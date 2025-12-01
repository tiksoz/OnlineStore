USE [category]
GO

/****** Object:  StoredProcedure [dbo].[categoriesDelete]    Script Date: 26.08.2025 13:37:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[categoriesDelete](
	@Id int
)
as
begin 
	if exists(select 1 from categories where Id = @Id)
	begin
		delete from categories where Id = @Id 
		select 'Category has been deleted from table' as mesaj 
	end
	else
	begin 
		select 'Category does not exist in the table' as mesaj 
	end
end
GO

