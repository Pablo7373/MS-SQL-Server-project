/*CREATE TABLE #DatChan		-- создаем временную таблицу 
(DescripID INT IDENTITY,
DescripCategory1 SMALLINT,
DescripCategory2 SMALLINT,
DescripCategory3 SMALLINT,
DescripCategory4 SMALLINT,
DescripCategory5 SMALLINT) 

SET IDENTITY_INSERT #DatChan ON			-- вставляем во временную таблицу значения из основной
INSERT INTO #DatChan(DescripID, DescripCategory1, DescripCategory2, DescripCategory3, DescripCategory4, DescripCategory5)
SELECT DescripID, DescripCategory1, DescripCategory2, DescripCategory3, DescripCategory4, DescripCategory5
FROM dbo.Descriptions
SET IDENTITY_INSERT #DatChan OFF*/

/*SELECT * FROM #DatChan
ORDER BY DescripID;

SELECT * FROM dbo.Descriptions;*/

/*ALTER TABLE #DatChan ALTER COLUMN DescripCategory1 varchar(10);		-- меняем тип данных во вр. таблице
ALTER TABLE #DatChan ALTER COLUMN DescripCategory2 varchar(10);
ALTER TABLE #DatChan ALTER COLUMN DescripCategory3 varchar(10);
ALTER TABLE #DatChan ALTER COLUMN DescripCategory4 varchar(10);
ALTER TABLE #DatChan ALTER COLUMN DescripCategory5 varchar(10);*/

/*SELECT FirstName,
       LastName,
       STUFF(
           COALESCE(',' + NULLIF(StreetAddress, ''), '')  + 
           COALESCE(',' + NULLIF(City, ''), '') +
           COALESCE(',' + NULLIF(Country, ''), '') +
           COALESCE(',' + NULLIF(PostalCode , ''), ''),
           1, 1, '') AS "Address"
   FROM Client*/

/*SELECT DescripID, (COALESCE(DescripCategory1) + COALESCE(',', DescripCategory2) +
					COALESCE(',', DescripCategory2) +
					COALESCE(',', DescripCategory2) +
					COALESCE(',', DescripCategory2)
					) AS ProductCategoryID_rom2
FROM #DatChan;*/

SELECT DescripID, CONCAT_WS(',', DescripCategory1, DescripCategory2, DescripCategory3, DescripCategory4, DescripCategory5)
FROM #DatChan

SELECT * FROM dbo.Descriptions;
SELECT * FROM #DatChan;

ALTER TABLE dbo.Descriptions
ADD ProductCategoryID_rom2 VARCHAR(30);

ALTER TABLE dbo.Descriptions
DROP COLUMN ProductCategoryID_rom2


/*UPDATE dbo.Descriptions		-- добавление сконкатенированных строк в новый столбец
SET dbo.Descriptions.ProductCategoryID_rom2 = CONCAT_WS(',', #DatChan.DescripCategory1, #DatChan.DescripCategory2, #DatChan.DescripCategory3, #DatChan.DescripCategory4, #DatChan.DescripCategory5)
FROM dbo.Descriptions 
	INNER JOIN #DatChan
	ON (dbo.Descriptions.DescripID = #DatChan.DescripID)*/


ALTER TABLE dbo.Descriptions
DROP COLUMN DescripCategory1, DescripCategory2, DescripCategory3, DescripCategory4, DescripCategory5

DROP TABLE #DatChan
