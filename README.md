# MS-SQL-Server-project

# Описания проекта

Мой проект по иморту данных формата .xlsx в MSSQL.
Что я делал:
1. Поменял кодировку исходных файлов на UTF-8.
2. Посчитал максимальную длину строк в каждом столбце и прибавил 10% от размера.
3. Импортировал данные в созданную БД в MS SQL Server, указав размерность столбцов с учётов данных из шага 2.
4. Увидел, что потерялась 1 строка, вставил её (SpecID_query.sql).
5. Создал взаимосвязь по ключу между таблицами Products и Specs по ТЗ (SpecID_query.sql).
6. Создал временную таблицу и в ней произвел конкатенацию строк по ТЗ (TempDataChanging.sql).
7. Заменил исходные строки на объединённую (TempDataChanging.sql).

# ТЗ

Импорт четырех таблиц из .xlsx в MSSQL,
СУБД установлена на выделенном сервере, 
дам доступ RDP 

Необходимо загрузить в БД MSSQL данные о новых товарах магазина,
сейчас данные хранятся в формате .xlsx (есть кириллица)
1. таблица Brands (807 строк для импорта)
- импорт производим из файла uhod_brands.xlsx
- uhod_brands.BrandID --> Brands.BrandID (ключ)
- uhod_brands.BrandName --> Brands.BrandName
- uhod_brands.BrandImage --> Brands.image

2. таблица Descriptions (21134 строки)
- импорт производим из файла uhod_descriptions.xlsx
- uhod_descriptions.DescripID --> Descriptions.DescripID (ключ)
- uhod_descriptions.GroupName --> Descriptions.GroupName
- uhod_descriptions.Description --> Descriptions.Description
- uhod_descriptions.BrandID --> Descriptons.BrandID

**Далее в файле идут 5 колонок 
DescripCategory1, ...2,3,4,5
при импорте необходимо вписать ID категорий каждого товара
в колонку Descriptions.ProductCategoryID_rom2 через запятую
пример:
для DescripID=315127 в Descriptions.ProductCategoryID_rom2 должно быть "1017,1028,1106,1176,1177"**

- uhod_descriptions.DescripImage1 --> Descriptons.imagefile_with_box
- uhod_descriptions.DescripImage2 --> Descriptons.imagefile_without_box
- uhod_descriptions.DescripImage3 --> Descriptons.imagefile_3 (нужно создать колонку nvarchar(200))
- uhod_descriptions.DescripImage4 --> Descriptons.imagefile_4 (нужно создать колонку nvarchar(200))
- uhod_descriptions.Страна --> Descriptons.Product_country
- uhod_descriptions.Объем --> Descriptons.obiom (нужно создать колонку nvarchar(200))
- uhod_descriptions.SPF --> Descriptons.SPF (нужно создать колонку nvarchar(200))
- uhod_descriptions.Тип кожи --> Descriptons.tip_kozhi (нужно создать колонку nvarchar(200))
- uhod_descriptions.Тип --> Descriptons.tip (нужно создать колонку nvarchar(200))
- uhod_descriptions.Размер --> Descriptons.razmer (нужно создать колонку nvarchar(200))
- uhod_descriptions.Верхние ноты --> Descriptons.Product_up_notes
- uhod_descriptions.Средние ноты --> Descriptons.Product_middle_notes
- uhod_descriptions.Базовые ноты --> Descriptons.Product_base_notes
- uhod_descriptions.Фиксация --> Descriptons.fiksacia (нужно создать колонку nvarchar(200))

3. Таблица Products (35128 строк)
- uhod_products.ProductID --> Products.ProductID (ключ)
- uhod_products.ProductName --> Products.ProductName
- uhod_products.DescripID --> Products.DescriptID
- uhod_products.ProductImage --> Products.VolumeImageFile
- uhod_specs.SpecID (where uhod_specs.ProductID = Products.ProductID) --> Products.SpecID  
(т.е. в последней строке импорт значений SpecID в табл. Products 
   осуществляется из файла uhod_specs) 

4. Таблица SiteSpec (35128 строк)
- uhod_specs.SpecID --> SiteSpec.SpecID 
- uhod_specs.SpecName --> SiteSpec.SpecName
