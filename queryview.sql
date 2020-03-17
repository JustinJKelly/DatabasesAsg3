SELECT M.rating AS rating,COUNT(*) as misreportCount
	  FROM earningsView E, Movies M
	  WHERE M.movieID=E.movieID AND
	        M.totalEarned<>E.computedEarnings AND
			2019 > ALL (SELECT M1.year
				 FROM Movies M1, earningsView E1
				 WHERE M1.movieId=E1.movieId AND
				       M1.totalEarned<>E1.computedEarnings AND
					   M1.rating=M.rating)
GROUP BY M.rating;
--Output: rating | misreportcount 
--       --------+----------------
--        G      |              2
--        P      |              1
--       (2 rows)

DELETE FROM Tickets
WHERE (theaterID=111 AND seatNum=1 AND showingDate='2009-06-23' AND startTime='11:00:00') OR (theaterID=444 AND seatNum=5 AND showingDate='2020-06-24' AND startTime='15:00:00');



SELECT M.rating AS rating,COUNT(*) as misreportCount
      FROM earningsView E, Movies M
      WHERE M.movieID=E.movieID AND
            M.totalEarned<>E.computedEarnings AND
            2019 > ALL (SELECT M1.year
                 FROM Movies M1, earningsView E1
                 WHERE M1.movieId=E1.movieId AND
                       M1.totalEarned<>E1.computedEarnings AND
                       M1.rating=M.rating)
GROUP BY M.rating;
--Output: rating | misreportcount 
--       --------+----------------
--        G      |              2
--       (1 row)





