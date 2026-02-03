use Ejercicio5;
select CITA.DIA, CITA.Hora, CLIENT.NOM, VEHICLE.Marca, TipusVeicles.NOM
from CLIENT, VEHICLE, TipusVeicles, CITA
where CITA.VEHICLE_id = VEHICLE.id and CLIENT_id=VEHICLE.CLIENT_id
and TipusVeicles.id = VEHICLE.TipusVeicles_id 
and CITA.DIA > "10/5/2022";