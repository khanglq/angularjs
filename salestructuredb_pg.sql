
CREATE TABLE "Fact_Transaction" (
  "PK_ID" bigint PRIMARY KEY,
  "FK_Contract_ID" bigint NOT NULL,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Sale_ID" bigint NOT NULL,
  "FK_Cust_ID" bigint NOT NULL,
  "Product_Type" varchar(50),
  "Product_Sub_Type" varchar(50),
  "Transaction_Type" varchar(50),
  "Deal_Date" date,
  "Value_Date" date,
  "Expire_Date" date,
  "Maturity_Date" date,
  "Payment_Date" varchar(25),
  "Amount" bigint,
  "Quantity" int,
  "Indiv_Org_Flag" bigint NOT NULL,
  "Day_Count_Convention" varchar(500),
  "Contract_ID_Ref" bigint
);

CREATE TABLE "Dim_Cust_ID" (
  "PK_ID" bigint PRIMARY KEY,
  "Cust_No" varchar(100) NOT NULL,
  "System_Code" varchar(100) NOT NULL
);

CREATE TABLE "Dim_Contract_ID" (
  "PK_ID" bigint PRIMARY KEY,
  "Contract_No" varchar(100) NOT NULL,
  "System_Code" varchar(100) NOT NULL
);

CREATE TABLE "Dim_Branch" (
  "PK_ID" bigint PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Department" (
  "PK_ID" bigint PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Sale_Channel" (
  "PK_ID" bigint PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000) NOT NULL,
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Employee" (
  "PK_ID" bigint PRIMARY KEY,
  "Name" bigint NOT NULL,
  "Address" varchar(400) NOT NULL,
  "Phone_No" varchar(50) NOT NULL,
  "Probation_Date" date NOT NULL,
  "Sign_Contract_Date" date,
  "Exit_Date" date,
  "FK_Branch_ID" bigint,
  "FK_Department_ID" bigint,
  "Created_Date" date,
  "Updated_Date" date,
  "Created_By" varchar(25),
  "Updated_By" varchar(25)
);

CREATE TABLE "Dim_Employee_Leave" (
  "PK_ID" bigint PRIMARY KEY,
  "FK_Employee_ID" bigint NOT NULL,
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
  "PK_ID" bigint PRIMARY KEY,
  "Name" varchar(200) NOT NULL,
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Product_Code" (
  "PK_ID" bigint PRIMARY KEY,
  "FK_Product_Cat" bigint NOT NULL,
  "Product_Code" varchar(60) UNIQUE NOT NULL,
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Day_Convention" (
  "PK_ID" bigint PRIMARY KEY,
  "Product_Code" varchar(60) UNIQUE NOT NULL,
  "Code" varchar(60),
  "Desc" varchar(4000),
  "Start_Date" date,
  "End_Date" date
);

CREATE TABLE "Dim_Sale_Person" (
  "PK_ID" bigint PRIMARY KEY,
  "Sale_ID" varchar(60) NOT NULL,
  "FK_Employee_ID" bigint NOT NULL,
  "System_Code" varchar(25)
);

CREATE TABLE "Dim_Sale_Person_Customer" (
  "PK_ID" bigint PRIMARY KEY,
  "FK_Sale_ID" bigint NOT NULL,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Cust_ID" bigint NOT NULL,
  "Start_Date" date,
  "End_Date" date,
  "Created_Date" date,
  "Updated_Date" date,
  "Created_By" varchar(25),
  "Updated_By" varchar(25)
);

CREATE TABLE "Fact_Product_Revenue" (
  "PK_ID" bigint PRIMARY KEY,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Sale_ID" bigint NOT NULL,
  "FK_Contract_ID" bigint NOT NULL,
  "Process_Date" date,
  "Amount" bigint,
  "Month" int,
  "Quarter" int,
  "Year" int
);

CREATE TABLE "Provision_Product_Revenue_NET" (
  "PK_ID" bigint PRIMARY KEY,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Sale_ID" bigint NOT NULL,
  "Process_Date" date,
  "Amount" bigint,
  "Total_Balance" bigint,
  "Target_Current_Period" bigint,
  "Target_Prev_Period" bigint,
  "Amount_Prev_Period" bigint,
  "Accumulative_Target_Achieved_Pct" bigint,
  "Month" int,
  "Quarter" int,
  "Year" int
);

CREATE TABLE "Fact_KPI_Product_Result" (
  "PK_ID" bigint PRIMARY KEY,
  "Session_ID" bigint,
  "Product_Code" varchar(60) NOT NULL,
  "FK_Sale_ID" bigint NOT NULL,
  "Process_Date" date,
  "Amount" bigint,
  "Total_Balance" bigint,
  "Target_Current_Period" bigint,
  "Target_Prev_Period" bigint,
  "Amount_Prev_Period" bigint,
  "Accumulative_Target_Achieved_Pct" bigint,
  "Month" int,
  "Quarter" int,
  "Year" int,
  "KPI_PCT" bigint,
  "KPI_Result" varchar(30),
  "No_Of_Run" int
);

CREATE TABLE "Fact_KPI_Reconcile_Result" (
  "PK_ID" bigint PRIMARY KEY,
  "Session_ID" bigint,
  "FK_Sale_ID" bigint NOT NULL,
  "Process_Date" date,
  "Amount" bigint,
  "Total_Balance" bigint,
  "Target_Current_Period" bigint,
  "Target_Prev_Period" bigint,
  "Amount_Prev_Period" bigint,
  "Accumulative_Target_Achieved_Pct" bigint,
  "Month" int,
  "Quarter" int,
  "Year" int,
  "KPI_PCT" bigint,
  "KPI_Result" varchar(30),
  "No_Of_Run" int,
  "Note" varchar(4000),
  "Attachment" varchar(300)
);

CREATE TABLE "Fact_KPI_Result" (
  "PK_ID" bigint PRIMARY KEY,
  "Session_ID" bigint,
  "FK_Sale_ID" bigint NOT NULL,
  "Process_Date" date,
  "Amount" bigint,
  "Total_Balance" bigint,
  "Target_Current_Period" bigint,
  "Target_Prev_Period" bigint,
  "Amount_Prev_Period" bigint,
  "Accumulative_Target_Achieved_Pct" bigint,
  "Month" int,
  "Quarter" int,
  "Year" int,
  "KPI_PCT" bigint,
  "KPI_Result" varchar(30),
  "No_Of_Run" int,
  "Note" varchar(4000),
  "Attachment" varchar(300)
);

ALTER TABLE "Fact_Transaction" ADD FOREIGN KEY ("FK_Cust_ID") REFERENCES "Dim_Cust_ID" ("PK_ID");

ALTER TABLE "Dim_Product_Code" ADD FOREIGN KEY ("FK_Product_Cat") REFERENCES "Dim_Product_Category" ("PK_ID");

ALTER TABLE "Dim_Day_Convention" ADD FOREIGN KEY ("Product_Code") REFERENCES "Dim_Product_Code" ("Product_Code");

ALTER TABLE "Fact_Transaction" ADD FOREIGN KEY ("Product_Code") REFERENCES "Dim_Product_Code" ("Product_Code");

ALTER TABLE "Dim_Sale_Person_Customer" ADD FOREIGN KEY ("FK_Sale_ID") REFERENCES "Dim_Sale_Person" ("PK_ID");

ALTER TABLE "Dim_Sale_Person_Customer" ADD FOREIGN KEY ("Product_Code") REFERENCES "Dim_Product_Code" ("Product_Code");

ALTER TABLE "Fact_Product_Revenue" ADD FOREIGN KEY ("FK_Contract_ID") REFERENCES "Dim_Contract_ID" ("PK_ID");

ALTER TABLE "Fact_Product_Revenue" ADD FOREIGN KEY ("Product_Code") REFERENCES "Dim_Product_Code" ("Product_Code");

ALTER TABLE "Fact_Product_Revenue" ADD FOREIGN KEY ("FK_Sale_ID") REFERENCES "Dim_Sale_Person" ("PK_ID");

ALTER TABLE "Fact_Transaction" ADD FOREIGN KEY ("FK_Contract_ID") REFERENCES "Dim_Contract_ID" ("PK_ID");

ALTER TABLE "Provision_Product_Revenue_NET" ADD FOREIGN KEY ("FK_Sale_ID") REFERENCES "Dim_Sale_Person" ("PK_ID");

ALTER TABLE "Provision_Product_Revenue_NET" ADD FOREIGN KEY ("Product_Code") REFERENCES "Dim_Product_Code" ("Product_Code");

ALTER TABLE "Fact_KPI_Reconcile_Result" ADD FOREIGN KEY ("PK_ID") REFERENCES "Fact_KPI_Product_Result" ("PK_ID");

--ALTER TABLE "Fact_KPI_Product_Result" ADD FOREIGN KEY ("FK_Sale_ID") REFERENCES "Fact_KPI_Result" ("FK_Sale_ID");

ALTER TABLE "Dim_Sale_Person" ADD FOREIGN KEY ("FK_Employee_ID") REFERENCES "Dim_Employee" ("PK_ID");

ALTER TABLE "Dim_Employee_Leave" ADD FOREIGN KEY ("FK_Employee_ID") REFERENCES "Dim_Employee" ("PK_ID");

ALTER TABLE "Dim_Employee" ADD FOREIGN KEY ("FK_Branch_ID") REFERENCES "Dim_Branch" ("PK_ID");

ALTER TABLE "Dim_Employee" ADD FOREIGN KEY ("FK_Department_ID") REFERENCES "Dim_Department" ("PK_ID");
