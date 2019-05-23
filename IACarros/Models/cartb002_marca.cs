namespace IACarros.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class cartb002_marca
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public cartb002_marca()
        {
            cartb001_modelo = new HashSet<cartb001_modelo>();
        }

        [Key]
        public int nu_marca { get; set; }

        [Required]
        [StringLength(200)]
        public string no_marca { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cartb001_modelo> cartb001_modelo { get; set; }
    }
}
