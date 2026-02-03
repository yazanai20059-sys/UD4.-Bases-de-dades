use Ejercicio6;
SELECT PASAJERO.nom as "Pasajer", VOL.NumVol as "VOL", DATEDIFF(VOL.FechaLlegada, VOL.FechaSalida) as "VOL_anada-i-Turnada"
FROM PASAJERO, RESERVA, VOL
WHERE PASAJERO.DNI_Telefono = RESERVA.DNI_Telefono
  AND RESERVA.NumVol = VOL.NumVol;
