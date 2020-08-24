--------------------------------------------------------
--  File created - Thursday-July-16-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CUSTOMERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."CUSTOMERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMAIL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMAIL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence HIBERNATE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MANOJ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."MANOJ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."PRODUCTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CATEGORY1
--------------------------------------------------------

  CREATE TABLE "HR"."CATEGORY1" 
   (	"CATEGORY_ID" NUMBER(10,1), 
	"CATEGORY_NAME" VARCHAR2(50 BYTE), 
	"CATEGORY_DESCRIPTION" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMAILSUBSCRIBER
--------------------------------------------------------

  CREATE TABLE "HR"."EMAILSUBSCRIBER" 
   (	"SUBSCRIBER_NO" NUMBER(10,1), 
	"FIRST_NAME" VARCHAR2(30 BYTE), 
	"LAST_NAME" VARCHAR2(30 BYTE), 
	"SUBSCRIBER_EMAIL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT1
--------------------------------------------------------

  CREATE TABLE "HR"."PRODUCT1" 
   (	"PRODUCT_ID" NUMBER(10,1), 
	"PRODUCT_NAME" VARCHAR2(70 BYTE), 
	"PRODUCT_DESC" VARCHAR2(400 BYTE), 
	"PRODUCT_PIC" VARCHAR2(50 BYTE), 
	"PRODUCT_PRICE" NUMBER(8,1), 
	"PRODUCT_DISCOUNT" NUMBER(8,1), 
	"PRODUCT_QUANTITY" NUMBER(*,0), 
	"CATEGORY_ID" NUMBER(10,1), 
	"CATEGORY_CATEGORY_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERTABLE
--------------------------------------------------------

  CREATE TABLE "HR"."USERTABLE" 
   (	"USER_ID" NUMBER(10,1), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"USER_EMAIL" VARCHAR2(30 BYTE), 
	"USER_PASSWORD" VARCHAR2(50 BYTE), 
	"USER_PHONE" VARCHAR2(12 BYTE), 
	"USER_PIC" VARCHAR2(40 BYTE), 
	"USER_ADDRESS" VARCHAR2(100 BYTE), 
	"USER_TYPE" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DEPTVU
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DEPTVU" ("EMPLOYEE_ID", "LAST_NAME", "SALARY", "DEPARTMENT_ID", "DEPARTMENT_NAME") AS 
  select employee_id,last_name,salary,department_id,department_name
from empx join deptx using (department_id)
;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
REM INSERTING into HR.CATEGORY1
SET DEFINE OFF;
Insert into HR.CATEGORY1 (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DESCRIPTION) values (24,'Laptops','Category to Store laptops.');
Insert into HR.CATEGORY1 (CATEGORY_ID,CATEGORY_NAME,CATEGORY_DESCRIPTION) values (1,'Mobiles','Category for all the mobiles. Best deals.');
REM INSERTING into HR.EMAILSUBSCRIBER
SET DEFINE OFF;
Insert into HR.EMAILSUBSCRIBER (SUBSCRIBER_NO,FIRST_NAME,LAST_NAME,SUBSCRIBER_EMAIL) values (1,'Manoj','Grewal','grewalmanoj221@gmail.com');
Insert into HR.EMAILSUBSCRIBER (SUBSCRIBER_NO,FIRST_NAME,LAST_NAME,SUBSCRIBER_EMAIL) values (2,'Himnish','Arora','ha891@snu.edu.in');
REM INSERTING into HR.PRODUCT1
SET DEFINE OFF;
Insert into HR.PRODUCT1 (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESC,PRODUCT_PIC,PRODUCT_PRICE,PRODUCT_DISCOUNT,PRODUCT_QUANTITY,CATEGORY_ID,CATEGORY_CATEGORY_ID) values (1,'LAPTOP-GAMING ACER','Laptop High Perfomance.','lap2a.jpg',64299,2100,12,null,24);
Insert into HR.PRODUCT1 (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESC,PRODUCT_PIC,PRODUCT_PRICE,PRODUCT_DISCOUNT,PRODUCT_QUANTITY,CATEGORY_ID,CATEGORY_CATEGORY_ID) values (4,'ONEPLUS 8','8 GB RAM, Stunning camera, Excellent Display.','mob1.jpg',45000,5001,15,null,1);
REM INSERTING into HR.USERTABLE
SET DEFINE OFF;
Insert into HR.USERTABLE (USER_ID,USER_NAME,USER_EMAIL,USER_PASSWORD,USER_PHONE,USER_PIC,USER_ADDRESS,USER_TYPE) values (22,'Manoj','grewalmanoj221@outlook.com','e5bed78df35c9a68cd0ebc89592def76df34c305','9812345232','default.jpg','Dhanasri','admin');
Insert into HR.USERTABLE (USER_ID,USER_NAME,USER_EMAIL,USER_PASSWORD,USER_PHONE,USER_PIC,USER_ADDRESS,USER_TYPE) values (1,'Sachin yadav','sachinyadav@gmail.com','6fa04ae60770216a92b9effc55224ebae22214d7','999235734','default.jpg','Gurgoan.','admin');
Insert into HR.USERTABLE (USER_ID,USER_NAME,USER_EMAIL,USER_PASSWORD,USER_PHONE,USER_PIC,USER_ADDRESS,USER_TYPE) values (2,'Himnish Arora','himnish@gmail.com','bedae2e75ce282f4c23daf14f1dada6dbad027a3','9812345232','default.jpg','Delhi, Rohini','normal');
--------------------------------------------------------
--  DDL for Index SYS_C007981
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007981" ON "HR"."CATEGORY1" ("CATEGORY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007982
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007982" ON "HR"."CATEGORY1" ("CATEGORY_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007999
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007999" ON "HR"."EMAILSUBSCRIBER" ("SUBSCRIBER_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008000
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C008000" ON "HR"."EMAILSUBSCRIBER" ("SUBSCRIBER_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007983
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007983" ON "HR"."PRODUCT1" ("PRODUCT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007973
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007973" ON "HR"."USERTABLE" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USER_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."USER_EMAIL" ON "HR"."USERTABLE" ("USER_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure DROP_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."DROP_TABLE" (table_name varchar2)
is
begin
	execute immediate
	'drop table' || table_name;
end;

/
--------------------------------------------------------
--  DDL for Procedure RA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."RA" (rama varchar2)
is
begin
execute immediate
'drop table'||rama;
end;

/
--------------------------------------------------------
--  DDL for Procedure REP_SAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."REP_SAL" 
(emp_id in employees.employee_id%type,
emp_name out employees.last_name%type,
emp_annsal out number)
is
begin
	select last_name,salary*12
	into emp_name,emp_annsal
	from employees
	where employee_id=emp_id;
end;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  DDL for Procedure TEL_NUM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."TEL_NUM" 
(numbr in out varchar2)
is
begin
	numbr:='('||substr(numbr,1,3)||')'||substr	(numbr,4,3)||'-'||substr(numbr,7,4);
end;

/
--------------------------------------------------------
--  DDL for Procedure UPGRADE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."UPGRADE" 
( P_empno in employees.employee_id%type)
is
begin
	update employees
	set salary=salary*1.2
	where employee_id=P_empno;
end;

/
--------------------------------------------------------
--  DDL for Package P1
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."P1" 
is
	function subt1(x number,y number) return number;
	function subt1(x varchar2,y varchar2) return varchar2;
end;

/
--------------------------------------------------------
--  DDL for Package Body P1
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."P1" --package body(private)
is
	function subt1(x number,y number) return number
	is
	begin
		return(x+y );
	end subt1;
	 function subt1(x varchar2,y varchar2) return varchar2
	is
	begin
		return(x||y);
	end subt1;
end p1;

/
--------------------------------------------------------
--  DDL for Function ADDD
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HR"."ADDD" 
( x in number,y number)
return number
is
begin
	return(x+y);
end;

/
--------------------------------------------------------
--  DDL for Function DEMO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HR"."DEMO" 
( empid in number
)
return varchar2
is
f_na varchar2(20);
l_na varchar2(20);
begin
	select first_name,last_name
	into f_na,l_na
	from employees
	where employee_id=empid;
	return(substr(f_na,0,1)||'.'||l_na);
end;

/
--------------------------------------------------------
--  DDL for Function T_HOME
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HR"."T_HOME" 
( empid in number
)
return number
is
f_na number;
begin
	select salary
	into f_na
	from employees
	where employee_id=empid;
	return(f_na);

end;

/
--------------------------------------------------------
--  DDL for Function T_HOME1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "HR"."T_HOME1" 
( empid in number
)
return varchar2
is
f_na number;
begin
	select salary
	into f_na
	from employees
	where employee_id=empid;

		if f_na >=5000 then
		return('Rich');
		else
		return('Poor');
		end if;

end;

/
--------------------------------------------------------
--  Constraints for Table CATEGORY1
--------------------------------------------------------

  ALTER TABLE "HR"."CATEGORY1" ADD UNIQUE ("CATEGORY_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."CATEGORY1" ADD PRIMARY KEY ("CATEGORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMAILSUBSCRIBER
--------------------------------------------------------

  ALTER TABLE "HR"."EMAILSUBSCRIBER" ADD UNIQUE ("SUBSCRIBER_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMAILSUBSCRIBER" ADD PRIMARY KEY ("SUBSCRIBER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMAILSUBSCRIBER" MODIFY ("SUBSCRIBER_EMAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT1
--------------------------------------------------------

  ALTER TABLE "HR"."PRODUCT1" ADD PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERTABLE
--------------------------------------------------------

  ALTER TABLE "HR"."USERTABLE" ADD CONSTRAINT "USER_EMAIL" UNIQUE ("USER_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."USERTABLE" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT1
--------------------------------------------------------

  ALTER TABLE "HR"."PRODUCT1" ADD CONSTRAINT "FKC80635429FA65697" FOREIGN KEY ("CATEGORY_CATEGORY_ID")
	  REFERENCES "HR"."CATEGORY1" ("CATEGORY_ID") ENABLE;
  ALTER TABLE "HR"."PRODUCT1" ADD FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "HR"."CATEGORY1" ("CATEGORY_ID") ENABLE;
