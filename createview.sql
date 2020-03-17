CREATE VIEW earningsView AS
   SELECT M.movieID, CASE
						WHEN EXISTS (SELECT *
							FROM Showings S, Tickets T
							WHERE S.movieID=M.movieID AND
								  S.theaterID=T.theaterID AND
								  S.showingDate=T.showingDate AND
                                  S.startTime=T.startTime)  
						THEN (SELECT SUM(T1.ticketPrice)
                            FROM Showings S1, Tickets T1
                            WHERE S1.movieID=M.movieID AND
                                  S1.theaterID=T1.theaterID AND
                                  S1.showingDate=T1.showingDate AND
                                  S1.startTime=T1.startTime)
						ELSE 0
					  END AS computedEarnings	
   FROM Movies M
   GROUP BY M.movieID;
