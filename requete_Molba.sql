-- 1:Obtenir la liste des 10 villes les plus peuplées en 2012--
select villes.ville_nom_reel,villes.ville_population_2012  from villes
order by villes.ville_population_2012 desc limit 10;

-- 2:Obtenir la liste des 50 villes ayant la plus faible superficie--
select villes.ville_nom_reel,villes.ville_surface  from villes
order by villes.ville_surface  asc  limit 50;

-- 3:Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
select  departement.departement_code, departement_nom  from departement
where departement.departement_code like'97%';

-- 4: Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé --
select villes.ville_nom_reel as VILLE,villes.ville_population_2012 as POPULATION, departement.departement_nom as DEPARTEMENT from villes
inner join departement on departement_code = villes.ville_departement 
order by villes.ville_population_2012 desc limit 10;

-- 5: Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, 
--en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes--
select departement.departement_code ,departement.departement_nom as DEPARTEMENT, count(villes.ville_departement) as NOMBRE_VILLE  from villes
inner join departement on departement_code =villes.ville_departement
group by departement_nom,departement_code 
order by nombre_ville desc;

-- 6: Obtenir la liste des 10 plus grands départements, en terme de superficie---
select departement.departement_code ,departement.departement_nom as DEPARTEMENT, sum(villes.ville_surface)  as superficie_departement  from villes
inner join departement on departement_code =villes.ville_departement
group by departement_nom,departement_code 
order by superficie_departement  desc
limit 10;

-- 7: Compter le nombre de villes dont le nom commence par “Saint”---
select count(villes.ville_nom)as ville_saint from villes 
where villes.ville_nom_simple  like 'saint%';


-- 8: Obtenir la liste des villes qui ont un nom existants plusieurs fois, 
-- et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes---
SELECT * FROM (select villes.ville_commune  ,villes.ville_nom , count(villes.ville_nom)as NBRE from villes 
group by ville_nom, villes.ville_commune) WHERE nbre > 1 
order by nbre desc 

-- 9: Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne--
select villes.ville_nom_reel, villes.ville_surface  from villes
where villes.ville_surface > (select avg(villes.ville_surface) from villes);

-- 10: Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
select departement.departement_code as code,departement.departement_nom as DEPARTEMENT, (villes.ville_population_2010+villes.ville_population_1999+villes.ville_population_2012)  as POPULATION  from villes
inner join departement on departement_code =villes.ville_departement
where (villes.ville_population_2010+villes.ville_population_1999+villes.ville_population_2012) >2000000
group by departement,code,population

-- 11: Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” 
--(dans la colonne qui contient les noms en majuscule)---
select replace(ville_saint,'-',' ') from (select villes.ville_nom as ville_saint from villes 
where villes.ville_nom  like 'SAINT%')





