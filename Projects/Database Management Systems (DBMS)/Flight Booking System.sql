CREATE DATABASE flights;

 USE  flights;
 
  
 CREATE TABLE available_flights(
 ID INT NOT NULL,
 FLIGHT_CODE VARCHAR(50) PRIMARY KEY,
 FROM_CITY VARCHAR (50),
 DESTINATION VARCHAR (50),
 TIME VARCHAR (50)
 );
 
 INSERT INTO available_flights(
 ID , FLIGHT_CODE , FROM_CITY, DESTINATION, TIME
 
 )VALUES 
 (1,	"AA123" , "New York" 	, "Los Angeles", 	"2024-06-21"), 
 (2	,"BA456"	,"London"	,"Paris"	,"2024-06-22" ),
(3,	"CA789"	,"Beijing"	,"Tokyo"	,"2024-06-23") ,
 (4 , 	"DA012" , 	"Sydney" ,	"Melbourne" ,	"2024-06-24"),
 (5,	"EA345", 	"Dubai" ,	"New York" ,	"2024-06-25"),
 (6	,"FA678"	,"Frankfurt"	,"Rome",	"2024-06-26"),
(7,	"GA901" ,"Singapore" ,	"Hong Kong",	"2024-06-27"),
(8	,"HA234"	,"Toronto"	,"Vancouver",	"2024-06-28"),
(9,	"AA567"	, "Mumbai"	, "Dubai"	,"2024-06-29"),
(10,	"JA890",	"Johannesburg"	,"Nairobi" ,	"2024-06-30");



 CREATE TABLE passengers_details(
 PASSENGER_ID INT NOT NULL, 
 NAME VARCHAR (50),
 CONTACT_NO BIGINT, 
 PAYMENT VARCHAR (50),
 FLIGHT_CODE_F VARCHAR(50),
 FOREIGN KEY (FLIGHT_CODE_F) REFERENCES available_flights (FLIGHT_CODE)
 -- FOREIGN KEY (NAME) REFERENCES flight_info (NAMES)
 ON UPDATE CASCADE
 ON DELETE CASCADE
 );
  

 
 INSERT INTO passengers_details (
 PASSENGER_ID, NAME, CONTACT_NO, PAYMENT
 ) Values( 1,	"John Doe"	,1234567890,	"Credit Card"),
(2,	"Jane Smith"	,2345678901	,"PayPal"),
(3,	'Michael Johnson'	,3456789012,	'Debit Card'),
(4	,'Emily Davis'	,4567890123	,'Credit Card'),
(5	,'Chris Brown'	,5678901234	,'Bank Transfer'),
(6	,'Jessica Miller'	,6789012345	,'PayPal'),
(7	,'Matthew Wilson'	,7890123456,	'Credit Card'),
(8	,'Laura Martinez'	,8901234567	,'Debit Card'),
(9	,'Daniel Anderson'	,9012345678	,'Bank Transfer'),
(10	,'Megan Taylor'	,0123456789	,'PayPal');
 
 
 CREATE TABLE flight_info(
 SEATS VARCHAR(50),
 NAMES VARCHAR(50),
 AVAILABLITY VARCHAR (50)
--  FOREIGN KEY (NAMES) references passengers_details (NAME)
 );
 

  INSERT INTO flight_info (
 SEATS, NAMES, AVAILABLITY
 )
 VALUES
 ("1A", "ISMAEEL SHAHBAZ", "BOOKED" ),
 ("1B", "AMNA NAVEED", "BOOKED" ),
 ("1C", "AGHA KAZIM ABBASS", "BOOKED" ),
  ("2A", " - ", "AVAILABLE" ),
  ("2B", " - ", "AVAILABLE" ),
  ("2C", " AYESHA REHAN ", "BOOKED" ),
  ("2D", " - ", "AVAILABLE" ),
  ("3A", " ROMA IRSHAD ", "BOOKED" ),
 ("3B", " MAHA LIAQAT ", "BOOKED" ),
 ("3C", " TAYYAB KHAN", "BOOKED" ),
 ("4A", " - ", "AVAILABLE" );



 CREATE TABLE booking_details(
 BOOKING_ID INT PRIMARY KEY,
 PASSENGER_ID VARCHAR(50),
 FLIGHT_CODE VARCHAR (50),
 BOOKING_DATE VARCHAR(50),
 
 FOREIGN KEY (FLIGHT_CODE) REFERENCES available_flights (FLIGHT_CODE)
--  FOREIGN KEY (BOOKING_DATE) REFERENCES available_flights (TIME),
--  FOREIGN KEY (PASSENGER_ID) REFERENCES passengers_details(name)
 ON UPDATE CASCADE
 ON DELETE CASCADE
 );
 
 
  INSERT INTO booking_details(
 BOOKING_ID, PASSENGER_ID, FLIGHT_CODE, BOOKING_DATE
 )
 VALUES
 (101,1,"HA234","2024-06-25"),
 (102,2,"JA890","2024-06-27"),
 (103,3,"DA012","2024-06-22"),
 (104,4,"DA012","2024-06-24"),
 (105,5,"FA678","2024-06-26"),
 (106,6,"HA234","2024-06-28"),
 (107,7,"EA345","2024-06-27"),
 (108,8,"JA890","2024-06-28");
 
