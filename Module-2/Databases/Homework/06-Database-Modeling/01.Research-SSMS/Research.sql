USE [master]
GO
/****** Object:  Database [Research]    Script Date: 17-Oct-16 21:11:17 ******/
CREATE DATABASE [Research]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\University_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Research] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Research].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Research] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Research] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Research] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Research] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Research] SET ARITHABORT OFF 
GO
ALTER DATABASE [Research] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Research] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Research] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Research] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Research] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Research] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Research] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Research] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Research] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Research] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Research] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Research] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Research] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Research] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Research] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Research] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Research] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Research] SET RECOVERY FULL 
GO
ALTER DATABASE [Research] SET  MULTI_USER 
GO
ALTER DATABASE [Research] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Research] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Research] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Research] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Research] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Research', N'ON'
GO
ALTER DATABASE [Research] SET QUERY_STORE = OFF
GO
USE [Research]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Research]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 17-Oct-16 21:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [text] NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTINENT]    Script Date: 17-Oct-16 21:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTINENT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTINENT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COUNTRY]    Script Date: 17-Oct-16 21:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRY](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 17-Oct-16 21:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOWN]    Script Date: 17-Oct-16 21:11:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOWN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_TOWN] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ADDRESS] ON 

INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (1, N'2 2nd Place', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (2, N'070 Pearson Court', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (3, N'9645 Banding Center', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (4, N'57100 Oak Trail', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (5, N'17 Rowland Pass', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (6, N'11 Daystar Park', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (7, N'3348 Graceland Avenue', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (8, N'532 Lotheville Court', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (9, N'55 Homewood Park', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (10, N'52834 Hagan Way', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (11, N'0369 Union Junction', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (12, N'64 Ruskin Center', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (13, N'48020 Waywood Street', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (14, N'61 Bobwhite Center', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (15, N'80017 Warbler Lane', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (16, N'757 Derek Alley', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (17, N'019 Scoville Terrace', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (18, N'29765 Messerschmidt Pass', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (19, N'2037 Crescent Oaks Center', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (20, N'78740 Dennis Park', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (21, N'06 Scoville Street', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (22, N'2370 Truax Way', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (23, N'41 Everett Junction', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (24, N'9359 Fuller Court', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (25, N'614 Red Cloud Pass', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (26, N'50 Sherman Circle', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (27, N'703 Susan Park', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (28, N'98 Rockefeller Center', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (29, N'644 Buhler Center', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (30, N'86238 Monica Avenue', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (31, N'1368 Laurel Avenue', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (32, N'8 Brown Point', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (33, N'39451 Forster Court', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (34, N'6730 Northwestern Center', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (35, N'41 Grayhawk Hill', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (36, N'76081 Myrtle Parkway', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (37, N'154 Trailsway Hill', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (38, N'96529 Maryland Drive', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (39, N'04067 Spohn Park', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (40, N'57 Linden Park', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (41, N'6911 Basil Terrace', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (42, N'5329 Oneill Junction', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (43, N'13467 Maryland Pass', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (44, N'9 Hazelcrest Plaza', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (45, N'9 Raven Crossing', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (46, N'2 Myrtle Pass', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (47, N'730 Erie Terrace', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (48, N'5 Montana Court', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (49, N'94 Dixon Court', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (50, N'85580 Morningstar Street', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (51, N'9492 Hoepker Court', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (52, N'8083 International Place', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (53, N'8666 Fremont Alley', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (54, N'84 Holmberg Road', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (55, N'356 Starling Trail', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (56, N'863 Green Way', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (57, N'71 School Hill', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (58, N'7133 Esker Crossing', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (59, N'5434 Mallard Road', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (60, N'9 Randy Way', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (61, N'355 Meadow Valley Circle', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (62, N'73850 Twin Pines Plaza', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (63, N'484 Fairview Park', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (64, N'98434 Arrowood Plaza', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (65, N'2 Butternut Lane', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (66, N'95 Clove Lane', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (67, N'64 Derek Parkway', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (68, N'0 Daystar Crossing', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (69, N'83 Dexter Plaza', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (70, N'973 Spohn Crossing', 6)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (71, N'21512 Cordelia Terrace', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (72, N'069 Twin Pines Crossing', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (73, N'2 Marquette Road', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (74, N'18252 West Circle', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (75, N'931 Arapahoe Drive', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (76, N'52812 Lukken Terrace', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (77, N'691 Summit Way', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (78, N'55 Ridgeway Road', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (79, N'84 5th Crossing', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (80, N'80 Becker Center', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (81, N'92 Fairview Parkway', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (82, N'39905 Lotheville Center', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (83, N'76 Alpine Crossing', 1)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (84, N'5088 Packers Place', 5)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (85, N'43859 Division Pass', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (86, N'56090 Farmco Road', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (87, N'89697 Wayridge Street', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (88, N'5502 Maple Wood Point', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (89, N'4 Fisk Crossing', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (90, N'382 Talmadge Court', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (91, N'6 Randy Road', 3)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (92, N'4 Arkansas Alley', 7)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (93, N'73980 Lunder Way', 9)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (94, N'7 Buell Hill', 8)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (95, N'55 Coolidge Avenue', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (96, N'91535 Rowland Street', 10)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (97, N'75342 Stuart Alley', 2)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (98, N'6539 Park Meadow Way', 4)
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (99, N'03842 Reinke Hill', 9)
GO
INSERT [dbo].[ADDRESS] ([Id], [AddressText], [TownId]) VALUES (100, N'673 Randy Way', 2)
SET IDENTITY_INSERT [dbo].[ADDRESS] OFF
SET IDENTITY_INSERT [dbo].[CONTINENT] ON 

INSERT [dbo].[CONTINENT] ([Id], [Name]) VALUES (1, N'Africa')
INSERT [dbo].[CONTINENT] ([Id], [Name]) VALUES (2, N'Europe')
INSERT [dbo].[CONTINENT] ([Id], [Name]) VALUES (3, N'Asia')
INSERT [dbo].[CONTINENT] ([Id], [Name]) VALUES (4, N'Australia')
SET IDENTITY_INSERT [dbo].[CONTINENT] OFF
SET IDENTITY_INSERT [dbo].[COUNTRY] ON 

INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (1, N'Bolivia', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (2, N'Macedonia', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (3, N'Dominica', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (4, N'Senegal', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (5, N'Solomon Islands', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (6, N'Ghana', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (7, N'Oman', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (8, N'Kuwait', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (9, N'Ecuador', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (10, N'Morocco', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (11, N'Japan', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (12, N'Nicaragua', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (13, N'Greenland', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (14, N'Sri Lanka', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (15, N'Sint Maarten', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (16, N'Suriname', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (17, N'Oman', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (18, N'Libya', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (19, N'Sao Tome and Principe', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (20, N'Antigua and Barbuda', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (21, N'Greece', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (22, N'Cambodia', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (23, N'Malaysia', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (24, N'Mongolia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (25, N'Kuwait', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (26, N'China', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (27, N'Norfolk Island', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (28, N'Guinea-Bissau', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (29, N'Angola', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (30, N'Poland', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (31, N'Guinea', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (32, N'Tunisia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (33, N'Brunei', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (34, N'Puerto Rico', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (35, N'Gabon', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (36, N'Georgia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (37, N'Yemen', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (38, N'Benin', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (39, N'Lesotho', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (40, N'Cuba', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (41, N'Bouvet Island', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (42, N'Russian Federation', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (43, N'Yemen', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (44, N'Guyana', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (45, N'Saint Kitts and Nevis', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (46, N'Bahrain', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (47, N'Barbados', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (48, N'Kenya', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (49, N'Senegal', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (50, N'United Kingdom (Great Britain)', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (51, N'Senegal', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (52, N'Qatar', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (53, N'Nicaragua', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (54, N'American Samoa', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (55, N'Dominica', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (56, N'Korea, South', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (57, N'Turkmenistan', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (58, N'Bangladesh', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (59, N'China', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (60, N'Virgin Islands, British', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (61, N'Bolivia', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (62, N'Mayotte', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (63, N'Kiribati', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (64, N'Guinea', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (65, N'Brazil', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (66, N'Singapore', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (67, N'Syria', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (68, N'Malaysia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (69, N'Latvia', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (70, N'Armenia', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (71, N'American Samoa', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (72, N'Guam', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (73, N'Greenland', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (74, N'Tuvalu', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (75, N'Romania', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (76, N'Congo, the Democratic Republic of the', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (77, N'Austria', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (78, N'Brazil', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (79, N'South Georgia and The South Sandwich Islands', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (80, N'Japan', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (81, N'Vanuatu', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (82, N'Greenland', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (83, N'Saint Martin', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (84, N'Serbia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (85, N'British Indian Ocean Territory', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (86, N'Haiti', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (87, N'Australia', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (88, N'Moldova', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (89, N'Tanzania', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (90, N'Ghana', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (91, N'Cook Islands', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (92, N'Saudi Arabia', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (93, N'Tanzania', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (94, N'Mauritius', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (95, N'Congo, the Democratic Republic of the', 3)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (96, N'Kiribati', 4)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (97, N'Myanmar', 1)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (98, N'Saint Barthélemy', 2)
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (99, N'Kenya', 3)
GO
INSERT [dbo].[COUNTRY] ([Id], [Name], [ContinentId]) VALUES (100, N'Vanuatu', 4)
SET IDENTITY_INSERT [dbo].[COUNTRY] OFF
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Adam', N'Rivera', 8)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Janice', N'White', 25)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Carl', N'Rice', 4)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'James', N'Edwards', 55)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (5, N'Eugene', N'Wood', 59)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (6, N'Jane', N'Wells', 64)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (7, N'Bobby', N'Sanders', 4)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (8, N'Lori', N'Burns', 98)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (9, N'Annie', N'West', 29)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (10, N'Keith', N'Riley', 54)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (11, N'Raymond', N'Martinez', 90)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (12, N'Martha', N'Howell', 33)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (13, N'Melissa', N'Lee', 30)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (14, N'Keith', N'Foster', 21)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (15, N'Aaron', N'Stephens', 71)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (16, N'Phyllis', N'Garza', 21)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (17, N'Daniel', N'Barnes', 2)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (18, N'Stephanie', N'Reed', 76)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (19, N'Mark', N'Burke', 68)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (20, N'Samuel', N'Lee', 57)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (21, N'Melissa', N'Allen', 33)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (22, N'Randy', N'Fowler', 84)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (23, N'Thomas', N'Jackson', 30)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (24, N'Tammy', N'Stone', 21)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (25, N'Joseph', N'Oliver', 94)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (26, N'Ruth', N'Jackson', 64)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (27, N'Gerald', N'Cole', 69)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (28, N'Nancy', N'Torres', 37)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (29, N'Fred', N'Day', 29)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (30, N'Albert', N'Snyder', 93)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (31, N'Robert', N'Diaz', 74)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (32, N'Christina', N'Kelly', 87)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (33, N'Dorothy', N'Peters', 50)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (34, N'Kathy', N'Reynolds', 89)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (35, N'Ryan', N'Patterson', 64)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (36, N'Alice', N'Hall', 20)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (37, N'Julie', N'Arnold', 81)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (38, N'Irene', N'Palmer', 16)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (39, N'Kevin', N'Walker', 62)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (40, N'Ernest', N'Gardner', 67)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (41, N'Brandon', N'Rose', 89)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (42, N'Carol', N'Williamson', 2)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (43, N'Barbara', N'Jones', 88)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (44, N'Diane', N'Hanson', 24)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (45, N'Joseph', N'Price', 10)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (46, N'Louise', N'Young', 29)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (47, N'Steven', N'Allen', 89)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (48, N'Adam', N'Moreno', 36)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (49, N'Jerry', N'Gibson', 52)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (50, N'Chris', N'Collins', 68)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (51, N'Christopher', N'Watkins', 23)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (52, N'Emily', N'Bell', 77)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (53, N'Henry', N'Day', 18)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (54, N'Raymond', N'Harrison', 33)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (55, N'Nicole', N'Barnes', 28)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (56, N'Todd', N'Davis', 9)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (57, N'Bonnie', N'Carroll', 14)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (58, N'Tammy', N'Garcia', 34)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (59, N'Lori', N'Washington', 40)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (60, N'Doris', N'Morales', 31)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (61, N'Gloria', N'Robinson', 59)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (62, N'Kathryn', N'Ellis', 62)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (63, N'Frances', N'Kennedy', 40)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (64, N'Alan', N'Lawrence', 28)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (65, N'Kathleen', N'Hernandez', 48)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (66, N'Laura', N'Hart', 98)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (67, N'Kathy', N'Walker', 100)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (68, N'Joan', N'Stone', 78)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (69, N'Harold', N'Wheeler', 32)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (70, N'Debra', N'Cooper', 53)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (71, N'Evelyn', N'Gilbert', 21)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (72, N'Matthew', N'Franklin', 81)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (73, N'Kathleen', N'Crawford', 61)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (74, N'Ruth', N'Schmidt', 90)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (75, N'Nicole', N'Hunter', 56)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (76, N'Adam', N'Miller', 56)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (77, N'Pamela', N'Torres', 31)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (78, N'Juan', N'Ortiz', 39)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (79, N'Stephanie', N'Spencer', 76)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (80, N'Catherine', N'Graham', 21)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (81, N'Eugene', N'Kelley', 100)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (82, N'Nicholas', N'Dean', 16)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (83, N'Steve', N'Hamilton', 73)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (84, N'Janet', N'Greene', 82)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (85, N'John', N'Thompson', 66)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (86, N'Joe', N'Torres', 44)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (87, N'Justin', N'Bennett', 37)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (88, N'Bobby', N'Hanson', 96)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (89, N'Sean', N'Morrison', 4)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (90, N'Sharon', N'Turner', 56)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (91, N'Louis', N'Allen', 32)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (92, N'Irene', N'Holmes', 51)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (93, N'Andrea', N'Gutierrez', 88)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (94, N'Gerald', N'Daniels', 48)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (95, N'Anne', N'Patterson', 6)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (96, N'Jane', N'Green', 96)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (97, N'Anne', N'Tucker', 97)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (98, N'Jeremy', N'Cox', 40)
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (99, N'Christopher', N'Marshall', 72)
GO
INSERT [dbo].[PERSON] ([Id], [FirstName], [LastName], [AddressId]) VALUES (100, N'Teresa', N'Bowman', 96)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
SET IDENTITY_INSERT [dbo].[TOWN] ON 

INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (1, N'Chelmsford', 62)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (2, N'Sunderland', 76)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (3, N'Bromyard', 87)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (4, N'Buccheri', 12)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (5, N'Moio Alcantara', 73)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (6, N'Laarne', 75)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (7, N'Inuvik', 55)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (8, N'Dunbar', 76)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (9, N'Suarlee', 64)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (10, N'María Elena', 39)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (11, N'Termoli', 97)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (12, N'Wetteren', 11)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (13, N'Sargodha', 11)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (14, N'Bhatpara', 32)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (15, N'Armungia', 33)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (16, N'Inverbervie', 65)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (17, N'El Quisco', 90)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (18, N'Serralunga d''Alba', 72)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (19, N'Gibsons', 18)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (20, N'Eluru', 55)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (21, N'Varna/Vahrn', 77)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (22, N'Mont-sur-Marchienne', 37)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (23, N'Leernes', 83)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (24, N'Glain', 58)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (25, N'Zaventem', 98)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (26, N'Hudson''s Hope', 8)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (27, N'Fosses-la-Ville', 84)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (28, N'Burhanpur', 9)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (29, N'Petit-Hallet', 44)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (30, N'Oudekapelle', 61)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (31, N'Coaldale', 15)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (32, N'Madurai', 76)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (33, N'Llandrindod Wells', 2)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (34, N'Terme', 15)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (35, N'Hull', 96)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (36, N'Westmeerbeek', 27)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (37, N'San Francisco', 64)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (38, N'LaSalle', 100)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (39, N'Çaldiran', 98)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (40, N'Sant''Agata sul Santerno', 87)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (41, N'Newton Stewart', 88)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (42, N'Ajaccio', 64)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (43, N'Meppel', 96)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (44, N'Bègles', 11)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (45, N'Spy', 29)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (46, N'Mellery', 33)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (47, N'Berg', 72)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (48, N'King Township', 97)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (49, N'Almería', 2)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (50, N'Seborga', 41)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (51, N'Georgia', 86)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (52, N'Collines-de-l''Outaouais', 7)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (53, N'Assiniboia', 69)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (54, N'Parchim	City', 53)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (55, N'Cairns', 15)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (56, N'Ollolai', 18)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (57, N'Los Angeles', 79)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (58, N'Invercargill', 61)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (59, N'Great Falls', 26)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (60, N'Macquenoise', 26)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (61, N'Nagaon', 49)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (62, N'Montacuto', 81)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (63, N'Livingston', 2)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (64, N'Lakewood', 36)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (65, N'Paraíso', 36)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (66, N'Mühlheim am Main', 95)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (67, N'Merbes-le-Ch‰teau', 71)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (68, N'Bailivre', 54)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (69, N'St. Andrä', 49)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (70, N'Aksehir', 66)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (71, N'Islahiye', 7)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (72, N'Ostra Vetere', 49)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (73, N'Tejar', 1)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (74, N'Bihain', 89)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (75, N'Sherbrooke', 97)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (76, N'Dandenong', 38)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (77, N'Sacramento', 20)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (78, N'Kirkwall', 88)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (79, N'Idar-Oberstei', 10)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (80, N'Rahim Yar Khan', 32)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (81, N'Kamalia', 34)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (82, N'Annapolis Royal', 19)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (83, N'Matagami', 9)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (84, N'Turriff', 50)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (85, N'Bossire', 5)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (86, N'Bolano', 9)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (87, N'Sperlinga', 47)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (88, N'Masone', 92)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (89, N'Anzegem', 53)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (90, N'Maple Ridge', 11)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (91, N'Asansol', 17)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (92, N'Medea', 13)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (93, N'Rae Bareli', 14)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (94, N'Colchester', 17)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (95, N'Veerle', 54)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (96, N'Tubeke Tubize', 44)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (97, N'La Estrella', 59)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (98, N'Borgo Valsugana', 80)
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (99, N'Meux', 28)
GO
INSERT [dbo].[TOWN] ([Id], [Name], [CountryId]) VALUES (100, N'Dallas', 6)
SET IDENTITY_INSERT [dbo].[TOWN] OFF
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_TOWN] FOREIGN KEY([TownId])
REFERENCES [dbo].[TOWN] ([Id])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_TOWN]
GO
ALTER TABLE [dbo].[COUNTRY]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRY_CONTINENT] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[CONTINENT] ([Id])
GO
ALTER TABLE [dbo].[COUNTRY] CHECK CONSTRAINT [FK_COUNTRY_CONTINENT]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_ADDRESS1] FOREIGN KEY([AddressId])
REFERENCES [dbo].[ADDRESS] ([Id])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_ADDRESS1]
GO
ALTER TABLE [dbo].[TOWN]  WITH CHECK ADD  CONSTRAINT [FK_TOWN_COUNTRY] FOREIGN KEY([CountryId])
REFERENCES [dbo].[COUNTRY] ([Id])
GO
ALTER TABLE [dbo].[TOWN] CHECK CONSTRAINT [FK_TOWN_COUNTRY]
GO
USE [master]
GO
ALTER DATABASE [Research] SET  READ_WRITE 
GO
