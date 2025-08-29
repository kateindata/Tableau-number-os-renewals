WITH sub_times_cte AS (
    SELECT 
        user_id,
        MAX(subscription_renewal_amount) AS sub_times_per_user
    FROM purchases
    GROUP BY user_id
)
SELECT 
    sub_times_per_user,
    COUNT(user_id) AS count_users
FROM sub_times_cte
GROUP BY sub_times_per_user
ORDER BY sub_times_per_user;
