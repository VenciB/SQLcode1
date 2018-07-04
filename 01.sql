select person.FirstName, person.LastName, posts.PostText, count(comments.ID_comment) AS NumOfComments
FROM person JOIN posts 
ON person.ID_person = posts.ID_person
JOIN comments
ON posts.ID_post = comments.ID_post
WHERE comments.CommentDate > ( CURDATE() - INTERVAL 14 DAY )
GROUP BY posts.ID_post
ORDER BY NumOfComments DESC
LIMIT 1; 