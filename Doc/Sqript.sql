USE [master]
GO
/****** Object:  Database [user49]    Script Date: 15.01.2025 14:44:39 ******/
CREATE DATABASE [user49]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user49', FILENAME = N'/var/opt/mssql/data/user49.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user49_log', FILENAME = N'/var/opt/mssql/data/user49_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [user49] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user49].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user49] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user49] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user49] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user49] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user49] SET ARITHABORT OFF 
GO
ALTER DATABASE [user49] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user49] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user49] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user49] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user49] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user49] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user49] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user49] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user49] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user49] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user49] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user49] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user49] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user49] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user49] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user49] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user49] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user49] SET RECOVERY FULL 
GO
ALTER DATABASE [user49] SET  MULTI_USER 
GO
ALTER DATABASE [user49] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user49] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user49] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user49] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user49] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user49] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [user49] SET QUERY_STORE = OFF
GO
USE [user49]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdHotelRoom] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[DateIn] [date] NOT NULL,
	[DateOn] [date] NULL,
	[IdCard] [int] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLeaningschedule]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLeaningschedule](
	[ID] [int] NOT NULL,
	[IdWoerker] [int] NOT NULL,
	[IDHotelRoom] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CLeaningschedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FInancialTransaction]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FInancialTransaction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdBooking] [int] NOT NULL,
	[Cost] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_FInancialTransaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelRoom]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdRoomStatus] [int] NULL,
 CONSTRAINT [PK_HotelRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Cost] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdBooking] [int] NOT NULL,
	[TicketContent] [nvarchar](250) NOT NULL,
	[IdService] [int] NOT NULL,
	[DateTime] [date] NOT NULL,
	[IdWorker] [int] NOT NULL,
	[IdTicketStatus] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketStatus]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TicketStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[Patronymic] [nvarchar](250) NULL,
	[IdRole] [int] NULL,
	[Login] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 15.01.2025 14:44:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[Patronymic] [nvarchar](250) NULL,
	[IdPost] [int] NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Одноместный эконом')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'Эконом двухместный с 2 раздельными кроватями')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'3-местный бюджет')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'Бизнес с 1 или 2 кроватями')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (5, N'Двухкомнатный двухместный стандарт с 1 или 2 кроватями')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (6, N'Одноместный стандарт')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (7, N'Студия')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (8, N'Люкс с 2 двуспальными кроватями')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (9, N'Стандарт двухместный с 2 раздельными кроватями')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelRoom] ON 

INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (1, 1, N'101', 6, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (2, 1, N'102', 6, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (3, 1, N'103', 1, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (4, 1, N'104', 1, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (5, 1, N'105', 9, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (6, 1, N'106', 9, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (7, 1, N'107', 2, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (8, 1, N'108', 2, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (9, 1, N'109', 3, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (10, 1, N'110', 3, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (11, 2, N'201', 4, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (12, 2, N'202', 4, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (13, 2, N'203', 4, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (14, 2, N'204', 5, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (15, 2, N'205', 5, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (16, 2, N'206', 5, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (17, 2, N'207', 6, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (18, 2, N'208', 6, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (19, 2, N'209', 6, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (20, 3, N'301', 7, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (21, 3, N'302', 7, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (22, 3, N'303', 7, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (23, 3, N'304', 8, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (24, 3, N'305', 8, NULL)
INSERT [dbo].[HotelRoom] ([ID], [Floor], [Number], [IdCategory], [IdRoomStatus]) VALUES (25, 3, N'306', 8, NULL)
SET IDENTITY_INSERT [dbo].[HotelRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (1, N'Ольга', N'Шевченко', N'Викторовна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (2, N'Ирина', N'Мазалова', N'Львовна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (3, N'Юрий', N'Семеняка', N'Геннадьевич', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (4, N'Олег', N'Савельев', N'Иванович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (5, N'Эдуард', N'Бунин', N'Михайлович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (6, N'Павел', N'Бахшиев', N'Иннокентьевич', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (7, N'Наталья', N'Тюренкова', N'Сергеевна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (8, N'Галина', N'Любяшева', N'Аркадьевна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (9, N'Петр', N'Александров', N'Константинович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (10, N'Ольга', N'Мазалова', N'Николаевна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (11, N'Виктор', N'Лапшин', N'Романович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (12, N'Семен', N'Гусев', N'Петрович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (13, N'Вера', N'Гладилина', N'Михайловна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (14, N'Динара', N'Масюк', N'Викторовна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (15, N'Илья', N'Лукин', N'Федорович', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (16, N'Станислав', N'Петров', N'Игоревич', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (17, N'Марина', N'Филь', N'Федоровна', NULL, NULL, NULL)
INSERT [dbo].[User] ([ID], [Name], [LastName], [Patronymic], [IdRole], [Login], [Password]) VALUES (18, N'Игорь', N'Михайлов', N'Вадимович', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Card] FOREIGN KEY([IdCard])
REFERENCES [dbo].[Card] ([ID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Card]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_HotelRoom] FOREIGN KEY([IdHotelRoom])
REFERENCES [dbo].[HotelRoom] ([ID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_HotelRoom]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[CLeaningschedule]  WITH CHECK ADD  CONSTRAINT [FK_CLeaningschedule_HotelRoom] FOREIGN KEY([IDHotelRoom])
REFERENCES [dbo].[HotelRoom] ([ID])
GO
ALTER TABLE [dbo].[CLeaningschedule] CHECK CONSTRAINT [FK_CLeaningschedule_HotelRoom]
GO
ALTER TABLE [dbo].[CLeaningschedule]  WITH CHECK ADD  CONSTRAINT [FK_CLeaningschedule_Worker] FOREIGN KEY([IdWoerker])
REFERENCES [dbo].[Worker] ([ID])
GO
ALTER TABLE [dbo].[CLeaningschedule] CHECK CONSTRAINT [FK_CLeaningschedule_Worker]
GO
ALTER TABLE [dbo].[FInancialTransaction]  WITH CHECK ADD  CONSTRAINT [FK_FInancialTransaction_Booking] FOREIGN KEY([IdBooking])
REFERENCES [dbo].[Booking] ([ID])
GO
ALTER TABLE [dbo].[FInancialTransaction] CHECK CONSTRAINT [FK_FInancialTransaction_Booking]
GO
ALTER TABLE [dbo].[HotelRoom]  WITH CHECK ADD  CONSTRAINT [FK_HotelRoom_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[HotelRoom] CHECK CONSTRAINT [FK_HotelRoom_Category]
GO
ALTER TABLE [dbo].[HotelRoom]  WITH CHECK ADD  CONSTRAINT [FK_HotelRoom_RoomStatus] FOREIGN KEY([IdRoomStatus])
REFERENCES [dbo].[RoomStatus] ([ID])
GO
ALTER TABLE [dbo].[HotelRoom] CHECK CONSTRAINT [FK_HotelRoom_RoomStatus]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Booking] FOREIGN KEY([IdBooking])
REFERENCES [dbo].[Booking] ([ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Booking]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Service]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketStatus] FOREIGN KEY([IdTicketStatus])
REFERENCES [dbo].[TicketStatus] ([ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_TicketStatus]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Worker] FOREIGN KEY([IdWorker])
REFERENCES [dbo].[Worker] ([ID])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Worker]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Post] FOREIGN KEY([IdPost])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Post]
GO
USE [master]
GO
ALTER DATABASE [user49] SET  READ_WRITE 
GO
