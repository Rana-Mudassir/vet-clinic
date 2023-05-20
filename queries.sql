/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT name , escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
SELECT * FROM animals WHERE neutered = 't';

-- Day 3 Queries Below

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

SELECT a.id, a.name AS animal_name
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT animal_id) AS animal_count
FROM visits
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

SELECT v.name AS vet_name, sp.name AS specialty_name
FROM vets AS v
LEFT JOIN specializations AS s ON v.id = s.vet_id
LEFT JOIN species AS sp ON s.species_id = sp.id;

SELECT a.name AS animal_name
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez'
AND v.visit_date >= '2020-04-01'
AND v.visit_date <= '2020-08-30';


SELECT a.name AS animal_name, COUNT(*) AS visit_count
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
GROUP BY a.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.animal_id
JOIN vets AS ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.name AS animal_name, v.visit_date, ve.name AS vet_name
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS ve ON v.vet_id = ve.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS unmatch_specialty_count
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS ve ON v.vet_id = ve.id
LEFT JOIN specializations AS s ON ve.id = s.vet_id AND a.species_id = s.species_id
WHERE s.species_id IS NULL;

SELECT s.id, s.name AS species_name, COUNT(*) AS species_gets_most
FROM visits AS v
JOIN animals AS a ON v.animal_id = a.id
JOIN vets AS ve ON v.vet_id = ve.id
JOIN species AS s ON a.species_id = s.id
WHERE ve.name = 'Maisy Smith'
GROUP BY s.id, s.name
ORDER BY species_gets_most DESC
LIMIT 1;
