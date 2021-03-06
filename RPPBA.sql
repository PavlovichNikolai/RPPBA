CREATE DATABASE RPPBA;

DROP DATABASE RPPBA;

CREATE TABLE CLIENT(C_ID INT PRIMARY KEY, O_FNAME CHAR(20), O_LNAME CHAR(20), O_TEL CHAR(20), O_MAIL CHAR(20), L_ID INT);
CREATE TABLE LOYALTY(L_ID INT PRIMARY KEY, L_NAME CHAR(20), L_SALE INT, L_BOUNDARY INT);
CREATE TABLE EMPLOYEE(E_ID INT PRIMARY KEY, E_FNAME CHAR(20), E_LNAME CHAR(20), E_LOGIN CHAR(20), P_ID INT);
CREATE TABLE PASSWORDS(E_ID INT PRIMARY KEY, PASS INT);
CREATE TABLE POSITION(P_ID INT PRIMARY KEY, P_NAME CHAR(20));
CREATE TABLE PRIVILEGE(PR_ID INT PRIMARY KEY, PR_NAME CHAR(20), P_ID INT);
CREATE TABLE M2_POSITION_PRIVILEGE(P_ID INT , PR_ID INT, PRIMARY KEY(P_ID, PR_ID));
CREATE TABLE PRODUCT(ID INT PRIMARY KEY, MODEL CHAR(20), PRICE INT, TYP INT, K_ID INT, S_ID INT);--????
CREATE TABLE PRODUCTION(DAT DATE, ID INT, KOL INT, PRIMARY KEY(DAT, ID));
CREATE TABLE RESIDUAL(ID INT PRIMARY KEY, R_KOL INT);
CREATE TABLE KERNEL_FPEN(K_ID INT PRIMARY KEY, TYP CHAR(20));--?????
CREATE TABLE SHELL_FPEN(S_ID INT PRIMARY KEY, TYP CHAR(20));
CREATE TABLE KERNEL_FPENCIL(K_ID INT PRIMARY KEY, TYP CHAR(20));
CREATE TABLE SHELL_FPENCIL(S_ID INT PRIMARY KEY, TYP CHAR(20));
CREATE TABLE ORDERS(O_ID INT PRIMARY KEY, O_ADR CHAR(30), O_COST INT, O_CONDITION INT, C_ID INT, E_ID INT, D_ID INT, DAT DATE);
CREATE TABLE FILLING(O_ID INT, ID INT, F_KOL INT, ST_ID INT, PRIMARY KEY(O_ID, ID));
CREATE TABLE DELIVERY(D_ID INT PRIMARY KEY, D_NAME CHAR(20));
CREATE TABLE STATES(ST_ID INT PRIMARY KEY, S_NAME CHAR(20));
CREATE TABLE ACTIONS(A_ID INT PRIMARY KEY, A_NAME CHAR(20));
CREATE TABLE M2_STATES_ACTIONS(A_ID INT, ST_ID INT, PRIMARY KEY(A_ID, ST_ID));
CREATE TABLE S13#DAT(DAT DATE PRIMARY KEY, D_KOD INT);
CREATE TABLE S150#NUM(NUM INT);

ALTER TABLE CLIENT ADD CONSTRAINT FK_CLIENT_LOYALTY FOREIGN KEY(L_ID) REFERENCES LOYALTY(L_ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_PASSWORDS FOREIGN KEY(E_ID) REFERENCES PASSWORDS(E_ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_POSITION FOREIGN KEY(P_ID) REFERENCES POSITION(P_ID);
ALTER TABLE M2_POSITION_PRIVILEGE ADD CONSTRAINT FK_M2_POSITION_PRIVILEGE_POSITION FOREIGN KEY(P_ID) REFERENCES POSITION(P_ID);
ALTER TABLE M2_POSITION_PRIVILEGE ADD CONSTRAINT FK_M2_POSITION_PRIVILEGE_PRIVILEGE FOREIGN KEY(PR_ID) REFERENCES PRIVILEGE(PR_ID);
ALTER TABLE PRODUCTION ADD CONSTRAINT FK_PRODUCTION_PRODUCT FOREIGN KEY(ID) REFERENCES PRODUCT(ID);
ALTER TABLE RESIDUAL ADD CONSTRAINT FK_RESIDUAL_PRODUCT FOREIGN KEY(ID) REFERENCES PRODUCT(ID);
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_DELIVERY FOREIGN KEY(D_ID) REFERENCES DELIVERY(D_ID);
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CLIENT FOREIGN KEY(C_ID) REFERENCES CLIENT(C_ID);
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEE FOREIGN KEY(E_ID) REFERENCES EMPLOYEE(E_ID);
ALTER TABLE FILLING ADD CONSTRAINT FK_FILLING_ORDERS FOREIGN KEY(O_ID) REFERENCES ORDERS(O_ID);
ALTER TABLE FILLING ADD CONSTRAINT FK_FILLING_STATES FOREIGN KEY(ST_ID) REFERENCES STATES(ST_ID);
ALTER TABLE M2_STATES_ACTIONS ADD CONSTRAINT FK_M2_STATES_ACTIONS_STATES FOREIGN KEY(ST_ID) REFERENCES STATES(ST_ID);
ALTER TABLE M2_STATES_ACTIONS ADD CONSTRAINT FK_M2_M2_STATES_ACTIONS_ACTIONS FOREIGN KEY(A_ID) REFERENCES ACTIONS(A_ID);
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_KERNEL_FPEN FOREIGN KEY(K_ID) REFERENCES KERNEL_FPEN(K_ID);
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_SHELL_FPEN FOREIGN KEY(S_ID) REFERENCES SHELL_FPEN(S_ID);
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_KERNEL_FPENCIL FOREIGN KEY(K_ID) REFERENCES KERNEL_FPENCIL(K_ID);
ALTER TABLE PRODUCT ADD CONSTRAINT FK_PRODUCT_SHELL_FPENCIL FOREIGN KEY(S_ID) REFERENCES SHELL_FPENCIL(S_ID);
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_S13#DAT FOREIGN KEY(DAT) REFERENCES S13#DAT(DAT);
ALTER TABLE PRODUCTION ADD CONSTRAINT FK_PRODUCTION_S13#DAT FOREIGN KEY(DAT) REFERENCES S13#DAT(DAT);

ALTER TABLE CLIENT DROP FK_CLIENT_LOYALTY; 
ALTER TABLE EMPLOYEE DROP FK_EMPLOYEE_PASSWORDS; 
ALTER TABLE EMPLOYEE DROP FK_EMPLOYEE_POSITION; 
ALTER TABLE M2_POSITION_PRIVILEGE DROP FK_M2_POSITION_PRIVILEGE_POSITION; 
ALTER TABLE M2_POSITION_PRIVILEGE DROP FK_M2_POSITION_PRIVILEGE_PRIVILEGE; 
ALTER TABLE PRODUCTION DROP FK_PRODUCTION_PRODUCT; 
ALTER TABLE RESIDUAL DROP FK_RESIDUAL_PRODUCT; 
ALTER TABLE ORDERS DROP FK_ORDERS_DELIVERY; 
ALTER TABLE ORDERS DROP FK_ORDERS_CLIENT; 
ALTER TABLE ORDERS DROP FK_ORDERS_EMPLOYEE; 
ALTER TABLE FILLING DROP FK_FILLING_ORDERS; 
ALTER TABLE FILLING DROP FK_FILLING_STATES; 
ALTER TABLE M2_STATES_ACTIONS DROP FK_M2_STATES_ACTIONS_STATES; 
ALTER TABLE M2_STATES_ACTIONS DROP FK_M2_M2_STATES_ACTIONS_ACTIONS; 
ALTER TABLE PRODUCT DROP FK_PRODUCT_KERNEL_FPEN; 
ALTER TABLE PRODUCT DROP FK_PRODUCT_SHELL_FPEN; 
ALTER TABLE PRODUCT DROP FK_PRODUCT_KERNEL_FPENCIL; 
ALTER TABLE PRODUCT DROP FK_PRODUCT_SHELL_FPENCIL; 
ALTER TABLE ORDERS DROP FK_ORDERS_S13#DAT; 
ALTER TABLE PRODUCTION DROP FK_PRODUCTION_S13#DAT; 

SELECT * FROM CLIENT;

DROP TABLE CLIENT;
DROP TABLE LOYALTY;
DROP TABLE EMPLOYEE;
DROP TABLE PASSWORDS;
DROP TABLE POSITION;
DROP TABLE PRIVILEGE;
DROP TABLE M2_POSITION_PRIVILEGE;
DROP TABLE PRODUCT;
DROP TABLE PRODUCTION;
DROP TABLE RESIDUAL;
DROP TABLE KERNEL_FPEN;
DROP TABLE SHELL_FPEN;
DROP TABLE KERNEL_FPENCIL;
DROP TABLE SHELL_FPENCIL;
DROP TABLE ORDERS;
DROP TABLE FILLING;
DROP TABLE DELIVERY;
DROP TABLE STATES;
DROP TABLE ACTIONS;
DROP TABLE M2_STATES_ACTIONS;
DROP TABLE S13#DAT;
DROP TABLE S150#NUM;
