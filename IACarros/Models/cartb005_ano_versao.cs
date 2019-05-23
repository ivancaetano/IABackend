namespace IACarros.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class cartb005_ano_versao
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int nu_versao { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short aa_versao { get; set; }

        [Key]
        [Column(Order = 2)]
        public decimal vr_preco { get; set; }
        [JsonIgnore]
        public virtual cartb004_versao cartb004_versao { get; set; }
    }
}
