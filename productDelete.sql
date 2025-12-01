USE [category]
GO

/****** Object:  StoredProcedure [dbo].[productDelete]    Script Date: 26.08.2025 13:38:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[productDelete](
	@Id int
)
as 
begin
	if exists(select 1 from productCategoy where Id=@Id)
		begin
			delete from productCategoy where Id=@Id
			select 'This product has been deleted from stock'
		end
	else
		begin 
			select 'This product is not in stock' as mesaj
		end
end
GO

