# Tableau: [Number of renewals](https://public.tableau.com/views/purchases_17563007346520/Insightsdescription?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
**Case study for Junior Data Science Economics role in Mornhouse company**

Output a mini-table in Tableau with 2 columns: 
Number of renewals & Number of users who have made a given number of rebills.
For example:
- 5 rebills - quantity of users
- 6 rebills - quantity of users
  
  Explanations:
- 0 - subscription with trial
- 1 - subscription without trial

**Dataset**:
[dataset](https://docs.google.com/spreadsheets/d/1mAP0_Noi8f9-Ha4et5TlksabocHsPtUM7EalYH5xX_o/edit?gid=0#gid=0)

## SQL Solution

The easiest way to preview the expected result is to use the **SQL query**: [num_of_ren_SQL_syntax.sql](num_of_ren_SQL_syntax.sql)

This query calculates how many times each user has renewed their subscription and then summarizes the results into a distribution table:
- First, it finds the maximum renewal count per user (so each user appears only once with their highest subscription_renewal_amount).
- Then, it groups users by that renewal count and counts how many users fall into each group.
- The final output shows how many users renewed 0 times, 1 time, 2 times, and so on.:

<img width="201" height="444" alt="image" src="https://github.com/user-attachments/assets/4df11cff-b33a-42c4-92c8-ba2080bd190a" />

## Tableau Solution
This was my first time using **Tableau Public** — a nice experience and learning a new tool is always a challenge for me.

So, first I registered on the website [Tableau Public](https://public.tableau.com/app/discover), learned [How-To Videos](https://public.tableau.com/app/learn/how-to-videos) and started working. 

Create a calculated field - the equivalent of **SQL** → `MAX(subscription_renewal_amount) GROUP BY user_id }`: go to Data → Right-click → Create Calculated Field. Name it something like Max Renewal per User and enter the formula  → `FIXED [user_id] : MAX([subscription_renewal_amount])`, click **OK**.

Fix **user_id** to make Tableau group by `user_id`.  
In Tableau, you don’t write `GROUP BY` directly. Instead, you use an **LOD expression** (Level of Detail expression).  
The syntax `{ FIXED [user_id] : MAX([subscription_renewal_amount]) }` is Tableau’s way of telling it to group by `user_id` before aggregating.  
This field will show each user’s highest `subscription_renewal_amount` value.

- **Convert `Max Renewal per User` to Dimension** → ensures Tableau groups by this field (like `GROUP BY user_id` in SQL)  
- **Convert it to Discrete** → ensures Tableau displays the values as distinct categories rather than a continuous axis.

Drag `user_id` to Text (or Columns): Right-click → Measure → Count (Distinct) to count unique users.

And we are almost finished.

Make sure your table has two columns:
- `Max Renewal per User` (0, 1, 2, …)
- `Count Distinct of user_id` (number of users at each renewal level)
- Rename column `Max Renewal per User` to `Number of renewals`
- Edit tooltips for better readability
- If needed, apply Sort → Ascending to order the rows.

<img width="201" height="563" alt="image" src="https://github.com/user-attachments/assets/228e078f-947b-4fef-a1a7-f221fec65522" />


<img width="371" height="141" alt="image" src="https://github.com/user-attachments/assets/6c6b857a-8033-4e96-a333-55e0e2a9a5c1" />

**And it is DONE!**

## And the main thing  -  Insights

This analysis groups users by how many times they renewed their subscription, providing a clear view of retention patterns and revenue distribution. By examining these renewal levels, we can assess how effectively the trial converts users, identify where revenue is concentrated, and uncover opportunities to improve the subscription model.
- **User retention after trial**
  
  A high number of users with 0 renewals indicates that the trial did not convert most users into paying customers. This suggests potential improvements in onboarding, trial experience, or the pricing of the subscription after the trial period.
- **Revenue concentration**
  
  Most of the revenue likely comes from the fraction of users who renew multiple times. Targeting these loyal users for retention campaigns could be highly efficient. The company earns more profit from users who have multiple renewals than from users who only renewed once. Even though there are fewer of these highly loyal users, their repeated payments generate a larger share of total revenue. This indicates that long-term retention is much more valuable than simply acquiring new users or first-time renewals.
- **Subscription model effectiveness**
  
  If very few users renew multiple times, it may be necessary to review the subscription price, billing cycle, or overall value proposition. Conversely, if many users renew at least once, the trial is effective at converting. In this dataset, however, a large number of users do not renew the subscription, which suggests that the current trial conditions are not working as the company expects.
- **Potential interventions**
  
  Introduce incentives for the first renewal, such as discounts or reminder emails. Analyze the characteristics of users who renew multiple times to identify patterns and inform targeted retention strategies.

  **Link:** [**Number of renewals**](https://public.tableau.com/views/purchases_17563007346520/Insightsdescription?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)



### Thank you for reviewing my work!  

### I welcome any feedback or suggestions to improve this analysis.
