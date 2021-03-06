-- SaleStructure DB script

Table Fact_Transaction {
  PK_ID bigint [pk]
  FK_Contract_ID bigint [not null]
  Product_Code varchar(60) [not null]
  FK_Sale_ID bigint [not null]
  FK_Cust_ID bigint [not null]
  Product_Type varchar(50) 
  Product_Sub_Type varchar(50) 
  Transaction_Type varchar(50) 
  Deal_Date date
  Value_Date date
  Expire_Date date
  Maturity_Date date
  Payment_Date varchar(25) 
  Amount bigint(20,4)
  Quantity int 
  Indiv_Org_Flag bigint [not null]
  Day_Count_Convention varchar(500) 
  Contract_ID_Ref bigint
}

Table Dim_Cust_ID {
  PK_ID bigint [pk]
  Cust_No varchar(100) [not null]
  System_Code varchar(100) [not null]
}

Table Dim_Contract_ID {
  PK_ID bigint [pk]
  Contract_No varchar(100) [not null]
  System_Code varchar(100) [not null]
}

Table Dim_Branch {
  PK_ID bigint [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date
}

Table Dim_Department {
  PK_ID bigint [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date  
}

Table Dim_Sale_Channel {
  PK_ID bigint [pk]
  Name varchar(200) [not null]
  Desc varchar(4000) [not null]
  Start_Date date
  End_Date date  
}

Table Dim_Employee {
  PK_ID bigint [pk]
  Name bigint [not null]
  Address varchar(400) [not null]
  Phone_No varchar(50) [not null]
  Probation_Date date [not null]
  Sign_Contract_Date date  
  Exit_Date date  
  FK_Branch_ID bigint 
  FK_Department_ID bigint 
  Created_Date date  
  Updated_Date date  
  Created_By varchar(25) 
  Updated_By varchar(25) 
}

Table Dim_Employee_Leave {
  PK_ID bigint [pk]
  FK_Employee_ID bigint [not null]
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
  PK_ID bigint [pk]
  Name varchar(200) [not null]
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}

Table Dim_Product_Code {
  PK_ID bigint [pk]
  FK_Product_Cat bigint [not null]
  Product_Code varchar(60) [unique, not null]
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}

Table Dim_Day_Convention {
  PK_ID bigint [pk]
  Product_Code varchar(60) [unique, not null]
  Code varchar(60) 
  Desc varchar(4000)  
  Start_Date date  
  End_Date date  
}

Table Dim_Sale_Person {
  PK_ID bigint [pk]
  Sale_ID varchar(60) [not null]
  FK_Employee_ID bigint [not null]
  System_Code varchar(25)  
}

Table Dim_Sale_Person_Customer {
  PK_ID bigint [pk]
  FK_Sale_ID bigint [not null]
  Product_Code varchar(60) [not null]
  FK_Cust_ID bigint [not null]
  Start_Date date  
  End_Date date  
  Created_Date date  
  Updated_Date date  
  Created_By varchar(25) 
  Updated_By varchar(25) 
}

Table Fact_Product_Revenue {
  PK_ID bigint [pk]
  Product_Code varchar(60) [not null]
  FK_Sale_ID bigint [not null]
  FK_Contract_ID bigint [not null]
  Process_Date date  
  Amount bigint(20,4)   
  Month int  
  Quarter int  
  Year int  
}

Table Provision_Product_Revenue_NET {
  PK_ID bigint [pk]
  Product_Code varchar(60) [not null]
  FK_Sale_ID bigint [not null]
  Process_Date date  
  Amount bigint(20,4)   
  Total_Balance bigint(20,4)   
  Target_Current_Period bigint(20,4)   
  Target_Prev_Period bigint(20,4)   
  Amount_Prev_Period bigint(20,4)   
  Accumulative_Target_Achieved_Pct bigint(20,4)   
  Month int  
  Quarter int  
  Year int  
}

Table Fact_KPI_Product_Result {
  PK_ID bigint [pk]
  Session_ID bigint
  Product_Code varchar(60) [not null]
  FK_Sale_ID bigint [not null]
  Process_Date date  
  Amount bigint(20,4)   
  Total_Balance bigint(20,4)   
  Target_Current_Period bigint(20,4)   
  Target_Prev_Period bigint(20,4)   
  Amount_Prev_Period bigint(20,4)   
  Accumulative_Target_Achieved_Pct bigint(20,4)   
  Month int  
  Quarter int  
  Year int  
  KPI_PCT bigint
  KPI_Result varchar(30) 
  No_Of_Run int  
}

Table Fact_KPI_Reconcile_Result {
  PK_ID bigint [pk]
  Session_ID bigint
  FK_Sale_ID bigint [not null]
  Process_Date date  
  Amount bigint(20,4)   
  Total_Balance bigint(20,4)   
  Target_Current_Period bigint(20,4)   
  Target_Prev_Period bigint(20,4)   
  Amount_Prev_Period bigint(20,4)   
  Accumulative_Target_Achieved_Pct bigint(20,4)   
  Month int  
  Quarter int  
  Year int  
  KPI_PCT bigint
  KPI_Result varchar(30) 
  No_Of_Run int  
  Note varchar(4000)  
  Attachment varchar(300)  
}

Table Fact_KPI_Result {
  PK_ID bigint [pk]
  Session_ID bigint
  FK_Sale_ID bigint [not null]
  Process_Date date  
  Amount bigint(20,4)   
  Total_Balance bigint(20,4)   
  Target_Current_Period bigint(20,4)   
  Target_Prev_Period bigint(20,4)   
  Amount_Prev_Period bigint(20,4)   
  Accumulative_Target_Achieved_Pct bigint(20,4)   
  Month int  
  Quarter int  
  Year int  
  KPI_PCT bigint
  KPI_Result varchar(30) 
  No_Of_Run int  
  Note varchar(4000)  
  Attachment varchar(300)  
}

--Relation script

Ref: "Dim_Cust_ID"."PK_ID" < "Fact_Transaction"."FK_Cust_ID"
Ref: "Dim_Product_Category"."PK_ID" < "Dim_Product_Code"."FK_Product_Cat"
Ref: "Dim_Product_Code"."Product_Code" - "Dim_Day_Convention"."Product_Code"
Ref: "Dim_Product_Code"."Product_Code" < "Fact_Transaction"."Product_Code"
Ref: "Dim_Sale_Person"."PK_ID" < "Dim_Sale_Person_Customer"."FK_Sale_ID"
Ref: "Dim_Product_Code"."Product_Code" < "Dim_Sale_Person_Customer"."Product_Code"
Ref: "Dim_Contract_ID"."PK_ID" < "Fact_Product_Revenue"."FK_Contract_ID"
Ref: "Dim_Product_Code"."Product_Code" < "Fact_Product_Revenue"."Product_Code"
Ref: "Dim_Sale_Person"."PK_ID" < "Fact_Product_Revenue"."FK_Sale_ID"
Ref: "Dim_Contract_ID"."PK_ID" < "Fact_Transaction"."FK_Contract_ID"
Ref: "Dim_Sale_Person"."PK_ID" < "Provision_Product_Revenue_NET"."FK_Sale_ID"
Ref: "Dim_Product_Code"."Product_Code" < "Provision_Product_Revenue_NET"."Product_Code"
Ref: "Fact_KPI_Product_Result"."PK_ID" - "Fact_KPI_Reconcile_Result"."PK_ID"
Ref: "Fact_KPI_Result"."FK_Sale_ID" < "Fact_KPI_Product_Result"."FK_Sale_ID"
Ref: "Dim_Employee"."PK_ID" < "Dim_Sale_Person"."FK_Employee_ID"
Ref: "Dim_Employee"."PK_ID" < "Dim_Employee_Leave"."FK_Employee_ID"
Ref: "Dim_Branch"."PK_ID" < "Dim_Employee"."FK_Branch_ID"
Ref: "Dim_Department"."PK_ID" < "Dim_Employee"."FK_Department_ID"
