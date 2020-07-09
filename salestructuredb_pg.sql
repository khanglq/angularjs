CREATE TABLE "Fact_Transaction" (
  "PK_ID" numeric PRIMARY KEY,
  "FK_Contract_ID" numeric NOT NULL,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Sale_ID" numeric NOT NULL,
  "FK_Cust_ID" numeric NOT NULL,
  "Product_Type" varchar(50),
  "Product_Sub_Type" varchar(50),
  "Transaction_Type" varchar(50),
  "Deal_Date" date,
  "Value_Date" date,
  "Expire_Date" date,
  "Maturity_Date" date,
  "Payment_Date" varchar2(25),
  "Amount" numeric(20,4),
  "Quantity" int,
  "Indiv_Org_Flag" number NOT NULL,
  "Day_Count_Convention" varchar2(500),
  "Contract_ID_Ref" number
);

CREATE TABLE "Dim_Cust_ID" (
  "PK_ID" numeric PRIMARY KEY,
  "Cust_No" varchar(100) NOT NULL,
  "System_Code" varchar(100) NOT NULL
);

CREATE TABLE "Dim_Contract_ID" (
  "PK_ID" numeric PRIMARY KEY,
  "Contract_No" varchar(100) NOT NULL,
  "System_Code" varchar(100) NOT NULL
);

CREATE TABLE "Dim_Branch" (
  "PK_ID" numeric PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Department" (
  "PK_ID" numeric PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Sale_Channel" (
  "PK_ID" numeric PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Employee" (
  "PK_ID" numeric PRIMARY KEY,
  "Name" numeric NOT NULL,
  "Address" varchar(400) NOT NULL,
  "Phone_No" varchar(50) NOT NULL,
  "Probation_Date" date NOT NULL,
  "Sign_Contract_Date" date,
  "Exit_Date" date,
  "FK_Branch_ID" numeric,
  "FK_Department_ID" numeric,
  "Created_Date" date,
  "Updated_Date" date,
  "Created_By" varchar(25),
  "Updated_By" varchar(25)
);

CREATE TABLE "Dim_Employee_Leave" (
  "PK_ID" numeric PRIMARY KEY,
  "FK_Employee_ID" numeric NOT NULL,
  "Leave_Type" varchar(50),
  "Note" varchar(4000),
  "From_Date" date,
  "To_Date" date,
  "Created_Date" date,
  "Updated_Date" date,
  "Created_By" varchar(25),
  "Updated_By" varchar(25)
);

CREATE TABLE "Dim_Product_Category" (
  "PK_ID" numeric PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Product_Code" (
  "PK_ID" numeric PRIMARY KEY,
  "FK_Product_Cat" numeric NOT NULL,
  "Product_Code" varchar(60) UNIQUE NOT NULL,
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Day_Convention" (
  "PK_ID" numeric PRIMARY KEY,
  "Product_Code" varchar(60) UNIQUE NOT NULL,
  "Code" varchar(60),
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

ALTER TABLE "Fact_Transaction" ADD FOREIGN KEY ("FK_Cust_ID") REFERENCES "Dim_Cust_ID" ("PK_ID");

ALTER TABLE "Fact_Transaction" ADD FOREIGN KEY ("FK_Contract_ID") REFERENCES "Dim_Contract_ID" ("PK_ID");
