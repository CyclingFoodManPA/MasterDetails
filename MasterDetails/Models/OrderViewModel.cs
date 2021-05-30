using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MasterDetails.Context;


namespace MasterDetails.Models
{
    public class OrderViewModel
    {
        public OrderViewModel()
        {
            this.OrderDetails = new List<OrderDetailsViewModel>();
        }

        public System.Guid MasterId { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }

        public virtual ICollection<OrderDetailsViewModel> OrderDetails { get; set; }
    }
}