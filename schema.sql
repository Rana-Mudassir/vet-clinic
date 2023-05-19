/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id SERIAL PRIMARY KEY, name varchar(20),date_of_birth date, escape_attempts INT, neutered boolean, weight_kg decimal(5,2));
ALTER TABLE animals ADD species char(20);