using System;
using System.Collections.Generic;

namespace DemoExamen.Models;

public partial class Booking
{
    public int Id { get; set; }

    public int IdHotelRoom { get; set; }

    public int IdUser { get; set; }

    public DateOnly DateIn { get; set; }

    public DateOnly? DateOut { get; set; }

    public int IdCard { get; set; }

    public virtual ICollection<FinancialTransaction> FinancialTransactions { get; set; } = new List<FinancialTransaction>();

    public virtual Card IdCardNavigation { get; set; } = null!;

    public virtual HotelRoom IdHotelRoomNavigation { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
