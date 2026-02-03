use Ejercici4;
select Polissa.Numero, Tipupolissa.nom, client.id, client.nom, client.cognom
from Polissa, Tipupolissa, client
where client.id=Polissa.client_id 
and Tipupolissa.id=Polissa.Tipupolissa_ID 
and Tipupolissa.nom like "auto";
