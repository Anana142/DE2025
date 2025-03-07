﻿using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class RoomStatus
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<HotelRoom> HotelRooms { get; set; } = new List<HotelRoom>();
}
