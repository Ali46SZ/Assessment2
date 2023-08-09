SELECT A.*, u.username
From [User] u
    JOIN
    (SELECT td.user_id AS user_id, td.training_id,
    COUNT (td.user_training_id) AS count_training,
    td.training_date as training_date
    FROM Training_details td
    GROUP BY td.training_id, td.user_id, td.training_date
    HAVING COUNT (td.user_training_id) > 1 ) A
ON (u.user_id = A.user_id)
ORDER BY training_date DESC