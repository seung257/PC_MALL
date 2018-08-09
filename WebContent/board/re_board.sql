create table Re_Board (
  b_id       	NUMBER(5)      	PRIMARY KEY,
  Pwd       	VARCHAR2(20)	NOT NULL,
  b_name  	VARCHAR2(20)	NOT NULL,
  b_email  	VARCHAR2(20)	NOT NULL,
  b_title     	VARCHAR2(80)	NOT NULL,
  b_content 	VARCHAR2(2000)	NOT NULL,
  b_date   	DATE          	default SYSDATE,
  b_hit      	NUMBER(5)       NULL,
  b_ip        	VARCHAR2(15)	NULL,
  ref         	NUMBER(5)	NULL,
  step      	NUMBER(5)	NULL,
  anslevel 	NUMBER(5)           	NULL )
/
