using System;
using System.Collections.Generic;
using DemoExamen.Models;
using Microsoft.EntityFrameworkCore;

namespace DemoExamen.Insfrastructures.Database;

public partial class User49Context : DbContext
{
    public User49Context()
    {
    }

    public User49Context(DbContextOptions<User49Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Booking> Bookings { get; set; }

    public virtual DbSet<Card> Cards { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Cleaningschedule> Cleaningschedules { get; set; }

    public virtual DbSet<FinancialTransaction> FinancialTransactions { get; set; }

    public virtual DbSet<HotelRoom> HotelRooms { get; set; }

    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<RoomStatus> RoomStatuses { get; set; }

    public virtual DbSet<Service> Services { get; set; }

    public virtual DbSet<Ticket> Tickets { get; set; }

    public virtual DbSet<TicketStatus> TicketStatuses { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Worker> Workers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server=192.168.200.35;user=user49;password=55405;database=user49;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Booking>(entity =>
        {
            entity.ToTable("Booking");

            entity.Property(e => e.Id).HasColumnName("ID");

            entity.HasOne(d => d.IdCardNavigation).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.IdCard)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_Card");

            entity.HasOne(d => d.IdHotelRoomNavigation).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.IdHotelRoom)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_HotelRoom");

            entity.HasOne(d => d.IdUserNavigation).WithMany(p => p.Bookings)
                .HasForeignKey(d => d.IdUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Booking_User");
        });

        modelBuilder.Entity<Card>(entity =>
        {
            entity.ToTable("Card");

            entity.Property(e => e.Id).HasColumnName("ID");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.ToTable("Category");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Cleaningschedule>(entity =>
        {
            entity.ToTable("CLeaningschedule");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.DateTime).HasColumnType("datetime");
            entity.Property(e => e.IdhotelRoom).HasColumnName("IDHotelRoom");

            entity.HasOne(d => d.IdWoerkerNavigation).WithMany(p => p.Cleaningschedules)
                .HasForeignKey(d => d.IdWoerker)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CLeaningschedule_Worker");

            entity.HasOne(d => d.IdhotelRoomNavigation).WithMany(p => p.Cleaningschedules)
                .HasForeignKey(d => d.IdhotelRoom)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CLeaningschedule_HotelRoom");
        });

        modelBuilder.Entity<FinancialTransaction>(entity =>
        {
            entity.ToTable("FInancialTransaction");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Cost).HasColumnType("decimal(19, 2)");

            entity.HasOne(d => d.IdBookingNavigation).WithMany(p => p.FinancialTransactions)
                .HasForeignKey(d => d.IdBooking)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FInancialTransaction_Booking");
        });

        modelBuilder.Entity<HotelRoom>(entity =>
        {
            entity.ToTable("HotelRoom");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Number).HasMaxLength(50);

            entity.HasOne(d => d.IdCategoryNavigation).WithMany(p => p.HotelRooms)
                .HasForeignKey(d => d.IdCategory)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HotelRoom_Category");

            entity.HasOne(d => d.IdRoomStatusNavigation).WithMany(p => p.HotelRooms)
                .HasForeignKey(d => d.IdRoomStatus)
                .HasConstraintName("FK_HotelRoom_RoomStatus");
        });

        modelBuilder.Entity<Post>(entity =>
        {
            entity.ToTable("Post");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<RoomStatus>(entity =>
        {
            entity.ToTable("RoomStatus");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Service>(entity =>
        {
            entity.ToTable("Service");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Cost).HasColumnType("decimal(19, 2)");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<Ticket>(entity =>
        {
            entity.ToTable("Ticket");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.TicketContent).HasMaxLength(250);

            entity.HasOne(d => d.IdBookingNavigation).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.IdBooking)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ticket_Booking");

            entity.HasOne(d => d.IdServiceNavigation).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.IdService)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ticket_Service");

            entity.HasOne(d => d.IdTicketStatusNavigation).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.IdTicketStatus)
                .HasConstraintName("FK_Ticket_TicketStatus");

            entity.HasOne(d => d.IdWorkerNavigation).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.IdWorker)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ticket_Worker");
        });

        modelBuilder.Entity<TicketStatus>(entity =>
        {
            entity.ToTable("TicketStatus");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(250);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LastName).HasMaxLength(250);
            entity.Property(e => e.Login).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.Password).HasMaxLength(250);
            entity.Property(e => e.Patronymic).HasMaxLength(250);

            entity.HasOne(d => d.IdRoleNavigation).WithMany(p => p.Users)
                .HasForeignKey(d => d.IdRole)
                .HasConstraintName("FK_User_Role");
        });

        modelBuilder.Entity<Worker>(entity =>
        {
            entity.ToTable("Worker");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.LastName).HasMaxLength(250);
            entity.Property(e => e.Name).HasMaxLength(250);
            entity.Property(e => e.Patronymic).HasMaxLength(250);

            entity.HasOne(d => d.IdPostNavigation).WithMany(p => p.Workers)
                .HasForeignKey(d => d.IdPost)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Worker_Post");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
