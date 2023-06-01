# database-project-Ankon0048
database-project-Ankon0048 created by GitHub Classroom
Rental Management
# README

This is a README file providing an overview of the database structure and queries used in the project.

## Database Diagram
![](https://github.com/DatabaseSystem19/database-project-Ankon0048/blob/main/db_Schema.jpg)

## Database Overview
The database consists of several tables that store information related to users, items, transactions, admins, and user history. Here's a brief description of each table:

- `users`: Stores user information such as user ID, name, gender, email, phone, and password.
- `items`: Contains details about different items including item number, title, category, publisher, year of publication, floor, and shelf number.
- `transactions`: Tracks the transactions made by users, including the transaction ID, user ID, item number, borrow date, and return date.
- `admin`: Stores information about admin users, including the admin ID, user ID, role, and transaction ID.
- `user_history`: Maintains the history of user transactions, including the item number, user ID, fine amount, and transaction ID.

## SQL Queries

The project includes several SQL queries that demonstrate various operations and functionalities of the database. Here are some examples:

- Data retrieval queries: The initial queries retrieve information from tables such as `user_tables`, `users`, `items`, `transactions`, `admin`, and `user_history`.
- DDL queries: These queries demonstrate altering table structure by adding, modifying, renaming, and dropping columns in the `users` table.
- DML queries: The provided DML queries illustrate inserting, updating, and deleting rows from the `users` table.
- Various select queries: These queries showcase filtering, and joining data from different tables using different conditions.
- Set membership queries: These queries demonstrate the usage of `AND`, `OR`, `EXISTS` and `ALL` operators in conjunction with subqueries.
- Aggregation queries: These queries utilize aggregate functions such as `COUNT`, `AVG`, `SUM`, `MIN`, and `MAX` to retrieve statistical information from the database.
- PL/SQL examples: The PL/SQL queries demonstrate variable declarations, printing values, row type usage, cursor usage, IF-ELSE statements, functions, and procedures.

## PL/SQL Examples

The provided PL/SQL queries showcase the usage of PL/SQL programming constructs and features. Some examples include:

- Variable declaration and printing values.
- Inserting data into tables using variables and default values.
- Row type usage for fetching data into variables.
- Cursor usage to fetch data from a table and process it.
- Array usage with the `EXTEND` function to populate and modify an array.
- IF-ELSE statements to conditionally execute code based on specific conditions.
- Function creation and usage to retrieve the count of transactions for a user.
- Procedure creation and usage to update the email address for a user.

Please note that these are just a few examples, and the project may contain more queries and functionalities.

## Conclusion

This README provides a brief summary of the database structure and queries used in the project. 
It showcases the tables, SQL queries, and PL/SQL examples to demonstrate different operations and functionalities of the database.

