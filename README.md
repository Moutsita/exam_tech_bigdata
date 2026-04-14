# Clonage du dépôt en ligne
''' bash
git clone https://github.com/Moutsita/exam_tech_bigdata.git
'''

# Récupération des mises à jour sur la branche principale
''' bash
git pull origin main
'''

# Lancement du programme
''' bash
docker-compose up -d --build
'''
# Arrêt du programme
''' bash
docker-compose down
'''

# Initialistion de dbt et cr&ation des dépôts
''' bash
docker exec -it airflow_exam bash -c "cd /opt/airflow/dbt && dbt init exam_tech_bigdata"
'''
