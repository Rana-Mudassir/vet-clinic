/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Agumon', '2020/2/3', 0, 10.23, true);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Gabumon', '2018/11/15', 2, 8, true);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Pikachu', '2021/1/7', 1, 15.04, false);
INSERT INTO animals (name, date_of_birth, escape_attempts, weight_kg, neutered)
 VALUES ('Devimon', '2017/5/12', 5, 11, true);
ALTER TABLE animals ADD species char(20);

-- INSERT New Data
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)  
VALUES ('Charmander', '2020/2/8', 0,false, -11), ('Plantmon', '2021/11/15', 2, true, -5.7),
('Squirtle', '1993/4/2', 3, false, -12.13), ('Angemon', '2005/6/12', 1, true, -45), ('Boarmon', '2005/6/7', 7, true, 20.4),
('Blossom', '1998/10/13', 3, true, 17), ('Ditto', '2022/5/14', 4, true, 22);
