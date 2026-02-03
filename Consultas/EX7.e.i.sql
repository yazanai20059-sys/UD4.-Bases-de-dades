use Ejercicio7;
select PRODUCTE.Nom, PRODUCTE.PreuUnitat
from PRODUCTE
where PRODUCTE.CodiBarres like "%1231313123" and PRODUCTE.iva Like "%21"
