USE [master]
GO
/****** Object:  Database [STD_DB]    Script Date: 2020-08-10 17:49:21 ******/
CREATE DATABASE [STD_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STD_DB', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\STD_DB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STD_DB_log', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\STD_DB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STD_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STD_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STD_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STD_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STD_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STD_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STD_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [STD_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STD_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STD_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STD_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STD_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STD_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STD_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STD_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STD_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STD_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STD_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STD_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STD_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STD_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STD_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STD_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STD_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STD_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [STD_DB] SET  MULTI_USER 
GO
ALTER DATABASE [STD_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STD_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STD_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STD_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [STD_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STD_DB', N'ON'
GO
USE [STD_DB]
GO
/****** Object:  Table [dbo].[DJBoxTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DJBoxTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cabinetId] [int] NOT NULL,
	[boxId] [int] NOT NULL,
	[boxType] [nvarchar](10) NULL,
	[IsLocked] [nvarchar](10) NULL,
	[IsBind] [nvarchar](10) NULL,
	[IsLongBind] [nvarchar](10) NULL,
	[IsSnapBind] [nvarchar](10) NULL,
	[IsFree] [nvarchar](10) NULL,
	[bindFeature] [nvarchar](50) NULL,
	[bindObject] [nvarchar](50) NULL,
	[bindObjectFormat] [nvarchar](50) NULL,
	[bindObjectProof] [nvarchar](50) NULL,
	[bindUserName] [nvarchar](50) NULL,
	[remarks] [nvarchar](100) NULL,
	[count] [int] NOT NULL CONSTRAINT [DF_DJBoxTable_count]  DEFAULT ((0)),
 CONSTRAINT [PK_DJBoxTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DJCabinetTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DJCabinetTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cabinetNO] [nvarchar](50) NOT NULL,
	[boxCount] [int] NOT NULL CONSTRAINT [DF_DJCabinetTable_boxCount]  DEFAULT ((0)),
 CONSTRAINT [PK_DJCabinetTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DJCardTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DJCardTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cardNO] [nvarchar](50) NULL,
	[userName] [nvarchar](50) NULL,
	[department] [nvarchar](50) NULL,
 CONSTRAINT [PK_DJCardTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FaceTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaceTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faceid] [bigint] NOT NULL,
	[userid] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaterialInventoryTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialInventoryTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[materialId] [int] NOT NULL,
	[materialName] [nvarchar](50) NULL,
	[materialNum] [nvarchar](50) NULL,
	[internalFileNo] [nvarchar](50) NULL,
	[assetNo] [nvarchar](50) NULL,
	[remarks] [nvarchar](max) NULL,
	[count] [int] NULL,
	[boxId] [int] NULL,
	[cabinetId] [int] NULL,
 CONSTRAINT [PK_MaterialInventoryTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaterialTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[materialName] [nvarchar](50) NULL,
	[materialNum] [nvarchar](50) NULL,
	[itemNum] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_MaterialTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OpenBoxRecordTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenBoxRecordTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cabinetNO] [nvarchar](50) NOT NULL,
	[boxId] [int] NOT NULL,
	[bindUserName] [nvarchar](50) NOT NULL,
	[bindObject] [nvarchar](50) NULL,
	[openTarget] [nvarchar](50) NOT NULL,
	[dateTime] [nvarchar](50) NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_RecordTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfoTable]    Script Date: 2020-08-10 17:49:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfoTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[cardNO] [nvarchar](50) NULL,
	[cardNO2] [nvarchar](50) NULL,
	[position] [nvarchar](50) NULL,
	[boxIds] [nvarchar](max) NULL,
	[counts] [nvarchar](max) NULL,
	[fingerId] [int] NULL,
	[boxId] [int] NULL,
	[passWord] [nvarchar](50) NULL,
	[phoneNO] [nvarchar](50) NULL,
	[materialNames] [nvarchar](max) NULL,
	[department] [nvarchar](50) NULL,
	[dateTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_FingerBindTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DJBoxTable] ON 

INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (1, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (2, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (3, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (4, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (5, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (6, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (7, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (8, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (9, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (10, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (11, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (12, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (13, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (14, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (15, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (16, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (17, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (18, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (19, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (20, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (21, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (22, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (23, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[DJBoxTable] ([id], [cabinetId], [boxId], [boxType], [IsLocked], [IsBind], [IsLongBind], [IsSnapBind], [IsFree], [bindFeature], [bindObject], [bindObjectFormat], [bindObjectProof], [bindUserName], [remarks], [count]) VALUES (24, 1, 24, N'小', N'false', N'false', N'false', N'false', N'true', N'', N'', N'', N'', N'', N'', 0)
SET IDENTITY_INSERT [dbo].[DJBoxTable] OFF
SET IDENTITY_INSERT [dbo].[DJCabinetTable] ON 

INSERT [dbo].[DJCabinetTable] ([id], [cabinetNO], [boxCount]) VALUES (1, N'001', 9)
SET IDENTITY_INSERT [dbo].[DJCabinetTable] OFF
ALTER TABLE [dbo].[OpenBoxRecordTable] ADD  CONSTRAINT [DF_OpenBoxRecordTable_count]  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[MaterialInventoryTable]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInventoryTable_MaterialTable] FOREIGN KEY([materialId])
REFERENCES [dbo].[MaterialTable] ([id])
GO
ALTER TABLE [dbo].[MaterialInventoryTable] CHECK CONSTRAINT [FK_MaterialInventoryTable_MaterialTable]
GO
USE [master]
GO
ALTER DATABASE [STD_DB] SET  READ_WRITE 
GO
