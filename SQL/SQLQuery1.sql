----1.	Sales (Amount and value) and profit margins since 2013 with general performance over a selected date range. 


SELECT  [Description]
      ,SUM([Quantity])  AS [Quantity]
      ,[Unit Price]
      ,sum([Total Excluding Tax]) as [Amount]
      ,SUM([Total Including Tax]) AS [Value]
      ,SUM([Profit]) AS [Profit]
	  ,B.[Calendar Year]
  FROM [WideWorldImportersDW].[Fact].[Sale] A
  JOIN [WideWorldImportersDW].[Dimension].[Date] B 
  ON A.[Delivery Date Key] = B.[Date]
  WHERE B.[Calendar Year] >= '2013'
  GROUP BY [Description],[Unit Price],B.[Calendar Year];

----2.	Top sales/profits by brand and stock items

SELECT COUNT(a.[Stock Item Key]) AS [Top Sales]
       ,SUM(a.[Quantity]) AS Quantity  
       ,SUM(a.[Profit]) AS [Profit] 
	   ,B.[Brand]
	   ,B.[Stock Item]

FROM [WideWorldImportersDW].[Fact].[Sale] a
JOIN [WideWorldImportersDW].[Dimension].[Stock Item] B ON A.[Stock Item Key] =B.[Stock Item Key]
GROUP BY B.[Brand],B.[Stock Item]
ORDER BY 3 DESC;

----3.	Territory sales/profits
SELECT  b.[City] 
       ,b.[State Province]
       ,b.[Sales Territory]
       ,COUNT(a.[Stock Item Key]) AS [Total Stock Itmes]
       ,SUM(a.[Quantity]) AS [Total Quantity]
       ,SUM(a.[Total Including Tax]) AS [Total Value]
       ,SUM(a.[Profit]) AS Profit

FROM [WideWorldImportersDW].[Fact].[Sale] a
JOIN [WideWorldImportersDW].[Dimension].[City] B ON b.[City Key] = a.[City Key]
GROUP BY b.[City]
       ,b.[State Province]
       ,b.[Sales Territory]


----4.	Top sales employees and details of sales
SELECT  COUNT(a.[Salesperson Key]) as [Top sales employees]    
	   ,[Is Salesperson]
	   ,[Employee]
      ,[Preferred Name]
	  ,[Description]
	  ,sum([Quantity]) [total Quantity Sold]
	  ,sum([Profit]) as [Profit]
	  ,SUM([Total Including Tax]) as [Total Value]

FROM [WideWorldImportersDW].[Fact].[Sale] a
JOIN [WideWorldImportersDW].[Dimension].[Employee] B ON  A.[Salesperson Key] = B.[Employee Key]
GROUP BY [Is Salesperson],[Employee],[Preferred Name],[Description]
ORDER BY 1 DESC;




----5.	Profit/Sales correlations with item prices
SELECT 
b.[Unit Price]
,b.[Recommended Retail Price]
,b.[Tax Rate]
,sum([Total Excluding Tax]) as [Total Excluding Tax]
,SUM([Total Including Tax]) AS [Total Including Tax]
,COUNT(a.[Stock Item Key]) AS [Total Sales]
,sum([Profit]) as [Profit]
,sum([Quantity]) [total Quantity Sold]
FROM [WideWorldImportersDW].[Fact].[Sale] a
JOIN [WideWorldImportersDW].[Dimension].[Stock Item] B 
ON a.[Stock Item Key] = b.[Stock Item Key]
GROUP BY b.[Unit Price],b.[Recommended Retail Price],b.[Tax Rate]


