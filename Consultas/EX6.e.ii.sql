use Ejercicio6;
select distinct count(*)
from VOL, RESERVA
Where VUELO_id=RESERVA.VUELO_id;