SELECT USER_FNAME,USER_LNAME
FROM( SELECT RESERVATION.USER_ID,USER1.USER_FNAME,USER1.USER_LNAME,SUM(RESERVATION_DEPOSIT) SUM_DEPOSIT
      FROM RESERVATION,USER1
      WHERE RESERVATION.USER_ID=USER1.USER_ID 
      AND EXTRACT( YEAR FROM TO_DATE(RESERVATION_EDATE,'dd-MM-RRRR'))=2013 
      GROUP BY RESERVATION.USER_ID,USER1.USER_FNAME,USER1.USER_LNAME
      ORDER BY SUM_DEPOSIT DESC) MAX_RES 
WHERE ROWNUM < 4;