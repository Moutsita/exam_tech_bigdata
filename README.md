### 1. Clonage du dépôt en ligne
``` bash
git clone https://github.com/Moutsita/exam_tech_bigdata.git
```

### 2. Récupération des mises à jour sur la branche principale
``` bash
git pull origin main
```

### 3. Lancement du programme
``` bash
docker-compose up -d --build
```

### 4. Arrêt du programme
``` bash
docker-compose down
```

### 5. Accéder au password de Airflow
``` bash
docker logs airflow_exam | Select-String "login"
```

### 6. Initialistion de dbt et cr&ation des dépôts
``` bash
docker exec -it airflow_exam bash -c "cd /opt/airflow/dbt && dbt init exam_tech_bigdata"
```
En tapant cette commande ci-dessus, il vous demandera de faire les configurations nécessaires pour communiquer avec snowflake
Verification du fonctionnement de "dbt"
```bash
docker exec -it airflow_exam bash

cd /opt/airflow/dbt/exam_tech_bigdata

dbt debug
```
NB: Il renverra un message :
```bash
 "All checks passed !"
```
Celle ci permet de vérifier si la configuration est OK
Le fichier profiles.yml est uniquement généré dans le container, pour des raisons de sécurité.


### 7. Configuration du fichier ingestion_postres_to_snowflake
Remplacer les données du connecteur snowflake par celle du profiles.yml

NB : Attention, pour account la syntaxe est : 
``` bash
<identifiant>.<region>.<cloud>
```

### 8. Configuration de Airflow en localhost:<port>
Ici notre port de communication du container est 8080; Voici les configurations une fois à l'intérieur :
- Clique sur Admin ensuite connections
- Recherche postgres_default et insère les valeurs suivantes (elles sont relatives à notre container) :

``` bash
-- - Conn Id: postgres_default
-- - Conn Type : Postgres
-- - Host: postgres_bookshop
-- - DB: bookshop
-- - User: user
-- - Password: password
-- - Port: 5432
```
- Vous pouvez à présent lancer le dag d'ingestion

### 9. Vérification du fonctionnement de dbt
a. Créer les dossier manquant dans le container

```bash
docker exec -u root airflow_exam mkdir -p /home/airflow/.dbt
```
b. Déplacer le fichier au bon endroit
```bash
docker exec -u root airflow_exam mv /opt/airflow/dbt/profiles.yml /home/airflow/.dbt/profiles.yml

docker exec -u root airflow_exam chown airflow:airflow /home/airflow/.dbt/profiles.yml
```

### 10. 