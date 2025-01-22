using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class HotelRoom
{
    public int Id { get; set; }

    public int Floor { get; set; }

    public string Number { get; set; } = null!;

    public int IdCategory { get; set; }

    public int? IdRoomStatus { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual ICollection<Cleaningschedule> Cleaningschedules { get; set; } = new List<Cleaningschedule>();

    public virtual Category IdCategoryNavigation { get; set; } = null!;

    public virtual RoomStatus? IdRoomStatusNavigation { get; set; }
}
