SELECT FAMOUS_USER.USER_ID ,USER1.USER_FNAME ,USER1.USER_LNAME
FROM 
(SELECT MAX_LIKES_FOR_EACH_REVIEW.USER_ID,COUNT(*) NO_VILLA_FAMOUS
FROM 
(SELECT REVIEW.VILLA_ID,MAX(NO_LIKES.LIKES) MAX_LIKES
 FROM REVIEW  JOIN (SELECT REVIEW_ID,COUNT(*) LIKES
                    FROM LIKEREVIEW
                    GROUP BY REVIEW_ID) NO_LIKES ON REVIEW.REVIEW_ID=NO_LIKES.REVIEW_ID
 GROUP BY REVIEW.VILLA_ID) MAX_LIKES_FOR_ALL_REVIEW, 
 (SELECT REVIEW.USER_ID,REVIEW.VILLA_ID,NO_LIKES.LIKES MAX_LIKES
      FROM REVIEW  JOIN (SELECT REVIEW_ID,COUNT(*) LIKES
                         FROM LIKEREVIEW
                         GROUP BY REVIEW_ID) NO_LIKES ON REVIEW.REVIEW_ID=NO_LIKES.REVIEW_ID) MAX_LIKES_FOR_EACH_REVIEW
WHERE MAX_LIKES_FOR_ALL_REVIEW.VILLA_ID=MAX_LIKES_FOR_EACH_REVIEW.VILLA_ID 
  AND MAX_LIKES_FOR_ALL_REVIEW.MAX_LIKES=MAX_LIKES_FOR_EACH_REVIEW.MAX_LIKES 
GROUP BY  MAX_LIKES_FOR_EACH_REVIEW.USER_ID
ORDER BY  NO_VILLA_FAMOUS DESC)  FAMOUS_USER,USER1                       
WHERE  FAMOUS_USER.USER_ID=USER1.USER_ID
AND ROWNUM=1;