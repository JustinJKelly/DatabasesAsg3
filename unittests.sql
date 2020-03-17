--FOREIGN KEY Constraints(will produce error)
INSERT INTO Tickets(theaterID,seatNum,showingDate,startTime,customerID,ticketPrice) VALUES (111,3,'2019-09-29','11:00:00',1,8.50);

INSERT INTO Tickets(theaterID,seatNum,showingDate,startTime,customerID,ticketPrice) VALUES (111,4,'2018-06-24','11:00:00',24,8.50);

INSERT INTO Tickets(theaterID,seatNum,showingDate,startTime,customerID,ticketPrice) VALUES (111,5,'2018-06-24','11:00:00',1,8.50);


--General Constraints(One good and one error)
UPDATE Tickets
SET ticketPrice=10.50
WHERE startTime>='19:00:00';

UPDATE Tickets
SET ticketPrice=-10.50
WHERE startTime>='19:00:00';



UPDATE Customers
SET joinDate=DATE '2016-10-20'
WHERE name LIKE '%Duck';

UPDATE Customers
SET joinDate=DATE '2014-10-20'
WHERE name LIKE '%Pitt';



UPDATE Showings
SET movieID=NULL
WHERE movieID=101;

UPDATE Showings
SET movieID=101,priceCode=NULL
WHERE movieID=102;
