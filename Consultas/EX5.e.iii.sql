use Ejercicio5;
select *
from CITA, CLIENT, TipusVeicles, VEHICLE
where CITA.VEHICLE_id = VEHICLE_id 
and CLIENT_id = VEHICLE.CLIENT_id
and TipusVeicles_id = VEHICLE.TipusVeicles_id;