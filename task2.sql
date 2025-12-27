-- Task 2: Normalize to 3NF

USE pandemic;

-- Create normalized table for entities (countries/regions)
CREATE TABLE IF NOT EXISTS entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_name VARCHAR(255) NOT NULL,
    code VARCHAR(10) NOT NULL,
    UNIQUE KEY unique_entity_code (entity_name, code)
);

-- Insert unique entities
INSERT INTO entities (entity_name, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases

-- Create normalized cases table
CREATE TABLE IF NOT EXISTS cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    year INT NOT NULL,
    number_yaws DECIMAL(15,6),
    polio_cases INT,
    cases_guinea_worm INT,
    number_rabies DECIMAL(15,6),
    number_malaria DECIMAL(15,6),
    number_hiv DECIMAL(15,6),
    number_tuberculosis DECIMAL(15,6),
    number_smallpox DECIMAL(15,6),
    number_cholera_cases INT,
    FOREIGN KEY (entity_id) REFERENCES entities(id),
    INDEX idx_entity_year (entity_id, year)
);

-- Insert data into normalized cases table
INSERT INTO cases (
    entity_id, 
    year, 
    number_yaws, 
    polio_cases, 
    cases_guinea_worm, 
    number_rabies, 
    number_malaria, 
    number_hiv, 
    number_tuberculosis, 
    number_smallpox, 
    number_cholera_cases
)
SELECT 
    e.id,
    ic.Year,
    ic.Number_yaws,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.Number_rabies,
    ic.Number_malaria,
    ic.Number_hiv,
    ic.Number_tuberculosis,
    ic.Number_smallpox,
    ic.Number_cholera_cases
FROM infectious_cases ic
JOIN entities e ON ic.Entity = e.entity_name AND ic.Code = e.code;

-- Verify record count
SELECT COUNT(*) FROM cases;