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
