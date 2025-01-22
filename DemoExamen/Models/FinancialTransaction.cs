using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class FinancialTransaction
{
    public int Id { get; set; }

    public int IdBooking { get; set; }

    public decimal Cost { get; set; }

    public virtual Booking IdBookingNavigation { get; set; } = null!;
}
