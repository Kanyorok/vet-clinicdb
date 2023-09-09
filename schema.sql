/* Database schema to keep the structure of entire database. */
CREATE DATABASE Vet_Clinic;

 CREATE TABLE animals ( 
    id int, 
    name VARCHAR(100), 
    date_of_birth date, 
    escape_attempts int, 
    neutered boolean, 
    weight_kg decimal
    );

ALTER TABLE animals ADD COLUMN species VARCHAR(100);
    