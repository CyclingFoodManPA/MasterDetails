USE master;
GO

DROP DATABASE IF EXISTS Orders;
GO

CREATE DATABASE Orders;
GO


USE [Orders]
GO


/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/11/2016 6:21:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [uniqueidentifier] NOT NULL,
	[MasterId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 12/11/2016 6:21:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMaster](
	[MasterId] [uniqueidentifier] NOT NULL,
	[CustomerName] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderMaster] PRIMARY KEY CLUSTERED 
(
	[MasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[OrderDetails] ([DetailId], [MasterId], [ProductName], [Quantity], [Amount]) VALUES (N'be46f419-f5cb-4b8d-b490-1deb72f6b044', N'e2f3663e-7e27-47cb-81f5-49898da09afd', N'HP Laptop', 3, CAST(300 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderDetails] ([DetailId], [MasterId], [ProductName], [Quantity], [Amount]) VALUES (N'dfce8a8c-2279-4a58-97cd-736e934c3633', N'e2f3663e-7e27-47cb-81f5-49898da09afd', N'Dell Laptop', 2, CAST(260 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderMaster] ([MasterId], [CustomerName], [Address], [OrderDate]) VALUES (N'e2f3663e-7e27-47cb-81f5-49898da09afd', N'Dave Jones', N'Jones Street', CAST(N'2016-11-22 09:05:59.817' AS DateTime))
GO
INSERT [dbo].[OrderMaster] ([MasterId], [CustomerName], [Address], [OrderDate]) VALUES (N'911a8a42-fe0e-4b28-9282-9920ed350eb8', N'John Doe', N'John Street, Lagos Nigeria', CAST(N'2016-11-21 22:43:34.850' AS DateTime))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderMaster] FOREIGN KEY([MasterId])
REFERENCES [dbo].[OrderMaster] ([MasterId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderMaster]
GO
