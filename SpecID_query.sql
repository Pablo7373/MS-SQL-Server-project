


/*ALTER TABLE dbo.Products --- вставка столбца SpecID
ADD SpecID INT; */
/*ADD FOREIGN KEY (SpecID)
REFERENCES dbo.Specs(SpecID);*/

/*INSERT INTO Products --- вставка недостающей строки данных
VALUES (316107, 'Randewoo ўетка массажна€ дл€ тела', 309609, NULL, NULL);*/

/*ALTER TABLE dbo.Products --- задаем PK если забыл)))
ADD PRIMARY KEY(ProductID)*/

/*ALTER TABLE Specs  --- задаем PK если забыл)))
ADD PRIMARY KEY(SpecID);*/


/*ALTER TABLE dbo.Products --- по идее так присваиваем FK, но он присвоил сам себе, сделал через блок-схему
ADD FOREIGN KEY (SpecID) REFERENCES dbo.Specs(SpecID);*/


/*ALTER TABLE Products --- удал€ем столбец SpecID
DROP COLUMN SpecID;*/

/*ALTER TABLE dbo.Products --- создаем столбец и присваиваем FK в один запрос
ADD SpecID INT,
FOREIGN KEY (SpecID)
REFERENCES dbo.Specs(SpecID);*/


/*UPDATE dbo.Products   --- обновление данных на основе равенства ключей
SET dbo.Products.SpecID = dbo.Specs.SpecID
FROM dbo.Products   
    INNER JOIN dbo.Specs   
    ON (dbo.Products.ProductID = dbo.Specs.ProductID);  */

