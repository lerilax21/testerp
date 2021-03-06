USE [master] 
GO
/****** Object:  Database [ERP_Pro1.0]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE DATABASE [ERP_Pro1.0]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERP_Pro1.0', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ERP_Pro1.0.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ERP_Pro1.0_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ERP_Pro1.0_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ERP_Pro1.0] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP_Pro1.0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP_Pro1.0] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP_Pro1.0] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP_Pro1.0] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ERP_Pro1.0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP_Pro1.0] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ERP_Pro1.0] SET  MULTI_USER 
GO
ALTER DATABASE [ERP_Pro1.0] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERP_Pro1.0] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP_Pro1.0] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP_Pro1.0] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ERP_Pro1.0] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ERP_Pro1.0]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Get_Primarykey_Column]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lerin
-- Create date: 9/11/2016
-- =============================================
CREATE FUNCTION [dbo].[fn_Get_Primarykey_Column] 
(
	@tableName varchar(30)
)
RETURNS varchar(30)
AS
BEGIN
	DECLARE @colName varchar(30)
	SET @colName = (SELECT column_name
					FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
					WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1
					AND table_name = @tableName)
	RETURN @colName
END

GO
/****** Object:  Table [dbo].[Reconciliation_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reconciliation_Detail](
	[recon_det__id] [int] IDENTITY(1,1) NOT NULL,
	[recon_id] [int] NOT NULL,
	[bp_id] [nchar](10) NULL,
	[pmode_id] [int] NULL,
	[transn] [int] NULL,
	[transn_type] [int] NULL,
	[transn_no] [varchar](30) NULL,
	[transn_date] [datetime] NULL,
	[trans_id] [int] NULL,
	[loc_id] [int] NULL,
	[pmode_ref_no] [varchar](20) NULL,
	[pmode_ref_date] [datetime] NULL,
	[recon_no] [varchar](30) NULL,
	[recon_date] [datetime] NULL,
	[recon_status] [int] NULL,
	[journal_id] [int] NULL,
	[ref] [varchar](30) NULL,
	[creditdebit] [int] NOT NULL,
	[currency_id] [int] NOT NULL,
	[exrate] [decimal](14, 4) NOT NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Reconciliation_Detail] PRIMARY KEY CLUSTERED 
(
	[recon_det__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reconciliation_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reconciliation_Master](
	[recon_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[bank_id] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[status] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Reconciliation_Master] PRIMARY KEY CLUSTERED 
(
	[recon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Area](
	[area_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[region_id] [int] NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Area_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Area] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Asset_Group]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Asset_Group](
	[assetgrp_Id] [int] IDENTITY(1,1) NOT NULL,
	[company_Id] [int] NOT NULL,
	[assetgrp_code] [int] NULL,
	[assetgrp_name] [varchar](30) NOT NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Asset_Group] PRIMARY KEY CLUSTERED 
(
	[assetgrp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Asset_Location]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Asset_Location](
	[assetloc_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[transfer_in] [datetime] NULL,
	[transfer_out] [datetime] NULL,
	[total_days] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Asset_Location] PRIMARY KEY CLUSTERED 
(
	[assetloc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Asset_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Asset_Master](
	[asset_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[assettype_id] [int] NOT NULL,
	[assetgrp_id] [int] NULL,
	[assetloc_id] [int] NULL,
	[baseunit_id] [int] NULL,
	[eu_id] [int] NULL,
	[brand_id] [int] NULL,
	[manuf_id] [int] NULL,
	[bp_id] [int] NULL,
	[asset_code] [varchar](20) NULL,
	[asset_name] [varchar](30) NOT NULL,
	[standard] [varchar](30) NULL,
	[sku] [varchar](30) NULL,
	[supplier_barcode] [varchar](30) NULL,
	[search_key] [varchar](30) NULL,
	[purchase_price] [decimal](14, 2) NULL,
	[asset_cost] [decimal](14, 2) NULL,
	[purchase_date] [datetime] NULL,
	[asset_depre] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Asset_Master_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Asset_Master] PRIMARY KEY CLUSTERED 
(
	[asset_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Asset_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Asset_Type](
	[assettype_Id] [int] IDENTITY(1,1) NOT NULL,
	[company_Id] [int] NULL,
	[assettype_code] [int] NULL,
	[assettype_name] [varchar](30) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Asset_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Asset_Type] PRIMARY KEY CLUSTERED 
(
	[assettype_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Bank]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Bank](
	[bank_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[bank_code] [varchar](15) NULL,
	[bank_name] [varchar](50) NULL,
	[reference] [varchar](30) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Bank_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Bank] PRIMARY KEY CLUSTERED 
(
	[bank_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Bank_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Bank_Master](
	[bankmaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[bank_id] [int] NOT NULL,
	[name] [varchar](30) NULL,
	[branch] [nchar](10) NULL,
	[acc_no] [varchar](30) NULL,
	[acc_type] [int] NULL,
	[cntp_person_Id] [int] NULL,
	[reference] [varchar](50) NULL,
	[iban] [varchar](15) NULL,
	[ifsc] [varchar](15) NULL,
	[swift] [varchar](15) NULL,
	[micr] [nchar](10) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Bank_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Bank_Master] PRIMARY KEY CLUSTERED 
(
	[bankmaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Base_Unit]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Base_Unit](
	[bu_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[bu_name] [varchar](30) NULL,
	[decimal] [decimal](12, 4) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Base_Unit_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Base_Unit] PRIMARY KEY CLUSTERED 
(
	[bu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Brand_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Brand_Master](
	[brandmaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[manuf_Id] [int] NULL,
	[bp_Id] [int] NULL,
	[brand_name] [varchar](30) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Brand_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Brand_Master] PRIMARY KEY CLUSTERED 
(
	[brandmaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BusinessPartner_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BusinessPartner_Master](
	[bp_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[currency_Id] [int] NULL,
	[cntp_Id] [int] NULL,
	[ship_cntp_id] [int] NULL,
	[bp_name] [varchar](30) NULL,
	[bp_code] [varchar](20) NULL,
	[bp_type] [int] NULL,
	[order_type] [int] NULL,
	[discount] [decimal](18, 2) NULL,
	[credit_limit] [decimal](18, 2) NULL,
	[tin] [varchar](30) NULL,
	[cst] [varchar](30) NULL,
	[gst] [varchar](30) NULL,
	[pan] [varchar](30) NULL,
	[note] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_BusinessPartner_Master_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_BusinessPartner_Master] PRIMARY KEY CLUSTERED 
(
	[bp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Chart_of_Account_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Chart_of_Account_Master](
	[chartofacc_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[acc_no] [varchar](30) NOT NULL,
	[acc_name] [varchar](30) NOT NULL,
	[acc_type] [int] NOT NULL,
	[credit_or_debit] [int] NOT NULL,
	[level_] [int] NOT NULL,
	[parent_acc] [int] NULL,
	[dimension1] [int] NULL,
	[dimension1_status] [int] NULL,
	[dimension2] [int] NULL,
	[dimension2_status] [int] NULL,
	[dimension3] [int] NULL,
	[dimension3_status] [int] NULL,
	[dimension4] [int] NULL,
	[dimension4_status] [int] NULL,
	[dimension5] [int] NULL,
	[dimension5_status] [int] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Chart_of_Account_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[err_msg] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Chart_of_Account_Master] PRIMARY KEY CLUSTERED 
(
	[chartofacc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Cntp_Person]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Cntp_Person](
	[cntp_Id] [int] IDENTITY(1,1) NOT NULL,
	[cntp_code] [varchar](20) NULL,
	[cntp_name] [varchar](30) NULL,
	[salution] [varchar](15) NULL,
	[cntp_lastname] [varchar](30) NULL,
	[cntp_displayname] [varchar](30) NULL,
	[designation] [varchar](30) NULL,
	[office_name] [varchar](50) NULL,
	[office_phone] [varchar](20) NULL,
	[mobile] [varchar](20) NULL,
	[fax] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[website] [varchar](20) NULL,
	[addr1] [varchar](100) NULL,
	[addr2] [varchar](100) NULL,
	[city] [varchar](30) NULL,
	[area] [varchar](30) NULL,
	[state_id] [int] NULL,
	[zip_code] [varchar](15) NULL,
	[map] [varchar](30) NULL,
	[note] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Cntp_Person_status]  DEFAULT ((0)),
	[err_msg] [varchar](30) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_tbl_Cntp_Person] PRIMARY KEY CLUSTERED 
(
	[cntp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Company_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company_Master](
	[cmpny_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_code] [varchar](15) NOT NULL,
	[cmpny_name] [varchar](35) NOT NULL,
	[display_name] [varchar](30) NULL,
	[startdate] [datetime] NULL,
	[cin] [varchar](30) NULL,
	[base_currency_code] [int] NULL,
	[reg_phone] [varchar](30) NULL,
	[reg_phone_status] [int] NULL,
	[reg_email] [varchar](30) NULL,
	[reg_email_status] [int] NULL,
	[tin] [varchar](30) NULL,
	[tan] [varchar](30) NULL,
	[pan] [varchar](30) NULL,
	[cst] [varchar](30) NULL,
	[gst] [varchar](30) NULL,
	[cntp_Id] [int] NULL,
	[eu_code] [varchar](15) NULL,
	[eu_name] [varchar](30) NULL,
	[logo] [varchar](80) NULL,
	[note] [varchar](80) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Company_Master_status]  DEFAULT ((0)),
	[err_msg] [varchar](80) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Company_Master] PRIMARY KEY CLUSTERED 
(
	[cmpny_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Country_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country_Master](
	[cntry_Id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL CONSTRAINT [DF_tbl_Country_Master_company_id]  DEFAULT ((0)),
	[cntry_code] [varchar](20) NULL,
	[cntry_name] [varchar](30) NOT NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Country_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Country_Master] PRIMARY KEY CLUSTERED 
(
	[cntry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Currency_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Currency_Master](
	[currency_id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_id] [int] NULL,
	[name] [varchar](15) NOT NULL,
	[symbol] [varchar](200) NULL,
	[decimal] [decimal](12, 4) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Currency_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Currency_Master] PRIMARY KEY CLUSTERED 
(
	[currency_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Dimension_Data]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Dimension_Data](
	[dim_data_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[dimension_id] [int] NULL,
	[dimension] [varchar](30) NULL,
	[name] [varchar](30) NULL,
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Dimension_Data_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Dimension_Data] PRIMARY KEY CLUSTERED 
(
	[dim_data_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Dimension_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Dimension_Master](
	[dimension_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[dimension_code] [varchar](20) NOT NULL,
	[dimension_name] [varchar](20) NOT NULL,
	[datatable] [int] NULL,
	[dimension_field] [int] NOT NULL,
	[name_field] [int] NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Dimension_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Dimension_Master] PRIMARY KEY CLUSTERED 
(
	[dimension_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Enterprice_Unit]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Enterprice_Unit](
	[eu_id] [int] IDENTITY(1,1) NOT NULL,
	[eu_code] [varchar](20) NULL,
	[company_id] [int] NOT NULL,
	[eu_name] [varchar](30) NOT NULL,
	[display_name] [varchar](30) NULL,
	[start_date] [datetime] NULL,
	[cin] [varchar](30) NULL,
	[currency_id] [int] NULL,
	[reg_phone] [varchar](30) NULL,
	[reg_phone_status] [int] NULL,
	[reg_email] [varchar](30) NULL,
	[reg_email_status] [int] NULL,
	[whs_code] [varchar](30) NULL,
	[tin] [varchar](30) NULL,
	[tan] [varchar](30) NULL,
	[pan] [varchar](30) NULL,
	[cst] [varchar](30) NULL,
	[gst] [varchar](30) NULL,
	[contact_id] [int] NULL,
	[region_id] [int] NULL,
	[logo] [varchar](90) NULL,
	[note] [varchar](100) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Enterprice_Unit_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Enterprice_Unit] PRIMARY KEY CLUSTERED 
(
	[eu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Exchange_Rate]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Exchange_Rate](
	[exrate_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[doc] [varchar](30) NOT NULL,
	[doc_date] [datetime] NULL,
	[currency_id] [int] NOT NULL,
	[ratetype] [int] NOT NULL,
	[expressinbasecurrency] [int] NULL,
	[foreigncurrency] [int] NOT NULL,
	[effectivedate] [datetime] NULL,
	[exchangerate] [decimal](8, 4) NULL,
	[ratefactor] [decimal](8, 4) NULL,
	[definedrate] [decimal](8, 4) NULL,
	[rateapproved] [int] NULL,
	[approvaldate] [datetime] NULL,
	[err_msg] [varchar](30) NULL,
	[status] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Exchange_Rate] PRIMARY KEY CLUSTERED 
(
	[exrate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Financial_Batch]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Financial_Batch](
	[financial_bat_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[batchnumber] [varchar](30) NOT NULL,
	[batchdate] [datetime] NOT NULL,
	[year_id] [int] NOT NULL,
	[period_id] [int] NOT NULL,
	[finilizationrunno] [varchar](30) NULL,
	[finilizationdate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Financial_Batch_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Financial_Batch] PRIMARY KEY CLUSTERED 
(
	[financial_bat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Financial_Year]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Financial_Year](
	[year_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[financial_year] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[financial_period] [int] NOT NULL,
	[start_period] [datetime] NULL,
	[end_period] [datetime] NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Financial_Year_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[created_by] [int] NULL,
	[update_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_Financial_Year] PRIMARY KEY CLUSTERED 
(
	[year_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Finil_Financial_Series]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Finil_Financial_Series](
	[final_run_sers_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[type] [varchar](4) NOT NULL,
	[digit] [int] NULL,
	[year_id] [int] NOT NULL,
	[prefix] [varchar](30) NULL,
	[seq_number] [varchar](30) NULL,
	[next_number] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Finilization_Run_Series_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Finilization_Run_Series] PRIMARY KEY CLUSTERED 
(
	[final_run_sers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Finilize_Financial_Batch]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Finilize_Financial_Batch](
	[finil_fin_bat_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[finilizationrun_no] [varchar](30) NULL,
	[finilizationrun_date] [datetime] NULL,
	[batchfrom] [varchar](30) NULL,
	[batchto] [int] NULL,
	[transtype_from] [int] NULL,
	[transtype_to] [int] NULL,
	[batchdate_from] [datetime] NULL,
	[batchdate_to] [datetime] NULL,
	[journalno_from] [varchar](30) NULL,
	[journalno_to] [varchar](30) NULL,
	[journaldate_from] [datetime] NULL,
	[journaldate_to] [datetime] NULL,
	[schedulename] [varchar](50) NULL,
	[repeatevery] [int] NULL,
	[stratson] [datetime] NULL,
	[endson] [datetime] NULL,
	[neverexpire] [int] NULL,
	[status] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[err_msg] [varchar](30) NULL,
 CONSTRAINT [PK_tbl_Finilize_Financial_Batch] PRIMARY KEY CLUSTERED 
(
	[finil_fin_bat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_FirstFree_Number]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_FirstFree_Number](
	[firstfree_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[eu_id] [int] NULL,
	[seqnumbertype] [int] NULL,
	[digit] [int] NULL,
	[transaction_id] [int] NOT NULL,
	[ordertype] [int] NOT NULL,
	[prefix] [varchar](10) NULL,
	[seqnumber] [int] NULL,
	[next_number] [varchar](60) NULL,
	[ref] [nchar](10) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_FirstFree_Number_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_FirstFree_Number] PRIMARY KEY CLUSTERED 
(
	[firstfree_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Department]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Department](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[dept_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Department_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Department] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Designation]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Designation](
	[desig_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[desig_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Designation_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Designation] PRIMARY KEY CLUSTERED 
(
	[desig_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Document_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Document_Master](
	[doc_master_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[emp_id] [int] NULL,
	[name] [varchar](30) NOT NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[doc_type_id] [int] NULL,
	[issueauthority] [varchar](30) NULL,
	[issue_place] [varchar](30) NULL,
	[issue_date] [datetime] NULL,
	[expire_date] [datetime] NULL,
	[contact_name] [varchar](30) NULL,
	[contact_no] [varchar](30) NULL,
	[ref] [varchar](30) NULL,
	[attachment] [varchar](150) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Document_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Document_Master] PRIMARY KEY CLUSTERED 
(
	[doc_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Document_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Document_Type](
	[doc_type_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[doc_type_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Document_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Document_Type] PRIMARY KEY CLUSTERED 
(
	[doc_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Employee_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Employee_Master](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_code] [varchar](30) NOT NULL,
	[company_id] [int] NOT NULL,
	[termination_type_id] [int] NULL,
	[name] [varchar](30) NOT NULL,
	[middlename] [varchar](20) NULL,
	[lastname] [varchar](20) NULL,
	[displayname] [varchar](40) NOT NULL,
	[logo] [varchar](200) NULL,
	[dateofjoin] [datetime] NULL,
	[gender] [int] NOT NULL,
	[lev_accrued] [int] NULL,
	[benifit_accrued] [int] NULL,
	[deduct_loan] [int] NULL,
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Employee_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Employee_Master] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Employee_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Employee_Type](
	[emp_type_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[emp_type_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Employee_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Employee_Type] PRIMARY KEY CLUSTERED 
(
	[emp_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_EmployeeBenifit_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_EmployeeBenifit_Master](
	[emp_beni_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[emp_beni_code] [varchar](20) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[salarycomp_id] [int] NULL,
	[benifit_accrued] [int] NULL,
	[accrual_type] [int] NULL,
	[accrual_carry_frwd] [int] NULL,
	[annual_limit] [int] NULL,
	[pay_factor] [int] NULL,
	[emp_contribution] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeBenifit_Master_emp_contribution]  DEFAULT ((0)),
	[empl_contribution] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeBenifit_Master_empl_contribution]  DEFAULT ((0)),
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_EmployeeBenifit_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_EmployeeBenifit_Master] PRIMARY KEY CLUSTERED 
(
	[emp_beni_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_EmployeeGrade_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_EmployeeGrade_Master](
	[emp_grd_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[currency_id] [int] NULL,
	[emp_grd_code] [int] NOT NULL,
	[name] [varchar](30) NULL,
	[salary_type] [int] NULL,
	[ex_rate] [decimal](12, 4) NULL,
	[min_salary] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeGrade_Master_min_salary]  DEFAULT ((0)),
	[min_salary_bc] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeGrade_Master_min_salary_bc]  DEFAULT ((0)),
	[max_salary] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeGrade_Master_max_salary]  DEFAULT ((0)),
	[max_salary_bc] [varchar](20) NULL CONSTRAINT [DF_tbl_Hrms_EmployeeGrade_Master_max_salary_bc]  DEFAULT ((0)),
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_EmployeeGrade_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_EmployeeGrade_Master] PRIMARY KEY CLUSTERED 
(
	[emp_grd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_EmployeeLeave_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_EmployeeLeave_Master](
	[emp_lev_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[lev_code] [varchar](25) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[lev_type_id] [int] NULL,
	[lev_accrued] [int] NULL,
	[lev_accrual_type] [int] NULL,
	[annual_limit] [int] NULL,
	[lev_carry_forwd] [int] NULL,
	[accrual_mnthly] [decimal](10, 2) NULL,
	[accrual_yearly] [int] NULL,
	[pay_factor] [int] NULL,
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_EmployeeLeave_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_EmployeeLeave_Master] PRIMARY KEY CLUSTERED 
(
	[emp_lev_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_FinalSettle_master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_FinalSettle_master](
	[finalsetle_id] [int] IDENTITY(1,1) NOT NULL,
	[comapny_id] [int] NOT NULL,
	[termination_type_id] [int] NULL,
	[name] [varchar](30) NULL,
	[lev_accrued] [int] NULL,
	[benifit_accrued] [int] NULL,
	[deduct_loan] [int] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_FinalSettle_master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_FinalSettle_master] PRIMARY KEY CLUSTERED 
(
	[finalsetle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Holiday]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Holiday](
	[holiday_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[holiday_code] [varchar](20) NULL,
	[holiday_date] [datetime] NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Holiday_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Holiday] PRIMARY KEY CLUSTERED 
(
	[holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Leave]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Leave](
	[leave_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[leave_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Leave_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Leave] PRIMARY KEY CLUSTERED 
(
	[leave_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Loan_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Loan_Master](
	[loan_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[emp_loan_code] [varchar](20) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[loan_type_id] [int] NULL,
	[currency_id] [int] NULL,
	[ex_rate] [decimal](14, 2) NULL,
	[max_loan_amt] [decimal](18, 2) NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Master_max_loan_amt]  DEFAULT ((0)),
	[max_loan_amt_bc] [decimal](18, 2) NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Master_max_loan_amt_bc]  DEFAULT ((0)),
	[min_loan_amt] [decimal](18, 2) NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Master_min_loan_amt]  DEFAULT ((0)),
	[min_loan_amt_bc] [decimal](18, 2) NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Master_min_loan_amt_bc]  DEFAULT ((0)),
	[instalmnt_status] [int] NULL,
	[ref] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Loan_Master] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Loan_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Loan_Type](
	[loan_type_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[loan_type_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Loan_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Loan_Type] PRIMARY KEY CLUSTERED 
(
	[loan_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Overtime_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Overtime_Type](
	[ovrtime_type_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[ovrtime_type_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[ovrtime_rate] [decimal](7, 2) NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Overtime_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Overtime_Type] PRIMARY KEY CLUSTERED 
(
	[ovrtime_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Project]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Project](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[project_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Project_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Salary_Component]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Salary_Component](
	[salarycomp_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[salarycomp_code] [varchar](20) NULL,
	[name] [varchar](35) NOT NULL,
	[ref] [varchar](20) NULL,
	[salarycomp_type] [int] NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Salary_Component_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Salary_Component] PRIMARY KEY CLUSTERED 
(
	[salarycomp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_Termination_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_Termination_Type](
	[termination_type_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[termination_type_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_Termination_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_Termination_Type] PRIMARY KEY CLUSTERED 
(
	[termination_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Hrms_WorkGroup]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Hrms_WorkGroup](
	[wrkgrp_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[wrkgrp_code] [varchar](20) NULL,
	[name] [varchar](20) NOT NULL,
	[ref] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Hrms_WorkGroup_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Hrms_WorkGroup] PRIMARY KEY CLUSTERED 
(
	[wrkgrp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Item_Group]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Item_Group](
	[itemgrp_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[taxmaster_Id] [int] NULL,
	[itemgrp_name] [varchar](30) NULL,
	[cess] [varchar](15) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Item_Group_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Item_Group] PRIMARY KEY CLUSTERED 
(
	[itemgrp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Item_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Item_Master](
	[itemmaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[item_code] [varchar](20) NULL,
	[itemtype_Id] [int] NULL,
	[bu_Id] [int] NULL,
	[manuf_Id] [int] NULL,
	[bp_id] [int] NULL,
	[item_name] [varchar](30) NULL,
	[std] [int] NULL,
	[sup_barcode] [varchar](50) NULL,
	[srch_key] [varchar](50) NULL,
	[itemgrp_Id] [int] NULL,
	[barcode] [varchar](50) NULL,
	[mrp] [decimal](18, 2) NULL,
	[retail_price] [decimal](18, 2) NULL,
	[purchase_price] [decimal](18, 2) NULL,
	[item_cost] [decimal](18, 2) NULL,
	[inventory_val] [decimal](18, 2) NULL,
	[rec_level] [int] NULL,
	[rec_qry] [int] NULL,
	[eco_order_qty] [int] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Item_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Item_Master] PRIMARY KEY CLUSTERED 
(
	[itemmaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Item_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Item_Type](
	[itemtype_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[itemtype_code] [varchar](20) NULL,
	[itemtype_name] [varchar](30) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Item_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Item_Type] PRIMARY KEY CLUSTERED 
(
	[itemtype_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Journal_Details]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Journal_Details](
	[journal_det_id] [int] IDENTITY(1,1) NOT NULL,
	[journal_master_id] [int] NOT NULL,
	[pos] [int] NULL,
	[acc_no] [varchar](30) NULL,
	[dimension1] [varchar](30) NULL,
	[dimension2] [varchar](30) NULL,
	[dimension3] [varchar](30) NULL,
	[dimension4] [varchar](30) NULL,
	[dimension5] [varchar](30) NULL,
	[credit_or_debit] [int] NOT NULL,
	[bankreconstatus] [int] NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[amount_rc1] [decimal](14, 2) NULL,
	[amount_rc2] [decimal](14, 2) NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Journal_Details_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Journal_Details] PRIMARY KEY CLUSTERED 
(
	[journal_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Journal_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Journal_Master](
	[journal_master_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[transtype_id] [int] NULL,
	[journaltype] [int] NOT NULL CONSTRAINT [DF_tbl_Journal_Master_journaltype]  DEFAULT ((0)),
	[doc_number] [varchar](30) NOT NULL,
	[doc_date] [datetime] NULL,
	[financial_bat_id] [int] NULL,
	[batch_no] [varchar](30) NULL,
	[batch_date] [datetime] NULL,
	[year_id] [int] NULL,
	[period_id] [int] NULL,
	[currency_id] [int] NULL,
	[home_currency] [int] NULL,
	[exchangerate] [decimal](14, 2) NULL,
	[ratefactor] [decimal](14, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_ratefactor]  DEFAULT ((1)),
	[creditamount] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_creditamount]  DEFAULT ((0)),
	[debitamount] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_debitamount]  DEFAULT ((0)),
	[balanceamount] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_balanceamount]  DEFAULT ((0)),
	[amount] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_amount]  DEFAULT ((0)),
	[amountHC] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_amountHC]  DEFAULT ((0)),
	[amountRC1] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_amountRC1]  DEFAULT ((0)),
	[amountRC2] [decimal](12, 2) NULL CONSTRAINT [DF_tbl_Journal_Master_amountRC2]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Journal_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Journal_Master] PRIMARY KEY CLUSTERED 
(
	[journal_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Location]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Location](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[location_code] [varchar](20) NOT NULL,
	[location_name] [varchar](30) NOT NULL,
	[region_id] [int] NULL,
	[area_id] [int] NULL,
	[contact_id] [int] NULL,
	[ref] [varchar](30) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Location_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Manufacturer]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Manufacturer](
	[manuf_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[manuf_code] [varchar](20) NULL,
	[manuf_name] [varchar](30) NULL,
	[reference] [varchar](30) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Manufacturer_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[manuf_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Mapping_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Mapping_Detail](
	[map_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[map_id] [int] NOT NULL,
	[credit_debit] [int] NOT NULL,
	[chart_acc_id] [int] NOT NULL,
	[dbfield] [int] NULL,
	[dim1] [varchar](30) NOT NULL,
	[dim2] [varchar](30) NOT NULL,
	[dim3] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tbl_Mapping_Detail] PRIMARY KEY CLUSTERED 
(
	[map_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Mapping_Scheme]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Mapping_Scheme](
	[map_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[transactiontype_id] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[transtn] [int] NULL,
	[order_type] [int] NOT NULL,
	[aproval_status] [int] NOT NULL CONSTRAINT [DF_tbl_Mapping_Scheme_aproval_status]  DEFAULT ((0)),
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Mapping_Scheme_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Mapping_Scheme] PRIMARY KEY CLUSTERED 
(
	[map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Payment_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Payment_Detail](
	[payment_det_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_id] [int] NOT NULL,
	[pos] [int] NULL,
	[acc_no_id] [int] NULL,
	[dim1] [varchar](30) NULL,
	[dim2] [varchar](30) NULL,
	[dim3] [varchar](30) NULL,
	[ref] [varchar](30) NULL,
	[amount] [decimal](14, 2) NOT NULL CONSTRAINT [DF_tbl_Payment_Detail_amount]  DEFAULT ((0)),
	[amount_bc] [decimal](14, 2) NOT NULL CONSTRAINT [DF_tbl_Payment_Detail_amount_bc]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Payment_Detail] PRIMARY KEY CLUSTERED 
(
	[payment_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Payment_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Payment_Master](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[journal_master_id] [int] NULL,
	[bp_id] [int] NULL,
	[expense_acc] [int] NULL,
	[bankmaster_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[pmode_id] [int] NULL,
	[transfer_tobank_id] [int] NULL,
	[transtype] [int] NOT NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[ex_rate] [decimal](14, 2) NULL,
	[transfer_to] [int] NULL,
	[payment_refno] [varchar](20) NULL,
	[payment_refdate] [datetime] NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[tds_amount] [decimal](14, 2) NULL,
	[tds_amount_bc] [decimal](14, 2) NULL,
	[net_amount] [decimal](14, 2) NULL,
	[net_amount_bc] [decimal](14, 2) NULL,
	[bank_charge] [decimal](14, 2) NULL,
	[bank_charge_bc] [decimal](14, 2) NULL,
	[total_amount] [decimal](14, 2) NULL,
	[total_amount_bc] [decimal](14, 2) NULL,
	[reconciliatn_date] [datetime] NULL,
	[reconciliatn_amount] [decimal](14, 2) NULL,
	[reconciliatn_status] [int] NULL,
	[reconciliatn_journal_id] [int] NULL,
	[reference] [varchar](30) NULL,
	[reference_date] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Payment_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Payment_Master] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Payment_Mode]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Payment_Mode](
	[pmode_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpany_id] [int] NULL,
	[bank_Id] [int] NULL,
	[pmode_name] [varchar](30) NULL,
	[pmode_transaction] [int] NULL,
	[acc_mode] [varchar](30) NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Payment_Mode_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Payment_Mode] PRIMARY KEY CLUSTERED 
(
	[pmode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Payment_Register]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Payment_Register](
	[paymnt_reg_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[bp_id] [int] NULL,
	[transfer_tobank_id] [int] NULL,
	[expense_acc] [int] NULL,
	[pmode_id] [int] NULL,
	[bankmaster_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[transactn] [int] NULL,
	[transtype] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[payment_refno] [varchar](20) NULL,
	[payment_refdate] [datetime] NULL,
	[credit_debit] [int] NULL,
	[ex_rate] [decimal](14, 2) NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_Table_1_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Payment_Register] PRIMARY KEY CLUSTERED 
(
	[paymnt_reg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Period_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Period_Master](
	[period_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[year_id] [int] NOT NULL,
	[financialperiod] [varchar](30) NOT NULL,
	[periodname] [varchar](20) NOT NULL,
	[quarter] [int] NULL,
	[periodfromdate] [datetime] NULL,
	[periodtodate] [datetime] NULL,
	[gld_status] [int] NULL,
	[acp_status] [int] NULL,
	[acr_status] [int] NULL,
	[fass_status] [int] NULL,
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Period_Master] PRIMARY KEY CLUSTERED 
(
	[period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Pricebook_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Pricebook_Detail](
	[pbookdet_id] [int] IDENTITY(1,1) NOT NULL,
	[pbookmst_id] [int] NULL,
	[item_id] [int] NULL,
	[name] [varchar](30) NULL,
	[price] [varchar](30) NULL,
	[ref] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Pricebook_Detail_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Pricebook_Detail] PRIMARY KEY CLUSTERED 
(
	[pbookdet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Pricebook_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Pricebook_Master](
	[pbookmst_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[eu_id] [int] NULL,
	[currency_id] [int] NULL,
	[docno] [varchar](50) NULL,
	[docdate] [datetime] NULL,
	[transaction_id] [int] NULL,
	[ordertype] [int] NULL,
	[cf] [int] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Pricebook_Master_status]  DEFAULT ((0)),
	[ref] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Pricebook_Master] PRIMARY KEY CLUSTERED 
(
	[pbookmst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Purchase_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Purchase_Detail](
	[purchase_det_id] [int] IDENTITY(1,1) NOT NULL,
	[eu_id] [int] NULL,
	[purchase_id] [int] NOT NULL,
	[transtype_id] [int] NULL,
	[item_id] [int] NOT NULL,
	[bu_id] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[order_qty] [int] NULL,
	[rate] [decimal](18, 2) NULL,
	[rate_bc] [decimal](18, 2) NULL,
	[total_rate] [decimal](18, 2) NULL,
	[total_rate_bc] [decimal](18, 2) NULL,
	[disc_percentage] [float] NULL,
	[disc_amount] [decimal](18, 2) NULL,
	[disc_amount_bc] [decimal](18, 2) NULL,
	[net_amount] [decimal](18, 2) NULL,
	[net_amount_bc] [decimal](18, 2) NULL,
	[tax] [float] NULL,
	[tax_percentage] [float] NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[tax_amount_bc] [decimal](18, 2) NULL,
	[line_total] [varchar](50) NULL,
	[line_total_bc] [varchar](50) NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Purchase_Detail_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Purchase_Detail] PRIMARY KEY CLUSTERED 
(
	[purchase_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Purchase_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Purchase_Master](
	[purchase_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[transtype_id] [int] NULL,
	[invoiceType] [int] NOT NULL CONSTRAINT [DF_tbl_Purchase_Master_invoiceType]  DEFAULT ((0)),
	[bp_id] [int] NULL,
	[journal_master_id] [int] NULL,
	[buyer_id] [int] NULL,
	[eu_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[purchase_orderno] [varchar](30) NULL,
	[purchase_orderdate] [datetime] NULL,
	[ordertype] [int] NOT NULL,
	[paymentterm] [varchar](30) NULL,
	[deliveryterm] [varchar](30) NULL,
	[exchange_rate] [decimal](18, 4) NULL,
	[amount] [decimal](18, 2) NULL,
	[amount_bc] [decimal](18, 2) NULL,
	[disc_amount] [decimal](18, 2) NULL,
	[disc_amount_bc] [decimal](18, 2) NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[tax_amount_bc] [decimal](18, 2) NULL,
	[order_amount] [decimal](18, 2) NULL,
	[order_amount_bc] [decimal](18, 2) NULL,
	[freight_charge] [decimal](18, 2) NULL,
	[freight_charge_bc] [decimal](18, 2) NULL,
	[net_amount] [decimal](18, 2) NULL,
	[net_amount_bc] [decimal](18, 2) NULL,
	[bill_toaddr] [varchar](50) NULL,
	[amount_paid] [decimal](18, 2) NULL,
	[amount_paid_bc] [decimal](18, 2) NULL,
	[due_amount] [decimal](18, 2) NULL,
	[due_amount_bc] [decimal](18, 2) NULL,
	[payment_status] [int] NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Purchase_Master_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Purchase_Master] PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Receipt_Register]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Receipt_Register](
	[receipt_reg_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[bp_id] [int] NULL,
	[loc_id] [int] NULL,
	[pmode_id] [int] NULL,
	[bankmaster_id] [int] NULL,
	[currency_id] [int] NULL,
	[transactn] [int] NULL,
	[transtype] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[payment_refno] [varchar](20) NULL,
	[payment_refdate] [datetime] NULL,
	[credit_debit] [int] NULL,
	[ex_rate] [decimal](14, 2) NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Receipt_Register_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Receipt_Register] PRIMARY KEY CLUSTERED 
(
	[receipt_reg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Reciept_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Reciept_Detail](
	[reciept_det_id] [int] IDENTITY(1,1) NOT NULL,
	[reciept_id] [int] NOT NULL,
	[pos] [int] NULL,
	[acc_no_id] [int] NULL,
	[dim1] [varchar](30) NULL,
	[dim2] [varchar](30) NULL,
	[dim3] [varchar](30) NULL,
	[ref] [varchar](30) NULL,
	[amount] [decimal](14, 2) NOT NULL CONSTRAINT [DF_tbl_Reciept_Detail_amount]  DEFAULT ((0)),
	[amount_bc] [decimal](14, 2) NOT NULL CONSTRAINT [DF_tbl_Reciept_Detail_amount_bc]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Reciept_Detail] PRIMARY KEY CLUSTERED 
(
	[reciept_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Reciept_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Reciept_Master](
	[receipt_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[eu_id] [int] NULL,
	[journal_master_id] [int] NULL,
	[bp_id] [int] NULL,
	[loc_id] [int] NULL,
	[bankmaster_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[pmode_id] [int] NOT NULL,
	[infavourof] [varchar](30) NULL,
	[purpose] [varchar](30) NULL,
	[trans_type] [int] NOT NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[ex_rate] [decimal](14, 2) NULL,
	[benificiary] [varchar](30) NULL,
	[payment_refno] [varchar](20) NULL,
	[payment_refdate] [datetime] NULL,
	[amount] [decimal](14, 2) NULL,
	[amount_bc] [decimal](14, 2) NULL,
	[tds_amount] [decimal](14, 2) NULL,
	[tds_amount_bc] [decimal](14, 2) NULL,
	[net_amount] [decimal](14, 2) NULL,
	[net_amount_bc] [decimal](14, 2) NULL,
	[bank_charge] [decimal](14, 2) NULL,
	[bank_charge_bc] [decimal](14, 2) NULL,
	[total_amount] [decimal](14, 2) NULL,
	[total_amount_bc] [decimal](14, 2) NULL,
	[reconciliatn_date] [datetime] NULL,
	[reconciliatn_amount] [decimal](14, 2) NULL,
	[reconciliatn_status] [int] NULL,
	[reconciliatn_journal_id] [int] NULL,
	[reference] [varchar](20) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Reciept_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Reciept_Master] PRIMARY KEY CLUSTERED 
(
	[receipt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Region]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Region](
	[regoin_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[regoin_code] [varchar](20) NULL,
	[name] [varchar](30) NULL,
	[country_id] [int] NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Region_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Region] PRIMARY KEY CLUSTERED 
(
	[regoin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SalesInvoice_Detail]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SalesInvoice_Detail](
	[salesinvoice_det_id] [int] IDENTITY(1,1) NOT NULL,
	[eu_id] [int] NULL,
	[salesinvoice_id] [int] NOT NULL,
	[transtype_id] [int] NULL,
	[item_id] [int] NOT NULL,
	[bu_id] [int] NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[order_qty] [int] NULL,
	[rate] [decimal](18, 2) NULL,
	[rate_bc] [decimal](18, 2) NULL,
	[total_rate] [decimal](18, 2) NULL,
	[total_rate_bc] [decimal](18, 2) NULL,
	[disc_percentage] [float] NULL,
	[disc_amount] [decimal](18, 2) NULL,
	[disc_amount_bc] [decimal](18, 2) NULL,
	[net_amount] [decimal](18, 2) NULL,
	[net_amount_bc] [decimal](18, 2) NULL,
	[tax] [float] NULL,
	[tax_percentage] [float] NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[tax_amount_bc] [decimal](18, 2) NULL,
	[line_total] [varchar](50) NULL,
	[line_total_bc] [varchar](50) NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_SalesInvoice_Detail_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_SalesInvoice_Detail] PRIMARY KEY CLUSTERED 
(
	[salesinvoice_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_SalesInvoice_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_SalesInvoice_Master](
	[salesinvoice_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[transtype_id] [int] NULL,
	[invoiceType] [int] NOT NULL CONSTRAINT [DF_tbl_SalesInvoice_Master_invoiceType]  DEFAULT ((0)),
	[bp_id] [int] NULL,
	[journal_master_id] [int] NULL,
	[saleman_id] [int] NULL,
	[eu_id] [int] NULL,
	[currency_id] [int] NOT NULL,
	[doc_no] [varchar](30) NULL,
	[doc_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[sales_orderno] [varchar](30) NULL,
	[sales_orderdate] [datetime] NULL,
	[ordertype] [int] NOT NULL,
	[paymentterm] [varchar](30) NULL,
	[deliveryterm] [varchar](30) NULL,
	[exchange_rate] [decimal](18, 4) NULL,
	[amount] [decimal](18, 2) NULL,
	[amount_bc] [decimal](18, 2) NULL,
	[disc_amount] [decimal](18, 2) NULL,
	[disc_amount_bc] [decimal](18, 2) NULL,
	[tax_amount] [decimal](18, 2) NULL,
	[tax_amount_bc] [decimal](18, 2) NULL,
	[order_amount] [decimal](18, 2) NULL,
	[order_amount_bc] [decimal](18, 2) NULL,
	[roundoff_amount] [decimal](18, 2) NULL,
	[roundoff_amount_bc] [decimal](18, 2) NULL,
	[freight_charge] [decimal](18, 2) NULL,
	[freight_charge_bc] [decimal](18, 2) NULL,
	[net_amount] [decimal](18, 2) NULL,
	[net_amount_bc] [decimal](18, 2) NULL,
	[bill_toaddr] [varchar](50) NULL,
	[amount_paid] [decimal](18, 2) NULL,
	[amount_paid_bc] [decimal](18, 2) NULL,
	[due_amount] [decimal](18, 2) NULL,
	[due_amount_bc] [decimal](18, 2) NULL,
	[payment_status] [int] NULL,
	[ref] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_SalesInvoice_Master_status]  DEFAULT ((0)),
	[err_msg] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_SalesInvoice_Master] PRIMARY KEY CLUSTERED 
(
	[salesinvoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_State_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_State_Master](
	[state_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NOT NULL,
	[state_code] [varchar](20) NULL,
	[state_name] [varchar](30) NOT NULL,
	[cntry_Id] [int] NOT NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_State_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_State_Master] PRIMARY KEY CLUSTERED 
(
	[state_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Subscription_Category]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Subscription_Category](
	[subcat_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[subcat_code] [varchar](15) NOT NULL,
	[subcat_name] [varchar](30) NOT NULL,
	[status] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Subscription_Category] PRIMARY KEY CLUSTERED 
(
	[subcat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Subscription_Parameter]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Subscription_Parameter](
	[para_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[currency_id] [int] NOT NULL,
	[ex_rate] [decimal](14, 4) NULL,
	[min_sub_fee] [decimal](14, 2) NULL,
	[min_sub_fee_bc] [decimal](14, 2) NULL,
	[min_member] [int] NOT NULL,
	[representive] [float] NULL,
	[eff_date] [datetime] NULL,
	[refe] [varchar](50) NULL,
	[status] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Subscription_Parameter] PRIMARY KEY CLUSTERED 
(
	[para_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Subscription_Period]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Subscription_Period](
	[sub_period_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[year] [varchar](10) NULL,
	[name] [varchar](30) NOT NULL,
	[totalperiods] [int] NULL,
	[startperiod] [datetime] NULL,
	[endperiod] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Sub_Period_status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Sub_Period] PRIMARY KEY CLUSTERED 
(
	[sub_period_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Subscription_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Subscription_Type](
	[subtype_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[subtype_code] [varchar](15) NOT NULL,
	[subtype_name] [varchar](30) NOT NULL,
	[life_subscription] [int] NOT NULL CONSTRAINT [DF_tbl_Sub_Type_life_subscription]  DEFAULT ((0)),
	[yearmonth] [int] NULL,
	[validity] [int] NULL,
	[currency_id] [int] NULL,
	[ex_rate] [decimal](14, 4) NULL,
	[subscription_fee] [decimal](12, 2) NULL,
	[subscription_fee_bc] [decimal](12, 2) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Sub_Type_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Sub_Type] PRIMARY KEY CLUSTERED 
(
	[subtype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Tax]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Tax](
	[tax_id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_id] [int] NOT NULL,
	[tax_code] [varchar](20) NULL,
	[tax_name] [varchar](30) NOT NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Tax_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Tax] PRIMARY KEY CLUSTERED 
(
	[tax_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Tax_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Tax_Master](
	[taxmaster_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_Id] [int] NULL,
	[tax] [varchar](15) NULL,
	[name] [varchar](20) NULL,
	[percentage] [float] NULL,
	[reference] [varchar](50) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_Tax_Master_status]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Tax_Master] PRIMARY KEY CLUSTERED 
(
	[taxmaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Transaction_Series]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Transaction_Series](
	[trans_series_id] [int] IDENTITY(1,1) NOT NULL,
	[transtype_id] [int] NOT NULL,
	[defaultaccount] [varchar](30) NULL,
	[credit_or_debit] [int] NULL,
	[digit] [int] NULL,
	[financial_year] [varchar](20) NULL,
	[prefix] [varchar](20) NULL,
	[trans_series] [varchar](30) NULL,
	[defaultseries] [int] NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_tbl_Transaction_Series_status]  DEFAULT ((0)),
	[next_number] [varchar](30) NULL,
	[company_id] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Transaction_Series] PRIMARY KEY CLUSTERED 
(
	[trans_series_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Transaction_Type]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Transaction_Type](
	[transtype_id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[transactiontype] [varchar](20) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[defaultaccount] [varchar](10) NULL,
	[credit_or_debit] [int] NULL,
	[ref] [varchar](30) NULL,
	[status] [int] NULL,
	[err_msg] [nchar](10) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Transaction_Type] PRIMARY KEY CLUSTERED 
(
	[transtype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_TransactionLog_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_TransactionLog_Master](
	[translog_Id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_Id] [int] NULL,
	[type] [varchar](5) NULL,
	[transaction_status] [int] NULL,
	[user_Id] [int] NULL,
	[log_msg] [varchar](80) NULL,
	[transaction_date] [datetime] NULL,
	[cmpny_id] [int] NULL,
 CONSTRAINT [PK_TransactionLog_Master] PRIMARY KEY CLUSTERED 
(
	[translog_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_User](
	[user_Id] [int] IDENTITY(1,1) NOT NULL,
	[cmpny_id] [int] NULL,
	[first_name] [varchar](30) NULL,
	[last_name] [varchar](30) NULL,
	[user_name] [varchar](30) NOT NULL,
	[pass] [varchar](129) NOT NULL,
	[mobile] [varchar](25) NULL,
	[email] [varchar](50) NULL,
	[website] [varchar](50) NULL,
	[city] [varchar](30) NULL,
	[area] [varchar](30) NULL,
	[state_id] [int] NULL,
	[zip_code] [varchar](30) NULL,
	[desig] [varchar](30) NULL,
	[status] [int] NULL CONSTRAINT [DF_tbl_User_status]  DEFAULT ((0)),
	[createdby] [int] NULL,
	[updatedby] [int] NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[user_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zsys_Column]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zsys_Column](
	[col_id] [int] IDENTITY(1,1) NOT NULL,
	[table_id] [int] NOT NULL,
	[col_disname] [varchar](40) NOT NULL,
	[col_actname] [varchar](40) NOT NULL,
 CONSTRAINT [PK_zsys_Column] PRIMARY KEY CLUSTERED 
(
	[col_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zsys_ErrorLog]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zsys_ErrorLog](
	[err_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[err_type] [varchar](20) NULL,
	[path] [varchar](100) NULL,
	[msg] [varchar](500) NULL,
	[datetime] [datetime] NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_zsys_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zsys_Table]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zsys_Table](
	[table_id] [int] IDENTITY(1,1) NOT NULL,
	[displayname] [varchar](40) NOT NULL,
	[originaltable] [varchar](40) NOT NULL,
	[status] [int] NOT NULL CONSTRAINT [DF_sys_Table_status]  DEFAULT ((0)),
 CONSTRAINT [PK_sys_Table] PRIMARY KEY CLUSTERED 
(
	[table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Cntp_Person]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Cntp_Person] ON [dbo].[tbl_Cntp_Person]
(
	[cntp_code] ASC,
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Company_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Company_Master] ON [dbo].[tbl_Company_Master]
(
	[cmpny_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniq_Dimension_data]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uniq_Dimension_data] ON [dbo].[tbl_Dimension_Data]
(
	[dimension_id] ASC,
	[dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Enterprice_Unit]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Enterprice_Unit] ON [dbo].[tbl_Enterprice_Unit]
(
	[eu_code] ASC,
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Financial_BatchNumber]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Financial_BatchNumber] ON [dbo].[tbl_Financial_Batch]
(
	[batchnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Item_Master]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Item_Master] ON [dbo].[tbl_Item_Master]
(
	[cmpny_Id] ASC,
	[item_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Location]    Script Date: 12/28/2016 7:09:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Location] ON [dbo].[tbl_Location]
(
	[location_code] ASC,
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reconciliation_Detail] ADD  CONSTRAINT [DF_Reconciliation_Detail_exrate]  DEFAULT ((1)) FOR [exrate]
GO
ALTER TABLE [dbo].[Reconciliation_Detail] ADD  CONSTRAINT [DF_Reconciliation_Detail_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[Reconciliation_Detail] ADD  CONSTRAINT [DF_Reconciliation_Detail_amount_bc]  DEFAULT ((0)) FOR [amount_bc]
GO
ALTER TABLE [dbo].[Reconciliation_Detail] ADD  CONSTRAINT [DF_Reconciliation_Detail_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Reconciliation_Master] ADD  CONSTRAINT [DF_Reconciliation_Master_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_Asset_Location] ADD  CONSTRAINT [DF__tbl_Asset__statu__72E607DB]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_Finilize_Financial_Batch] ADD  CONSTRAINT [DF_tbl_Finilize_Financial_Batch_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_Subscription_Category] ADD  CONSTRAINT [DF_tbl_Subscription_Category_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tbl_Subscription_Parameter] ADD  CONSTRAINT [DF_tbl_Subscription_Parameter_min_member]  DEFAULT ((0)) FOR [min_member]
GO
ALTER TABLE [dbo].[Reconciliation_Master]  WITH CHECK ADD  CONSTRAINT [FK_Reconciliation_Master_tbl_Bank_Master] FOREIGN KEY([bank_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[Reconciliation_Master] CHECK CONSTRAINT [FK_Reconciliation_Master_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[Reconciliation_Master]  WITH CHECK ADD  CONSTRAINT [FK_Reconciliation_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[Reconciliation_Master] CHECK CONSTRAINT [FK_Reconciliation_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Area]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Area_tbl_Region] FOREIGN KEY([region_id])
REFERENCES [dbo].[tbl_Region] ([regoin_id])
GO
ALTER TABLE [dbo].[tbl_Area] CHECK CONSTRAINT [FK_tbl_Area_tbl_Region]
GO
ALTER TABLE [dbo].[tbl_Asset_Group]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Group_tbl_Company_Master] FOREIGN KEY([company_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Group] CHECK CONSTRAINT [FK_tbl_Asset_Group_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Group] FOREIGN KEY([assetgrp_id])
REFERENCES [dbo].[tbl_Asset_Group] ([assetgrp_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Group]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Location] FOREIGN KEY([assetloc_id])
REFERENCES [dbo].[tbl_Asset_Location] ([assetloc_id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Location]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Type] FOREIGN KEY([assettype_id])
REFERENCES [dbo].[tbl_Asset_Type] ([assettype_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Asset_Type]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Base_Unit] FOREIGN KEY([baseunit_id])
REFERENCES [dbo].[tbl_Base_Unit] ([bu_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Base_Unit]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Brand_Master] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tbl_Brand_Master] ([brandmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Brand_Master]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Asset_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Master_tbl_Manufacturer] FOREIGN KEY([manuf_id])
REFERENCES [dbo].[tbl_Manufacturer] ([manuf_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Master] CHECK CONSTRAINT [FK_tbl_Asset_Master_tbl_Manufacturer]
GO
ALTER TABLE [dbo].[tbl_Asset_Type]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Asset_Type_tbl_Company_Master] FOREIGN KEY([company_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Asset_Type] CHECK CONSTRAINT [FK_tbl_Asset_Type_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Bank]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Bank_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Bank] CHECK CONSTRAINT [FK_tbl_Bank_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Bank_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Bank_Master_tbl_Bank1] FOREIGN KEY([bank_id])
REFERENCES [dbo].[tbl_Bank] ([bank_Id])
GO
ALTER TABLE [dbo].[tbl_Bank_Master] CHECK CONSTRAINT [FK_tbl_Bank_Master_tbl_Bank1]
GO
ALTER TABLE [dbo].[tbl_Bank_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Bank_Master_tbl_Cntp_Person] FOREIGN KEY([cntp_person_Id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_Bank_Master] CHECK CONSTRAINT [FK_tbl_Bank_Master_tbl_Cntp_Person]
GO
ALTER TABLE [dbo].[tbl_Bank_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Bank_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Bank_Master] CHECK CONSTRAINT [FK_tbl_Bank_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Base_Unit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Base_Unit_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Base_Unit] CHECK CONSTRAINT [FK_tbl_Base_Unit_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Brand_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Brand_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_Id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Brand_Master] CHECK CONSTRAINT [FK_tbl_Brand_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Brand_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Brand_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Brand_Master] CHECK CONSTRAINT [FK_tbl_Brand_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Brand_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Brand_Master_tbl_Manufacturer] FOREIGN KEY([manuf_Id])
REFERENCES [dbo].[tbl_Manufacturer] ([manuf_Id])
GO
ALTER TABLE [dbo].[tbl_Brand_Master] CHECK CONSTRAINT [FK_tbl_Brand_Master_tbl_Manufacturer]
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Cntp_PersonBillTo] FOREIGN KEY([cntp_Id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master] CHECK CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Cntp_PersonBillTo]
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Cntp_PersonShip] FOREIGN KEY([ship_cntp_id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master] CHECK CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Cntp_PersonShip]
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master] CHECK CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Currency_Master] FOREIGN KEY([currency_Id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_BusinessPartner_Master] CHECK CONSTRAINT [FK_tbl_BusinessPartner_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Chart_of_Account_Master] FOREIGN KEY([parent_acc])
REFERENCES [dbo].[tbl_Chart_of_Account_Master] ([chartofacc_id])
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master] CHECK CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Chart_of_Account_Master]
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master] CHECK CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master] FOREIGN KEY([dimension1])
REFERENCES [dbo].[tbl_Dimension_Master] ([dimension_id])
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master] CHECK CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master]
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master1] FOREIGN KEY([dimension2])
REFERENCES [dbo].[tbl_Dimension_Master] ([dimension_id])
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master] CHECK CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master1]
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master2] FOREIGN KEY([dimension3])
REFERENCES [dbo].[tbl_Dimension_Master] ([dimension_id])
GO
ALTER TABLE [dbo].[tbl_Chart_of_Account_Master] CHECK CONSTRAINT [FK_tbl_Chart_of_Account_Master_tbl_Dimension_Master2]
GO
ALTER TABLE [dbo].[tbl_Cntp_Person]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Cntp_Person_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Cntp_Person] CHECK CONSTRAINT [FK_tbl_Cntp_Person_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Cntp_Person]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Cntp_Person_tbl_State_Master] FOREIGN KEY([state_id])
REFERENCES [dbo].[tbl_State_Master] ([state_Id])
GO
ALTER TABLE [dbo].[tbl_Cntp_Person] CHECK CONSTRAINT [FK_tbl_Cntp_Person_tbl_State_Master]
GO
ALTER TABLE [dbo].[tbl_Company_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Company_Master_tbl_Cntp_Person] FOREIGN KEY([cntp_Id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_Company_Master] CHECK CONSTRAINT [FK_tbl_Company_Master_tbl_Cntp_Person]
GO
ALTER TABLE [dbo].[tbl_Company_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Company_Master_tbl_Currency_Master] FOREIGN KEY([base_currency_code])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Company_Master] CHECK CONSTRAINT [FK_tbl_Company_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Currency_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Currency_Master_tbl_Company_Master] FOREIGN KEY([cmpny_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Currency_Master] CHECK CONSTRAINT [FK_tbl_Currency_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Dimension_Data]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dimension_Data_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Dimension_Data] CHECK CONSTRAINT [FK_tbl_Dimension_Data_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Dimension_Data]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dimension_Data_tbl_Dimension_Master] FOREIGN KEY([dimension_id])
REFERENCES [dbo].[tbl_Dimension_Master] ([dimension_id])
GO
ALTER TABLE [dbo].[tbl_Dimension_Data] CHECK CONSTRAINT [FK_tbl_Dimension_Data_tbl_Dimension_Master]
GO
ALTER TABLE [dbo].[tbl_Dimension_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dimension_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Dimension_Master] CHECK CONSTRAINT [FK_tbl_Dimension_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Dimension_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dimension_Master_zsys_ColumnDim_Field] FOREIGN KEY([dimension_field])
REFERENCES [dbo].[zsys_Column] ([col_id])
GO
ALTER TABLE [dbo].[tbl_Dimension_Master] CHECK CONSTRAINT [FK_tbl_Dimension_Master_zsys_ColumnDim_Field]
GO
ALTER TABLE [dbo].[tbl_Dimension_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dimension_Master_zsys_ColumnNameField] FOREIGN KEY([name_field])
REFERENCES [dbo].[zsys_Column] ([col_id])
GO
ALTER TABLE [dbo].[tbl_Dimension_Master] CHECK CONSTRAINT [FK_tbl_Dimension_Master_zsys_ColumnNameField]
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Cntp_Person] FOREIGN KEY([contact_id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit] CHECK CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Cntp_Person]
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit] CHECK CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Enterprice_Unit] CHECK CONSTRAINT [FK_tbl_Enterprice_Unit_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate] CHECK CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate] CHECK CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Currency_Master1] FOREIGN KEY([foreigncurrency])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Exchange_Rate] CHECK CONSTRAINT [FK_tbl_Exchange_Rate_tbl_Currency_Master1]
GO
ALTER TABLE [dbo].[tbl_Financial_Batch]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Financial_Batch_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Financial_Batch] CHECK CONSTRAINT [FK_tbl_Financial_Batch_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Financial_Batch]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Financial_Batch_tbl_Financial_Year] FOREIGN KEY([year_id])
REFERENCES [dbo].[tbl_Financial_Year] ([year_id])
GO
ALTER TABLE [dbo].[tbl_Financial_Batch] CHECK CONSTRAINT [FK_tbl_Financial_Batch_tbl_Financial_Year]
GO
ALTER TABLE [dbo].[tbl_Financial_Batch]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Financial_Batch_tbl_Period_Master] FOREIGN KEY([period_id])
REFERENCES [dbo].[tbl_Period_Master] ([period_id])
GO
ALTER TABLE [dbo].[tbl_Financial_Batch] CHECK CONSTRAINT [FK_tbl_Financial_Batch_tbl_Period_Master]
GO
ALTER TABLE [dbo].[tbl_Financial_Year]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Financial_Year_tbl_Financial_Year] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Financial_Year] CHECK CONSTRAINT [FK_tbl_Financial_Year_tbl_Financial_Year]
GO
ALTER TABLE [dbo].[tbl_Finil_Financial_Series]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Finil_Financial_Series_tbl_Financial_Year] FOREIGN KEY([year_id])
REFERENCES [dbo].[tbl_Financial_Year] ([year_id])
GO
ALTER TABLE [dbo].[tbl_Finil_Financial_Series] CHECK CONSTRAINT [FK_tbl_Finil_Financial_Series_tbl_Financial_Year]
GO
ALTER TABLE [dbo].[tbl_Finil_Financial_Series]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Finilization_Run_Series_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Finil_Financial_Series] CHECK CONSTRAINT [FK_tbl_Finilization_Run_Series_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Finilize_Financial_Batch]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Finilize_Financial_Batch_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Finilize_Financial_Batch] CHECK CONSTRAINT [FK_tbl_Finilize_Financial_Batch_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_FirstFree_Number]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FirstFree_Number_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_FirstFree_Number] CHECK CONSTRAINT [FK_tbl_FirstFree_Number_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_FirstFree_Number]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FirstFree_Number_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_FirstFree_Number] CHECK CONSTRAINT [FK_tbl_FirstFree_Number_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_Hrms_Document_Type] FOREIGN KEY([doc_type_id])
REFERENCES [dbo].[tbl_Hrms_Document_Type] ([doc_type_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_Hrms_Document_Type]
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_User] FOREIGN KEY([emp_id])
REFERENCES [dbo].[tbl_User] ([user_Id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Document_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Document_Master_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Hrms_Employee_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Employee_Master_tbl_Hrms_Termination_Type] FOREIGN KEY([termination_type_id])
REFERENCES [dbo].[tbl_Hrms_Termination_Type] ([termination_type_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Employee_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Employee_Master_tbl_Hrms_Termination_Type]
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeBenifit_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_EmployeeBenifit_Master_tbl_Hrms_Salary_Component] FOREIGN KEY([salarycomp_id])
REFERENCES [dbo].[tbl_Hrms_Salary_Component] ([salarycomp_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeBenifit_Master] CHECK CONSTRAINT [FK_tbl_Hrms_EmployeeBenifit_Master_tbl_Hrms_Salary_Component]
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeGrade_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_EmployeeGrade_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeGrade_Master] CHECK CONSTRAINT [FK_tbl_Hrms_EmployeeGrade_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeLeave_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_EmployeeLeave_Master_tbl_Hrms_Leave] FOREIGN KEY([lev_type_id])
REFERENCES [dbo].[tbl_Hrms_Leave] ([leave_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_EmployeeLeave_Master] CHECK CONSTRAINT [FK_tbl_Hrms_EmployeeLeave_Master_tbl_Hrms_Leave]
GO
ALTER TABLE [dbo].[tbl_Hrms_FinalSettle_master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_FinalSettle_master_tbl_Hrms_Termination_Type] FOREIGN KEY([termination_type_id])
REFERENCES [dbo].[tbl_Hrms_Termination_Type] ([termination_type_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_FinalSettle_master] CHECK CONSTRAINT [FK_tbl_Hrms_FinalSettle_master_tbl_Hrms_Termination_Type]
GO
ALTER TABLE [dbo].[tbl_Hrms_Loan_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Loan_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Loan_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Loan_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Hrms_Loan_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hrms_Loan_Master_tbl_Hrms_Loan_Type] FOREIGN KEY([loan_type_id])
REFERENCES [dbo].[tbl_Hrms_Loan_Type] ([loan_type_id])
GO
ALTER TABLE [dbo].[tbl_Hrms_Loan_Master] CHECK CONSTRAINT [FK_tbl_Hrms_Loan_Master_tbl_Hrms_Loan_Type]
GO
ALTER TABLE [dbo].[tbl_Item_Group]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Group_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Group] CHECK CONSTRAINT [FK_tbl_Item_Group_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Item_Group]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Group_tbl_Tax_Master] FOREIGN KEY([taxmaster_Id])
REFERENCES [dbo].[tbl_Tax_Master] ([taxmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Group] CHECK CONSTRAINT [FK_tbl_Item_Group_tbl_Tax_Master]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_Base_Unit] FOREIGN KEY([bu_Id])
REFERENCES [dbo].[tbl_Base_Unit] ([bu_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_Base_Unit]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_Item_Group] FOREIGN KEY([itemgrp_Id])
REFERENCES [dbo].[tbl_Item_Group] ([itemgrp_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_Item_Group]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_Item_Type] FOREIGN KEY([itemtype_Id])
REFERENCES [dbo].[tbl_Item_Type] ([itemtype_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_Item_Type]
GO
ALTER TABLE [dbo].[tbl_Item_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Master_tbl_Manufacturer] FOREIGN KEY([manuf_Id])
REFERENCES [dbo].[tbl_Manufacturer] ([manuf_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Master] CHECK CONSTRAINT [FK_tbl_Item_Master_tbl_Manufacturer]
GO
ALTER TABLE [dbo].[tbl_Item_Type]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Item_Type_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Item_Type] CHECK CONSTRAINT [FK_tbl_Item_Type_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Journal_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Details_tbl_Journal_Master] FOREIGN KEY([journal_master_id])
REFERENCES [dbo].[tbl_Journal_Master] ([journal_master_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Details] CHECK CONSTRAINT [FK_tbl_Journal_Details_tbl_Journal_Master]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Financial_Batch] FOREIGN KEY([financial_bat_id])
REFERENCES [dbo].[tbl_Financial_Batch] ([financial_bat_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Financial_Batch]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Financial_Year] FOREIGN KEY([year_id])
REFERENCES [dbo].[tbl_Financial_Year] ([year_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Financial_Year]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Period_Master] FOREIGN KEY([period_id])
REFERENCES [dbo].[tbl_Period_Master] ([period_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Period_Master]
GO
ALTER TABLE [dbo].[tbl_Journal_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Journal_Master_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_Journal_Master] CHECK CONSTRAINT [FK_tbl_Journal_Master_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_Location]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Location_tbl_Area] FOREIGN KEY([area_id])
REFERENCES [dbo].[tbl_Area] ([area_id])
GO
ALTER TABLE [dbo].[tbl_Location] CHECK CONSTRAINT [FK_tbl_Location_tbl_Area]
GO
ALTER TABLE [dbo].[tbl_Location]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Location_tbl_Cntp_Person] FOREIGN KEY([contact_id])
REFERENCES [dbo].[tbl_Cntp_Person] ([cntp_Id])
GO
ALTER TABLE [dbo].[tbl_Location] CHECK CONSTRAINT [FK_tbl_Location_tbl_Cntp_Person]
GO
ALTER TABLE [dbo].[tbl_Location]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Location_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Location] CHECK CONSTRAINT [FK_tbl_Location_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Location]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Location_tbl_Region] FOREIGN KEY([region_id])
REFERENCES [dbo].[tbl_Region] ([regoin_id])
GO
ALTER TABLE [dbo].[tbl_Location] CHECK CONSTRAINT [FK_tbl_Location_tbl_Region]
GO
ALTER TABLE [dbo].[tbl_Manufacturer]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Manufacturer_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Manufacturer] CHECK CONSTRAINT [FK_tbl_Manufacturer_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Mapping_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Mapping_Detail_tbl_Mapping_Scheme] FOREIGN KEY([map_id])
REFERENCES [dbo].[tbl_Mapping_Scheme] ([map_id])
GO
ALTER TABLE [dbo].[tbl_Mapping_Detail] CHECK CONSTRAINT [FK_tbl_Mapping_Detail_tbl_Mapping_Scheme]
GO
ALTER TABLE [dbo].[tbl_Mapping_Scheme]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Mapping_Scheme_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Mapping_Scheme] CHECK CONSTRAINT [FK_tbl_Mapping_Scheme_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Mapping_Scheme]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Mapping_Scheme_tbl_Transaction_Type] FOREIGN KEY([transactiontype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_Mapping_Scheme] CHECK CONSTRAINT [FK_tbl_Mapping_Scheme_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_Payment_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Detail_tbl_Bank_Master] FOREIGN KEY([acc_no_id])
REFERENCES [dbo].[tbl_Chart_of_Account_Master] ([chartofacc_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Detail] CHECK CONSTRAINT [FK_tbl_Payment_Detail_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Detail_tbl_Payment_Master] FOREIGN KEY([payment_id])
REFERENCES [dbo].[tbl_Payment_Master] ([payment_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Detail] CHECK CONSTRAINT [FK_tbl_Payment_Detail_tbl_Payment_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Bank_Master] FOREIGN KEY([bankmaster_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Bank_Master1] FOREIGN KEY([transfer_tobank_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Bank_Master1]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Chart_of_Account_Master] FOREIGN KEY([expense_acc])
REFERENCES [dbo].[tbl_Chart_of_Account_Master] ([chartofacc_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Chart_of_Account_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Journal_Master] FOREIGN KEY([journal_master_id])
REFERENCES [dbo].[tbl_Journal_Master] ([journal_master_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Journal_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Master_tbl_Payment_Mode] FOREIGN KEY([pmode_id])
REFERENCES [dbo].[tbl_Payment_Mode] ([pmode_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Master] CHECK CONSTRAINT [FK_tbl_Payment_Master_tbl_Payment_Mode]
GO
ALTER TABLE [dbo].[tbl_Payment_Mode]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Mode_tbl_Bank] FOREIGN KEY([bank_Id])
REFERENCES [dbo].[tbl_Bank] ([bank_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Mode] CHECK CONSTRAINT [FK_tbl_Payment_Mode_tbl_Bank]
GO
ALTER TABLE [dbo].[tbl_Payment_Mode]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Mode_tbl_Company_Master] FOREIGN KEY([cmpany_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Mode] CHECK CONSTRAINT [FK_tbl_Payment_Mode_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Bank_Master] FOREIGN KEY([transfer_tobank_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Bank_Master1] FOREIGN KEY([bankmaster_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Bank_Master1]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Chart_of_Account_Master] FOREIGN KEY([expense_acc])
REFERENCES [dbo].[tbl_Chart_of_Account_Master] ([chartofacc_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Chart_of_Account_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Payment_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Payment_Register_tbl_Payment_Mode] FOREIGN KEY([pmode_id])
REFERENCES [dbo].[tbl_Payment_Mode] ([pmode_Id])
GO
ALTER TABLE [dbo].[tbl_Payment_Register] CHECK CONSTRAINT [FK_tbl_Payment_Register_tbl_Payment_Mode]
GO
ALTER TABLE [dbo].[tbl_Period_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Period_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Period_Master] CHECK CONSTRAINT [FK_tbl_Period_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Period_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Period_Master_tbl_Financial_Year] FOREIGN KEY([year_id])
REFERENCES [dbo].[tbl_Financial_Year] ([year_id])
GO
ALTER TABLE [dbo].[tbl_Period_Master] CHECK CONSTRAINT [FK_tbl_Period_Master_tbl_Financial_Year]
GO
ALTER TABLE [dbo].[tbl_Pricebook_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pricebook_Detail_tbl_Item_Master] FOREIGN KEY([item_id])
REFERENCES [dbo].[tbl_Item_Master] ([itemmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Pricebook_Detail] CHECK CONSTRAINT [FK_tbl_Pricebook_Detail_tbl_Item_Master]
GO
ALTER TABLE [dbo].[tbl_Pricebook_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pricebook_Detail_tbl_Pricebook_Master] FOREIGN KEY([pbookmst_id])
REFERENCES [dbo].[tbl_Pricebook_Master] ([pbookmst_id])
GO
ALTER TABLE [dbo].[tbl_Pricebook_Detail] CHECK CONSTRAINT [FK_tbl_Pricebook_Detail_tbl_Pricebook_Master]
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master] CHECK CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master] CHECK CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Pricebook_Master] CHECK CONSTRAINT [FK_tbl_Pricebook_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Base_Unit] FOREIGN KEY([bu_id])
REFERENCES [dbo].[tbl_Base_Unit] ([bu_Id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail] CHECK CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Base_Unit]
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail] CHECK CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Item_Master] FOREIGN KEY([item_id])
REFERENCES [dbo].[tbl_Item_Master] ([itemmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail] CHECK CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Item_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Purchase_Master] FOREIGN KEY([purchase_id])
REFERENCES [dbo].[tbl_Purchase_Master] ([purchase_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail] CHECK CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Purchase_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Detail] CHECK CONSTRAINT [FK_tbl_Purchase_Detail_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_Journal_Master] FOREIGN KEY([journal_master_id])
REFERENCES [dbo].[tbl_Journal_Master] ([journal_master_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_Journal_Master]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_Purchase_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Purchase_Master_tbl_User] FOREIGN KEY([buyer_id])
REFERENCES [dbo].[tbl_User] ([user_Id])
GO
ALTER TABLE [dbo].[tbl_Purchase_Master] CHECK CONSTRAINT [FK_tbl_Purchase_Master_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Bank_Master] FOREIGN KEY([bankmaster_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Location] FOREIGN KEY([loc_id])
REFERENCES [dbo].[tbl_Location] ([location_id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Location]
GO
ALTER TABLE [dbo].[tbl_Receipt_Register]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receipt_Register_tbl_Payment_Mode] FOREIGN KEY([pmode_id])
REFERENCES [dbo].[tbl_Payment_Mode] ([pmode_Id])
GO
ALTER TABLE [dbo].[tbl_Receipt_Register] CHECK CONSTRAINT [FK_tbl_Receipt_Register_tbl_Payment_Mode]
GO
ALTER TABLE [dbo].[tbl_Reciept_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Detail_tbl_Bank_Master] FOREIGN KEY([acc_no_id])
REFERENCES [dbo].[tbl_Chart_of_Account_Master] ([chartofacc_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Detail] CHECK CONSTRAINT [FK_tbl_Reciept_Detail_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Detail_tbl_Reciept_Master] FOREIGN KEY([reciept_id])
REFERENCES [dbo].[tbl_Reciept_Master] ([receipt_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Detail] CHECK CONSTRAINT [FK_tbl_Reciept_Detail_tbl_Reciept_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Bank_Master] FOREIGN KEY([bankmaster_id])
REFERENCES [dbo].[tbl_Bank_Master] ([bankmaster_Id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Bank_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Journal_Master] FOREIGN KEY([journal_master_id])
REFERENCES [dbo].[tbl_Journal_Master] ([journal_master_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Journal_Master]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Location] FOREIGN KEY([loc_id])
REFERENCES [dbo].[tbl_Location] ([location_id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Location]
GO
ALTER TABLE [dbo].[tbl_Reciept_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Reciept_Master_tbl_Payment_Mode] FOREIGN KEY([pmode_id])
REFERENCES [dbo].[tbl_Payment_Mode] ([pmode_Id])
GO
ALTER TABLE [dbo].[tbl_Reciept_Master] CHECK CONSTRAINT [FK_tbl_Reciept_Master_tbl_Payment_Mode]
GO
ALTER TABLE [dbo].[tbl_Region]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Region_tbl_Country_Master] FOREIGN KEY([country_id])
REFERENCES [dbo].[tbl_Country_Master] ([cntry_Id])
GO
ALTER TABLE [dbo].[tbl_Region] CHECK CONSTRAINT [FK_tbl_Region_tbl_Country_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Base_Unit] FOREIGN KEY([bu_id])
REFERENCES [dbo].[tbl_Base_Unit] ([bu_Id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Base_Unit]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Item_Master] FOREIGN KEY([item_id])
REFERENCES [dbo].[tbl_Item_Master] ([itemmaster_Id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Item_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_SalesInvoice_Master] FOREIGN KEY([salesinvoice_id])
REFERENCES [dbo].[tbl_SalesInvoice_Master] ([salesinvoice_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_SalesInvoice_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Detail] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Detail_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_BusinessPartner_Master] FOREIGN KEY([bp_id])
REFERENCES [dbo].[tbl_BusinessPartner_Master] ([bp_Id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_BusinessPartner_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Enterprice_Unit] FOREIGN KEY([eu_id])
REFERENCES [dbo].[tbl_Enterprice_Unit] ([eu_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Enterprice_Unit]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Journal_Master] FOREIGN KEY([journal_master_id])
REFERENCES [dbo].[tbl_Journal_Master] ([journal_master_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Journal_Master]
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_SalesInvoice_Master] CHECK CONSTRAINT [FK_tbl_SalesInvoice_Master_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_State_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_State_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_State_Master] CHECK CONSTRAINT [FK_tbl_State_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_State_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_State_Master_tbl_Country_Master] FOREIGN KEY([cntry_Id])
REFERENCES [dbo].[tbl_Country_Master] ([cntry_Id])
GO
ALTER TABLE [dbo].[tbl_State_Master] CHECK CONSTRAINT [FK_tbl_State_Master_tbl_Country_Master]
GO
ALTER TABLE [dbo].[tbl_Subscription_Parameter]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Subscription_Parameter_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Subscription_Parameter] CHECK CONSTRAINT [FK_tbl_Subscription_Parameter_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Subscription_Type]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Sub_Type_tbl_Currency_Master] FOREIGN KEY([currency_id])
REFERENCES [dbo].[tbl_Currency_Master] ([currency_id])
GO
ALTER TABLE [dbo].[tbl_Subscription_Type] CHECK CONSTRAINT [FK_tbl_Sub_Type_tbl_Currency_Master]
GO
ALTER TABLE [dbo].[tbl_Tax]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Tax_tbl_Company_Master] FOREIGN KEY([cmpny_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Tax] CHECK CONSTRAINT [FK_tbl_Tax_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Tax_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Tax_Master_tbl_Company_Master] FOREIGN KEY([cmpny_Id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Tax_Master] CHECK CONSTRAINT [FK_tbl_Tax_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Transaction_Series]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Transaction_Series_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Transaction_Series] CHECK CONSTRAINT [FK_tbl_Transaction_Series_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_Transaction_Series]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Transaction_Series_tbl_Transaction_Type] FOREIGN KEY([transtype_id])
REFERENCES [dbo].[tbl_Transaction_Type] ([transtype_id])
GO
ALTER TABLE [dbo].[tbl_Transaction_Series] CHECK CONSTRAINT [FK_tbl_Transaction_Series_tbl_Transaction_Type]
GO
ALTER TABLE [dbo].[tbl_Transaction_Type]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Transaction_Type_tbl_Company_Master] FOREIGN KEY([company_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_Transaction_Type] CHECK CONSTRAINT [FK_tbl_Transaction_Type_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_TransactionLog_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TransactionLog_Master_tbl_Company_Master] FOREIGN KEY([cmpny_id])
REFERENCES [dbo].[tbl_Company_Master] ([cmpny_Id])
GO
ALTER TABLE [dbo].[tbl_TransactionLog_Master] CHECK CONSTRAINT [FK_tbl_TransactionLog_Master_tbl_Company_Master]
GO
ALTER TABLE [dbo].[tbl_TransactionLog_Master]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TransactionLog_Master_tbl_User] FOREIGN KEY([user_Id])
REFERENCES [dbo].[tbl_User] ([user_Id])
GO
ALTER TABLE [dbo].[tbl_TransactionLog_Master] CHECK CONSTRAINT [FK_tbl_TransactionLog_Master_tbl_User]
GO
ALTER TABLE [dbo].[zsys_Column]  WITH CHECK ADD  CONSTRAINT [FK_zsys_Column_zsys_Table] FOREIGN KEY([table_id])
REFERENCES [dbo].[zsys_Table] ([table_id])
GO
ALTER TABLE [dbo].[zsys_Column] CHECK CONSTRAINT [FK_zsys_Column_zsys_Table]
GO
/****** Object:  StoredProcedure [dbo].[sp_Sync_DimensionData]    Script Date: 12/28/2016 7:09:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lerin
-- Create date: 9/11/16
-- =============================================
CREATE PROCEDURE [dbo].[sp_Sync_DimensionData] 
	@valueField varchar(30),
	@displayField varchar(30),
	@tableName varchar(30)
AS
BEGIN
	DECLARE	@str varchar(500) = ''
	DECLARE @p_Column varchar(30) 
	SET NOCOUNT ON;
	SET @p_Column= [dbo].[fn_Get_Primarykey_Column](@tableName)
	SET @str += 'SELECT'
	SET @str += ' ' + @p_Column + ' AS PKEY'
	SET @str += ', ' + @valueField + ' AS VALUEFIELD'
	SET @str += ', ' + @displayField + ' AS NAMEFIELD'
	SET @str += ' ' + 'FROM'
	SET @str += ' ' + @tableName
	EXECUTE(@str)
END

GO
USE [master]
GO
ALTER DATABASE [ERP_Pro1.0] SET  READ_WRITE 
GO
