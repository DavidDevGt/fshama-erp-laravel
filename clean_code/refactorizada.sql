-- Employee Role Table
CREATE TABLE employee_role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Permission Table
CREATE TABLE permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Roles and Permissions Intermediate Table
CREATE TABLE role_permission (
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    PRIMARY KEY (role_id, permission_id)
);

-- User Table
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    role_id INT,
    active TINYINT (1) DEFAULT 1
);

-- Category Table
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Product Brand Table
CREATE TABLE product_brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Measurement Unit Table
CREATE TABLE measurement_unit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Supplier Table
CREATE TABLE supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    tax_id VARCHAR(20),
    credit_days INT DEFAULT 0,
    sales_rep_name VARCHAR(255),
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Product Table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(500),
    purchase_price DECIMAL(10, 2) NOT NULL,
    sale_price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    brand_id INT,
    measurement_unit_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Supplier Invoice Table
CREATE TABLE supplier_invoice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    invoice_number VARCHAR(50) NOT NULL,
    invoice_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    pending_balance DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(255),
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Supplier Invoice Detail Table
CREATE TABLE supplier_invoice_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL,
    brand_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Client Type Table
CREATE TABLE client_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR (255) NOT UNIQUE,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Departments Table
CREATE TABLE department (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (255) NOT UNIQUE,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Municipalities Table
CREATE TABLE municipality (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT,
    name VARCHAR (255) NOT UNIQUE,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Villages Table
CREATE TABLE village (
    id INT AUTO_INCREMENT PRIMARY KEY,
    municipality_id INT,
    name VARCHAR (255) NOT UNIQUE,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Clients Table
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tax_id VARCHAR (15) UNIQUE,
    name VARCHAR (255) NOT NULL,
    surname VARCHAR (255) NOT NULL,
    billing_address TEXT NOT NULL,
    shipping_address TEXT NOT WHAT,
    village_id INT, 
    municipality_id INT, 
    department_id INT, 
    country VARCHAR (255) DEFAULT 'Guatemala',
    phone VARCHAR (25),
    phone2 VARCHAR (25),
    email VARCHAR (255) UNIQUE,
    client_type_id INT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Branches Table
CREATE TABLE branch (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    branch_tax_id VARCHAR (15),
    branch_name VARCHAR (255) NOT NULL,
    branch_address TEXT NOT NULL,
    branch_city VARCHAR (255),
    branch_department VARCHAR (255),
    branch_phone VARCHAR (20),
    branch_email VARCHAR (255),
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT CURRENT_TIMESTAMP
);

-- Employees Table
CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    surname VARCHAR (255),
    address TEXT,
    phone VARCHAR (20) NOT WHAT,
    email VARCHAR (255) UNIQUE,
    hiring_date DATETIME NOT NULL,
    role_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT CURRENT_TIMESTAMP
);

-- Shipping Method Table
CREATE TABLE shipping_method (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    estimated_time VARCHAR(255),
    cost DECIMAL(10, 2),
    remarks TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Order Table
CREATE TABLE order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    branch_id INT,
    billing_address TEXT NOT NULL,
    shipping_address TEXT NOT NULL,
    order_date DATETIME NOT NULL,
    estimated_delivery_date DATETIME,
    total DECIMAL(10, 2) NOT NULL,
    status INT NOT NULL DEFAULT 1,
    shipping_method_id INT,
    order_remarks TEXT,
    created_by_user_id INT,
    order_created_date DATETIME,
    authorized_by_user_id INT,
    order_authorized_date DATETIME,
    invoiced_by_user_id INT,
    order_invoiced_date DATETIME,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Order Details Table
CREATE TABLE order_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    unidad_medida_id INT,
    brand_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Invoice Table
CREATE TABLE invoice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    client_id INT NOT NULL,
    invoice_date DATETIME NOT NULL,
    fel_signing_date DATETIME,
    series VARCHAR(10),
    invoice_number INT,
    authorization VARCHAR(255),
    tax_id VARCHAR(45),
    is_tax_id INT NOT NULL,
    name VARCHAR(200),
    total DECIMAL(10, 2) NOT NULL,
    remarks TEXT,
    status INT NOT NULL DEFAULT 1,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Invoice Details Table
CREATE TABLE invoice_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    unidad_medida_id INT,
    brand_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Purchase Order Status Table
CREATE TABLE purchase_order_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);

-- Purchase Order Table
CREATE TABLE purchase_order (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    purchase_order_status_id INT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Purchase Order Details Table
CREATE TABLE purchase_order_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL
);

-- Discount Table
CREATE TABLE discount (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Payment Method Table
CREATE TABLE payment_method (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Supplier Payment Table
CREATE TABLE supplier_payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    supplier_invoice_id INT NOT NULL,
    paid_amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method_id INT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inventory Movement Table
CREATE TABLE inventory_movement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    type ENUM('Entrada', 'Salida') NOT NULL,
    movement_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reason TEXT,
    purchase_order_id INT DEFAULT NULL,
    invoice_id INT DEFAULT NULL,
    adjustment_id INT DEFAULT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inventory Entry Table
CREATE TABLE inventory_entry (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    entrydate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    purchase_order_id INT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inventory Exit Table
CREATE TABLE inventory_exit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    exit_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reason TEXT NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inventory Adjustment Table
CREATE TABLE inventory_adjustment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    adjustment_quantity INT NOT NULL,
    adjustment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reason TEXT NOT NULL,
    type ENUM('Entrada', 'Salida') NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Price History Table
CREATE TABLE price_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    previous_purchase_price DECIMAL(10, 2),
    previous_sale_price DECIMAL(10, 2),
    change_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Wholesale Unit Table
CREATE TABLE wholesale_unit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    unit_quantity INT NOT NULL,
    product_id INT NOT NULL,
    purchase_date DATETIME NOT NULL,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Logistics and Shipping Table
CREATE TABLE logistics_shipping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    agency_name VARCHAR(255) NOT NULL,
    estimated_shipping_time VARCHAR(255),
    cost DECIMAL(10, 2),
    remarks TEXT,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Warehouse Table
CREATE TABLE warehouse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    address TEXT,
    city VARCHAR(255),
    department VARCHAR(255),
    country VARCHAR(255) DEFAULT 'Guatemala',
    phone VARCHAR(20),
    maximum_capacity DECIMAL(10, 2),
    current_capacity DECIMAL(10, 2) DEFAULT 0,
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP
);

-- Product Location in Warehouse Table
CREATE TABLE product_location (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    quantity DECIMAL(10, 2) NOT NULL,
    shelf VARCHAR(50),
    row VARCHAR(50),
    column VARCHAR(50),
    active TINYINT (1) DEFAULT 1,
    creation_date TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    modification_date TIMESTAMP DEFAULT CURRENT TIMESTAMP ON UPDATE CURRENT TIMESTAMP
);