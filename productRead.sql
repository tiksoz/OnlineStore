USE [category]
GO

/****** Object:  StoredProcedure [dbo].[productRead]    Script Date: 26.08.2025 13:38:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[productRead](
	@Id int
)
as 
begin 
	if @Id is NULL
		begin
			select Id, ProductName, CreateDate, UpdateDate, CategoryID from productCategoy
		end
	else if exists(select 1 from productCategoy where Id=@Id)
		begin
			select Id, ProductName, CreateDate, UpdateDate, CategoryID from productCategoy where Id=@Id
		end
	else
		begin
			select 'This product is not in stock'
		end
end
GO

