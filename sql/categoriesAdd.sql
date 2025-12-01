USE [category]
GO

/****** Object:  StoredProcedure [dbo].[categoriesAdd]    Script Date: 26.08.2025 13:37:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[categoriesAdd](
	@CategoryName nvarchar(MAX)
)
as
Begin
	if exists (select * from categories where CategoryName = @CategoryName)
	begin
		select 'This category exists in the table.' as mesaj
	end
	else
	begin
		insert into categories (CategoryName, createDate, updateDate)
		values (@CategoryName, GETDATE(), GETDATE())
			select 'This category add in the table' as mesaj
	end
End;
GO

