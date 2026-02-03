use Ejercici4;
select *
from client, Polissa, Tipupolissa, venedor
where client_id = Polissa.client_id 
and venedor_id = Polissa.venedor_id 
and Tipupolissa_ID = Polissa.Tipupolissa_ID;