Use Ejercicio6;
select PASAJERO.Nom, PASAJERO.cognom, RESERVA.id, RESERVA.Importe_Total
from PASAJERO, RESERVA, VOL
where PASAJERO.id=RESERVA.PASAJERO_id and VOL.id = RESERVA.VUELO_id and VOL.FechaSalida like "2002-22-2";