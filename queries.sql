/*Queries that provide answers to the questions from all projects.*/

/*Find all animals whose name ends in "mon"*/
SELECT * FROM animals WHERE name LIKE '%mon';

/*List the name of all animals born between 2016 and 2019*/
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/*List the name of all animals that are neutered and have less than 3 escape attempts*/
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts < 3;

/*List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth FROM animals WHERE name IN ('Pikachu','Agumon');

/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/
SELECT * FROM animals WHERE neutered=TRUE;

/*Find all animals not named Gabumon.*/
SELECT * FROM animals WHERE name!='Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Transactions */

/*1*/
/*Inside a transaction update the animals table by setting the species column to unspecified*/
BEGIN;
UPDATE animals SET species = 'unspecified';

/*Roll back the change*/
ROLLBACK;
/*Verify that the species columns went back to the state before the transaction*/
SELECT * FROM animals;

/*2*/
/*Inside a transaction*/
BEGIN;
/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon*/
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set*/
UPDATE animals SET species = 'pokemon' WHERE species = '';
/*Commit the transaction.*/
COMMIT;
/*Verify that changes persist after commit.*/
SELECT * FROM animals;

/*3*/
/*Inside a transaction delete all records in the animals table, then roll back the transaction*/
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*4*/
/*Inside a transaction:*/
BEGIN;
/*Delete all animals born after Jan 1st, 2022.*/
DELETE FROM animals WHERE date_of_birth IN (SELECT date_of_birth WHERE date_of_birth > '2022-01-01');
/*Create a savepoint for the transaction.*/
SAVEPOINT delete_date;
/*Update all animals' weight to be their weight multiplied by -1.*/
UPDATE animals SET weight_kg = weight_kg * -1;
/*Rollback to the savepoint*/
ROLLBACK TO SAVEPOINT delete_date;
/*Update all animals' weights that are negative to be their weight multiplied by -1.*/
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
/*Commit transaction.*/
COMMIT;

/*5*/
/*How many animals are there?*/
SELECT COUNT(*) from animals;
/*How many animals have never tried to escape?*/
SELECT COUNT(*) from animals WHERE escape_attempts=0;
/*What is the average weight of animals?*/
SELECT AVG(weight_kg)::NUMERIC(10,2) As avg_weight from animals;
/*Who escapes the most, neutered or not neutered animals?*/
SELECT SUM(escape_attempts) AS escape_attempts,neutered from animals GROUP BY neutered;
/*What is the minimum and maximum weight of each type of animal?*/
SELECT MIN(weight_kg) AS minimum_weight,MAX(weight_kg) as max_weight,species from animals GROUP BY species;
/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT MIN(weight_kg) AS min_weight,MAX(weight_kg) as max_weight,species from animals GROUP BY species;


