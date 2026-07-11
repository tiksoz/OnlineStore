use ECommerceDB;
create table Users (
	UserID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Names nvarchar(20) NOT NULL,
	PassswordHash char(60) NOT NULL, 
	Email varchar(50) NOT NULL UNIQUE
);

create table Cart (
	CartID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	UserID int NOT NULL,
	FOREIGN KEY (UserID) REFERENCES ECommerceDB.dbo.Users(UserID) ON DELETE CASCADE
);

create table Favori (
	FavoriID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	UserID int NOT NULL,
	FOREIGN KEY (UserID) REFERENCES ECommerceDB.dbo.Users(UserID) ON DELETE CASCADE
);

create table Products(
	ProductID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Names nvarchar(150) NOT NULL,
	ImageUrl nvarchar(500) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
	UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
	Stock int NOT NULL DEFAULT 0,
	CategoryID int NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES ECommerceDB.dbo.Categories(CategoryID) ON DELETE CASCADE
);

create table CartItems(
	CartItemID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Quantity int NOT NULL,
	ProductID int NOT NULL,
	CartID int NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ECommerceDB.dbo.Products(ProductID) ON DELETE CASCADE,
	FOREIGN KEY (CartID) REFERENCES ECommerceDB.dbo.Cart(CartID) ON DELETE CASCADE
);

create table FavoriItems(
	FavoriItemID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FavoriID int NOT NULL,
	ProductID int NOT NULL,
	FOREIGN KEY (FavoriID) REFERENCES ECommerceDB.dbo.Favori(FavoriID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES ECommerceDB.dbo.Products(ProductID) ON DELETE CASCADE
);
