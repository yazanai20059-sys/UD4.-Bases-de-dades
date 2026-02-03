use Ejercicio7;
select distinct Count(LINIATIQUET.ID) 
from LINIATIQUET, TIQUET, Vendedor
where TIQUET.id= LINIATIQUET.TIQUET_id and TIQUET.Vendedor_id=Vendedor.id and Vendedor.nom like "%o";