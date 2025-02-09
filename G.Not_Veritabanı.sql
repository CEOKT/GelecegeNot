USE [master]
GO
/****** Object:  Database [tbl_GelecegeNot]    Script Date: 28/04/2024 12:40:27 ******/
CREATE DATABASE [tbl_GelecegeNot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tbl_GelecegeNot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tbl_GelecegeNot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tbl_GelecegeNot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tbl_GelecegeNot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tbl_GelecegeNot] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tbl_GelecegeNot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tbl_GelecegeNot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ARITHABORT OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [tbl_GelecegeNot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tbl_GelecegeNot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tbl_GelecegeNot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tbl_GelecegeNot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tbl_GelecegeNot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tbl_GelecegeNot] SET  MULTI_USER 
GO
ALTER DATABASE [tbl_GelecegeNot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tbl_GelecegeNot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tbl_GelecegeNot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tbl_GelecegeNot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tbl_GelecegeNot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tbl_GelecegeNot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tbl_GelecegeNot] SET QUERY_STORE = ON
GO
ALTER DATABASE [tbl_GelecegeNot] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tbl_GelecegeNot]
GO
/****** Object:  Table [dbo].[Gecmis]    Script Date: 28/04/2024 12:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gecmis](
	[ıd] [int] IDENTITY(1,1) NOT NULL,
	[not] [nvarchar](255) NULL,
	[tarih] [datetime] NULL,
	[kullaniciID] [int] NULL,
 CONSTRAINT [PK_Gecmis] PRIMARY KEY CLUSTERED 
(
	[ıd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gelecek]    Script Date: 28/04/2024 12:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gelecek](
	[ıd] [int] IDENTITY(1,1) NOT NULL,
	[not] [nvarchar](255) NOT NULL,
	[atarih] [datetime] NULL,
	[kullaniciID] [int] NULL,
 CONSTRAINT [PK_Gelecek] PRIMARY KEY CLUSTERED 
(
	[ıd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanici]    Script Date: 28/04/2024 12:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanici](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciAdi] [varchar](50) NOT NULL,
	[sifre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gecmis] ON 

INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (45, N'Vize PC programlama', CAST(N'2024-04-19T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (46, N'Vize Lineer cebir', CAST(N'2024-04-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (47, N'Arabayı yıkat', CAST(N'2024-04-11T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (48, N'Vize iş sağlığı', CAST(N'2024-04-25T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (49, N'Kart taksidini yatır', CAST(N'2024-04-22T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (56, N'Randevu saat 13.00', CAST(N'2024-04-24T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Gecmis] ([ıd], [not], [tarih], [kullaniciID]) VALUES (57, N'Araç muayne ', CAST(N'2024-04-04T00:00:00.000' AS DateTime), 13)
SET IDENTITY_INSERT [dbo].[Gecmis] OFF
GO
SET IDENTITY_INSERT [dbo].[Gelecek] ON 

INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (74, N'Proje teslim son gün', CAST(N'2024-04-30T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (88, N'Alışverişe çık', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (89, N'Projeyi bitir', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (90, N'Kargoyu al', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (91, N'Ev ödevini tamamla', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (92, N'Ayakkabı satın al', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Gelecek] ([ıd], [not], [atarih], [kullaniciID]) VALUES (95, N'Servisi çağır', CAST(N'2024-04-29T00:00:00.000' AS DateTime), 13)
SET IDENTITY_INSERT [dbo].[Gelecek] OFF
GO
SET IDENTITY_INSERT [dbo].[kullanici] ON 

INSERT [dbo].[kullanici] ([id], [kullaniciAdi], [sifre]) VALUES (7, N'Cemilcem', N'1234')
INSERT [dbo].[kullanici] ([id], [kullaniciAdi], [sifre]) VALUES (13, N'Murat', N'4321')
SET IDENTITY_INSERT [dbo].[kullanici] OFF
GO
ALTER TABLE [dbo].[Gelecek]  WITH CHECK ADD  CONSTRAINT [FK_Gelecek_kullanici1] FOREIGN KEY([kullaniciID])
REFERENCES [dbo].[kullanici] ([id])
GO
ALTER TABLE [dbo].[Gelecek] CHECK CONSTRAINT [FK_Gelecek_kullanici1]
GO
USE [master]
GO
ALTER DATABASE [tbl_GelecegeNot] SET  READ_WRITE 
GO
