
--  Zomato data analysis

-- ==========================================================================================
-- 			Table creation 
-- ==========================================================================================

create database practice_zomato_db;

create table customers(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(80),
    reg_date date
);

create table restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    opening_hours varchar(55)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
	order_item varchar(55),
    order_date date,
	order_status varchar(55),
    total_amount float
);

CREATE TABLE riders (
    rider_id INT PRIMARY KEY,
    rider_name VARCHAR(80),
    sign_up date
); 

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    rider_id INT,
    delivery_status varchar(50),
    delivery_time TIME,
	constraint fk_orders foreign key (order_id) references orders(order_id) ,
	constraint fk_riders foreign key (rider_id) references riders(rider_id) 
);

-- ==========================================================================================
		--    Inserting values in tables
-- ==========================================================================================

-- 1. INSERT 30 CUSTOMERS
INSERT INTO customers (customer_id, customer_name, reg_date) VALUES
(1, 'Anish Chand', '2023-01-15'),
(2, 'Priya Sharma', '2023-01-18'),
(3, 'Rahul Verma', '2023-02-03'),
(4, 'Sneha Gupta', '2023-02-10'),
(5, 'Aman Singh', '2023-02-20'),
(6, 'Neha Kapoor', '2023-03-10'),
(7, 'Rohan Malhotra', '2023-03-12'),
(8, 'Kavya Reddy', '2023-03-18'),
(9, 'Vikram Patel', '2023-04-05'),
(10, 'Ishita Mehta', '2023-04-15'),
(11, 'Arjun Desai', '2023-05-02'),
(12, 'Pooja Nair', '2023-05-10'),
(13, 'Siddharth Joshi', '2023-05-22'),
(14, 'Tanya Agarwal', '2023-06-01'),
(15, 'Rishi Khanna', '2023-06-08'),
(16, 'Meera Iyer', '2023-06-20'),
(17, 'Karan Bhatia', '2023-07-03'),
(18, 'Diya Thakur', '2023-07-15'),
(19, 'Yash Mishra', '2023-07-25'),
(20, 'Zara Khan', '2023-08-05'),
(21, 'Aarav Jain', '2023-08-12'),
(22, 'Bhavya Rao', '2023-08-20'),
(23, 'Chetan Goel', '2023-09-01'),
(24, 'Divya Sen', '2023-09-10'),
(25, 'Esha Malhotra', '2023-09-18'),
(26, 'Faisal Ahmed', '2023-10-02'),
(27, 'Gauri Pandey', '2023-10-15'),
(28, 'Harsh Vardhan', '2023-11-01'),
(29, 'Ishaani Roy', '2023-11-12'),
(30, 'Jatin Chopra', '2023-11-25');

-- ==========================================================================================

-- 2. INSERT 30 RESTAURANTS
INSERT INTO restaurants (restaurant_id, restaurant_name, city, opening_hours) VALUES
(101, 'Punjabi Tadka', 'Delhi', '11:00 AM - 11:00 PM'),
(102, 'South Indian Cafe', 'Bangalore', '7:00 AM - 10:30 PM'),
(103, 'Pizza Paradise', 'Mumbai', '12:00 PM - 12:00 AM'),
(104, 'Chinese Wok Express', 'Delhi', '11:30 AM - 11:30 PM'),
(105, 'Burger Singh', 'Delhi', '11:00 AM - 1:00 AM'),
(106, 'Dosa Plaza', 'Bangalore', '8:00 AM - 10:00 PM'),
(107, 'The Biryani House', 'Hyderabad', '12:00 PM - 11:00 PM'),
(108, 'Kathi Junction', 'Delhi', '11:00 AM - 11:00 PM'),
(109, 'Sagar Ratna', 'Delhi', '8:00 AM - 10:30 PM'),
(110, 'Haldirams', 'Delhi', '10:00 AM - 10:00 PM'),
(111, 'Baskin Robbins', 'Mumbai', '11:00 AM - 11:00 PM'),
(112, 'Domino''s Pizza', 'Bangalore', '11:00 AM - 11:00 PM'),
(113, 'KFC', 'Delhi', '11:00 AM - 11:00 PM'),
(114, 'McDonald''s', 'Mumbai', '10:00 AM - 12:00 AM'),
(115, 'Cafe Coffee Day', 'Bangalore', '9:00 AM - 11:00 PM'),
(116, 'Goli Vada Pav', 'Mumbai', '10:00 AM - 10:00 PM'),
(117, 'Wow! Momo', 'Kolkata', '12:00 PM - 10:00 PM'),
(118, 'Behrouz Biryani', 'Delhi', '12:00 PM - 1:00 AM'),
(119, 'Faasos', 'Pune', '11:00 AM - 1:00 AM'),
(120, 'Oven Story Pizza', 'Mumbai', '12:00 PM - 1:00 AM'),
(121, 'The Belgian Waffle', 'Delhi', '11:00 AM - 11:00 PM'),
(122, 'Natural Ice Cream', 'Mumbai', '10:00 AM - 12:00 AM'),
(123, 'Chai Point', 'Bangalore', '7:00 AM - 11:00 PM'),
(124, 'Giani''s', 'Delhi', '11:00 AM - 11:00 PM'),
(125, 'Mad Over Donuts', 'Mumbai', '11:00 AM - 11:00 PM'),
(126, 'Rolls Mania', 'Pune', '12:00 PM - 11:00 PM'),
(127, 'Subway', 'Delhi', '9:00 AM - 11:00 PM'),
(128, 'Starbucks', 'Bangalore', '8:00 AM - 11:00 PM'),
(129, 'Barbeque Nation', 'Delhi', '12:00 PM - 11:00 PM'),
(130, 'Paradise Biryani', 'Hyderabad', '11:00 AM - 11:00 PM');

-- ==========================================================================================

-- 3. INSERT 30 RIDERS
INSERT INTO riders (rider_id, rider_name, sign_up) VALUES
(501, 'Vikram Singh', '2023-02-10'),
(502, 'Amit Kumar', '2023-02-15'),
(503, 'Rohit Yadav', '2023-02-20'),
(504, 'Suresh Raina', '2023-03-01'),
(505, 'Mahesh Babu', '2023-03-08'),
(506, 'Deepak Sharma', '2023-03-15'),
(507, 'Rajesh Mehta', '2023-04-02'),
(508, 'Anil Kapoor', '2023-04-10'),
(509, 'Sunil Gowda', '2023-04-18'),
(510, 'Praveen Nair', '2023-05-05'),
(511, 'Kiran Desai', '2023-05-12'),
(512, 'Manoj Tiwari', '2023-05-20'),
(513, 'Naveen Reddy', '2023-06-01'),
(514, 'Omar Farooq', '2023-06-10'),
(515, 'Puneet Raj', '2023-06-18'),
(516, 'Qasim Ali', '2023-07-03'),
(517, 'Raman Gill', '2023-07-12'),
(518, 'Sanjay Dutt', '2023-07-20'),
(519, 'Tarun Malhotra', '2023-08-01'),
(520, 'Umesh Patil', '2023-08-10'),
(521, 'Vijay Sethi', '2023-08-18'),
(522, 'Wasim Akram', '2023-09-02'),
(523, 'Xavier Thomas', '2023-09-10'),
(524, 'Yogesh Rao', '2023-09-20'),
(525, 'Zaheer Khan', '2023-10-01'),
(526, 'Arshad Warsi', '2023-10-10'),
(527, 'Boman Irani', '2023-10-18'),
(528, 'Chirag Jain', '2023-11-01'),
(529, 'Dinesh Karthik', '2023-11-10'),
(530, 'Eshan Khattar', '2023-11-20');

-- ==========================================================================================

-- 4. INSERT 30 ORDERS
INSERT INTO orders (order_id, customer_id, restaurant_id, order_item, order_date, order_status, total_amount) VALUES
(1001, 1, 101, 'Butter Chicken + Naan', '2024-01-05', 'Delivered', 850.00),
(1002, 2, 102, 'Masala Dosa + Filter Coffee', '2024-01-06', 'Delivered', 320.00),
(1003, 3, 103, 'Margherita Pizza Large', '2024-01-07', 'Delivered', 699.00),
(1004, 1, 104, 'Hakka Noodles + Chilli Chicken', '2024-01-08', 'Delivered', 580.00),
(1005, 4, 105, 'Big Crunch Burger Combo', '2024-01-09', 'Delivered', 450.00),
(1006, 5, 109, 'South Indian Thali', '2024-01-10', 'Delivered', 420.00),
(1007, 6, 112, 'Pepperoni Pizza + Coke', '2024-01-11', 'Delivered', 799.00),
(1008, 7, 118, 'Lucknowi Chicken Biryani', '2024-01-12', 'Delivered', 950.00),
(1009, 8, 121, 'Chocolate Waffle + Cold Coffee', '2024-01-13', 'Delivered', 380.00),
(1010, 9, 127, 'Veg Sub + Cookie', '2024-01-14', 'Delivered', 399.00),
(1011, 10, 101, 'Paneer Lababdar + Lachha Paratha', '2024-01-15', 'Delivered', 720.00),
(1012, 11, 103, 'Farmhouse Pizza + Garlic Bread', '2024-01-16', 'Delivered', 899.00),
(1013, 12, 107, 'Hyderabadi Mutton Biryani', '2024-01-17', 'Delivered', 1100.00),
(1014, 13, 115, 'Cappuccino + Sandwich', '2024-01-18', 'Delivered', 350.00),
(1015, 14, 105, 'Maharaja Mac + Fries', '2024-01-19', 'Delivered', 499.00),
(1016, 15, 102, 'Idli Vada Combo', '2024-01-20', 'Delivered', 280.00),
(1017, 16, 117, 'Chicken Steam Momo (8pc)', '2024-01-21', 'Delivered', 320.00),
(1018, 17, 129, 'BBQ Buffet (Non-Veg)', '2024-01-22', 'Delivered', 1499.00),
(1019, 18, 111, 'Death by Chocolate Ice Cream', '2024-01-23', 'Delivered', 480.00),
(1020, 19, 113, 'Zinger Burger Meal', '2024-01-24', 'Delivered', 549.00),
(1021, 20, 101, 'Dal Makhani + Jeera Rice', '2024-01-25', 'Delivered', 650.00),
(1022, 21, 103, 'Cheese Burst Pizza', '2024-01-26', 'Delivered', 999.00),
(1023, 22, 118, 'Veg Galouti Kebab + Biryani', '2024-01-27', 'Delivered', 890.00),
(1024, 23, 121, 'KitKat Waffle', '2024-01-28', 'Delivered', 410.00),
(1025, 24, 127, 'Chicken Tandoori Sub', '2024-01-29', 'Delivered', 479.00),
(1026, 25, 102, 'Mysore Masala Dosa', '2024-01-30', 'Delivered', 340.00),
(1027, 26, 117, 'Pan Fried Momo + Thupka', '2024-01-31', 'Delivered', 450.00),
(1028, 27, 129, 'Barbeque Nation Buffet', '2024-02-01', 'Delivered', 1599.00),
(1029, 28, 105, 'Veg Whopper Combo', '2024-02-02', 'Delivered', 479.00),
(1030, 29, 101, 'Shahi Paneer + Butter Naan', '2024-02-03', 'Delivered', 780.00);

-- ==========================================================================================

-- 5. INSERT 30 DELIVERIES
INSERT INTO deliveries (delivery_id, order_id, rider_id, delivery_status, delivery_time) VALUES
(2001, 1001, 501, 'Delivered', '00:35:00'),
(2002, 1002, 502, 'Delivered', '00:28:00'),
(2003, 1003, 503, 'Delivered', '00:42:00'),
(2004, 1004, 501, 'Delivered', '00:38:00'),
(2005, 1005, 504, 'Delivered', '00:25:00'),
(2006, 1006, 505, 'Delivered', '00:30:00'),
(2007, 1007, 506, 'Delivered', '00:45:00'),
(2008, 1008, 507, 'Delivered', '00:52:00'),
(2009, 1009, 508, 'Delivered', '00:22:00'),
(2010, 1010, 509, 'Delivered', '00:29:00'),
(2011, 1011, 501, 'Delivered', '00:40:00'),
(2012, 1012, 503, 'Delivered', '00:48:00'),
(2013, 1013, 510, 'Delivered', '00:55:00'),
(2014, 1014, 511, 'Delivered', '00:26:00'),
(2015, 1015, 504, 'Delivered', '00:33:00'),
(2016, 1016, 502, 'Delivered', '00:27:00'),
(2017, 1017, 512, 'Delivered', '00:31:00'),
(2018, 1018, 513, 'Delivered', '01:10:00'),
(2019, 1019, 514, 'Delivered', '00:24:00'),
(2020, 1020, 515, 'Delivered', '00:36:00'),
(2021, 1021, 501, 'Delivered', '00:41:00'),
(2022, 1022, 503, 'Delivered', '00:50:00'),
(2023, 1023, 516, 'Delivered', '00:58:00'),
(2024, 1024, 517, 'Delivered', '00:23:00'),
(2025, 1025, 518, 'Delivered', '00:37:00'),
(2026, 1026, 502, 'Delivered', '00:30:00'),
(2027, 1027, 519, 'Delivered', '00:35:00'),
(2028, 1028, 520, 'Delivered', '01:15:00'),
(2029, 1029, 504, 'Delivered', '00:32:00'),
(2030, 1030, 501, 'Delivered', '00:44:00');

-- ==========================================================================================

--  adding fk constraints

alter table orders
add constraint fk_customers
foreign key (customer_id)
references customers(customer_id) 

alter table orders
add constraint fk_restaurants
foreign key (restaurant_id)
references restaurants(restaurant_id) 






