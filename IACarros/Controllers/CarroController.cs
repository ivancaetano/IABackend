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

namespace IACarros.Controllers
{
    public class CarroController : ApiController
    {
        private CARDB db = new CARDB();

        // GET api/Carro
        public IQueryable<cartb004_versao> Getcartb004_versao(dynamic dialog)
        {
            Dictionary<string, string> parametros = ControllerContext.Request.GetQueryNameValuePairs().ToDictionary(x => x.Key, x => x.Value);
            string importante = GetValue(parametros, "importante");
            int limite = int.Parse(GetValue(parametros, "limite"));
            decimal precoInicial = decimal.Parse(GetValue(parametros, "precoInicial"));
            decimal precoFinal = decimal.Parse(GetValue(parametros, "precoFinal"));
            short anoInicial = short.Parse(GetValue(parametros, "anoInicial"));
            short anoFinal = short.Parse(GetValue(parametros, "anoFinal"));
            string cambio = GetValue(parametros, "cambio");
            string combustivel = GetValue(parametros, "combustivel");
            string carroceria = GetValue(parametros, "carroceria");
            IQueryable<cartb004_versao> ls = db.cartb004_versao
                .Where(v=>v.cartb005_ano_versao.Where(a=>precoInicial<=a.vr_preco&& a.vr_preco<=precoFinal).Count()>0
                && v.cartb005_ano_versao.Where(a => anoInicial <= a.aa_versao && a.aa_versao <= anoFinal).Count()>=0
                &&v.ic_cambio==cambio
                &&v.ic_combustivel==combustivel
                &&v.cartb003_categoria.no_categoria==carroceria);
            switch (importante)
            {
                case "economia":
                    ls = ls.OrderBy(v => v.nu_economia).Take(limite);
                    break;
                case "conforto":
                    ls = ls.OrderBy(v => v.nu_conforto).Take(limite);
                    break;
                case "potencia":
                    ls = ls.OrderBy(v => v.nu_potencia).Take(limite);
                    break;
            }

            return ls;
        }

        private static string GetValue(Dictionary<string, string> parametros, string key)
        {
            return parametros.Where(p => p.Key == key).First().Value;
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