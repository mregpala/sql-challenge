
--Left Outer Join looking for employees with no salary
SELECT 
    emp."EmployeeNo"
   ,emp."LastName"
   ,emp."FirstName"
   ,emp."Sex"
   ,sal."Salary"
FROM 
    "Employee" emp
LEFT OUTER JOIN
    "Salary" sal
 ON emp."EmployeeNo" = sal."EmployeeNo"
ORDER BY sal."Salary" DESC NULLS FIRST;

--Employees hired in 1986
SELECT 
    emp."LastName"
   ,emp."FirstName"
   ,emp."HireDate"
FROM 
    "Employee" emp
WHERE 
    "emp"."HireDate" BETWEEN '1/1/1986' AND '12/31/1986';
   
--Department Manager Information
SELECT
    dept."DeptId"
   ,dept."Name" AS "DeptName"
   ,emp."EmployeeNo"
   ,emp."LastName"
   ,emp."FirstName"
FROM
    "DeptManager" dm
INNER JOIN 
    "Employee" emp
 on "emp"."EmployeeNo" = dm."EmployeeNo"
INNER JOIN
    "Department" dept
 on dept."DeptId" = dm."DeptId";
  
 --Employee Department 
 SELECT
     demp."DeptId"
	,dept."Name" AS "DeptName"
	,emp."EmployeeNo"
	,emp."LastName"
	,emp."FirstName"
 FROM
 	 "Employee" emp
 INNER JOIN
 	 "DeptEmp" demp
  ON demp."EmpNo" = emp."EmployeeNo"
 INNER JOIN
     "Department" dept
  ON dept."DeptId" = demp."DeptId";
 
 --Employees with first name of Hercules and last name starting with a "B"
 SELECT
     emp."FirstName"
	,emp."LastName"
	,emp."Sex"
 FROM 
 	 "Employee" emp
 WHERE 
     emp."FirstName" = 'Hercules'
	 AND emp."LastName" LIKE 'B%';
	 
--List all the employees in the Sales Department
SELECT
     emp."EmployeeNo"
	,emp."LastName"
	,emp."FirstName"
	,dept."Name" AS "DeptName"
FROM 
	"Employee" emp
INNER JOIN
    "DeptEmp" demp
 ON demp."EmpNo" = emp."EmployeeNo"
INNER JOIN
    "Department" dept
 ON dept."DeptId" = demp."DeptId"
    AND dept."Name" = 'Sales';
	
--List all the employees in the Sales and Development Departments
SELECT
     emp."EmployeeNo"
	,emp."LastName"
	,emp."FirstName"
	,dept."Name" AS "DeptName"
FROM 
	"Employee" emp
INNER JOIN
    "DeptEmp" demp
 ON demp."EmpNo" = emp."EmployeeNo"
INNER JOIN
    "Department" dept
 ON dept."DeptId" = demp."DeptId"
    AND  dept."Name" IN ('Development','Sales');
     
--Last Name frequency.  Sort descending on frequency count.
SELECT
    emp."LastName"
   ,COUNT(1) AS "FreqCount"
FROM 
    "Employee" emp
GROUP BY 
    emp."LastName"
ORDER BY 2 DESC, 1 ASC;

