SELECT U.USER_FNAME OWNER_FNAME,U.USER_LNAME OWNER_LNAME,COUNT(VILLA_ID) VILLA_COUNT
FROM USER1 U JOIN VILLA V ON U.USER_ID=V.OWNER_ID
GROUP BY V.OWNER_ID,U.USER_FNAME,U.USER_LNAME
ORDER BY COUNT(VILLA_ID);