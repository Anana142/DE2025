using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class User
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Patronymic { get; set; }

    public int? IdRole { get; set; }

    public string? Login { get; set; }

    public string? Password { get; set; }

    public DateOnly? LastAuthorization { get; set; }

    public bool IsLocked { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual Role? IdRoleNavigation { get; set; }
}
