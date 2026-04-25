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

### 6. Initialistion de dbt et création des dépôts
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

### 10. Redémarrage du projet après un arrêt
Si vous avez effectué un "docker compose down"; pour revenir à votre projet et recréer le fichier profiles.yml, suivre les étapes suivantes :
```bash
docker exec -it airflow_exam bash

cd /opt/airflow/dbt/exam_tech_bigdata

mkdir -p ~/.dbt/ && cat << EOF > ~/.dbt/profiles.yml
exam_tech_bigdata:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: [ton_id_snowflake]
      user: [ton_utilisateur]
      password: [ton_mot_de_passe]
      role: ACCOUNTADMIN
      database: BOOKSHOP
      warehouse: COMPUTE_WH
      schema: STAGGING
      threads: 4
EOF
```
Une fois exécutée, verifier la présence du script crée
```bash
cat ~/.dbt/profiles.yaml
```
Par la suite, vous pouvez lancer le débuggage de dbt
```bash
dbt debug
```
N.B: Le fichier profiles.yml étant éphémère, chaque fois que nous exécutons "docker compose down", il disparait aussi, c'est pourquoi afin 

### 11. Construction du projet et test final
```bash
dbt run # pour le test de verification du projet

dbt test # pour le test final

dbt clean # pour le nettoyage de tous les résidus
```

### 12. Visualisation du pipeline
```bash
dbt docs generate
dbt docs serve
```

### 13. SNOWFLAKE_CONN
Créer un fichier dans dags/config.py et insérer le script comme suit :
```bash
# dags/config.py

SNOWFLAKE_CONN = {
    'user': 'TON_UTILISATEUR',
    'password': 'TON_MOT_DE_PASSE',
    'account': 'TON_COMPTE_SNOWFLAKE',
    'warehouse': 'COMPUTE_WH',
    'database': 'BOOKSHOP_DB',
    'schema': 'PUBLIC',
    'role': 'ACCOUNTADMIN'
}
```
Ensuite l'insérer dans le fichier gitignore
N.B: Dans notre cas il est inséré, celà evite la fuite d'information personnelle et renforce la sécurité