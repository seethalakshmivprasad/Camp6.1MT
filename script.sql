USE [master]
GO
/****** Object:  Database [Asset]    Script Date: 19-07-2025 15:58:48 ******/
CREATE DATABASE [Asset]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Asset', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Asset.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Asset_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Asset_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Asset] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Asset].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Asset] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Asset] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Asset] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Asset] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Asset] SET ARITHABORT OFF 
GO
ALTER DATABASE [Asset] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Asset] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Asset] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Asset] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Asset] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Asset] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Asset] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Asset] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Asset] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Asset] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Asset] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Asset] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Asset] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Asset] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Asset] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Asset] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Asset] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Asset] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Asset] SET  MULTI_USER 
GO
ALTER DATABASE [Asset] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Asset] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Asset] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Asset] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Asset] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Asset] SET QUERY_STORE = OFF
GO
USE [Asset]
GO
/****** Object:  Table [dbo].[AssetDefinition]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetDefinition](
	[AssetDefinitionId] [int] IDENTITY(1,1) NOT NULL,
	[AssetTypeId] [int] NOT NULL,
	[AssetName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetDefinitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[AssetId] [int] IDENTITY(1,1) NOT NULL,
	[AssetDefinitionId] [int] NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetType](
	[AssetTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderId] [int] IDENTITY(1,1) NOT NULL,
	[AssetDefinitionId] [int] NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assets] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AssetDefinition]  WITH CHECK ADD  CONSTRAINT [FK_AssetDefinition_AssetType] FOREIGN KEY([AssetTypeId])
REFERENCES [dbo].[AssetType] ([AssetTypeId])
GO
ALTER TABLE [dbo].[AssetDefinition] CHECK CONSTRAINT [FK_AssetDefinition_AssetType]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_AssetDefinition] FOREIGN KEY([AssetDefinitionId])
REFERENCES [dbo].[AssetDefinition] ([AssetDefinitionId])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_AssetDefinition]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_PurchaseOrder] FOREIGN KEY([PurchaseOrderId])
REFERENCES [dbo].[PurchaseOrder] ([PurchaseOrderId])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_PurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_AssetDefinition] FOREIGN KEY([AssetDefinitionId])
REFERENCES [dbo].[AssetDefinition] ([AssetDefinitionId])
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_AssetDefinition]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssetsByName]    Script Date: 19-07-2025 15:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAssetsByName]
    @AssetName NVARCHAR(100)
AS
BEGIN
    SELECT 
        a.AssetId,
        ad.AssetName,
        po.PurchaseOrderId,
        po.Status AS PurchaseOrderStatus,
        a.CreatedDate,
        a.Status AS AssetStatus
    FROM Assets a
    INNER JOIN AssetDefinition ad ON a.AssetDefinitionId = ad.AssetDefinitionId
    INNER JOIN PurchaseOrder po ON a.PurchaseOrderId = po.PurchaseOrderId
    WHERE ad.AssetName LIKE '%' + @AssetName + '%'
END;
GO
USE [master]
GO
ALTER DATABASE [Asset] SET  READ_WRITE 
GO
