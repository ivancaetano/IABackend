using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using IACarros.Models;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;


namespace IACarros.Controllers
{
    public class RespostaDialog
    {
        public string speech { get; set; }
        public string displayText { get; set; }
        public List<Message> messages { get; set; }
    }
    public class Context
    {
        public string name { get; set; }
        public dynamic parameters { get; set; }
        public int lifespan { get; set; }
    }

    public class Metadata
    {
        public string intentId { get; set; }
        public string webhookUsed { get; set; }
        public string webhookForSlotFillingUsed { get; set; }
        public string isFallbackIntent { get; set; }
        public string intentName { get; set; }
    }

    public class Message
    {
        public int type { get; set; }
        public string speech { get; set; }
    }

    public class Fulfillment
    {
        public string speech { get; set; }
        public List<Message> messages { get; set; }
    }

    public class Result
    {
        public string source { get; set; }
        public string resolvedQuery { get; set; }
        public string speech { get; set; }
        public string action { get; set; }
        public bool actionIncomplete { get; set; }
        public dynamic parameters { get; set; }
        public List<Context> contexts { get; set; }
        public Metadata metadata { get; set; }
        public Fulfillment fulfillment { get; set; }
        public int score { get; set; }
    }

    public class Status
    {
        public int code { get; set; }
        public string errorType { get; set; }
    }

    public class EntrataDialog
    {
        public string id { get; set; }
        public DateTime timestamp { get; set; }
        public string lang { get; set; }
        public Result result { get; set; }
        public Status status { get; set; }
        public string sessionId { get; set; }
    }
    public class DialogFlowController : ApiController
    {
        private CARDB db = new CARDB();

        [ResponseType(typeof(RespostaDialog))]
        // POST api/DialogFlow
        public IHttpActionResult Postcartb004_versao(dynamic dialog)
        {
            Result result = (Result)((JObject)dialog.result).ToObject(typeof(Result));
            dynamic parametros = result.contexts.Where(s => s.name == "nome-followup").FirstOrDefault().parameters;
            string importante = parametros.importante;
            int limite = 5;
            decimal precoInicial = parametros.precoMinimo * 1000;
            decimal precoFinal = parametros.precoMaximo * 1000;
            short anoInicial = parametros.anoMinimo;
            short anoFinal = parametros.anoMaximo;
            string cambio = ((string)parametros.cambio).Substring(0, 1);
            string combustivel = ((string)parametros.combustivel).Substring(0, 1);
            string carroceria = ((string)parametros.carroceria).Substring(0, 1);
            IQueryable<cartb004_versao> ls = db.cartb004_versao
                .Where(v => v.cartb005_ano_versao.Where(a => precoInicial <= a.vr_preco && a.vr_preco <= precoFinal).Count() > 0
                && v.cartb005_ano_versao.Where(a => anoInicial <= a.aa_versao && a.aa_versao <= anoFinal).Count() >= 0
                && (v.ic_cambio == cambio || cambio == "T")
                && (v.ic_combustivel == combustivel || combustivel == "T")
                && (v.cartb003_categoria.no_categoria.Substring(0, 1).ToUpper() == carroceria || carroceria == "T"));
            switch (importante.Substring(0, 1))
            {
                case "E":
                    ls = ls.OrderBy(v => v.nu_economia).Take(limite);
                    break;
                case "C":
                    ls = ls.OrderBy(v => v.nu_conforto).Take(limite);
                    break;
                case "P":
                    ls = ls.OrderBy(v => v.nu_potencia).Take(limite);
                    break;
            }


            RespostaDialog resposta = new RespostaDialog();
            resposta.messages = new List<Message>();
            if (ls.Count()>0)
            {
                Message primeiraMensagem = new Message();
                primeiraMensagem.type = 0;
                primeiraMensagem.speech = "Abaixo os carros que mais combinam com você, por ordem decrescente!";
                resposta.messages.Add(primeiraMensagem);
                foreach (cartb004_versao versao in ls)
                {
                    Message mensagem = new Message();
                    mensagem.type = 0;
                    mensagem.speech = versao.no_versao + ", com preço de " + versao.cartb005_ano_versao.First().vr_preco.ToString() + " o ano do modelo é " + versao.cartb005_ano_versao.First().aa_versao;
                    resposta.messages.Add(mensagem);
                }

                
                
            }
            else
            {

                Message primeiraMensagem = new Message();
                primeiraMensagem.type = 0;
                primeiraMensagem.speech = "Infelizmente não encontrei nenhum carro com essas especificações!";
                resposta.messages.Add(primeiraMensagem);
            }
            resposta.speech = "Abaixo os carros que mais combinam com você, por ordem decrescente!";
            resposta.displayText = "Abaixo os carros que mais combinam com você, por ordem decrescente!";
            return CreatedAtRoute("DefaultApi", "", resposta);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}