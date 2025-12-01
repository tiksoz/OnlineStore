USE [category]
GO

/****** Object:  Table [dbo].[productCategoy]    Script Date: 26.08.2025 13:41:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[productCategoy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_productCategoy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[productCategoy]  WITH CHECK ADD  CONSTRAINT [FK_productCategoy_categories1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[categories] ([Id])
GO

ALTER TABLE [dbo].[productCategoy] CHECK CONSTRAINT [FK_productCategoy_categories1]
GO

