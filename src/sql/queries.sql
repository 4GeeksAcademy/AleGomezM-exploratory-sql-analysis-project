SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC LIMIT 7;

SELECT 
    strftime('%m', observations.observation_date) AS month,
    COUNT(observations.observation_date) AS total_meses
FROM observations
GROUP BY month
ORDER BY total_meses DESC;





