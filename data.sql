/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Agumon', '2020/2/3', 0, 10.23, true);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Gabumon', '2018/11/15', 2, 8, true);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Pikachu', '2021/1/7', 1, 15.04, false);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Devimon', '2017/5/12', 5, 11, true);

-- INSERT New Data
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Charmander', '2020/2/8', 0,false, -11), ('Plantmon', '2021/11/15', 2, true, -5.7),
('Squirtle', '1993/4/2', 3, false, -12.13), ('Angemon', '2005/6/12', 1, true, -45), ('Boarmon', '2005/6/7', 7, true, 20.4),
('Blossom', '1998/10/13', 3, true, 17), ('Ditto', '2022/5/14', 4, true, 22);

INSERT INTO species (name) VALUES('Pokemon'),('Digimon');

INSERT INTO owners (full_name, age)  
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), 
('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE (name = 'Gabumon') OR (name = 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE (name = 'Devimon') OR (name = 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE (name = 'Angemon') OR (name = 'Boarmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE (name = 'Charmander') OR (name = 'Squirtle') OR (name = 'Blossom');