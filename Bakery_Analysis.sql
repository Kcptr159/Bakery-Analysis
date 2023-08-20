-- Splitting DateTime column (Year, Month, Day, Weekday)

ALTER TABLE [PROJECT 1].[dbo].[BakerySales]
ADD Year INT;

UPDATE [PROJECT 1].[dbo].[BakerySales]
SET Year = YEAR(DateTime);

ALTER TABLE [PROJECT 1].[dbo].[BakerySales]
DROP COLUMN DateTime;

ALTER TABLE [PROJECT 1].[dbo].[BakerySales]
ADD Month NVARCHAR(255);

UPDATE [PROJECT 1].[dbo].[BakerySales]
SET Month = DATENAME(MONTH, DateTime);

ALTER TABLE [PROJECT 1].[dbo].[BakerySales]
ADD Date INT;

UPDATE [PROJECT 1].[dbo].[BakerySales]
SET Date = DAY(DateTime);

ALTER TABLE [PROJECT 1].[dbo].[BakerySales]
ADD Day NVARCHAR(255);

UPDATE [PROJECT 1].[dbo].[BakerySales]
SET Day = DATENAME(WEEKDAY, DateTime);

-- Now let's see if everything is updated or not

SELECT *
FROM [PROJECT 1].[dbo].[BakerySales];

-- Let's look at distinct items in the store

SELECT DISTINCT(Items)
FROM [PROJECT 1].[dbo].[BakerySales];

-- Total number of each item sold and which item is being sold frequently

SELECT Items, COUNT(*) AS ItemCount
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Items
ORDER BY ItemCount DESC;

-- Now, let's analyze sales by Daypart

SELECT Daypart, COUNT(*) AS SalesCount
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Daypart
ORDER BY SalesCount DESC;

-- Now, let's analyze sales by DayType

SELECT DayType, COUNT(*) AS SalesCount
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY DayType
ORDER BY SalesCount DESC;

-- Let's determine the month with the highest item sales

SELECT Month, COUNT(*) AS SalesCount
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Month
ORDER BY SalesCount DESC;

-- Finally, let's determine the day of the month with the highest sales

SELECT Day, COUNT(*) AS SalesCount
FROM [PROJECT 1].[dbo].[BakerySales]
GROUP BY Day
ORDER BY SalesCount DESC;