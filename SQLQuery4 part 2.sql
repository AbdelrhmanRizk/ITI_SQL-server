select SalesOrderID,ShipDate from sales.SalesOrderHeader 
where OrderDate between '7/28/2002' and '7/29/2014'

select  ProductID,Name  from Production.Product
where StandardCost < 110

select  ProductID,Name  from Production.Product
where Weight is null

select  *  from Production.Product
where Color in('Silver','black','red')

select  *  from Production.Product
where Name like 'B%'

update Production.ProductDescription set Description ='Chromoly steel_High of defects'
where ProductDescriptionID = 3

select Description from Production.ProductDescription
where Description like '%[_]%'




select OrderDate , sum(TotalDue) from Sales.SalesOrderHeader 
where ShipDate between '7/1/2001'  and '7/31/2014'
group by OrderDate 


select distinct HireDate from HumanResources.Employee


select  AVG(distinct(ListPrice)) from Production.Product


select CONCAT('The ', name ,' is only! ', ListPrice) from Production.Product
where ListPrice  between 100 and 120
order by ListPrice






select rowguid ,Name, SalesPersonID, Demographics  into store_Archive
from Sales.Store 

select * from store_Archive

select rowguid ,Name, SalesPersonID, Demographics  into store_Archive2
from Sales.Store 
where 1=2 

select format(getdate(),'dd.mm.yyyy')
union all
select format(getdate(),'dd-mmm-yy')
union all
select format(getdate(),'dd/mmm/yy')
