UPDATE LIKE_COMMENTS
SET 
   COMMENT_NO = ?
 , LIKE_CLASS = ?
 , INSERT_USER = ?
 , INSERT_DATETIME = ?
 , UPDATE_USER = ?
 , UPDATE_DATETIME = ?
 , DELETE_FLAG = ?
WHERE 
NO = ?
;
