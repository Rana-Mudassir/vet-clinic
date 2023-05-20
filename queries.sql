/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT name , escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
SELECT * FROM animals WHERE neutered = 't';

START TRANSACTION;
UPDATE animals 
SET species = 'unspecified'
ROLLBACK;

START TRANSACTION;
UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon'

UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL OR species = '';

START TRANSACTION;
DELETE FROM animals

ROLLBACK;

START TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022/1/1';

SAVEPOINT deletebyage;

UPDATE animals 
SET weight_kg = weight_kg * -1; 

ROLLBACK TO SAVEPOINT deletebyage;

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

SELECT COUNT(id) FROM animals; 

SELECT COUNT(id) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals

SELECT neutered, COUNT(*) AS escape_count
FROM animals
WHERE escape_attempts >= 0
GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990/1/1' AND '2000/12/31'
GROUP BY species;

SELECT full_name AS person_name, name AS animal_name
FROM owners
JOIN animals 
ON owners.id = animals.owner_id
WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')

SELECT A.name AS animal_name, S.name AS specie_name
FROM species S
JOIN animals A
ON S.id = A.species_id
WHERE S.id = (SELECT id FROM species WHERE name = 'Pokemon')

SELECT full_name AS person_name, name AS animal_name
FROM owners
LEFT JOIN animals 
ON owners.id = animals.owner_id

SELECT S.name AS specie_name, COUNT (A.id) AS total_animals
FROM species S
LEFT JOIN animals A
ON S.id = A.species_id
GROUP BY S.name;

SELECT full_name AS owner_name, animals.name AS animal_name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT full_name AS owner_name, animals.name AS animal_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT full_name AS owner_name, COUNT(owner_id) AS total_animals
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owner_name
ORDER BY COUNT(*) DESC 
LIMIT 1;