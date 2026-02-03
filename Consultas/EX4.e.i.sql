use Ejercici4;
select count(*) as "Num Polissa"
from client , Polissa 
where client. id=Polissa.client_id and client.Nom Like "%Edgar";