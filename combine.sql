--UPDATE Tickets
--SET SeatNum = NewTickets.SeatNum, Paid = FALSE
--FROM NewTickets
--WHERE Tickets.TicketID = NewTickets.TicketID
--      AND Tickets.CustID = NewTickets.CustID
--      AND Tickets.AirlineID = NewTickets.AirlineID
--      AND Tickets.FlightNum = NewTickets.FlightNum;

BEGIN TRANSACTION;

UPDATE Showings
SET movieID=M.movieID
FROM ModifyShowings M
WHERE Showings.theaterID=M.theaterID 
	  AND Showings.showingDate=M.showingDate
	  AND Showings.startTime=M.startTime;

INSERT INTO Showings
	SELECT M.theaterID, M.showingDate, M.startTime, M.movieID
	FROM ModifyShowings M
	WHERE (M.theaterID,M.showingDate,M.startTime) 
		  NOT IN (SELECT S.theaterID,S.showingDate,S.startTime
		            FROM Showings S);

COMMIT;	
		
