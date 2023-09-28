-- GROUP BY + JOIN
--1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear)
--1.b) Considere apenas o mês (CalendarMonthLabel) de 'January'
--1.c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a 1200000

--1.a)
SELECT TOP(100) * FROM FactSales
SELECT * FROM DimDate

SELECT
	CalendarYear AS 'Year',
	SUM(SalesQuantity) AS 'Total Sales'
FROM 
	FactSales

INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey

GROUP BY CalendarYear

--1.b)
SELECT
	CalendarYear AS 'Year',
	SUM(SalesQuantity) AS 'Total Sales'
FROM 
	FactSales

INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey

WHERE CalendarMonthLabel = 'January'
GROUP BY CalendarYear
ORDER BY SUM(SalesQuantity) DESC

--1.c)
SELECT
	CalendarYear AS 'Year',
	SUM(SalesQuantity) AS 'Total Sales'
FROM 
	FactSales

INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey

WHERE CalendarMonthLabel = 'January'
GROUP BY CalendarYear
HAVING SUM(SalesQuantity) >= 1200000
