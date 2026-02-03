use Ejercicio6;
select AVION.Modelo, AVION.Capacidad, AVION.Fabricant, VOL.Origen, VOL.Desti, VOL.FechaLlegada, VOL.FechaSalida
from AVION, VOL
Where AVION.id=VOL.AVION_id and AVION.Fabricant like "%Avionesmanolo";