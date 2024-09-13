/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5; 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT DISTINCT employees.FirstName, employees.LastName, employees.EmployeeID, SUM(Sales.Quantity) AS QuantitySum
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY QuantitySum DESC
LIMIT 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.CategoryID = 2
OR categories.CategoryID = 8;
/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California
--You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS TotalSales, SUM(products.Price * sales.Quantity) AS TotalPrice
FROM sales
LEFT JOIN products
ON products.ProductID = sales.ProductID
WHERE sales.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.ProductID = 857
AND reviews.Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sales.Quantity
FROM ((sales
INNER JOIN products ON sales.ProductID = products.ProductID)
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID)
ORDER BY employees.EmployeeID;