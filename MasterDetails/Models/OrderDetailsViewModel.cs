using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MasterDetails.Models
{    
    public class OrderDetailsViewModel
    {
        public System.Guid DetailId { get; set; }
        public System.Guid MasterId { get; set; }
        public string ProductName { get; set; }
        public string Quantity { get; set; }
        public string Amount { get; set; }
    }
}