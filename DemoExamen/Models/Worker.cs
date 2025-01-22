using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Worker
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public int IdPost { get; set; }

    public virtual ICollection<Cleaningschedule> Cleaningschedules { get; set; } = new List<Cleaningschedule>();

    public virtual Post IdPostNavigation { get; set; } = null!;

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
