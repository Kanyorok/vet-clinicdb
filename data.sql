/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', date '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Gabumon', date '2018-11-15', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Pikachu', date '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  VALUES ('Devimon', date '2017-05-12', 5, TRUE, 11);

/*Day Two Project*/
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', date '2020-02-08', 0, TRUE, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', date '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', date '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', date '2005-06-15', 1, TRUE, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', date '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', date '1998-10-13', 3, TRUE, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', date '2022-05-14', 4, TRUE, 22);

/*Day Three Project*/
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Digimon');
INSERT INTO species (name) VALUES('Pokemon');

/*Updates*/
UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

/**Day Four Projects*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, date '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, date '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, date '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, date '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), 1);
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 2);
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 1);
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), date '2020-05-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2020-07-22');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2021-02-02');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-01-05');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-03-08');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-05-14');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2021-05-04');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2021-02-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2019-12-21');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), date '2020-08-10');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2021-04-07');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2019-09-29');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2020-10-03');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2020-11-04');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2019-01-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2019-05-15');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-02-27');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-08-03');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2020-05-24');
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), date '2021-01-11');

/* Day one performance*/
INSERT INTO visits (animals_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) select 'owner' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';