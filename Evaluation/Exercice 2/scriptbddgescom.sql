CREATE DATABASE IF NOT EXISTS gescom;
USE gescom;

-- J'ai mis en premières tables celles qui n'ont que des clés primaires ou des clés étrangères appartenant à leur propre table (exemple id_employees_1 dans EMPLOYEES), car on ne peut pas déclarer une clé étrangère d'une autre table tant qu'elle n'a pas été déclarée en tant que clé primaire dans sa table d'origine.

CREATE TABLE ORDERS(
   id_order INT(10) NOT NULL AUTO_INCREMENT,
   order_deliveries VARCHAR(50),
   order_payments VARCHAR(50),
   PRIMARY KEY(id_order)
);

-- Pour moi EMPLOYEES (les employés) est une table à part, car je ne voyais pas l'intérêt de la joindre à une autre table, car pour moi les employés n'ont pas de lien avec les clients, ou les produits, ou les commandes ou les commerciaux. Pour moi les commandes se font sur internet, et donc les employés ne préparent les commandes internet, ils s'occupent seulement des produits en magasin, hors ici dans la table PRODUCTS on parle bien des produits vendus uniquement sur internet.

CREATE TABLE EMPLOYEES(
   id_employees INT(10) NOT NULL AUTO_INCREMENT,
   post_employees VARCHAR(50),
   shop_employees VARCHAR(50),
   department_employee VARCHAR(50),
   gross_salary_employee DECIMAL(10,2),
   sex_employee VARCHAR(50),
   number_children_employee INT(3),
   date_service DATE,
   id_employees_1 INT(10) NOT NULL,
   PRIMARY KEY(id_employees),
   FOREIGN KEY(id_employees_1) REFERENCES EMPLOYEES(id_employees)
);

CREATE TABLE SALES_REP(
   id_salesrep INT(10) NOT NULL AUTO_INCREMENT,
   name_salesrep VARCHAR(50),
   PRIMARY KEY(id_salesrep)
);

CREATE TABLE CUSTOMERS(
   id_customer INT(10) NOT NULL AUTO_INCREMENT,
   passeword VARCHAR(50),
   date_added_customer DATE,
   date_modified_customer DATE,
   PRIMARY KEY(id_customer)
);

CREATE TABLE CATEGORY(
   id_category INT(10) NOT NULL AUTO_INCREMENT,
   PRIMARY KEY(id_category)
);

CREATE TABLE SUPPLIERS(
   id_supplier INT(10) NOT NULL AUTO_INCREMENT,
   name_supplier VARCHAR(50),
   id_salesrep INT(10),
   PRIMARY KEY(id_supplier),
   UNIQUE(id_salesrep),
   FOREIGN KEY(id_salesrep) REFERENCES SALES_REP(id_salesrep)
);

CREATE TABLE SUB_CATEGORY(
   id_subcategory INT(10) NOT NULL AUTO_INCREMENT,
   subcategory_name VARCHAR(50),
   id_category INT(10) NOT NULL,
   PRIMARY KEY(id_subcategory),
   FOREIGN KEY(id_category) REFERENCES CATEGORY(id_category)
);

CREATE TABLE PRODUCTS(
   id_products INT(10) NOT NULL AUTO_INCREMENT,
   price DECIMAL(9,2),
   internal_reference VARCHAR(50),
   bar_code VARCHAR(50),
   current_stock INT(10),
   stock_alert INT(10),
   color VARCHAR(50),
   label VARCHAR(50),
   description_products VARCHAR(50),
   date_added_products DATE,
   date_modified_products DATE,
   photofile_name VARCHAR(50),
   statement_products VARCHAR(50),
   id_category INT(10),
   id_supplier INT(10),
   PRIMARY KEY(id_products),
   FOREIGN KEY(id_category) REFERENCES CATEGORY(id_category),
   FOREIGN KEY(id_supplier) REFERENCES SUPPLIERS(id_supplier)
);

CREATE TABLE ORDER_DETAILS(
   id_products INT(10),
   id_order INT(10),
   TVA_price DECIMAL(10,2),
   discount_price DECIMAL(10,2),
   unit_price DECIMAL(10,2),
   quantity INT(10),
   PRIMARY KEY(id_products, id_order),
   FOREIGN KEY(id_products) REFERENCES PRODUCTS(id_products),
   FOREIGN KEY(id_order) REFERENCES ORDERS(id_order)
);

-- Cette table est une association dans mon Merise, et j'ai trouvé logique de la mettre en fin de script car elle est composée uniquement de clés venant de d'autres tables

CREATE TABLE ORDERING(
   id_order INT(10),
   id_customer INT(10),
   PRIMARY KEY(id_order, id_customer),
   FOREIGN KEY(id_order) REFERENCES ORDERS(id_order),
   FOREIGN KEY(id_customer) REFERENCES CUSTOMERS(id_customer)
);
