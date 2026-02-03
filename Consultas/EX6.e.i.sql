use Ejercicio6;
select PASAJERO.DNI, PASAJERO.Nom, PASAJERO.cognom, VOL.NumVol, VOL.Origen, VOL.Desti, RESERVA.Importe_Total 
from PASAJERO, VOL, RESERVA
Where PASAJERO.id=RESERVA.PASAJERO_id and VOL.id=RESERVA.VUELO_id