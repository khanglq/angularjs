// SaleStructure DB script

Table Fact_Transaction {
  PK_ID numeric [pk]
  FK_Contract_ID numeric [not null]
  Product_Code varchar(60) [not null]
  FK_Sale_ID numeric [not null]
  FK_Cust_ID numeric [not null]
  Product_Type varchar(50) 
  Product_Sub_Type varchar(50) 
  Transaction_Type varchar(50) 
  Deal_Date date
  Value_Date date
  Expire_Date date
  Maturity_Date date
  Payment_Date varchar2(25) 
  Amount numeric(20,4)
  Quantity int 
  Indiv_Org_Flag number [not null]
  Day_Count_Convention varchar2(500) 
  Contract_ID_Ref number
}

Table Dim_Cust_ID {
  PK_ID numeric [pk]
  Cust_No varchar(100) [not null]
  System_Code varchar(100) [not null]
}

Ref: "Dim_Cust_ID"."PK_ID" < "Fact_Transaction"."FK_Cust_ID"

Table Dim_Contract_ID {
  PK_ID numeric [pk]
  Contract_No varchar(100) [not null]
  System_Code varchar(100) [not null]
}

Ref: "Dim_Contract_ID"."PK_ID" < "Fact_Transaction"."FK_Contract_ID"

Table Dim_Branch {
  PK_ID numeric [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date
}

Table Dim_Department {
  PK_ID numeric [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date  
}

Table Dim_Sale_Channel {
  PK_ID numeric [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date  
}

Table Dim_Employee {
  PK_ID numeric [pk]
  Name numeric [not null]
  Address varchar(400) [not null]
  Phone_No varchar(50) [not null]
  Probation_Date date [not null]
  Sign_Contract_Date date  
  Exit_Date date  
  FK_Branch_ID numeric 
  FK_Department_ID numeric 
  Created_Date date  
  Updated_Date date  
  Created_By varchar(25) 
  Updated_By varchar(25) 
}

Table Dim_Employee_Leave {
  PK_ID numeric [pk]
  FK_Employee_ID numeric [not null]
  Leave_Type varchar(50) 
  Note varchar(4000) 
  From_Date date  
  To_Date date  
  Created_Date date  
  Updated_Date date  
  Created_By varchar(25) 
  Updated_By varchar(25) 
}

Table Dim_Product_Category {
  PK_ID numeric [pk]
  Name varchar(200) [not null]
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}

Table Dim_Product_Code {
  PK_ID numeric [pk]
  FK_Product_Cat numeric [not null]
  Product_Code varchar(60) [unique, not null]
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}

Table Dim_Day_Convention {
  PK_ID numeric [pk]
  Product_Code varchar(60) [unique, not null]
  Code varchar(60) 
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}