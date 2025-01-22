using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Cleaningschedule
{
    public int Id { get; set; }

    public int IdWoerker { get; set; }

    public int IdhotelRoom { get; set; }

    public DateTime DateTime { get; set; }

    public virtual Worker IdWoerkerNavigation { get; set; } = null!;

    public virtual HotelRoom IdhotelRoomNavigation { get; set; } = null!;
}
