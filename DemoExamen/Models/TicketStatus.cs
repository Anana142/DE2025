﻿using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class TicketStatus
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
