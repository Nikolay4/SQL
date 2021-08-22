USE [tempdb]
GO

drop table if Exists dbo.ProductCategories
drop table if Exists dbo.Products
drop table if Exists dbo.Categories


GO

/* Продукты */
CREATE TABLE [dbo].[Products](
	[ProductId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NOT NULL
) 
GO
 /* Категории */
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL
) 
GO

/* категории продуктов. таблица отношений */
CREATE TABLE [dbo].[ProductCategories](
	ProductId INT REFERENCES Products (ProductId),
	CategoryId INT REFERENCES Categories (CategoryId)
)
GO

Insert into Products (ProductName)
Values  ('Product1'), 
		('Product2'),
		('Product3'),
		('Product4'),
		('Product5'),
		('Product6'),
		('Product7'),
		('Product8'),
		('Product9')

GO

Insert into Categories (CategoryName)
Values  ('Category1'),
		('Category2'),
		('Category3'),
		('Category4'),
		('Category5'),
		('Category6'),
		('Category7'),
		('Category8'),
		('Category9')

GO

Insert into ProductCategories (ProductId, CategoryId)
Values 
--1 продукт 
(1,1),
(1,2),
(1,3),
--2 продукт
(2,1),
(2,2),
--3 без категорий
--4 продукт
(4,2),
(4,4),
--5 продукт
(5,6),
--6 продукт
(6,6),
--7 продукт
(7,7),
(7,9),
--8 без категорий
--продукт
(9,1),
(9,3)

GO

SELECT p.ProductName, c.CategoryName 
from Products p
left join ProductCategories pc on pc.ProductId = p.ProductId
left join Categories c on c.CategoryId = pc.CategoryId