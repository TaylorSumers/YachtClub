//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Boats.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client()
        {
            this.Order = new HashSet<Order>();
        }
    
        public int ClientID { get; set; }
        public string ClientSurname { get; set; }
        public string ClientName { get; set; }
        public string ClientPatronymic { get; set; }
        public System.DateTime ClientDateofBirh { get; set; }
        public string ClientPhone { get; set; }
        public Nullable<int> ClientOrg { get; set; }
        public int ClientAddress { get; set; }
        public int ClientDocument { get; set; }
        public string ClientEmail { get; set; }
    
        public virtual Address Address { get; set; }
        public virtual Document Document { get; set; }
        public virtual Organization Organization { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
    }
}
