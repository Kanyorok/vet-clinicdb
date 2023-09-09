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

CREATE TABLE owners (
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(255),
   age INT
);

CREATE TABLE species (
   id SERIAL PRIMARY KEY,
   name VARCHAR(100)
);

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);
