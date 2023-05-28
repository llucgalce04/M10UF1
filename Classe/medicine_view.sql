DROP VIEW IF EXISTS total_cost_medicines;
CREATE VIEW total_cost_medicines AS
SELECT treatments.id_medicine, 
COUNT(treatments.medicine) AS total_medicines,treatments.cost_production,
SUM(treatments.cost_production * COUNT(treatments.medicine)) AS total_cost
FROM medicines 
LEFT JOIN treatments on medicines.id_medicine = treatments.id_medicine 
GROUP BY treatments.id_medicine, treatments.cost_production;
