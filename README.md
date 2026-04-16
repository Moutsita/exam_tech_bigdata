### Clonage du dépôt en ligne
``` bash
git clone https://github.com/Moutsita/exam_tech_bigdata.git
```

### Récupération des mises à jour sur la branche principale
``` bash
git pull origin main
```

### Lancement du programme
``` bash
docker-compose up -d --build
```

### Arrêt du programme
``` bash
docker-compose down
```

### Accéder au password de Airflow
``` bash
docker logs airflow_exam | Select-String "login"
```

### Initialistion de dbt et cr&ation des dépôts
``` bash
docker exec -it airflow_exam bash -c "cd /opt/airflow/dbt && dbt init exam_tech_bigdata"
```

### Configuration du fichier ingestion_postres_to_snowflake
Remplacer les données du connecteur snowflake par celle du profiles.yml

NB : Attention, pour account la syntaxe est : 
``` bash
<identifiant>.<region>.<cloud>
```

### Configuration de Airflow en localhost:<port>
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

### A suivre ()