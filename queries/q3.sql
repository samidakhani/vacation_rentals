SELECT U.USER_FNAME,U.USER_LNAME
FROM USER1 U,RESERVATION R,COUPON C
WHERE U.USER_ID=R.USER_ID
AND R.COUPON_ID=C.COUPON_ID
AND C.COUPON_DISCOUNT > 10;