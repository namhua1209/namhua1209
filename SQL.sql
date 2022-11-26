---- CREATE AND USE DATABASE ----
create database HuaDaiNam_Portfolio
use HuaDaiNam_Portfolio


---- CREATE TABLES & SET PRIMARY KEYS ----
-- CUSTOMER
create table CUSTOMER (  Customer_ID	      char(4)         not null
                       , Full_name	        varchar(40)
                       , Address	          varchar(50)
                       , Phone_number	      varchar(20)
                       , Date_of_birth	    smalldatetime
                       , Registered_date	  smalldatetime
                       , Revenue	          money
                       , constraint C primary key(Customer_ID)
                      )
-- STAFF
create table STAFF (   Staff_ID	    char(4)         not null
                    , Full_name	    varchar(40)
                    , Phone_number	varchar(20)
                    , Onboard_date	smalldatetime	
                    , constraint S primary key(Staff_ID)
                   )
-- PRODUCT
create table PRODUCT (  Product_ID	      char(4)     not null
                      , Product_name	    varchar(40)
                      , Unit	            varchar(20)
                      , Producing_country	varchar(40)
                      , Price	            money
                        constraint P primary key(Product_ID)	
                     )
-- INVOICE
create table INVOICE (   Invoice_number	int         not null
                      , Invoice_date 	  smalldatetime
                      , Customer_ID 	  char(4)
                      , Staff_ID 	      char(4)
                      , Amount	        money
                        constraint I primary key(Invoice_number)
                     )
-- INVOICE_DETAILS
create table INVOICE_DETAILS (  Invoice_number	int
                              , Product_ID	    char(4)
                              , Quantity	      int
                                constraint I_D primary key(Invoice_number, Product_ID)
                             )


---- CREATE FOREIGN KEYS FOR TABLES ----
-- INVOICE
alter table INVOICE 
  add constraint fk01_I foreign key (Customer_ID) 
    references CUSTOMER (Customer_ID)
alter table INVOICE 
  add constraint fk02_I foreign key (Staff_ID) 
    references STAFF (Staff_ID)
-- INVOICE_DETAILS
alter table INVOICE_DETAILS
  add constraint fk01_I_D foreign key (Invoice_number) 
    references INVOICE (Invoice_number)
alter table INVOICE_DETAILS 
  add constraint fk02_I_D foreign key (Product_ID) 
    references PRODUCT (Product_ID)


---- SET FORMAT FOR DATE ----
set dateformat dmy


---- INSERT DATA TO EACH TABLE ----
-- CUSTOMER
insert into CUSTOMER 
    values  ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
          , ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
          , ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
          , ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
          , ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
          , ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
          , ('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
          , ('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
          , ('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
          , ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)
-- STAFF
insert into STAFF 
    values  ('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
          , ('NV02','Le Thi Phi Yen','987567390','21/04/2006')
          , ('NV03','Nguyen Van B','997047382','27/04/2006')
          , ('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
          , ('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')
-- PRODUCT
insert into PRODUCT 
    values    ('BC01','But chi','cay','Singapore',3000)
            , ('BC02','But chi','cay','Singapore',5000)
            , ('BC03','But chi','cay','Viet Nam',3500)
            , ('BC04','But chi','hop','Viet Nam',30000)
            , ('BB01','But bi','cay','Viet Nam',5000)
            , ('BB02','But bi','cay','Trung Quoc',7000)
            , ('BB03','But bi','hop','Thai Lan',100000)
            , ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
            , ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
            , ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
            , ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
            , ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
            , ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
            , ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
            , ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
            , ('ST02','So tay loai 1','quyen','Viet Nam',55000)
            , ('ST03','So tay loai 2','quyen','Viet Nam',51000)
            , ('ST04','So tay','quyen','Thai Lan',55000)
            , ('ST05','So tay mong','quyen','Thai Lan',20000)
            , ('ST06','Phan viet bang','hop','Viet Nam',5000)
            , ('ST07','Phan khong bui','hop','Viet Nam',7000)
            , ('ST08','Bong bang','cai','Viet Nam',1000)
            , ('ST09','But long','cay','Viet Nam',5000)
            , ('ST10','But long','cay','Trung Quoc',7000)
---- INVOICE ----
insert into INVOICE 
    values    (1001,'23/07/2006','KH01','NV01',320000)
            , (1002,'12/08/2006','KH01','NV02',840000)
            , (1003,'23/08/2006','KH02','NV01',100000)
            , (1004,'01/09/2006','KH02','NV01',180000)
            , (1005,'20/10/2006','KH01','NV02',3800000)
            , (1006,'16/10/2006','KH01','NV03',2430000)
            , (1007,'28/10/2006','KH03','NV03',510000)
            , (1008,'28/10/2006','KH01','NV03',440000)
            , (1009,'28/10/2006','KH03','NV04',200000)
            , (1010,'01/11/2006','KH01','NV01',5200000)
            , (1011,'04/11/2006','KH04','NV03',250000)
            , (1012,'30/11/2006','KH05','NV03',21000)
            , (1013,'12/12/2006','KH06','NV01',5000)
            , (1014,'31/12/2006','KH03','NV02',3150000)
            , (1015,'01/01/2007','KH06','NV01',910000)
            , (1016,'01/01/2007','KH07','NV02',12500)
            , (1017,'02/01/2007','KH08','NV03',35000)
            , (1018,'13/01/2007','KH08','NV03',330000)
            , (1019,'13/01/2007','KH01','NV03',30000)
            , (1020,'14/01/2007','KH09','NV04',70000)
            , (1021,'16/01/2007','KH10','NV03',67500)
            , (1022,'16/01/2007',Null,'NV03',7000)
            , (1023,'17/01/2007',Null,'NV01',330000)
-- INVOICE_DETAILS
insert into INVOICE_DETAILS 
    values    (1001,'TV02',10)
            , (1001,'ST01',5)
            , (1001,'BC01',5)
            , (1001,'BC02',10)
            , (1001,'ST08',10)
            , (1002,'BC04',20)
            , (1002,'BB01',20)
            , (1002,'BB02',20)
            , (1003,'BB03',10)
            , (1004,'TV01',20)
            , (1004,'TV02',10)
            , (1004,'TV03',10)
            , (1004,'TV04',10)
            , (1005,'TV05',50)
            , (1005,'TV06',50)
            , (1006,'TV07',20)
            , (1006,'ST01',30)
            , (1006,'ST02',10)
            , (1007,'ST03',10)
            , (1008,'ST04',8)
            , (1009,'ST05',10)
            , (1010,'TV07',50)
            , (1010,'ST07',50)
            , (1010,'ST08',100)
            , (1010,'ST04',50)
            , (1010,'TV03',100)
            , (1011,'ST06',50)
            , (1012,'ST07',3)
            , (1013,'ST08',5)
            , (1014,'BC02',80)
            , (1014,'BB02',100)
            , (1014,'BC04',60)
            , (1014,'BB01',50)
            , (1015,'BB02',30)
            , (1015,'BB03',7)
            , (1016,'TV01',5)
            , (1017,'TV02',1)
            , (1017,'TV03',1)
            , (1017,'TV04',5)
            , (1018,'ST04',6)
            , (1019,'ST05',1)
            , (1019,'ST06',2)
            , (1020,'ST07',10)
            , (1021,'ST08',5)
            , (1021,'TV01',7)
            , (1021,'TV02',10)
            , (1022,'ST07',1)
            , (1023,'ST04',6)


---- TESTING TABLES ----
select * from CUSTOMER
select * from STAFF
select * from PRODUCT
select * from INVOICE 
select * from INVOICE_DETAILS 


---- ALTER TABLES PROBLEMS ----
-- Add Note column with data type varchar(20) for PRODUCT table
alter table PRODUCT 
  add Note varchar(20)

-- Add Customer_type column with data type tinyint for CUSTOMER table
alter table CUSTOMER 
  add Customer_type tinyint

-- Change the data type of the Note column in the PRODUCT table to varchar(100)
alter table PRODUCT 
  alter column Note varchar(100)

-- Delete Note column in PRODUCT table
alter table PRODUCT 
  drop column Note

-- For customers who purchase 3 or more times, Customer_type is classified as VIP, 
-- 2 times to less than 3 times is Frequently, and 1 time is Currently
select    C.Customer_ID
        , C.Address
        , C.Date_of_birth
        , C.Full_name
        , C.Phone_number
        , C.Registered_date
        , C.Revenue
        , case 
            when count (distinct I.Invoice_number) >= 3
              then 'VIP'
            when count (distinct I.Invoice_number) >= 2
              then 'Frequentlt'
            else 'Currently'
          end Customer_type
from CUSTOMER C 
  left join INVOICE I 
    on C.Customer_ID = I.Customer_ID
group by  C.Customer_ID
        , C.Address
        , C.Date_of_birth
        , C.Full_name
        , C.Phone_number
        , C.Registered_date
        , C.Revenue


---- QUERY PROBLEMS ----
-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất
select  Product_ID
      , Product_name
from PRODUCT
where Producing_country = 'Trung Quoc'

-- In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”
select  Product_ID
      , Product_name
from PRODUCT
where Unit in ('cay', 'quyen')

-- In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”
select  Product_ID
      , Product_name
from PRODUCT
where Product_ID like ('B%01')

-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000
select  Product_ID
      , Product_name
from PRODUCT
where (Producing_country = 'Trung Quoc')
  and (Price between 30000 and 40000)

-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000
select  Product_ID
      , Product_name
from PRODUCT
where (Producing_country = 'Trung Quoc' 
    or Producing_country = 'Thai Lan')
  and Price between 30000 and 40000

-- In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007
select  Invoice_number
      , Amount 
from INVOICE 
where Invoice_date between '1/1/2007' and '2/1/2007'

-- In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần)
select  Invoice_number
      , Amount 
from INVOICE 
where month(Invoice_date) = 1
  and year(Invoice_date) = 2007
order by Amount desc

-- In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007
select  C.Customer_ID
      , C.Full_name 
from CUSTOMER C
left join INVOICE I 
  on C.Customer_ID = I.Customer_ID
where I.Invoice_date = '1/1/2007'

-- In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006
select  I.Invoice_number
      , I.Amount 
from INVOICE I 
left join STAFF S 
  on I.Staff_ID = S.Staff_ID
where S.Full_name = 'Nguyen Van B' 
  and I.Invoice_date = '28/10/2006'

-- In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006
select  P.Product_ID
      , P.Product_name
from PRODUCT P 
left join INVOICE_DETAILS I_D  
  on P.Product_ID = I_D.Product_ID
left join INVOICE         I    
  on I_D.Invoice_number = I.Invoice_number
left join CUSTOMER        C    
  on I.Customer_ID = C.Customer_ID
where C.Full_name = 'Nguyen Van A'
  and month(I.Invoice_date) = 10
  and year (I.Invoice_date) = 2006

-- Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”
select Invoice_number
from INVOICE_DETAILS 
where Product_ID in ('BB01', 'BB02')

-- Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20
select Invoice_number
from INVOICE_DETAILS 
where Product_ID in ('BB01', 'BB02')
  and Quantity between 10 and 20

-- Tìm các số hóa đơn mua CÙNG LÚC 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20
select Invoice_number
from INVOICE_DETAILS 
where Product_ID = 'BB01' 
  and Quantity between 10 and 20
  and Invoice_number in (select Invoice_number 
                         from INVOICE_DETAILS 
                         where Product_ID = 'BB02' 
                           and Quantity between 10 and 20)

-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007
select  P.Product_ID
      , P.Product_name 
from PRODUCT P 
inner join INVOICE_DETAILS I_D 
  on P.Product_ID = I_D.Product_ID
inner join INVOICE I   
  on I_D.Invoice_number = I.Invoice_number
where P.Producing_country = 'Trung Quoc'
  and I.Invoice_date = '1/1/2007'

-- In ra danh sách các sản phẩm (MASP,TENSP) không bán được
select  Product_ID
      , Product_name 
from PRODUCT
where Product_ID not in (select Product_ID 
                         from INVOICE_DETAILS)

-- In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006
select  Product_ID
      , Product_name 
from PRODUCT
where Product_ID not in (select I_D.Product_ID 
                         from INVOICE_DETAILS I_D
                         inner join INVOICE I 
                           on I_D.Invoice_number = I.Invoice_number
                         where year(Invoice_date) = 2006)

-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006
select  Product_ID
      , Product_name 
from PRODUCT
where Producing_country = 'Trung Quoc'
  and Product_ID not in (select I_D.Product_ID 
                         from INVOICE_DETAILS I_D
                         inner join INVOICE I 
                           on I_D.Invoice_number = I.Invoice_number
                         where year(Invoice_date) = 2006)

-- Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất
select I_D.Invoice_number 
from INVOICE_DETAILS I_D 
inner join PRODUCT P 
  on I_D.Product_ID = P.Product_ID 
where Producing_country = 'Singapore'

-- Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(Invoice_number) 'Total walk-in guest'
from INVOICE 
where Customer_ID is null

-- Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006
select count(distinct Product_ID) 'Total different products selling on 2006'
from INVOICE_DETAILS I_D 
inner join INVOICE I 
  on I_D.Invoice_number = I.Invoice_number
where year(Invoice_date) = 2006

-- Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select  max(Amount) 'Max invoice'
      , min(Amount) 'Min invoice'
from INVOICE

-- Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(Amount) 'Average amount of all invoices selling in 2006'
from INVOICE 
where year(Invoice_date) = 2006

-- Tính doanh thu bán hàng trong năm 2006
select sum(Amount) 'Revenue in 2006'
from INVOICE 
where year(Invoice_date) = 2006

-- Tìm số hóa đơn có trị giá cao nhất trong năm 2006
select max(Amount) 'Max invoice'
from INVOICE
where year(Invoice_date) = 2006

-- Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006
select C.Full_name
from (select  *
            , dense_rank() over(order by Amount desc) Rank_of_amount
      from INVOICE 
      where year(Invoice_date) = 2006
     ) A
inner join CUSTOMER C 
  on A.Customer_ID = C.Customer_ID
where A.Rank_of_amount = 1

-- In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất
-- CÁCH 1:
select  Customer_ID
      , Full_name
from (select  *
            , rank() over(order by Revenue desc) Rank_of_revenue
      from CUSTOMER
     ) A
where A.Rank_of_revenue in (1,2,3)
--CÁCH 2:
select  top 3 Customer_ID
      , Full_name
from CUSTOMER 
order by Revenue desc

-- In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất
select  Product_ID
      , Product_name
      , Price
      , Rank_of_price
from (select  *
            , dense_rank() over(order by Price desc) Rank_of_price
      from PRODUCT
     ) A
where A.Rank_of_price in (1,2,3)

-- In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm)
select  Product_ID
      , Product_name 
from (select  *
            , dense_rank() over(order by Price desc) Rank_of_price
      from PRODUCT
     ) A
where Producing_country = 'Thai Lan' 
  and A.Rank_of_price in (1,2,3)

-- In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất)
select  Product_ID
      , Product_name 
from (select  *
            , dense_rank() over(order by Price desc) Rank_of_price
      from PRODUCT
      where Producing_country = 'Trung Quoc'
     ) A
where A.Rank_of_price in (1,2,3) 

-- In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng)
select *
from (select  *
            , dense_rank() over(order by Revenue desc) Rank_of_revenue
      from CUSTOMER
     ) A
where A.Rank_of_revenue in (1,2,3)

-- Tính tổng số sản phẩm do “Trung Quoc” sản xuất
select count(distinct Product_ID) 'Total number of products made in China'
from PRODUCT 
where Producing_country = 'Trung Quoc'

-- Tính tổng số sản phẩm của từng nước sản xuất
select  Producing_country
      , count(distinct Product_ID) 'Total number of products'
from PRODUCT 
group by Producing_country

-- Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm
select  Producing_country
      , max(Price) 'Max price' 
      , min(Price) 'Min price'
      , avg(Price) 'Average price'
from PRODUCT 
group by Producing_country

-- Tính doanh thu bán hàng mỗi ngày
select  Invoice_date
      , sum(Amount) 'Total revenue'
from INVOICE
group by Invoice_date

-- Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006
-- CÁCH 1:
select  P.Product_ID
      , sum(I_D.Quantity) 'Total quantity'
from PRODUCT P 
inner join INVOICE_DETAILS I_D 
  on P.Product_ID = I_D.Product_ID
inner join INVOICE I 
  on I_D.Invoice_number = I.Invoice_number
group by P.Product_ID, I.Invoice_date
having month(Invoice_date) = 10
  and year(Invoice_date) = 2006
order by sum(I_D.Quantity) desc
-- CÁCH 2:
select  Product_ID
      , sum(Quantity) 'Total quantity'
from INVOICE_DETAILS 
group by  Product_ID
        , Invoice_number 
having Invoice_number in (select Invoice_number 
                          from INVOICE 
                          where month(Invoice_date) = 10 
                            and year(Invoice_date) = 2006)
order by sum(Quantity) desc

-- Tính doanh thu bán hàng của từng tháng trong năm 2006
select  month(Invoice_date) 'Month'
      , sum(Amount) 'Total revenue'
from INVOICE 
group by  month(Invoice_date)
        , year(Invoice_date)
having year(Invoice_date) = 2006

-- Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau
select Invoice_number 
from INVOICE_DETAILS 
group by Invoice_number 
having count(distinct Product_ID) >= 4

-- Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau)
select I_D.Invoice_number 
from INVOICE_DETAILS I_D 
inner join PRODUCT P on I_D.Product_ID = P.Product_ID
group by  I_D.Invoice_number
        , P.Producing_country 
having count(distinct I_D.Product_ID) >= 3
  and P.Producing_country = 'Viet Nam'

-- Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất
select  Customer_ID
      , Full_name 
from CUSTOMER 
where Customer_ID in (select top 1 Customer_ID
                      from INVOICE
                      group by Customer_ID
                      order by count(distinct Invoice_number) desc)

-- Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
-- CÁCH 1:
select  top 1 month(Invoice_date) 'Month in 2006'
      , sum(Amount) Total_revenue 
from INVOICE 
group by month(Invoice_date), year(Invoice_date) 
having year(Invoice_date) = '2006'
order by sum(Amount) desc
-- CÁCH 2:
select  Month_in_2006
      , Total_revenue 
from (select  month(Invoice_date) Month_in_2006
            , sum(Amount) Total_revenue
            , dense_rank() over(order by sum(Amount) desc) Rank_of_revenue_in_2006
      from INVOICE
      group by  month(Invoice_date)
              , year(Invoice_date) 
      having year(Invoice_date) = '2006'
     ) A 
where A.Rank_of_revenue_in_2006 = 1

-- Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006
ERROR ... 
-- CÁCH 1:
select  top 1 P.Product_ID
      , P.Product_name
      , I_D.Quantity  
from INVOICE_DETAILS I_D 
inner join INVOICE I 
  on I_D.Invoice_number = I.Invoice_number
inner join PRODUCT P 
  on I_D.Product_ID     = P.Product_ID 
group by  P.Product_ID
        , P.Product_name
        , I_D.Quantity
        , year(I.Invoice_date) 
having year(I.Invoice_date) = '2006'
order by sum(I_D.Quantity) asc
-- CÁCH 2:
select  Product_ID
      , Product_name
      , Total_quantity 
from (select  P.Product_ID
            , P.Product_name
            , sum(I_D.Quantity) Total_quantity
            , dense_rank() over(order by sum(I_D.Quantity) asc) Rank_of_total_quantity
      from INVOICE_DETAILS I_D 
      inner join INVOICE I 
        on I_D.Invoice_number = I.Invoice_number
      inner join PRODUCT P 
        on I_D.Product_ID = P.Product_ID
      group by  P.Product_ID
              , P.Product_name
              , year(I.Invoice_date)
      having year(I.Invoice_date) = '2006'
     ) A 
where Rank_of_total_quantity = 1

-- Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất
-- CÁCH 1:
select  Producing_country
      , Product_ID
      , Product_name
from (select  Producing_country
            , Product_ID
            , Product_name 
            , dense_rank() over(partition by Producing_country order by Price desc) Rank_of_price 
      from PRODUCT
     ) A
where  Rank_of_price = 1
-- CÁCH 2
select  Producing_country
      , Product_ID
      , Product_name 
from PRODUCT P1
where Price >= all (select Price 
                     from PRODUCT P2 
                     where P1.Producing_country = P2.Producing_country)

-- Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
select  Producing_country 
      , count(distinct Product_ID) [Total product]
      , count(distinct Price) [Number of price]
from PRODUCT 
group by Producing_country
having count(distinct Product_ID) >= 3
    and count(distinct Price) >= 3

-- Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
--CÁCH 1:
select  C1.Customer_ID
      , C1.Full_name
      , C1.Revenue 
      , count(distinct I1.Invoice_number) Number_of_purchases 
from CUSTOMER C1 
inner join INVOICE I1 
  on C1.Customer_ID = I1.Customer_ID 
group by  C1.Customer_ID
        , C1.Full_name
        , C1.Revenue
having C1.Customer_ID in (select top 10 C2.Customer_ID 
                          from CUSTOMER C2
                          order by C2.Revenue desc) 
  and count(distinct I1.Invoice_number) >= all (select count(distinct I2.Invoice_number) Number_of_purchases 
                                                from INVOICE I2 
                                                group by I2.Customer_ID)
-- CÁCH 2:
select  Customer_ID
      , Full_name
      , Revenue
      , Number_of_purchases
from (select  C.Customer_ID
            , C.Full_name
            , C.Revenue
            , count(distinct I.Invoice_number) Number_of_purchases
            , dense_rank() over(order by count(distinct I.Invoice_number) desc) Rank_of_number_of_purchases
      from INVOICE I 
      inner join CUSTOMER C 
        on I.Customer_ID = C.Customer_ID
      group by  C.Customer_ID
              , C.Full_name
              , C.Revenue 
      having C.Customer_ID in (select top 10 Customer_ID 
                               from CUSTOMER 
                               order by Revenue desc)
     ) A 
where Rank_of_number_of_purchases = 1