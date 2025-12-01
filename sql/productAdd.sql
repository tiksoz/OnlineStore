USE [category]
GO

/****** Object:  StoredProcedure [dbo].[productAdd]    Script Date: 26.08.2025 13:38:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[productAdd](
	@ProductName nvarchar(Max),
	@CategoryId int
)
as 
begin
	if exists(select 1 from productCategoy where ProductName=@ProductName)
		begin
			select 'This product already exists in stock' as mesaj
		end
	else
		begin
			insert into productCategoy (ProductName, CreateDate, UpdateDate, CategoryID) values(@ProductName, GETDATE(), GETDATE(), @CategoryId) 
			select 'This product has been added to stock' as mesaj
		end
end
GO

