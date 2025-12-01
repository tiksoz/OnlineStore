USE [category]
GO

/****** Object:  StoredProcedure [dbo].[categoriesRead]    Script Date: 26.08.2025 13:37:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[categoriesRead](
	@Id int
)
as
begin
	if @Id is NULL
		select Id, CategoryName, createDate, updateDate from categories 
	else if exists (select 1 from categories where Id= @Id)
		begin 
			select Id, CategoryName, createDate, updateDate from categories 
			where Id=@Id
		end
	else
		begin
			select 'This product is not in stock' as mesaj
		end
end
GO

