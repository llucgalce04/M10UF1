DROP VIEW IF EXISTS sum_cost_medicines;
CREATE VIEW sum_cost_medicines AS
SELECT SUM(total_coste) as sumatorio_total_coste
FROM coste_total_medicinas;
