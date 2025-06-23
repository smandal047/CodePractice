-- MySQL

# Write your MySQL query statement below
select product_id from Products
where lower(low_fats) = 'y' and lower(recyclable) = 'y'