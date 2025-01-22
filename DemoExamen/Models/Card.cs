using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Card
{
    public int Id { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();
}
