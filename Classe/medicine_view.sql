drop view IF exists profit_medicine;
create view profit_medicine as select treatments.id_medicine,
COUNT(medicine) medicines, cost,
SUM(cost) total_cost_production, price,
SUM(price) total_cost_sell from medicines LEFT JOIN
treatments on medicines.id_medicine=treatments.id_medicine group
by cost;

