USE [master]
GO
/****** Object:  Database [proyecto]    Script Date: 15/6/2024 11:37:48 ******/
CREATE DATABASE [proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\proyecto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\proyecto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [proyecto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [proyecto] SET QUERY_STORE = ON
GO
ALTER DATABASE [proyecto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [proyecto]
GO
/****** Object:  UserDefinedTableType [dbo].[IMAGE_PRODUCT_LIST]    Script Date: 15/6/2024 11:37:48 ******/
CREATE TYPE [dbo].[IMAGE_PRODUCT_LIST] AS TABLE(
	[ID_PRODUCT] [int] NULL,
	[IMAGE_NAME] [nvarchar](100) NULL,
	[PRODUCT_IMAGE] [varbinary](max) NULL
)
GO
/****** Object:  Table [dbo].[Address]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[IdAddress] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](100) NULL,
	[IdProvince] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID_CATEGORY] [int] IDENTITY(1,1) NOT NULL,
	[CODE_CATEGORY] [nvarchar](100) NULL,
	[CATEGORY_NAME] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CATEGORY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CODE_CATEGORY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CATEGORY_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[IdPerson] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGE_PRODUCT]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_PRODUCT](
	[ID_IMAGE] [int] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCT] [int] NULL,
	[IMAGE_NAME] [nvarchar](100) NULL,
	[PRODUCT_IMAGE] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_IMAGE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[methodSend]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[methodSend](
	[id_MethodSend] [int] IDENTITY(1,1) NOT NULL,
	[nameMethod] [varchar](100) NULL,
	[id_Supplier] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_MethodSend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Orders_id] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NULL,
	[id_shipment] [int] NULL,
	[deleted] [bit] NOT NULL,
	[ProductsOrdered] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Orders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Payment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentStatus] [varchar](20) NOT NULL,
	[PaymentMethod_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethod_Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PaymentMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentRejected]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentRejected](
	[PaymentRejected_Id] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentRejected_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTransaction]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTransaction](
	[Transaction_Id] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Id] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionAmount] [decimal](10, 2) NOT NULL,
	[TransactionStatus] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[IdPerson] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[lastName] [nvarchar](100) NOT NULL,
	[secondLastName] [nvarchar](100) NOT NULL,
	[IdPhone] [int] NULL,
	[IdAddress] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[IdPhone] [int] IDENTITY(1,1) NOT NULL,
	[phone] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID_PRODUCT] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCT_CODE] [nvarchar](100) NULL,
	[PRODUCT_NAME] [nvarchar](100) NULL,
	[PRODUCT_DESCRIPTION] [nvarchar](255) NULL,
	[ID_SUPPLIER] [int] NULL,
	[PRICE] [decimal](10, 2) NULL,
	[ID_CATEGORY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PRODUCT_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsOrdered]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsOrdered](
	[ProductsOrdered_id] [int] IDENTITY(1,1) NOT NULL,
	[Orders_id] [int] NULL,
	[ID_PRODUCT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductsOrdered_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[IdProvince] [int] IDENTITY(1,1) NOT NULL,
	[nameProvince] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvince] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nameProvince] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUNTUATION]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUNTUATION](
	[ID_PUNTUATION] [int] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCT] [int] NULL,
	[REVIEW] [nvarchar](155) NULL,
	[PUNTUATION_VALUE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PUNTUATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipments]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipments](
	[id_shipment] [int] IDENTITY(1,1) NOT NULL,
	[id_Supplier] [int] NULL,
	[price_final] [decimal](18, 0) NULL,
	[date_send] [datetime] NULL,
	[date_arrival] [datetime] NULL,
	[days_elapsed] [int] NULL,
	[fkIdAddress] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_shipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingHistory]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingHistory](
	[IdShoppingHistory] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdShoppingHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STOCK]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOCK](
	[ID_STOCK] [int] IDENTITY(1,1) NOT NULL,
	[ID_PRODUCT] [int] NULL,
	[QUANTITY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_STOCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPPLIER]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLIER](
	[ID_SUPPLIER] [int] IDENTITY(1,1) NOT NULL,
	[SUPPLIER_CODE] [nvarchar](100) NULL,
	[SUPPLIER_NAME] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_SUPPLIER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SUPPLIER_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SUPPLIER_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[id_Supplier] [int] IDENTITY(1,1) NOT NULL,
	[nameSupplier] [varchar](50) NULL,
	[informationSupplier] [varchar](500) NULL,
	[priceBase] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([IdProvince])
REFERENCES [dbo].[Province] ([IdProvince])
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD FOREIGN KEY([IdPerson])
REFERENCES [dbo].[Person] ([IdPerson])
GO
ALTER TABLE [dbo].[IMAGE_PRODUCT]  WITH CHECK ADD FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
GO
ALTER TABLE [dbo].[methodSend]  WITH CHECK ADD FOREIGN KEY([id_Supplier])
REFERENCES [dbo].[suppliers] ([id_Supplier])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([id_shipment])
REFERENCES [dbo].[shipments] ([id_shipment])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Orders_id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([PaymentMethod_Id])
REFERENCES [dbo].[PaymentMethod] ([PaymentMethod_Id])
GO
ALTER TABLE [dbo].[PaymentRejected]  WITH CHECK ADD FOREIGN KEY([Payment_Id])
REFERENCES [dbo].[Payment] ([Payment_Id])
GO
ALTER TABLE [dbo].[PaymentTransaction]  WITH CHECK ADD FOREIGN KEY([Payment_Id])
REFERENCES [dbo].[Payment] ([Payment_Id])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD FOREIGN KEY([IdAddress])
REFERENCES [dbo].[Address] ([IdAddress])
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD FOREIGN KEY([IdPhone])
REFERENCES [dbo].[Phone] ([IdPhone])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([ID_CATEGORY])
REFERENCES [dbo].[CATEGORY] ([ID_CATEGORY])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([ID_SUPPLIER])
REFERENCES [dbo].[SUPPLIER] ([ID_SUPPLIER])
GO
ALTER TABLE [dbo].[ProductsOrdered]  WITH CHECK ADD FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
GO
ALTER TABLE [dbo].[ProductsOrdered]  WITH CHECK ADD FOREIGN KEY([Orders_id])
REFERENCES [dbo].[Orders] ([Orders_id])
GO
ALTER TABLE [dbo].[PUNTUATION]  WITH CHECK ADD FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
GO
ALTER TABLE [dbo].[shipments]  WITH CHECK ADD FOREIGN KEY([fkIdAddress])
REFERENCES [dbo].[Address] ([IdAddress])
GO
ALTER TABLE [dbo].[shipments]  WITH CHECK ADD FOREIGN KEY([id_Supplier])
REFERENCES [dbo].[suppliers] ([id_Supplier])
GO
ALTER TABLE [dbo].[ShoppingHistory]  WITH CHECK ADD FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STOCK]  WITH CHECK ADD FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
GO
/****** Object:  StoredProcedure [dbo].[CreateShipment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CREATE
CREATE PROCEDURE [dbo].[CreateShipment]
    @id_Supplier INT,
    @price_final DECIMAL,
    @date_send DATETIME,
    @date_arrival DATETIME,
    @days_elapsed INT,
	@fkIdAddress INT
AS
    BEGIN
        INSERT INTO shipments (id_Supplier, price_final, date_send, date_arrival, days_elapsed, fkIdAddress)
        VALUES (@id_Supplier, @price_final, @date_send, @date_arrival, @days_elapsed, @fkIdAddress);
		RETURN scope_identity();
    END
GO
/****** Object:  StoredProcedure [dbo].[DeleteShipment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DELETE
CREATE PROCEDURE [dbo].[DeleteShipment]
    @id_shipment INT
AS
BEGIN
    DELETE FROM shipments WHERE id_shipment = @id_shipment;
	return 1;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertOrder]
    @IdClient INT,
    @id_shipment INT,
	@deleted BIT,
    @Orders_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdClient)
        BEGIN
            RAISERROR('El cliente con Id %d no existe.', 16, 1, @IdClient);
            RETURN;
        END
        
        -- Validar existencia del envío
        IF NOT EXISTS (SELECT 1 FROM Shipments WHERE id_shipment = @id_shipment)
        BEGIN
            RAISERROR('El envío con Id %d no existe.', 16, 1, @id_shipment);
            RETURN;
        END

        INSERT INTO Orders (IdClient, id_shipment, Deleted)
        VALUES (@IdClient, @id_shipment, @deleted);

        SET @Orders_id = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        SET @Orders_id = 0;
        THROW; -- Re-lanza la excepción para que sea capturada por la transacción externa
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrderWithProducts]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- CREANDO SP CON LA TRANSACTION QUE INCLUYE LOS OTROS 2 SPS, PARA YA AGREGAR PEDIDOS DEFINITIVAMENTE

Create PROCEDURE [dbo].[InsertOrderWithProducts]
    @IdClient INT,
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
	@DeletedVar BIT, 
    @OrderCreated INT OUTPUT,
    @LastProductsOrdered INT OUTPUT,
    @Error VARCHAR(500) OUTPUT,

	-- Parametros SP insert Shipment
	@idSupplier INT,
	@priceFinal DECIMAL,
	@dateSend DATETIME,
	@dateArrival DATETIME,
	@daysElapsed INT,
	@idShipmentOrder INT,
	@idDireccion INT

AS
BEGIN
    SET NOCOUNT ON; -- Evita que se devuelvan mensajes de cuenta de filas afectadas
    BEGIN TRANSACTION;
    BEGIN TRY

		-- Insertar el shipment
	EXEC @idShipmentOrder = CreateShipment
			@id_Supplier = @idSupplier,
			@price_final = @priceFinal,
			@date_send = @dateArrival,
			@date_arrival = @dateArrival,
			@days_elapsed = @daysElapsed,
			@fkIdAddress = @idDireccion;

        -- Insertar en Orders
        EXEC InsertOrder
            @IdClient = @IdClient, 
            @id_shipment = @idShipmentOrder, 
			@Deleted = @DeletedVar,
            @Orders_id = @OrderCreated OUTPUT;

        -- Insertar en ProductsOrdered
        EXEC InsertProductsOrdered
            @Orders_id = @OrderCreated, 
            @ProductIds = @ProductIds, 
            @ProductsOrdered_id = @LastProductsOrdered OUTPUT;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        SET @Error = ERROR_MESSAGE();
        PRINT 'Error al insertar el pedido: ' + @Error;
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProductsOrdered]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- INSERTAR EN LA TABLA PRODUCTS_ORDERED (relacion 1 a n, un pedido n productos)
Create PROCEDURE [dbo].[InsertProductsOrdered]
    @Orders_id INT, -- ID del pedido recién creado
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
    @ProductsOrdered_id INT OUTPUT -- ID de la relación de productos ordenados que se devolverá
AS
BEGIN
    SET NOCOUNT ON; -- Evita que se devuelvan mensajes de cuenta de filas afectadas
    BEGIN TRY
 
	    IF NOT EXISTS (SELECT 1 FROM Orders WHERE Orders_id = @Orders_id)
        BEGIN
            RAISERROR('El pedido con Id %d no existe.', 16, 1, @Orders_id);
            RETURN;
        END
    
        DECLARE @ProductId INT; -- Variable para almacenar temporalmente cada ID de producto
        DECLARE @Index INT = 1; -- Índice inicial para el bucle
        DECLARE @ProductIdList TABLE (ProductId INT); -- Tabla temporal para almacenar los IDs de productos

        -- Divide la cadena de IDs de productos en una tabla
        WHILE LEN(@ProductIds) > 0
        BEGIN
            -- Extrae el primer ID de producto de la cadena
            SET @ProductId = CAST(SUBSTRING(@ProductIds, 1, CHARINDEX(',', @ProductIds + ',') - 1) AS INT);
            
            IF NOT EXISTS (SELECT 1 FROM Products WHERE ProductId = @ProductId)
            BEGIN
                RAISERROR('El producto con Id %d no existe.', 16, 1, @ProductId);
                RETURN;
            END
            
            -- Inserta el ID de producto en la tabla temporal
            INSERT INTO @ProductIdList (ProductId) VALUES (@ProductId);
            -- Elimina el ID de producto procesado de la cadena
            SET @ProductIds = STUFF(@ProductIds, 1, CHARINDEX(',', @ProductIds + ','), '');
        END

        -- Inserta cada producto en la tabla ProductsOrdered
        INSERT INTO ProductsOrdered (Orders_id, ID_PRODUCT)
        OUTPUT INSERTED.ProductsOrdered_id INTO @ProductIdList -- Captura el ID insertado
        SELECT @Orders_id, ProductId FROM @ProductIdList;

        -- Obtiene el último ID de ProductsOrdered insertado
        SELECT TOP 1 @ProductsOrdered_id = ProductsOrdered_id FROM ProductsOrdered WHERE Orders_id = @Orders_id ORDER BY ProductsOrdered_id DESC;
    END TRY
    BEGIN CATCH
        SET @ProductsOrdered_id = 0; -- Establece el valor de salida a 0 en caso de error
        THROW; -- Re-lanza la excepción para que sea capturada por la transacción externa
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ReadShipment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	-- READ
CREATE PROCEDURE [dbo].[ReadShipment]
    @id_shipment INT
AS
	BEGIN
		SELECT price_final, date_send,date_arrival,days_elapsed,fkIdAddress
		FROM shipments
		WHERE id_shipment = @id_shipment;
	END
GO
/****** Object:  StoredProcedure [dbo].[ReadShipmentAll]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	-- READ ALL
CREATE PROCEDURE [dbo].[ReadShipmentAll]
AS
BEGIN
    SELECT id_shipment,price_final, date_send,date_arrival,days_elapsed
    FROM shipments
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateClient]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/1/24>
-- Description:	<CRUD CLIENT>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateClient] 
--Parameter initialization
	--Province
	@IdProvince int,
	@nameProvince nvarchar(20),
	--Phone
	@IdPhone int,
	@phone int,

	--Address
	@IdAddress int,
	@street nvarchar (100),
	--Person
	@IdPerson int,
	@name nvarchar(100),
	@lastName nvarchar(100),
	@secondLastName nvarchar(100),
	--Client
	@IdClient int,
	--ShoppingHistory
	@IdShoppingHistory int,
	--Variables
	@ERROR INT OUT
	
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	BEGIN TRY

	INSERT INTO Province(
		nameProvince)
	VALUES(
		@nameProvince
	)
	SET @IdProvince = SCOPE_IDENTITY()

	INSERT INTO Phone(
		phone)
	VALUES(
		@phone
	)
	SET @IdPhone = SCOPE_IDENTITY()

	INSERT INTO Address(
		street,
		IdProvince)
	VALUES(
		@street,
		@IdProvince)
	SET @IdAddress = SCOPE_IDENTITY()

	INSERT INTO Person(
		name,
		lastName,
		secondLastName,
		IdPhone,
		IdAddress)
	VALUES(
		@name,
		@lastName,
		@secondLastName,
		@IdPhone,
		@IdAddress)
	SET @IdPerson = SCOPE_IDENTITY()

	INSERT INTO Client(
		IdPerson)
	VALUES(
		@IdPerson)
	SET @IdClient = SCOPE_IDENTITY()

	INSERT INTO ShoppingHistory(
		IdClient)
	VALUES(
		@IdClient)
	SET @IdShoppingHistory = SCOPE_IDENTITY()

	COMMIT

	END TRY

	BEGIN CATCH
	SET @ERROR = ERROR_NUMBER()
	ROLLBACK TRAN

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteCategory]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_DeleteCategory]
	@Cat_Code nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @Cat_Code IS NULL OR @Cat_Code = ''
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	DECLARE @ID_CAT int


	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY = @Cat_Code)
	BEGIN
	SELECT @ID_CAT=ID_CATEGORY FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code
	
	IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE ID_CATEGORY=@ID_CAT)
	BEGIN
	
	BEGIN TRANSACTION
	BEGIN TRY

	DELETE FROM CATEGORY WHERE ID_CATEGORY=@ID_CAT
	set @return=1
	COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
	set @return=-2

	END CATCH
	
	RETURN;
	END
	ELSE
	BEGIN
	SET @return=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	set @return=0
	return;
	END
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteClient]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/2/24>
-- Description:	<CRUD CLIENT>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteClient]
    @IdToDelete INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdToDelete)
    BEGIN
       
        SET @IsDeleted = 0;
    END
    ELSE
    BEGIN
      
        DELETE FROM Client WHERE IdClient = @IdToDelete;


        IF @@ROWCOUNT > 0
        BEGIN

            SET @IsDeleted = 1;
        END
        ELSE
        BEGIN

            SET @IsDeleted = 0;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePaymentMethod]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Kendall>
-- Create date: <Create, 31/05/2024>
-- Description:	<Description, sp>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletePaymentMethod]
    @IdToDelete INT,
    @IsDeleted BIT OUTPUT
AS
BEGIN
    -- Verificar si el registro deseado existe
    IF NOT EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethod_Id = @IdToDelete)
    BEGIN
        -- No se puede eliminar, porque el m todo de pago no existe
        SET @IsDeleted = 0;
    END
    ELSE
    BEGIN
        -- Eliminar el m todo de pago
        DELETE FROM PaymentMethod WHERE PaymentMethod_Id = @IdToDelete;

        -- Verificar si el registro fue eliminado correctamente
        IF @@ROWCOUNT > 0
        BEGIN
            -- El m todo de pago fue eliminado correctamente
            SET @IsDeleted = 1;
        END
        ELSE
        BEGIN
            -- No se pudo eliminar el m todo de pago
            SET @IsDeleted = 0;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteProduct]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_DeleteProduct]

@code_product nvarchar(100),
@id_return int output

	
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_product IS NULL OR @code_product=''
	BEGIN
	SET @id_return=-1
	RETURN;
	END

	DECLARE @ID_P INT

	BEGIN TRANSACTION
	BEGIN TRY


	IF EXISTS (SELECT 1 FROM PRODUCT WHERE PRODUCT_CODE=@code_product)
	BEGIN
	EXEC Sp_SelectIdProduct @code_product,@ID_P output

	IF EXISTS (SELECT 1 FROM STOCK WHERE ID_PRODUCT=@ID_P)
	BEGIN
	DELETE FROM STOCK WHERE ID_PRODUCT=@ID_P
	END


	IF EXISTS (SELECT 1 FROM IMAGE_PRODUCT WHERE ID_PRODUCT=@ID_P)
	BEGIN
	DELETE FROM IMAGE_PRODUCT WHERE ID_PRODUCT=@ID_P
	END
	ELSE
	BEGIN
	SET @id_return=-7
	ROLLBACK TRANSACTION
	END


	DELETE FROM PRODUCT WHERE ID_PRODUCT=@ID_P
	SET @id_return=1
	END
	ELSE
	BEGIN
	SET @id_return=-10
	END
	


	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SET @id_return=-6
	ROLLBACK TRANSACTION
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteSupplierProd]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_DeleteSupplierProd]
	@supplier_code nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @supplier_code IS NULL OR @supplier_code = ''
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	DECLARE @ID_supplier int
	


	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE = @supplier_code)
	BEGIN
	SELECT @ID_supplier=ID_SUPPLIER FROM SUPPLIER WHERE SUPPLIER_CODE=@supplier_code
	
	IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE ID_SUPPLIER=@ID_supplier)
	BEGIN
	
	BEGIN TRANSACTION
	BEGIN TRY

	DELETE FROM SUPPLIER WHERE ID_SUPPLIER=@ID_supplier
	set @return=1
	COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

	ROLLBACK TRANSACTION
	set @return=-2

	END CATCH
	
	RETURN;
	END
	ELSE
	BEGIN
	SET @return=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	set @return=0
	return;
	END
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteSuppliers]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brayan Rosales
-- Create date: 15-06-2024_
-- Description:	delete de suplidores
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteSuppliers] 
	-- Add the parameters for the stored procedure here
	@idSupplier int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from suppliers where id_Supplier = @idSupplier;
	return 1;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertCategory]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_InsertCategory]
	@Cat_Code nvarchar (100),
	@Cat_Name nvarchar (100),
	@return int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;


	IF @Cat_Code IS NULL OR @Cat_Code = '' OR @Cat_Name IS NULL OR @Cat_Name = '' 
    BEGIN
        SET @return = -1; 
        RETURN;
    END

	IF  DATALENGTH(@Cat_name) > 100
	BEGIN
	SET @return=-4
	RETURN;
	END

	BEGIN TRANSACTION
	BEGIN TRY


	IF NOT EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY = @Cat_Code OR CATEGORY_NAME=@Cat_Name)
	BEGIN
	
	INSERT INTO CATEGORY (CODE_CATEGORY,CATEGORY_NAME)
	VALUES (@Cat_Code,@Cat_Name)
	COMMIT TRANSACTION
	set @return=1
	END
	ELSE
	BEGIN
	ROLLBACK TRANSACTION
	set @return=0
	END
	
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @return=-2
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPaymentMethod]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Kendall>
-- Create date: <Create, 31/05/2024>
-- Description:	<Description, sp>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertPaymentMethod]
    @PaymentMethodName VARCHAR(50),
    @IdToReturn INT OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Intentar insertar un nuevo m todo de pago
        INSERT INTO PaymentMethod (PaymentMethodName)
        VALUES (@PaymentMethodName);
        
        -- Si se llega a este punto, la inserci n fue exitosa
        SET @IdToReturn = SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
        -- Capturar el error y devolver el ID 0 para indicar un nombre repetido y la no inserccion
        SET @IdToReturn = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertProduct]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Josue,Porras>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[Sp_InsertProduct] 
	@productCode nvarchar (100),
	@product_name nvarchar (100),
	@product_description nvarchar (255),
	@supplier_code nvarchar (100),
	@price decimal (10,2),
	@code_category nvarchar (100),
	@images_Prod IMAGE_PRODUCT_LIST READONLY,
	@QUANTITY INT,
	@id_return int output

AS
BEGIN

	SET NOCOUNT ON;

	IF @productCode is null or @productCode = '' or @product_name is null or @product_name = '' or @product_description is null or @product_description = ''
	or @supplier_code is null or @supplier_code = '' or @price is null or @price <= 0 or @code_category is null or @code_category = '' 
	begin
	set @id_return=-1;
	return;
	end

	DECLARE @ID_C INT
	DECLARE @ID_S INT
	DECLARE @ID_P INT

	BEGIN TRANSACTION
	BEGIN TRY

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@code_category ) AND EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@supplier_code )
	BEGIN

	EXEC Sp_selectIdCat @code_category,@ID_C output

	EXEC Sp_SelectIdSupplierProd @supplier_code, @ID_S output

	IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE PRODUCT_CODE=@productCode OR PRODUCT_NAME=@product_name AND ID_SUPPLIER=@ID_S)
	BEGIN

	INSERT INTO PRODUCT (ID_CATEGORY,ID_SUPPLIER,PRICE,PRODUCT_CODE,PRODUCT_DESCRIPTION,PRODUCT_NAME)
	VALUES (@ID_C,@ID_S,@price,@productCode,@product_description,@product_name)
	SET @ID_P= SCOPE_IDENTITY()

	IF @ID_P>0
	BEGIN
	INSERT INTO STOCK (ID_PRODUCT,QUANTITY)VALUES (@ID_P,@QUANTITY)

	INSERT INTO IMAGE_PRODUCT (ID_PRODUCT,IMAGE_NAME,PRODUCT_IMAGE)
	SELECT @ID_P, IMAGE_NAME ,PRODUCT_IMAGE FROM @images_Prod

    SET @id_return=1
	END
	ELSE
	BEGIN
	SET @id_return=0
	ROLLBACK TRANSACTION
	END


	END
	ELSE
	BEGIN
	SET @id_return =-3
	END

	END
	ELSE
	BEGIN
	SET @id_return=-2
	END

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	SET @id_return=1
	ROLLBACK TRANSACTION
	END CATCH


  
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertSupplier]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_InsertSupplier]

@code_supplier nvarchar (100),
@name_supplier nvarchar (100),
@bl_return int OUTPUT 
	
AS
BEGIN

	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = '' OR @name_supplier IS NULL OR @name_supplier = '' 
    BEGIN
        SET @bl_return = -1; 
        RETURN;
    END

	IF  DATALENGTH(@name_supplier) > 100 OR DATALENGTH(@code_supplier) > 100
	BEGIN
	SET @bl_return=-4
	RETURN;
	END

	BEGIN TRANSACTION
	BEGIN TRY


	IF NOT EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE = @code_supplier OR SUPPLIER_NAME=@name_supplier)
	BEGIN
	
	INSERT INTO SUPPLIER(SUPPLIER_CODE,SUPPLIER_NAME)
	VALUES (@code_supplier,@name_supplier)
	COMMIT TRANSACTION
	set @bl_return=1
	END
	ELSE
	BEGIN
	ROLLBACK TRANSACTION
	set @bl_return=0
	END
	
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @bl_return=-2
	END CATCH
	

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModifyCategory]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_ModifyCategory]
	@Cat_Code nvarchar (100),
	@Cat_name nvarchar(100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @Cat_Code IS NULL OR @Cat_Code = '' OR @Cat_name IS NULL OR @Cat_name = '' 
    BEGIN
	SET @return_Id = -1
        RETURN;
    END

	IF  DATALENGTH(@Cat_Code) > 100 OR DATALENGTH(@Cat_name) > 100
	BEGIN
	SET @return_Id=-2
	RETURN;
	END

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code)
	BEGIN

	IF NOT EXISTS (SELECT 1 FROM CATEGORY WHERE CATEGORY_NAME = @Cat_name AND CODE_CATEGORY <> @Cat_Code)
	BEGIN
	UPDATE CATEGORY SET CATEGORY_NAME= @Cat_name WHERE CODE_CATEGORY=@Cat_Code
	SET @return_Id=1
	RETURN;
	END
	ELSE
	BEGIN
	SET @return_Id=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	SET @return_Id=0
	RETURN;
	END
	


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModifySupplierProd]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_ModifySupplierProd]
	@code_supplier nvarchar (100),
	@name_supplier nvarchar(100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = '' OR @name_supplier IS NULL OR @name_supplier = '' 
    BEGIN
	SET @return_Id = -1
        RETURN;
    END

	IF  DATALENGTH(@code_supplier) > 100 OR DATALENGTH(@name_supplier) > 100
	BEGIN
	SET @return_Id=-2
	RETURN;
	END

	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier)
	BEGIN

	IF NOT EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_NAME = @name_supplier AND SUPPLIER_CODE <> @code_supplier)
	BEGIN
	UPDATE SUPPLIER SET SUPPLIER_NAME= @name_supplier WHERE SUPPLIER_CODE=@code_supplier
	SET @return_Id=1
	RETURN;
	END
	ELSE
	BEGIN
	SET @return_Id=-3
	RETURN;
	END

	END
	ELSE
	BEGIN
	SET @return_Id=0
	RETURN;
	END
	


END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterPayment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Creacion de un pago dentro de la aplicacion
CREATE PROCEDURE [dbo].[sp_RegisterPayment]
	
	@Order_Id INT,
	@Amount DECIMAL(10,2),
	@PaymentMethod_Id INT,
	@PaymentGenerated INT OUTPUT,
	@Message VARCHAR(100) OUTPUT

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION 
	
	BEGIN TRY	
		
		--Obtenemos la fecha actual
		DECLARE @StartDate DATETIME = GETDATE();

		-- Insertamos en la tabla de pagos, el estado esta en pendiente por defecto! 
		INSERT INTO Payment 
		VALUES (@Order_Id, @StartDate, @Amount, 'Pendiente', @PaymentMethod_Id);

		SET @PaymentGenerated = SCOPE_IDENTITY();
		-- Simulacion del pago, se crea un rango de 0.0 a 1.0 y con un 70% de probabilidad de exito

		DECLARE @Range FLOAT = RAND(); -- Range tendra un valor de 0.0 a 1.0

		-- Si el rango esta dentro de 0.0 y 0.7 el pago sera exitoso
		IF @Range <= 0.7

		BEGIN 
			
			-- Se simula como si la transaccion llevo varios segundos en procesar los datos
			DECLARE @PastSeconds INT = ROUND(RAND(CHECKSUM(NEWID())) * 29 + 1, 0);

			-- Nueva fecha de la transaccion despues de la simulacion de verificacion
			DECLARE @EndDate DATETIME = DATEADD(SECOND, @PastSeconds, @StartDate);

			-- Calculo de los impuestos
			DECLARE @PaymentTransactionAmount DECIMAL(10,2) = @Amount + (@Amount * 0.13); 

			-- La transaccion se cumplio con exito
			INSERT INTO PaymentTransaction
			VALUES (@PaymentGenerated, @EndDate, @PaymentTransactionAmount, 'Exitosa');

			-- Se actualiza el estado del pedido que estaba pendiente por realizado
			UPDATE Payment
			SET PaymentStatus = 'Realizado'
			WHERE Payment_Id = @PaymentGenerated; 

			SET @Message = '!El pago se realiz  correctamente! Numero generado: ' + CAST(@Range AS VARCHAR(10))

		END

		-- Si el rango es mayor de ese valor entonces el pago sera rechazado
		ELSE

		BEGIN
			
			-- Insertar dentro de una tabla donde se registraran los pagos que fueron rechazados 
			-- mediante la simulacion creada anteriormente
			INSERT INTO PaymentRejected 
			VALUES (@PaymentGenerated); 

			-- Se actualiza el estado del pedido que estaba pendiente por rechazado
			UPDATE Payment
			SET PaymentStatus = 'Rechazado'
			WHERE Payment_Id = @PaymentGenerated;

			SET @Message = '!El pago no se pudo realizar! Numero generado: ' + CAST(@Range AS VARCHAR(10))

		END

	COMMIT
	END TRY

	BEGIN CATCH

	SET @PaymentGenerated = 0;
	SET @Message = 'Algo salio mal';

	ROLLBACK TRANSACTION
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_searchProduct]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Briones Vargas
-- Create date: 25-05-24
-- Description:	Sp que busca productos
-- =============================================
CREATE PROCEDURE [dbo].[sp_searchProduct]
	@productName NVARCHAR(100),
	@categoryName NVARCHAR(100),
	@minPrice DECIMAL(10,2),
	@maxPrice DECIMAL(10,2),
	@ERROR INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		SET @ERROR = 0;
		BEGIN TRY
			SELECT 
				P.PRODUCT_NAME,
				P.PRODUCT_DESCRIPTION,
				P.PRICE,
				C.CATEGORY_NAME,
				S.SUPPLIER_NAME,
				I.PRODUCT_IMAGE,
				ST.QUANTITY
			FROM 
				PRODUCT P
			INNER JOIN 
				CATEGORY C ON P.ID_CATEGORY = C.ID_CATEGORY
			INNER JOIN 
				SUPPLIER S ON P.ID_SUPPLIER = S.ID_SUPPLIER
			LEFT JOIN 
				IMAGE_PRODUCT I ON P.ID_PRODUCT = I.ID_PRODUCT
			LEFT JOIN 
				STOCK ST ON P.ID_PRODUCT = ST.ID_PRODUCT
			WHERE 
				(@productName IS NOT NULL AND P.PRODUCT_NAME LIKE '%' + @productName + '%') OR
				(@categoryName IS NOT NULL AND C.CATEGORY_NAME LIKE '%' + @categoryName + '%') OR
				(@minPrice IS NOT NULL AND P.PRICE >= @minPrice) OR
				(@maxPrice IS NOT NULL AND P.PRICE <= @maxPrice);
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			SET @ERROR = ERROR_NUMBER()
			PRINT 'Error al buscar el producto'
			ROLLBACK TRAN
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectAllCat]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_SelectAllCat]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	
	SELECT ID_CATEGORY,CODE_CATEGORY,CATEGORY_NAME FROM CATEGORY


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_selectALLProduct]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<josue,,porras>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_selectALLProduct]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
	P.ID_PRODUCT,
	P.PRODUCT_CODE,
	P.PRODUCT_NAME,
	P.PRODUCT_DESCRIPTION,
	C.CATEGORY_NAME AS 'NOMBRE_CATEGORIA',
	S.SUPPLIER_NAME AS 'NOMBRE_PROVEEDOR',
	P.PRICE AS 'PRECIO'


	FROM
	PRODUCT P
	INNER JOIN CATEGORY C ON P.ID_CATEGORY=C.ID_CATEGORY
	INNER JOIN SUPPLIER S ON P.ID_SUPPLIER=S.ID_SUPPLIER


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectALLSupplierProd]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_SelectALLSupplierProd]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT ID_SUPPLIER, SUPPLIER_CODE, SUPPLIER_NAME FROM SUPPLIER

	END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectAllSuppliers]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brayan
-- Create date: 15-06-2024
-- Description:	select
-- =============================================
CREATE PROCEDURE [dbo].[sp_selectAllSuppliers] 
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select nameSupplier,informationSupplier,priceBase from suppliers;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectCategory]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_SelectCategory]
	@Cat_Code nvarchar (100),
	@Cat_name nvarchar(100)output,
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @Cat_Code IS NULL OR @Cat_Code = ''
    BEGIN
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code)
	BEGIN
	SELECT @Cat_name=CATEGORY_NAME,@return_Id=ID_CATEGORY FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code
	END
	ELSE
	BEGIN
	SET @Cat_name='NS'
	SET @return_Id=-1
	END


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_selectIdCat]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Sp_selectIdCat]
	@Cat_Code nvarchar (100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @Cat_Code IS NULL OR @Cat_Code = ''
    BEGIN
	SET @return_Id = -1
        RETURN;
    END

	IF  DATALENGTH(@Cat_Code) > 100
	BEGIN
	SET @return_Id=-2
	RETURN;
	END

	IF EXISTS (SELECT 1 FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code)
	BEGIN
	SELECT @return_Id=ID_CATEGORY FROM CATEGORY WHERE CODE_CATEGORY=@Cat_Code
	RETURN;
	END
	ELSE
	BEGIN
	SET @return_Id=0
	RETURN;
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectIdProduct]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Josue Porras>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SelectIdProduct]
	
	@code_product nvarchar (100),
	@id_return int output

AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_product IS NULL OR @code_product=''
	BEGIN
	SET @id_return=-1
	RETURN;
	END


	IF EXISTS (SELECT 1 FROM PRODUCT WHERE PRODUCT_CODE= @code_product)
	BEGIN

	SELECT @id_return= ID_PRODUCT FROM PRODUCT WHERE PRODUCT_CODE=@code_product

	END
	ELSE 
	BEGIN
	SET @id_return=0
	END
   
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectIdSupplierProd]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_SelectIdSupplierProd]
	@code_supplier nvarchar (100),
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = ''
    BEGIN
	    set @return_Id=-2
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier)
	BEGIN
	SELECT @return_Id=ID_SUPPLIER FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier
	END
	ELSE
	BEGIN
	SET @return_Id=-1
	END


	END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectSupplierProd]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_SelectSupplierProd]
	@code_supplier nvarchar (100),
	@name_supplier nvarchar(100)output,
	@return_Id int OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	IF @code_supplier IS NULL OR @code_supplier = ''
    BEGIN
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier)
	BEGIN
	SELECT @name_supplier=SUPPLIER_NAME,@return_Id=ID_SUPPLIER FROM SUPPLIER WHERE SUPPLIER_CODE=@code_supplier
	END
	ELSE
	BEGIN
	SET @name_supplier='NS'
	SET @return_Id=-1
	END


	END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectSuppliersID]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brayan
-- Create date: 15-06-2024
-- Description:	select
-- =============================================
CREATE PROCEDURE [dbo].[sp_selectSuppliersID]
	-- Add the parameters for the stored procedure here
	@id_Supplier int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select nameSupplier,informationSupplier,priceBase from suppliers where id_Supplier = @id_Supplier;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_suppliers]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bryan Rosales
-- Create date: 15-06-2024
-- Description:	sp de suplidores
-- =============================================
CREATE PROCEDURE [dbo].[sp_suppliers] 
	-- Add the parameters for the stored procedure here
	@nameSupplier varchar(50), 
	@informationSupplier varchar(500),
	@priceBase decimal(10,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[suppliers]
			   ([nameSupplier]
			   ,[informationSupplier]
			   ,[priceBase])
		 VALUES
			   (@nameSupplier
			   ,@informationSupplier
			   ,@priceBase)
	return scope_identity();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateClientDetails]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Ceasar Calvo>
-- Create date: <6/3/24>
-- Description:	<CRUD CLIENT>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateClientDetails]
    @IdClient INT,
    @Name NVARCHAR(100),
    @LastName NVARCHAR(100),
    @SecondLastName NVARCHAR(100),
    @Phone INT,
    @Street NVARCHAR(100),
    @IdProvince INT,
    @IdToReturn INT OUTPUT
AS
BEGIN
    DECLARE @IdPerson INT
    DECLARE @IdPhone INT
    DECLARE @IdAddress INT
    
    -- Verificar si el cliente existe
    IF NOT EXISTS (SELECT 1 FROM Client WHERE IdClient = @IdClient)
    BEGIN
        -- No se puede actualizar, el cliente no existe
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Obtener IdPerson del cliente
    SELECT @IdPerson = IdPerson FROM Client WHERE IdClient = @IdClient;
    
    -- Verificar si la persona existe
    IF NOT EXISTS (SELECT 1 FROM Person WHERE IdPerson = @IdPerson)
    BEGIN
        -- No se puede actualizar, la persona no existe
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Obtener IdPhone e IdAddress de la persona
    SELECT @IdPhone = IdPhone, @IdAddress = IdAddress FROM Person WHERE IdPerson = @IdPerson;
    
    -- Verificar si el nuevo n mero de tel fono ya existe para otro registro
    IF EXISTS (SELECT 1 FROM Phone WHERE phone = @Phone AND IdPhone <> @IdPhone)
    BEGIN
        -- No se puede actualizar, el n mero de tel fono ya existe para otro registro
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Verificar si el nuevo nombre de calle ya existe para otro registro
    IF EXISTS (SELECT 1 FROM Address WHERE street = @Street AND IdAddress <> @IdAddress)
    BEGIN
        -- No se puede actualizar, el nombre de la calle ya existe para otro registro
        SET @IdToReturn = 0;
        RETURN;
    END
    
    -- Actualizar la informaci n de la persona
    UPDATE Person
    SET name = @Name, lastName = @LastName, secondLastName = @SecondLastName
    WHERE IdPerson = @IdPerson;
    
    -- Actualizar el tel fono
    UPDATE Phone
    SET phone = @Phone
    WHERE IdPhone = @IdPhone;
    
    -- Actualizar la direcci n
    UPDATE Address
    SET street = @Street, IdProvince = @IdProvince
    WHERE IdAddress = @IdAddress;
    
    -- Devolver el ID del cliente actualizado
    SET @IdToReturn = @IdClient;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePaymentMethod]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Kendall>
-- Create date: <Create, 31/05/2024>
-- Description:	<Description, sp>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdatePaymentMethod]
	@IdToUpdate INT,
    @PaymentMethodName VARCHAR(50),
    @IdToReturn INT OUTPUT
AS
BEGIN
    -- Verificar si el registro deseado existe
    IF NOT EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethod_Id = @IdToUpdate)
    BEGIN
        -- No se puede actualizar, el m todo de pago no existe
        SET @IdToReturn = 0;
    END
    ELSE
    BEGIN
        -- Verificar si el nombre ya existe para otro registro diferente al actual
        IF EXISTS (SELECT 1 FROM PaymentMethod WHERE PaymentMethodName = @PaymentMethodName AND PaymentMethod_Id <> @IdToUpdate)
        BEGIN
            -- No se puede actualizar, el nombre ya existe para otro registro
            SET @IdToReturn = 0;
        END
        ELSE
        BEGIN
            -- Actualizar el m todo de pago existente
            UPDATE PaymentMethod
            SET PaymentMethodName = @PaymentMethodName
            WHERE PaymentMethod_Id = @IdToUpdate;

            -- Devolver el ID del m todo de pago actualizado
            SET @IdToReturn = @IdToUpdate;
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSuppliers]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brayan Rosales
-- Create date: 15-06-2024
-- Description:	sp_updateSuppliers
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateSuppliers] 
	-- Add the parameters for the stored procedure here
	@id_Supplier int,
	@nameSupplier varchar(50), 
	@informationSupplier varchar(500),
	@priceBase decimal(10,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	UPDATE [dbo].[suppliers]
	   SET [nameSupplier] = @nameSupplier
		  ,[informationSupplier] = @informationSupplier
		  ,[priceBase] = @priceBase
	 WHERE id_Supplier = @id_Supplier

	 RETURN 1;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateShipment]    Script Date: 15/6/2024 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- UPDATE
CREATE PROCEDURE [dbo].[UpdateShipment]
    @id_shipment INT,
    @id_Supplier INT,
    @price_final DECIMAL,
    @date_send DATETIME,
    @date_arrival DATETIME,
    @days_elapsed INT
AS
BEGIN
	UPDATE shipments
	SET id_Supplier = @id_Supplier,
		price_final = @price_final,
		date_send = @date_send,
		date_arrival = @date_arrival,
		days_elapsed = @days_elapsed
	WHERE id_shipment = @id_shipment;
END

GO
USE [master]
GO
ALTER DATABASE [proyecto] SET  READ_WRITE 
GO
