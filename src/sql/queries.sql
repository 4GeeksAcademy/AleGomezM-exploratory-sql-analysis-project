SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


SELECT 
    regions.name,
    COUNT(DISTINCT species.id) AS cantidad_especies
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name
ORDER BY cantidad_especies DESC LIMIT 10;

SELECT 
    strftime('%m', observations.observation_date) AS mes,
    COUNT(*) AS registros_mes
FROM observations
GROUP BY mes
ORDER BY registros_mes DESC ;

SELECT
    species.common_name,
    SUM(observations.count) AS conteo
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.common_name
HAVING conteo <1
ORDER BY conteo ASC;

SELECT
    regions.name,
    COUNT(observations.region_id) AS observaciones_region
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY region_id
ORDER BY observaciones_region DESC LIMIT 3;

SELECT
    species.common_name,
    COUNT(*) AS cantidad_observaciones
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species_id
ORDER BY cantidad_observaciones DESC LIMIT 12;

SELECT 
    observations.observer,
    COUNT(*) AS cantidad_registros
FROM observations
GROUP BY observations.observer
ORDER BY cantidad_registros DESC LIMIT 12;

SELECT
    DISTINCT species.common_name
FROM species
LEFT JOIN  observations ON species.id = observations.species_id
WHERE observations.species_id IS NULL;


