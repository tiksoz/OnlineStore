USE [category]
GO

/****** Object:  StoredProcedure [dbo].[productUpdate]    Script Date: 26.08.2025 13:38:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[productUpdate](
	@Id int,
	@ProductName nvarchar(MAX),
	@CategoryID int
)
as 
begin
	if exists(select 1 from productCategoy where ProductName = @ProductName)
		begin
			select 'This product exists in stock'  as mesaj
		end
	else 
		begin
			update productCategoy set ProductName=@ProductName, UpdateDate=GETDATE(), CategoryID=@CategoryID where Id=@Id
			select 'This product has been updated in stock' as mesaj
		end
end
GO

