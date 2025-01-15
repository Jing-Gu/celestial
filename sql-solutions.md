```bash
psql --username=freecodecamp --dbname=postgres;

CREATE DATABASE universe;

\c universe
```

```sql
CREATE TABLE summary(
	summary_id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL,
	description TEXT,
	source TEXT
);

CREATE TABLE galaxy (
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL,
	type VARCHAR(20),
	age_in_billion_years NUMERIC(5,2),
	has_life BOOLEAN
);

CREATE TABLE star (
	star_id SERIAL PRIMARY KEY,
	galaxy_id INT NOT NULL,
	name VARCHAR(20) UNIQUE NOT NULL,
	type VARCHAR(20),
	distance_from_earth_in_light_years INT,
	FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) ON DELETE CASCADE
);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	star_id INT NOT NULL,
	name VARCHAR(20) UNIQUE NOT NULL,
	type VARCHAR(20),
	material VARCHAR(50),
	diameter_km INT,
	distance_from_sun_au INT,
	distance_from_sun_km BIGINT,
	has_rings BOOLEAN,
	FOREIGN KEY (star_id) REFERENCES star(star_id) ON DELETE CASCADE
);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	planet_id INT NOT NULL,
	name VARCHAR(20) UNIQUE NOT NULL,
	material VARCHAR(50),
	diameter_km INT,
	is_habitable BOOLEAN,
	FOREIGN KEY (planet_id) REFERENCES planet(planet_id) ON DELETE CASCADE
);

INSERT INTO galaxy (name, type, age_in_billion_years, has_life) VALUES
('Milky Way', 'Spiral', 13.8, TRUE),
('Andromeda', 'Spiral', 10.0, FALSE),
('Triangulum', 'Spiral', 3.0, FALSE),
('Whirlpool', 'Spiral', 10.0, FALSE),
('Sombrero', 'Elliptical', 13.0, FALSE),
('Pinwheel', 'Spiral', 8.0, FALSE);

INSERT INTO star (galaxy_id, name, type, distance_from_earth_in_light_years) VALUES
(1, 'Sun', 'Main Sequence', 0),
(2, 'Alpheratz', 'Blue Giant', 2537000),
(3, 'Triangulum', 'White Dwarf', 3000000),
(4, 'Whirlpool A', 'Spiral', 23100000),
(5, 'Sombrero A', 'Elliptical', 28000000),
(6, 'Pinwheel A', 'Irregular', 21000000); 

INSERT INTO planet (star_id, name, type, material, diameter_km, distance_from_sun_au, distance_from_sun_km, has_rings) VALUES
(1, 'Mercury', 'Terrestrial', 'Rocky', 4879, 0.39, 57900000, FALSE),
(1, 'Venus', 'Terrestrial', 'Rocky', 12104, 0.72, 108200000, FALSE),
(1, 'Earth', 'Terrestrial', 'Rocky', 12742, 1.0, 149600000, FALSE),
(1, 'Mars', 'Terrestrial', 'Rocky', 6779, 1.52, 227900000, FALSE),
(2, 'Jupiter', 'Gas Giant', 'Gaseous', 139820, 5.2, 778500000, TRUE),
(2, 'Saturn', 'Gas Giant', 'Gaseous', 116460, 9.58, 1433500000, TRUE),
(3, 'Uranus', 'Ice Giant', 'Icy', 50724, 19.2, 2872500000, TRUE),
(3, 'Neptune', 'Ice Giant', 'Icy', 49244, 30.07, 4495100000, TRUE),
(4, 'Alpha Centauri Bb', 'Exoplanet', 'Rocky', 12000, 1.2, 180000000, FALSE),
(4, 'Proxima Centauri b', 'Exoplanet', 'Rocky', 11000, 0.5, 75000000, FALSE),
(5, 'Kepler-22b', 'Exoplanet', 'Rocky', 18000, 1.0, 150000000, FALSE),
(6, 'HD 209458 b', 'Hot Jupiter', 'Gaseous', 139000, 0.047, 7000000, TRUE);


UPDATE planet SET star_id = 1 WHERE name IN ('Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune');
UPDATE planet SET star_id = 2 WHERE name IN ('Alpha Centauri Bb', 'Proxima Centauri b');
UPDATE planet SET star_id = 3 WHERE name = 'Kepler-22b';


INSERT INTO moon (planet_id, name, material, diameter_km, is_habitable) VALUES
(3, 'Moon', 'Rocky', 3474, FALSE),
(4, 'Phobos', 'Rocky', 22.4, FALSE), 
(4, 'Deimos', 'Rocky', 12.4, FALSE), 
(5, 'Io', 'Volcanic', 3643, FALSE),
(5, 'Europa', 'Icy', 3121, TRUE), 
(5, 'Ganymede', 'Icy', 5262, TRUE), 
(5, 'Callisto', 'Icy', 4821, FALSE), 
(5, 'Leda', 'Rocky', 20, FALSE),
(5, 'Himalia', 'Rocky', 170, FALSE),
(5, 'Elara', 'Rocky', 86, FALSE),
(6, 'Iapetus', 'Icy', 1469, FALSE),
(6, 'Titan', 'Gaseous', 5150, TRUE), 
(6, 'Enceladus', 'Icy', 504, TRUE),
(6, 'Rhea', 'Icy', 1528, FALSE), 
(6, 'Mimas', 'Icy', 396, FALSE),
(7, 'Miranda', 'Rocky', 471.6, FALSE),
(7, 'Oberon', 'Rocky', 1522, FALSE),
(7, 'Titania', 'Rocky', 1578, FALSE),
(7, 'Umbriel', 'Rocky', 1170, FALSE); 
(8, 'Triton', 'Icy', 2706, FALSE);


INSERT INTO summary (name, description, source) VALUES
('galaxy', 'Galaxies consist of stars, planets, and vast clouds of gas and dust, all bound together by gravity.', 'nasa'),
('star', 'Stars are giant balls of hot gas – mostly hydrogen, with some helium and small amounts of other elements.', 'nasa'),
('planet', 'A plant is a celestial body that orbits a star. Planets are typically much smaller than stars and do not generate their own light. Instead, they reflect the light from their parent star.', 'chatgpt'),
('moon', 'A moon (also known as a satellite) is a natural celestial body that orbits a planet or a dwarf planet.', 'chatgpt');
```
