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

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(255),
    age INT,
    date_of_graduation date
)

CREATE TABLE specializations (
	vet_id INT REFERENCES vets(id),
	species_id INT REFERENCES species(id),
	PRIMARY KEY (vet_id, species_id )
)

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date date
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX idx_visits_animal_id ON visits (animal_id);

CREATE INDEX idx_visits_vet_id ON visits (vet_id);

CREATE INDEX owners_email_asc ON owners (email ASC)
