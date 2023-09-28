--1.a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal de vendas (ChannelName). 
--     Você deve ordenar a tabela final de acordo com SalesQuantity, em ordem decrescente.
--1.b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) 
--     e quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName).
--1.c) Faça um resumo do valor total vendido (Sales Amount) para cada mês (CalendarMonthLabel) e ano (CalendarYear).

--1.a)
SELECT TOP(100) * FROM FactSales
SELECT * FROM DimChannel

SELECT 
	ChannelName,
	SUM(SalesQuantity) AS 'Total Sales'
FROM 
	FactSales

INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC

--1.b)
SELECT TOP(100) * FROM FactSales
SELECT * FROM DimStore

SELECT
	StoreName,
	SUM(SalesQuantity) AS 'Total Sales',
	SUM(ReturnQuantity) AS 'Total Retrun'
FROM 
	FactSales

INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName

--1.c)
SELECT TOP(100) * FROM FactSales
SELECT * FROM DimDate

SELECT 
	CalendarYear AS 'Year',
	CalendarMonthLabel AS 'Month',
	SUM(SalesAmount) AS 'Sales Amount'
FROM 
	FactSales

INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
GROUP BY CalendarYear, CalendarMonthLabel, CalendarMonth
ORDER BY CalendarMonth ASC