Use Ejercicio7;
select TIQUET.numero_factura, TIQUET.data, TIQUET.hora, Vendedor.nom, Vendedor.Cognom, TIQUET.Total
from TIQUET, Vendedor, LINIATIQUET, PRODUCTE
where PRODUCTE.id=LINIATIQUET.PRODUCTE_id and TIQUET.id=LINIATIQUET.TIQUET_id and Vendedor.id=TIQUET.Vendedor_id and PRODUCTE.Nom like "%padro";