USE [category]
GO

/****** Object:  StoredProcedure [dbo].[categoriesUpdate]    Script Date: 26.08.2025 13:37:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[categoriesUpdate](
	@CategoryName nvarchar(MAX),
	@Id int
)
as 
begin
	 if exists (select * from categories where CategoryName = @CategoryName)
		begin 
			print 'This category exists in a table'
		end
	 else
		begin
			update categories set CategoryName = @CategoryName, updateDate = GETDATE() where Id = @Id
			print 'This category updated in a table'
		end
end
GO

