namespace IACarros.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class cartb001_modelo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cartb001_modelo()
        {
            cartb004_versao = new HashSet<cartb004_versao>();
        }

        [Key]
        public int nu_modelo { get; set; }

        [Required]
        [StringLength(200)]
        public string no_modelo { get; set; }

        public int nu_marca { get; set; }
        [JsonProperty(PropertyName = "marca")]
        public virtual cartb002_marca cartb002_marca { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cartb004_versao> cartb004_versao { get; set; }
    }
}
