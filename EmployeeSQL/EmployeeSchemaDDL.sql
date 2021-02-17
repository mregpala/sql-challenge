DROP TABLE IF EXISTS "Salary";

CREATE TABLE "Salary" (
    "EmployeeNo" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "EmployeeNo"
     )
);



DROP TABLE IF EXISTS "Employee" CASCADE;

CREATE TABLE "Employee" (
    "EmployeeNo" int   NOT NULL,
    "EmpTitleId" varchar(5)   NOT NULL,
    "BirthDate" date   NOT NULL,
    "FirstName" varchar(60)   NOT NULL,
    "LastName" varchar(60)   NOT NULL,
    "Sex" varchar(1)   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "EmployeeNo"
     )
);

DROP TABLE IF EXISTS "DeptManager";

CREATE TABLE "DeptManager" (
    "DeptId" varchar(6) NOT NULL,
    "EmployeeNo" int   NOT NULL,
    CONSTRAINT "pk_DeptManager" PRIMARY KEY (
        "DeptId","EmployeeNo"
     )
);

DROP TABLE  IF EXISTS "DeptEmp";

CREATE TABLE "DeptEmp" (
    "EmpNo" int   NOT NULL,
    "DeptId" varchar(6) NOT NULL,
    CONSTRAINT "pk_DeptEmp" PRIMARY KEY (
        "EmpNo","DeptId"
     )
);


DROP TABLE IF EXISTS "DeptManager";

CREATE TABLE "DeptManager" (
    "DeptId" varchar(6) NOT NULL,
    "EmployeeNo" int   NOT NULL,
    CONSTRAINT "pk_DeptManager" PRIMARY KEY (
        "DeptId","EmployeeNo"
     )
);


DROP TABLE IF EXISTS "Department" CASCADE;

CREATE TABLE "Department" (
    "DeptId" varchar(6)   NOT NULL,
    "Name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "DeptId"
     )
);

DROP TABLE IF EXISTS "Title" CASCADE;
CREATE TABLE "Title" (
    "TitleId" varchar(10)   NOT NULL,
    "Title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "TitleId"
     )
);




ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_EmpTitleId" FOREIGN KEY("EmpTitleId")
REFERENCES "Title" ("TitleId");

ALTER TABLE "DeptEmp" ADD CONSTRAINT "fk_DeptEmp_EmpNo" FOREIGN KEY("EmpNo")
REFERENCES "Employee" ("EmployeeNo");

ALTER TABLE "DeptEmp" ADD CONSTRAINT "fk_DeptEmp_DeptId" FOREIGN KEY("DeptId")
REFERENCES "Department" ("DeptId");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_EmployeeNo" FOREIGN KEY("EmployeeNo")
REFERENCES "Employee" ("EmployeeNo");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_DeptId" FOREIGN KEY("DeptId")
REFERENCES "Department" ("DeptId");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_EmployeeNo" FOREIGN KEY("EmployeeNo")
REFERENCES "Employee" ("EmployeeNo");

