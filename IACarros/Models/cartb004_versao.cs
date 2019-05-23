namespace IACarros.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class cartb004_versao
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cartb004_versao()
        {
            cartb005_ano_versao = new HashSet<cartb005_ano_versao>();
        }

        [Key]
        public int nu_versao { get; set; }

        [Required]
        [StringLength(200)]
        public string no_versao { get; set; }

        public int nu_modelo { get; set; }

        public int nu_categoria { get; set; }

        public decimal vr_peso_potencia { get; set; }

        public decimal vr_peso_torque { get; set; }

        public decimal vr_economia { get; set; }

        public decimal vr_conforto { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public int? nu_economia { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public int? nu_conforto { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public int? nu_potencia { get; set; }

        [Required]
        [StringLength(1)]
        public string ic_nacionalidade { get; set; }

        [Required]
        [StringLength(1)]
        public string ic_combustivel { get; set; }

        [Required]
        [StringLength(1)]
        public string ic_cambio { get; set; }
        [JsonProperty(PropertyName = "modelo")]
        public virtual cartb001_modelo cartb001_modelo { get; set; }
        [JsonProperty(PropertyName = "categoria")]
        public virtual cartb003_categoria cartb003_categoria { get; set; }
        [JsonProperty(PropertyName = "anos")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cartb005_ano_versao> cartb005_ano_versao { get; set; }
    }
}
