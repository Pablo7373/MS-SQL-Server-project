


/*ALTER TABLE dbo.Products --- ������� ������� SpecID
ADD SpecID INT; */
/*ADD FOREIGN KEY (SpecID)
REFERENCES dbo.Specs(SpecID);*/

/*INSERT INTO Products --- ������� ����������� ������ ������
VALUES (316107, 'Randewoo ����� ��������� ��� ����', 309609, NULL, NULL);*/

/*ALTER TABLE dbo.Products --- ������ PK ���� �����)))
ADD PRIMARY KEY(ProductID)*/

/*ALTER TABLE Specs  --- ������ PK ���� �����)))
ADD PRIMARY KEY(SpecID);*/


/*ALTER TABLE dbo.Products --- �� ���� ��� ����������� FK, �� �� �������� ��� ����, ������ ����� ����-�����
ADD FOREIGN KEY (SpecID) REFERENCES dbo.Specs(SpecID);*/


/*ALTER TABLE Products --- ������� ������� SpecID
DROP COLUMN SpecID;*/

/*ALTER TABLE dbo.Products --- ������� ������� � ����������� FK � ���� ������
ADD SpecID INT,
FOREIGN KEY (SpecID)
REFERENCES dbo.Specs(SpecID);*/


/*UPDATE dbo.Products   --- ���������� ������ �� ������ ��������� ������
SET dbo.Products.SpecID = dbo.Specs.SpecID
FROM dbo.Products   
    INNER JOIN dbo.Specs   
    ON (dbo.Products.ProductID = dbo.Specs.ProductID);  */

