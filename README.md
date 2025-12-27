# Woolf University. Relational Databases Course. Final Project

## Overview

This assignment involves creating a schema, normalizing data, performing aggregations, working with date functions, and building a custom SQL function for analytical processing.

---

## Task 1 – Schema Creation and Data Import

* Create a new schema "pandemic".
* Import the dataset **infectious_cases** using the import tool.
* Review the data to understand its structure.
* Note that attributes like `Entity` and `Code` repeat — these must be normalized.

---

## Task 2 – Data Normalization

* Normalize the table **infectious_cases** into **Third Normal Form (3NF)**.
* Split repetitive data into separate tables (for example, `entities` and `cases`).
* Keep both normalized tables in the same `pandemic` schema.
* Verify data load count:

  ```sql
  SELECT COUNT(*) FROM infectious_cases;
  ```

---

## Task 3 – Data Analysis

* For each unique **Entity** and **Code** (or their IDs), calculate:

  * **Average**,
  * **Minimum**,
  * **Maximum**,
  * **Sum** of `Number_rabies`.
* Exclude rows where `Number_rabies` is empty (`''`).
* Sort results by the calculated **average** in descending order.
* Limit the output to **10 rows**.

---

## Task 4 – Year Difference Column

Using built-in SQL date functions:

* Create a new attribute that forms the date **'YYYY-01-01'** from the column `Year`.
* Add an attribute representing the **current date**.
* Compute a third attribute showing the **difference in years** between these two dates.

---

## Task 5 – Custom Function

Create a function that:

* Accepts a **year value** as input.
* Constructs a date `'YYYY-01-01'`.
* Returns the **difference in years** between the current date and the constructed date.
