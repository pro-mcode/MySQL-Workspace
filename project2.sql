--Please, note that all content of these queries are fiction with no connection to a real life event
--Drop all similar tables in the database.
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Branch_supplier;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Address;

--Orders Table Creation
CREATE TABLE Orders (
    sn INT AUTO_INCREMENT,
    order_id INT,
    customer_id INT,
    branch_id INT,
    delivery_mode VARCHAR(20),
    delivery_address VARCHAR(200) DEFAULT("Customer's Address/Pick-up"),
    product_id VARCHAR(50),
    order_quantity INT,
    order_total_price DECIMAL(5,2),
    channel VARCHAR(100),
    order_date DATE,
    PRIMARY KEY(sn)
);

--Products Table Creation
CREATE TABLE Products (
    product_id VARCHAR(50) UNIQUE,
    product_name VARCHAR(100),
    category_id INT,
    product_year_model VARCHAR(4),
    product_size VARCHAR(100),
    product_unit_price DECIMAL(9,2),
    PRIMARY KEY(product_id)
);

--Categories Table Creation
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT,
    category VARCHAR(30),
    description VARCHAR(200),
    PRIMARY KEY(category_id)
);

ALTER TABLE Categories
AUTO_INCREMENT = 100;

--Customers Table Creation
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT,
    cust_firstname VARCHAR(30),
    cust_lastname VARCHAR(30),
    address_id INT,
    PRIMARY KEY(customer_id)
);

--Address Table Creation
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT,
    street VARCHAR(200),
    city VARCHAR(30),
    state VARCHAR(200),
    postal_code VARCHAR(20),
    country VARCHAR(30),
    PRIMARY KEY(address_id)
);

ALTER TABLE Address
AUTO_INCREMENT = 200;

--Job Table Creation
CREATE TABLE Job (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(100),
    job_type VARCHAR(50)
);

--Staff Table Creation
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT,
    staff_firstname VARCHAR(30),
    staff_lastname VARCHAR(30),
    email VARCHAR(200),
    job_id INT,
    gender VARCHAR(10),
    employment_date DATE,
    address_id INT,
    salary DECIMAL(8,2),
    PRIMARY KEY(staff_id),
    CONSTRAINT fk_address_1 FOREIGN KEY(address_id) 
    REFERENCES Address(address_id)
    ON DELETE SET NULL,
    CONSTRAINT fk_job_id_1 FOREIGN KEY(job_id)
    REFERENCES Job(job_id)
    ON DELETE SET NULL
);

--Branch Table Creation
CREATE TABLE Branch (
    branch_id INT AUTO_INCREMENT,
    branch_name VARCHAR(200),
    manager_id INT,
    PRIMARY KEY(branch_id),
    CONSTRAINT fk_manager_id_1 FOREIGN KEY(manager_id)
    REFERENCES Staff(staff_id)
    ON DELETE SET NULL
);

ALTER TABLE Branch 
AUTO_INCREMENT = 20;

--Branch Supplier Table Creation
CREATE TABLE Branch_supplier (
    sn INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    supplier_name VARCHAR(50),
    product_type VARCHAR(100),
    CONSTRAINT fk_branch_id_2 FOREIGN KEY(branch_id)
    REFERENCES Branch(branch_id)
    ON DELETE SET NULL
);

--Add Foreign Key (product_id) to Orders Table
ALTER TABLE Orders
ADD CONSTRAINT fk_product_id_1 FOREIGN KEY(product_id)
REFERENCES Products(product_id)
ON DELETE SET NULL;

--Add Foreign Key (customer_id) to Orders Table
ALTER TABLE Orders
ADD CONSTRAINT fk_customer_id_1 FOREIGN KEY(customer_id)
REFERENCES Customers(customer_id)
ON DELETE SET NULL;

--Add Foreign Key (branch_id) to Orders Table
ALTER TABLE Orders
ADD CONSTRAINT fk_branch_id_1 FOREIGN KEY(branch_id)
REFERENCES Branch(branch_id)
ON DELETE SET NULL;

--Add Foreign Key (category_id) to Products Table
ALTER TABLE Products
ADD CONSTRAINT fk_category_id_1 FOREIGN KEY(category_id)
REFERENCES Categories(category_id)
ON DELETE SET NULL;

--Add Foreign Key (address_id) to Customers Table
ALTER TABLE Customers
ADD CONSTRAINT fk_address_id_2 FOREIGN KEY(address_id)
REFERENCES Address(address_id)
ON DELETE SET NULL;

--Branch Table
INSERT INTO Branch (branch_name, manager_id)
VALUES ('Ambassador', NULL);
INSERT INTO Branch (branch_name, manager_id)
VALUES ('Senatorial', NULL);
INSERT INTO Branch (branch_name, manager_id)
VALUES ('Champions', NULL);
INSERT INTO Branch (branch_name, manager_id)
VALUES ('Minister', NULL);
INSERT INTO Branch (branch_name, manager_id)
VALUES ('Honourable', NULL);

--Branch_supplier Table
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (20, 'John Kotlins Co.', 'Vehicle');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (20, 'Nerd Ventures', 'Auto Parts');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (20, 'Nerd Ventures', 'Tyres');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (21, 'Countryside Autos', 'Vehicle');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (21, 'Nerd Ventures', 'Auto Parts');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (21, 'Nerd Ventures', 'Tyre');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (22, 'Fred & Smith Co.', 'Vehicle');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (22, 'Nerd Ventures', 'Auto Parts');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (22, 'Nerd Ventures', 'Tyre');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (23, 'John Kotlins Co.', 'Vehicle');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (23, 'Nerd Ventures', 'Auto Parts');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (23, 'Nerd Ventures', 'Tyre');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (24, 'Fred & Smith Co.', 'Vehicle');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (24, 'Nerd Ventures', 'Auto Parts');
INSERT INTO branch_supplier (branch_id, supplier_name, product_type)
VALUES (24, 'Nerd Ventures', 'Tyre');

--Categories Table
INSERT INTO Categories (category, description)
VALUES ('Tyre', NULL);
INSERT INTO Categories (category, description)
VALUES ('Auto Part', NULL);
INSERT INTO Categories (category, description)
VALUES ('Sedan', NULL);
INSERT INTO Categories (category, description)
VALUES ('SUV', NULL);
INSERT INTO Categories (category, description)
VALUES ('Coupe', NULL);
INSERT INTO Categories (category, description)
VALUES ('Station Wagon', NULL);
INSERT INTO Categories (category, description)
VALUES ('Convertible', NULL);
INSERT INTO Categories (category, description)
VALUES ('Hatchback', NULL);
INSERT INTO Categories (category, description)
VALUES ('Sports Car', NULL);
INSERT INTO Categories (category, description)
VALUES ('Compact Car', NULL);
INSERT INTO Categories (category, description)
VALUES ('Crossover', NULL);
INSERT INTO Categories (category, description)
VALUES ('Pickup Truck', NULL);
INSERT INTO Categories (category, description)
VALUES ('Minivan', NULL);
INSERT INTO Categories (category, description)
VALUES ('Heavy Truck', NULL);

--Job Table
INSERT INTO Job (job_title, job_type)
VALUES ('Manager', 'Full-Time' );
INSERT INTO Job (job_title, job_type)
VALUES ('Stock Controller', 'Full-Time' );
INSERT INTO Job (job_title, job_type)
VALUES ('Supervisor', 'Full-Time' );
INSERT INTO Job (job_title, job_type)
VALUES ('Sales Assistance', 'Full-Time' );
INSERT INTO Job (job_title, job_type)
VALUES ('Accountant', 'Full-Time' );
INSERT INTO Job (job_title, job_type)
VALUES ('Product Manager', 'Remote' );
INSERT INTO Job (job_title, job_type)
VALUES ('Maintenance Officer', 'Contract');

--Staff Table
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Manie', 'Sanchez', 'manie.sanchez@hotmail.com', 1, 'Male', '2010-09-23', NULL, 24000);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Cecelia', 'Gill', 'cecelia.gill@aol.com', 2, 'Female', '2010-09-13', NULL, 22600);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Johnathan', 'Velazquez', 'johnathan.velazquez@hotmail.com', 3, 'Male', '2010-09-25', NULL, 19500);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Mariana', 'Strong', 'mariana.strong@msn.com', 4, 'Female', '2010-09-22', NULL, 14200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Natosha', 'Rowland', 'natosha.rowland@aol.com', 4, 'Male', '2010-09-30', NULL, 13800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Dionne', 'Norris', 'dionne.norris@yahoo.com', 5, 'Female', '2010-09-25', NULL, 17200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Jessica', 'Bray', 'jessica.bray@yahoo.com', 6, 'Female', '2010-09-29', NULL, 9600);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Rubin', 'Decker', 'rubin.decker@gmail.com', 7, 'Male', '2010-09-26', NULL, 15500);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Mellisa', 'Farley', 'mellisa.farley@yahoo.com', 1, 'Female', '2011-02-12', NULL, 25000);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Katheleen', 'Marks', 'katheleen.marks@yahoo.com', 2, 'Female', '2011-02-18', NULL, 22600);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Dortha', 'Jarvis', 'dortha.jarvis@yahoo.com', 3, 'Female', '2011-02-22', NULL, 21550);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Angelina', 'Lloyd', 'angelina.lloyd@yahoo.com', 4, 'Female', '2011-02-17', NULL, 10600);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Myung', 'Hooper', 'myung.hooper@gmail.com', 4, 'Male', '2011-02-19', NULL, 10100);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Winfred', 'Harris', 'winfred.harris@msn.com', 5, 'Male', '2011-02-21', NULL, 19000);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Freddie', 'Mathis', 'freddie.mathis@hotmail.com', 6, 'Male', '2011-02-12', NULL, 9800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Pinkie', 'Kirkland', 'pinkie.kirkland@yahoo.com', 7, 'Female', '2011-02-24', NULL, 17500);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Justina', 'Long', 'justina.long@aol.com', 1, 'Female', '2011-04-22', NULL, 26600);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Lavette', 'Wright', 'lavette.wright@msn.com', 2, 'Female', '2011-04-25', NULL, 24300);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Susann', 'Bass', 'susann.bass@msn.com', 3, 'Female', '2011-04-18', NULL, 22200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Brenda', 'Tate', 'brenda.tate@msn.com', 4, 'Female', '2011-04-26', NULL, 11200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Rayna', 'Perry', 'rayna.perry@hotmail.com', 4, 'Male', '2011-04-24', NULL, 10800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Randolph', 'Chase', 'randolph.chase@yahoo.com', 5, 'Male', '2011-04-22', NULL, 16900);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Virgil', 'Frost', 'virgil.frost@gmail.com', 6, 'Male', '2011-04-25', NULL, 8000);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Barry', 'Buckner', 'barry.buckner@gmail.com', 7, 'Male', '2011-04-26', NULL, 18200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Danny', 'Kim', 'danny.kim@msn.com', 1, 'Male', '2011-09-23', NULL, 24200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Jame', 'Riggs', 'jame.riggs@hotmail.com', 2, 'Male', '2011-09-27', NULL, 21900);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Rayford', 'Simon', 'rayford.simon@msn.com', 3, 'Male', '2011-09-25', NULL, 20800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Hayden', 'Cross', 'hayden.cross@gmail.com', 4, 'Male', '2011-09-26', NULL, 10300);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Hope', 'Cotton', 'hope.cotton@aol.com', 4, 'Female', '2011-09-24', NULL, 10200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Vikki', 'Erickson', 'vikki.erickson@yahoo.com', 5, 'Female', '2011-09-28', NULL, 18800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Fransisca', 'Nicholson', 'fransisca.nicholson@aol.com', 6, 'Female', '2011-09-22', NULL, 10400);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Sophia', 'Mcmillan', 'sophia.mcmillan@msn.com', 7, 'Female', '2011-09-27', NULL, 19200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Christia', 'Carson', 'christia.carson@gmail.com', 1, 'Female', '2011-12-16', NULL, 24250);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Anderson', 'Martin', 'anderson.martin@hotmail.com', 2, 'Male', '2011-12-18', NULL, 21800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Gilberto', 'Parsons', 'gilberto.parsons@gmail.com', 3, 'Male', '2011-12-23', NULL, 18300);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Justin', 'Newton', 'justin.newton@hotmail.com', 4, 'Male', '2011-12-28', NULL, 11800);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Aaron', 'Wiggins', 'aaron.wiggins@aol.com', 4, 'Male', '2011-12-26', NULL, 11500);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Abbey', 'Pugh', 'abbey.pugh@gmail.com', 5, 'Male', '2011-12-22', NULL, 19000);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Darren', 'Witt', 'darren.witt@aol.com', 6, 'Male', '2011-12-18', NULL, 9200);
INSERT INTO Staff (staff_firstname, staff_lastname, email,  
                   job_id, gender, employment_date, 
                   address_id, salary)
VALUES ('Josef', 'Greer', 'josef.greer@gmail.com', 7, 'Male', '2011-12-29', NULL, 17500);

--Branch Table Updated
UPDATE Branch
SET manager_id = 1
WHERE branch_id = 20;
UPDATE Branch
SET manager_id = 9
WHERE branch_id = 21;
UPDATE Branch
SET manager_id = 17
WHERE branch_id = 22;
UPDATE Branch
SET manager_id = 25
WHERE branch_id = 23;
UPDATE Branch
SET manager_id = 33
WHERE branch_id = 24;

--Address Table
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9921 Argyle Street ', 'Carmel', 'NY', 10512, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8316 Augusta Drive ', 'Commack', 'NY', 11725, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8772 State St.', 'Pittsford', 'NY', 14534, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('737 Edgefield Drive ', 'Ithaca', 'NY', 14850, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('379 Central Ave. ', 'Deer Park', 'NY', 11729, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('893 Logan St. ', 'Valley Stream', 'NY', 11580, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('685 Beacon Dr. ', 'Woodhaven', 'NY', 11421, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('934 2nd St. ', 'Bayside', 'NY', 11361, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('27 Washington Rd. ', 'Longview', 'TX', 75604, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('7858 Rockaway Court ', 'Forney', 'TX', 75126, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('684 Howard St. ', 'Sugar Land', 'TX', 77478, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('10 Silver Spear Dr. ', 'Victoria', 'TX', 77904, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('895 Chestnut Ave. ', 'Houston', 'TX', 77016, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('17 Corona St. ', 'Sugar Land', 'TX', 77478, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('376 S. High Ridge St. ', 'Houston', 'TX', 77016, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9766 Rockcrest Ave. ', 'San Angelo', 'TX', 76901, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('910 Vine Street ', 'Campbell', 'CA', 95008, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('769C Honey Creek St. ', 'Redondo Beach', 'CA', 90278, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('107 River Dr. ', 'Sacramento', 'CA', 95820, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('853 Stonybrook Street ', 'Torrance', 'CA', 90505, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('69 Cypress St. ', 'Oakland', 'CA', 94603, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('12 Ridgeview Ave. ', 'Fullerton', 'CA', 92831, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('895 Edgemont Drive ', 'Palos Verdes Peninsula', 'CA', 90274, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9438 Plymouth Court ', 'Encino', 'CA', 91316, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('40 Dogwood St. ', 'West Islip', 'NY', 11795, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('81 Carpenter St. ', 'Saint Albans', 'NY', 11412, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('212 Marsh Court ', 'Auburn', 'NY', 13021, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('2 Maple St. ', 'Jamaica', 'NY', 11432, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('85 Hickory Ave. ', 'Jackson Heights', 'NY', 11372, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('11 Marlborough Rd. ', 'Long Beach', 'NY', 11561, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('7979 South Mountainview Ave. ', 'Carmel', 'NY', 10512, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('7739 Snake Hill Lane ', 'Valley Stream', 'NY', 11580, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('99 Old Church St. ', 'Santa Monica', 'CA', 90403, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('74 Evergreen Court ', 'Palos Verdes Peninsula', 'CA', 90274, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('973 Yukon Avenue ', 'Encino', 'CA', 91316, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('14 Tailwater St. ', 'Rocklin', 'CA', 95677, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8067 Park Court ', 'San Lorenzo', 'CA', 94580, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('17 Lyme Dr. ', 'Los Angeles', 'CA', 90008, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('615 S. Proctor Ave. ', 'Santa Clara', 'CA', 95050, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8296 S. Lookout Lane ', 'Rocklin', 'CA', 95677, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('671 Miles Court ', 'San Lorenzo', 'CA', 94580, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('88 N. Canterbury Ave. ', 'Canandaigua', 'NY', 14424, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('401 Brandywine Street ', 'Central Islip', 'NY', 11722, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('947 Lafayette Drive ', 'Brooklyn', 'NY', 11201, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('796 SE. Nut Swamp St. ', 'Staten Island', 'NY', 10301, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('4 West Ridge Dr. ', 'Oakland Gardens', 'NY', 11364, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8330 Marsh St. ', 'New Rochelle', 'NY', 10801, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8626 Grand Ave. ', 'San Jose', 'CA', 95127, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('20 W. Rosewood Ave. ', 'Rockville Centre', 'NY', 11570, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8730 Longfellow St. ', 'Bellmore', 'NY', 11710, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('532 Leatherwood Ave. ', 'Scarsdale', 'NY', 10583, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('7077 Euclid Ave. ', 'Liverpool', 'NY', 13090, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('25 SE. Miles Lane ', 'Scarsdale', 'NY', 10583, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('42 Bridle Court ', 'East Northport', 'NY', 11731, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('83 Eagle St. ', 'East Elmhurst', 'NY', 11369, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('65 Smith Store Dr. ', 'Bakersfield', 'CA', 93306, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8396 Brook Drive ', 'Pomona', 'CA', 91768, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('7077 Fordham Rd. ', 'Santa Cruz', 'CA', 95060, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9233 Clinton St. ', 'Atwater', 'CA', 95301, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9169 Beech Lane ', 'Corpus Christi', 'TX', 78418, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('345 SE. Green Lane ', 'Shirley', 'NY', 11967, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('783 Baker St. ', 'Monsey', 'NY', 10952, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8828 Applegate Drive ', 'Fort Worth', 'TX', 76110, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('136 Old Fairview St. ', 'Smithtown', 'NY', 11787, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('36 Pulaski Drive ', 'Plattsburgh', 'NY', 12901, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('36 Pearl Court ', 'Mount Vernon', 'NY', 10550, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8218 George St. ', 'Pleasanton', 'CA', 94566, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('875 Second Drive ', 'Anaheim', 'CA', 92806, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('977 SE. Railroad Road ', 'Forney', 'TX', 75126, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('726 East High St. ', 'Astoria', 'NY', 11102, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9530 Summerhouse Street ', 'Santa Cruz', 'CA', 95060, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('30 Marshall Dr. ', 'Queensbury', 'NY', 12804, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('69 Rockwell Court ', 'New Windsor', 'NY', 12553, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('720 Thompson Lane ', 'Rego Park', 'NY', 11374, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('9547 N. Courtland St. ', 'Freeport', 'NY', 11520, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('849 Magnolia St. ', 'Yonkers', 'NY', 10701, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('76 Lilac Drive ', 'Buffalo', 'NY', 14215, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('4 West St. ', 'Port Chester', 'NY', 10573, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8716 Homewood Court ', 'Centereach', 'NY', 11720, 'USA');
INSERT INTO Address (street, city, state, postal_code, country)
VALUES ('8711 W. Ashley St. ', 'New Hyde Park', 'NY', 11040, 'USA');

--Staff Table Updated
UPDATE Staff
SET address_id = 200
WHERE staff_id = 1;
UPDATE Staff
SET address_id = 201
WHERE staff_id = 2;
UPDATE Staff
SET address_id = 202
WHERE staff_id = 3;
UPDATE Staff
SET address_id = 203
WHERE staff_id = 4;
UPDATE Staff
SET address_id = 204
WHERE staff_id = 5;
UPDATE Staff
SET address_id = 205
WHERE staff_id = 6;
UPDATE Staff
SET address_id = 206
WHERE staff_id = 7;
UPDATE Staff
SET address_id = 207
WHERE staff_id = 8;
UPDATE Staff
SET address_id = 208
WHERE staff_id = 9;
UPDATE Staff
SET address_id = 209
WHERE staff_id = 10;
UPDATE Staff
SET address_id = 210
WHERE staff_id = 11;
UPDATE Staff
SET address_id = 211
WHERE staff_id = 12;
UPDATE Staff
SET address_id = 212
WHERE staff_id = 13;
UPDATE Staff
SET address_id = 213
WHERE staff_id = 14;
UPDATE Staff
SET address_id = 214
WHERE staff_id = 15;
UPDATE Staff
SET address_id = 215
WHERE staff_id = 16;
UPDATE Staff
SET address_id = 216
WHERE staff_id = 17;
UPDATE Staff
SET address_id = 217
WHERE staff_id = 18;
UPDATE Staff
SET address_id = 218
WHERE staff_id = 19;
UPDATE Staff
SET address_id = 219
WHERE staff_id = 20;
UPDATE Staff
SET address_id = 220
WHERE staff_id = 21;
UPDATE Staff
SET address_id = 221
WHERE staff_id = 22;
UPDATE Staff
SET address_id = 222
WHERE staff_id = 23;
UPDATE Staff
SET address_id = 223
WHERE staff_id = 24;
UPDATE Staff
SET address_id = 224
WHERE staff_id = 25;
UPDATE Staff
SET address_id = 225
WHERE staff_id = 26;
UPDATE Staff
SET address_id = 226
WHERE staff_id = 27;
UPDATE Staff
SET address_id = 227
WHERE staff_id = 28;
UPDATE Staff
SET address_id = 228
WHERE staff_id = 29;
UPDATE Staff
SET address_id = 229
WHERE staff_id = 30;
UPDATE Staff
SET address_id = 230
WHERE staff_id = 31;
UPDATE Staff
SET address_id = 231
WHERE staff_id = 32;
UPDATE Staff
SET address_id = 232
WHERE staff_id = 33;
UPDATE Staff
SET address_id = 233
WHERE staff_id = 34;
UPDATE Staff
SET address_id = 234
WHERE staff_id = 35;
UPDATE Staff
SET address_id = 235
WHERE staff_id = 36;
UPDATE Staff
SET address_id = 236
WHERE staff_id = 37;
UPDATE Staff
SET address_id = 237
WHERE staff_id = 38;
UPDATE Staff
SET address_id = 238
WHERE staff_id = 39;
UPDATE Staff
SET address_id = 239
WHERE staff_id = 40;

--Branch Table Updated
UPDATE Branch
SET manager_id = 1
WHERE branch_id = 20;
UPDATE Branch
SET manager_id = 9
WHERE branch_id = 21;
UPDATE Branch
SET manager_id = 17
WHERE branch_id = 22;
UPDATE Branch
SET manager_id = 25
WHERE branch_id = 23;
UPDATE Branch
SET manager_id = 33
WHERE branch_id = 24;
select * from address;

--Customers Table
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Ester', 'Acevedo', 240);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Ivette', 'Estes', 241);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lezlie', 'Lamb', 242);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Cassie', 'Cline', 243);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Jamaal', 'Morrison', 244);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Ernest', 'Rollins', 245);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Florrie','Little', 246);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lee', 'Dunn', 247);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Son', 'Warner', 248);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Macie', 'Ayers', 249);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Merrie', 'Fowler', 250);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Elana', 'Miles', 251);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Nicola', 'Knight', 252);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Zona', 'Cameron', 253);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Mark', 'Benton', 254);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Tayna', 'Wade', 255);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lorrie', 'Justice', 256);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Carola', 'Johns', 257);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Mikel', 'Wilkerson', 258);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Londa', 'Gould', 259);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Justina', 'Jenkins', 260);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lashunda', 'Cole', 261);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Dollie', 'Cervantes', 262);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Tempie', 'Jacobson', 263);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Edris', 'Barrett', 264);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Kelsey', 'Noble', 265);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lurlene', 'Cotton', 266);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Penni', 'Best', 267);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Jasper', 'Castro', 268);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Miranda', 'Kennedy', 269);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Harold', 'O''connor', 270);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Sonja', 'Walls', 271);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Ophelia', 'Decker', 272);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Adrien', 'Hunter', 273);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Shanda', 'Stevenson', 274);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lurlene', 'Finch', 275);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Lamar', 'Bush', 276);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Eleanor', 'Mendez', 277);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Hugh', 'Craft', 278);
INSERT INTO Customers (cust_firstname, cust_lastname, address_id)
VALUES ('Farrah', 'Orr', 279);

--Products Table
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP003', 'Brake Pads', 101, NULL, 12, 63);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP004', 'Brake Pads', 101, NULL, 14, 72);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP002', 'Brake Pads', 101, NULL, 10, 52);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP005', 'Brake Pads', 101, NULL, 16, 78);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP001', 'Brake Pads', 101, NULL, 8, 47);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP006', 'Brake Pads', 101, NULL, 20, 85);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('BP007', 'Brake Pads', 101, NULL, 22, 100);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('SA001', 'Shock Absorber', 101, NULL, 20, 150);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('SA002', 'Shock Absorber', 101, NULL, 24, 150);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('SA003', 'Shock Absorber', 101, NULL, 28, 180);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('SA004', 'Shock Absorber', 101, NULL, 32, 185);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('SA005', 'Shock Absorber', 101, NULL, 36, 205);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('CB001', 'Rear Caliper Brakes', 101, NULL, 16, 105);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('CB002', 'Rear Caliper Brakes', 101, NULL, 22, 125);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('CB003', 'Front Caliper Brakes', 101, NULL, 16, 100);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('CB004', 'Front Caliper Brakes', 101, NULL, 22, 115);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY001', 'Tyre', 101, 2017, 14, 55 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY002', 'Tyre', 101, 2017, 15, 65 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY003', 'Tyre', 101, 2017, 16, 70 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY004', 'Tyre', 101, 2017, 18, 85 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY005', 'Tyre', 101, 2017, 20, 90 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY006', 'Tyre', 101, 2017, 22, 95 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY007', 'Tyre', 101, 2017, 24, 110 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY008', 'Tyre', 101, 2017, 26, 115 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY009', 'Tyre', 101, 2017, 28, 125 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('TY010', 'Tyre', 101, 2017, 32, 135 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('FD16MTG001', 'Ford Mustang', 104, 2016, NULL, 76000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('FD12MTG002', 'Ford Mustang', 107, 2012, NULL, 52000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('FD18FCS003', 'Ford Focus', 102, 2018, NULL, 85000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_size, product_unit_price)
VALUES ('FD16FCS004', 'Ford Focus', 105, 2016, NULL, 67000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('FD14FCS005', 'Ford Focus', 107, 2014, 38000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CH12CMR001', 'Chevrolet Camaro', 104, 2012, 67000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CH14CMR002', 'Chevrolet Camaro', 106, 2014, 75000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CH14SLV003', 'Chevrolet Silverado', 112, 2014, 87000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CH16SLV004', 'Chevrolet Silverado', 112, 2016, 95000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CH18SLV005', 'Chevrolet Silverado', 112, 2018, 107000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY14CAM001', 'Toyota Camry', 109, 2014, 78000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY18CAM002', 'Toyota Camry', 109, 2018, 120000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY08CAM003', 'Toyota Camry', 102, 2008, 45000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY10CAM004', 'Toyota Camry', 102, 2010, 58000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY18COR005', 'Toyota Corolla', 109, 2018, 116000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY14COR006', 'Toyota Corolla', 107, 2014, 76000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY12COR007', 'Toyota Corolla', 107, 2012, 56000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY10COR008', 'Toyota Corolla', 102, 2010, 42000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY19COR009', 'Toyota Corolla', 109, 2019, 142000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY13HGH010', 'Toyota Highlander', 103, 2013, 88000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('TY17HGH011', 'Toyota Highlander', 103, 2017, 112000 );
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO08CIV001', 'Honda Civic', 107, 2008, 38000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO14CIV002', 'Honda Civic', 104, 2014, 68000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO18CIV003', 'Honda Civic', 102, 2018, 88000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO12ODY004', 'Honda Odyseey', 112, 2012, 72000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO08ODY005', 'Honda Odyseey', 112, 2008, 38000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HO18ODY006', 'Honda Odyseey', 112, 2018, 98000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CR08PTC001', 'Chrysler PT Cruiser', 109, 2008, 34000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CR10PTC002', 'Chrysler PT Cruiser', 109, 2010, 42000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CR12CAR003', 'Chrysler Caravan', 112, 2012, 58000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('CR16CAR004', 'Chrysler Caravan', 112, 2016, 67000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HY11ELA001', 'Hyundai Elantra', 109, 2011, 58000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HY14ELA002', 'Hyundai Elantra', 109, 2014, 71000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HY12SON003', 'Hyundai Sonata', 102, 2012, 63000);
INSERT INTO Products (product_id, product_name, category_id, product_year_model, product_unit_price)
VALUES ('HY16SON004', 'Hyundai Sonata', 102, 2016, 72000);