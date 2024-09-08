# Recruitment Company Database
Course Project for ITCS 3160: Collaborated with a stakeholder from a mid-sized recruitment company to execute the design and implementation of a relational database in MySQL, devising a comprehensive data model to support business objectives. SQL scripting was also utilized to create database indexes and stored procedures, optimizing performance and improving data retrieval efficiency by 37%.

## Project Objectives
- [X] To create a robust and efficient MySQL client database
- [X] To design and create a database schema
- [X] To apply learning in a professional setting

## Getting Started

### Database Schema and Design

An Microsoft Excel spreadsheet was the basis for the database with the columns:
- LinkedIn
- FirstName
- LastName
- Position
- Company
- Industry
- Speciality
- City
- State

After normalization to Boyce-Codd Normal Form, the schema was converted into two database tables. The logical design is as follows:

### Data Migration Process

The order to create tables was CompanyIndustry then Employee, due to the foreign key in the Employee table. Then the data was loaded using SQL scripts from the Excel spreadsheet.

### Database Retrieval and Optimization

**Queries:** Three queries were created to test the database retrieval. 
1. Uses INNER JOIN to select employees with their industries.
2. Selects all employees who work at a specific company.
3. Displays the companies in each city with more than 2 employees.

**Stored Procedure:** Takes an integer as input to return the companies with more than *n* employees.

**View:** Not all employess have specialities, so this view shows only the employees who do have one.

**Indexing:** Three indexes were created on Employee (FirstName, LastName), Employee (Speciality), and Employee (City). After optimization, the physical runtimes for each of the three queries decreased.

Query 1: 0.0018 sec → 0.0010 sec

Query 2: 0.00072 sec → 0.00061 sec

Query 3: 0.0071 sec → 0.0035 sec


