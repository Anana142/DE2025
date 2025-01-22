using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Ticket
{
    public int Id { get; set; }

    public int IdBooking { get; set; }

    public string TicketContent { get; set; } = null!;

    public int IdService { get; set; }

    public DateOnly DateTime { get; set; }

    public int IdWorker { get; set; }

    public int? IdTicketStatus { get; set; }

    public virtual Booking IdBookingNavigation { get; set; } = null!;

    public virtual Service IdServiceNavigation { get; set; } = null!;

    public virtual TicketStatus? IdTicketStatusNavigation { get; set; }

    public virtual Worker IdWorkerNavigation { get; set; } = null!;
}
