/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
     name varchar(20),date_of_birth date,
      escape_attempts INT, neutered boolean,
       weight_kg decimal(5,2)
    );

ALTER TABLE animals ADD species char(20);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name varchar(40),  
	age INT
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name varchar(40)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species
    FOREIGN KEY (species_id)
    REFERENCES species (id);
	
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners
    FOREIGN KEY (owner_id)
    REFERENCES owners(id);