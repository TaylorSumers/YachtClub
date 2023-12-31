USE [master]
GO
/****** Object:  Database [YachtClub]    Script Date: 13.08.2023 19:28:59 ******/
CREATE DATABASE [YachtClub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YachtClub', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YachtClub.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YachtClub_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\YachtClub_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [YachtClub] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YachtClub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YachtClub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YachtClub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YachtClub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YachtClub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YachtClub] SET ARITHABORT OFF 
GO
ALTER DATABASE [YachtClub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YachtClub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YachtClub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YachtClub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YachtClub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YachtClub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YachtClub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YachtClub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YachtClub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YachtClub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YachtClub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YachtClub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YachtClub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YachtClub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YachtClub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YachtClub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YachtClub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YachtClub] SET RECOVERY FULL 
GO
ALTER DATABASE [YachtClub] SET  MULTI_USER 
GO
ALTER DATABASE [YachtClub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YachtClub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YachtClub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YachtClub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YachtClub] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YachtClub] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'YachtClub', N'ON'
GO
ALTER DATABASE [YachtClub] SET QUERY_STORE = ON
GO
ALTER DATABASE [YachtClub] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [YachtClub]
GO
/****** Object:  Table [dbo].[AdditionalEquipment]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalEquipment](
	[AdditionalEquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[AdditionalEquipmentName] [varchar](30) NOT NULL,
	[AdditionalEquipmentDescription] [varchar](100) NOT NULL,
	[AdditionalEquipmentCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Addition__562EBE4A070625E1] PRIMARY KEY CLUSTERED 
(
	[AdditionalEquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressCity] [int] NOT NULL,
	[AddressStreet] [int] NOT NULL,
	[AddressHouse] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boat]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boat](
	[BoatID] [int] IDENTITY(1,1) NOT NULL,
	[BoatModel] [varchar](30) NOT NULL,
	[BoatType] [int] NOT NULL,
	[BoatRowersNum] [int] NOT NULL,
	[BoatWood] [int] NOT NULL,
	[BoatColor] [int] NOT NULL,
	[BoatCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Boat__148829BCE2538CCE] PRIMARY KEY CLUSTERED 
(
	[BoatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatEquipment]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatEquipment](
	[BoatEquipmentID] [int] NOT NULL,
	[Boat] [int] NOT NULL,
	[Equipment] [int] NOT NULL,
 CONSTRAINT [PK__BoatEqui__249043DA6352D8D6] PRIMARY KEY CLUSTERED 
(
	[BoatEquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatType]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatType](
	[BoatTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BoatTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BoatTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] NOT NULL,
	[ClientSurname] [varchar](20) NOT NULL,
	[ClientName] [varchar](20) NOT NULL,
	[ClientPatronymic] [varchar](20) NULL,
	[ClientDateofBirh] [date] NOT NULL,
	[ClientPhone] [varchar](20) NOT NULL,
	[ClientOrg] [int] NULL,
	[ClientAddress] [int] NOT NULL,
	[ClientDocument] [int] NOT NULL,
	[ClientEmail] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Client__E67E1A0409DB0302] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [int] NOT NULL,
	[DocumentNumber] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderBoat] [int] NOT NULL,
	[OrderClient] [int] NOT NULL,
	[OrderCost] [decimal](10, 2) NOT NULL,
	[OrderPrepayment] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Organiza__CADB0B7286D0863A] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[StreetID] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WoodType]    Script Date: 13.08.2023 19:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WoodType](
	[WoodTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WoodTypeName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WoodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdditionalEquipment] ON 

INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (1, N'Черпак', N'Деревянный черпак, красный', CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (2, N'Весло малое', N'малое весло, дубовое', CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (3, N'Весло среднее', N'Среднее весло, дубовое', CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (4, N'Весло большое', N'Большое весло, дубовое', CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (5, N'Зонтик', N'Большой красный зонтик', CAST(4800.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (6, N'Тент', N'Синий тент', CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (7, N'Холодильник', N'Холодильник на солнечной энергии', CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (8, N'Спасжилет Ж', N'Спасательный жилет для женщин', CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (9, N'Спасжилет М', N'Спасательный жилет для мужчин', CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (10, N'Спасжилет Д', N'Спасательный жилет для детей', CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[AdditionalEquipment] ([AdditionalEquipmentID], [AdditionalEquipmentName], [AdditionalEquipmentDescription], [AdditionalEquipmentCost]) VALUES (11, N'Стандартный вахтенный журнал', N'Вахтенный журнал, 100 стр', CAST(3000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[AdditionalEquipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [AddressCity], [AddressStreet], [AddressHouse]) VALUES (1, 1, 1, N'43')
INSERT [dbo].[Address] ([AddressID], [AddressCity], [AddressStreet], [AddressHouse]) VALUES (2, 1, 2, N'3')
INSERT [dbo].[Address] ([AddressID], [AddressCity], [AddressStreet], [AddressHouse]) VALUES (3, 2, 3, N'15')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Boat] ON 

INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (101, N'RB Стандарт', 1, 1, 1, 1, CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (201, N'SB Стандарт', 2, 0, 2, 2, CAST(280000.00 AS Decimal(10, 2)))
INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (202, N'SB Юниор', 2, 0, 3, 3, CAST(165000.00 AS Decimal(10, 2)))
INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (301, N'G Эконом', 3, 6, 3, 4, CAST(550000.00 AS Decimal(10, 2)))
INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (302, N'G Люкс', 3, 8, 4, 5, CAST(750000.00 AS Decimal(10, 2)))
INSERT [dbo].[Boat] ([BoatID], [BoatModel], [BoatType], [BoatRowersNum], [BoatWood], [BoatColor], [BoatCost]) VALUES (303, N'G Супер Люкс', 3, 12, 2, 6, CAST(1080000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Boat] OFF
GO
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (1, 101, 1)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (2, 201, 1)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (7, 101, 2)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (9, 202, 2)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (13, 301, 3)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (14, 302, 3)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (15, 303, 3)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (16, 303, 4)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (17, 303, 5)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (20, 302, 6)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (21, 303, 6)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (22, 303, 7)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (23, 101, 8)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (24, 201, 8)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (29, 101, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (30, 201, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (31, 202, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (32, 301, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (33, 302, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (34, 303, 9)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (37, 202, 10)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (38, 301, 10)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (39, 302, 10)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (40, 303, 10)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (41, 201, 11)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (42, 202, 11)
INSERT [dbo].[BoatEquipment] ([BoatEquipmentID], [Boat], [Equipment]) VALUES (43, 301, 11)
GO
SET IDENTITY_INSERT [dbo].[BoatType] ON 

INSERT [dbo].[BoatType] ([BoatTypeID], [BoatTypeName]) VALUES (1, N'Шлюпка')
INSERT [dbo].[BoatType] ([BoatTypeID], [BoatTypeName]) VALUES (2, N'Парусная лодка')
INSERT [dbo].[BoatType] ([BoatTypeID], [BoatTypeName]) VALUES (3, N'Галера')
SET IDENTITY_INSERT [dbo].[BoatType] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Санкт-Петербург')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'Москва')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
INSERT [dbo].[Client] ([ClientID], [ClientSurname], [ClientName], [ClientPatronymic], [ClientDateofBirh], [ClientPhone], [ClientOrg], [ClientAddress], [ClientDocument], [ClientEmail]) VALUES (111, N'Порков', N'Александр', N'', CAST(N'1986-05-31' AS Date), N'+7 (915) 142-67-10', 1, 1, 1, N'c.bargue@kaarinacruises.fi')
INSERT [dbo].[Client] ([ClientID], [ClientSurname], [ClientName], [ClientPatronymic], [ClientDateofBirh], [ClientPhone], [ClientOrg], [ClientAddress], [ClientDocument], [ClientEmail]) VALUES (112, N'Сатова', N'Евгения', N'', CAST(N'1972-08-01' AS Date), N'+7 925 145-18-83', 2, 2, 2, N'hanna.hentonen@doublehh.com')
INSERT [dbo].[Client] ([ClientID], [ClientSurname], [ClientName], [ClientPatronymic], [ClientDateofBirh], [ClientPhone], [ClientOrg], [ClientAddress], [ClientDocument], [ClientEmail]) VALUES (113, N'Буревой', N'Михаил', N'', CAST(N'1960-05-03' AS Date), N'+7 916 341-43-20', NULL, 3, 3, N'bjorn.bengtson@amundsen.fi')
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (1, N'Зеленый')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (2, N'Белый')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (3, N'Красный')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (4, N'Черный')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (5, N'Синий')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (6, N'Коричневый')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([DocumentID], [DocumentType], [DocumentNumber]) VALUES (1, 1, N'PP6036589
')
INSERT [dbo].[Document] ([DocumentID], [DocumentType], [DocumentNumber]) VALUES (2, 1, N'PK5533478
')
INSERT [dbo].[Document] ([DocumentID], [DocumentType], [DocumentNumber]) VALUES (3, 2, N'452639129
')
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeName]) VALUES (1, N'Паспорт РФ')
INSERT [dbo].[DocumentType] ([DocumentTypeID], [DocumentTypeName]) VALUES (2, N'Загранпаспорт')
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([OrganizationID], [OrganizationName]) VALUES (1, N'ООО ""Венчур капитал""')
INSERT [dbo].[Organization] ([OrganizationID], [OrganizationName]) VALUES (2, N'ООО ""Калипсо""')
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (1, N'Невский пр.')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (2, N'ул. Судостроителей')
INSERT [dbo].[Street] ([StreetID], [StreetName]) VALUES (3, N'ул. Ленина')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
SET IDENTITY_INSERT [dbo].[WoodType] ON 

INSERT [dbo].[WoodType] ([WoodTypeID], [WoodTypeName]) VALUES (1, N'Ель')
INSERT [dbo].[WoodType] ([WoodTypeID], [WoodTypeName]) VALUES (2, N'Тик')
INSERT [dbo].[WoodType] ([WoodTypeID], [WoodTypeName]) VALUES (3, N'Сосна')
INSERT [dbo].[WoodType] ([WoodTypeID], [WoodTypeName]) VALUES (4, N'Дуб')
SET IDENTITY_INSERT [dbo].[WoodType] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([AddressCity])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([AddressStreet])
REFERENCES [dbo].[Street] ([StreetID])
GO
ALTER TABLE [dbo].[Boat]  WITH CHECK ADD  CONSTRAINT [FK__Boat__BoatColor__35BCFE0A] FOREIGN KEY([BoatColor])
REFERENCES [dbo].[Color] ([ColorID])
GO
ALTER TABLE [dbo].[Boat] CHECK CONSTRAINT [FK__Boat__BoatColor__35BCFE0A]
GO
ALTER TABLE [dbo].[Boat]  WITH CHECK ADD  CONSTRAINT [FK__Boat__BoatType__33D4B598] FOREIGN KEY([BoatType])
REFERENCES [dbo].[BoatType] ([BoatTypeID])
GO
ALTER TABLE [dbo].[Boat] CHECK CONSTRAINT [FK__Boat__BoatType__33D4B598]
GO
ALTER TABLE [dbo].[Boat]  WITH CHECK ADD  CONSTRAINT [FK__Boat__BoatWood__34C8D9D1] FOREIGN KEY([BoatWood])
REFERENCES [dbo].[WoodType] ([WoodTypeID])
GO
ALTER TABLE [dbo].[Boat] CHECK CONSTRAINT [FK__Boat__BoatWood__34C8D9D1]
GO
ALTER TABLE [dbo].[BoatEquipment]  WITH CHECK ADD  CONSTRAINT [FK__BoatEquip__Equip__398D8EEE] FOREIGN KEY([Equipment])
REFERENCES [dbo].[AdditionalEquipment] ([AdditionalEquipmentID])
GO
ALTER TABLE [dbo].[BoatEquipment] CHECK CONSTRAINT [FK__BoatEquip__Equip__398D8EEE]
GO
ALTER TABLE [dbo].[BoatEquipment]  WITH CHECK ADD  CONSTRAINT [FK__BoatEquipm__Boat__38996AB5] FOREIGN KEY([Boat])
REFERENCES [dbo].[Boat] ([BoatID])
GO
ALTER TABLE [dbo].[BoatEquipment] CHECK CONSTRAINT [FK__BoatEquipm__Boat__38996AB5]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__ClientAd__440B1D61] FOREIGN KEY([ClientAddress])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__ClientAd__440B1D61]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__ClientDo__44FF419A] FOREIGN KEY([ClientDocument])
REFERENCES [dbo].[Document] ([DocumentID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__ClientDo__44FF419A]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__ClientOr__4316F928] FOREIGN KEY([ClientOrg])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__ClientOr__4316F928]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD FOREIGN KEY([DocumentType])
REFERENCES [dbo].[DocumentType] ([DocumentTypeID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderBoat__47DBAE45] FOREIGN KEY([OrderBoat])
REFERENCES [dbo].[Boat] ([BoatID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderBoat__47DBAE45]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__OrderClie__48CFD27E] FOREIGN KEY([OrderClient])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__OrderClie__48CFD27E]
GO
USE [master]
GO
ALTER DATABASE [YachtClub] SET  READ_WRITE 
GO
