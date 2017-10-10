#Django project update automation script
#!/usr/bin/env bash
VENV_HOME=/path/to/venv
SASS_FOLDERS=("sass1" "sass2")
echo "Activating virtual environment..."
source $VENV_HOME/bin/activate
echo "Pulling from master..."
git pull origin master
echo "Installing requirements..."
pip install -r requirements.txt
echo "Making migrations..."
python manage.py migrate
echo "Collecting static content..."
python3 manage.py collectstatic --noinput
echo "Compiling coffeescript files..."
coffee -c static/
echo "Compiling sass files..."
for sass_folder in ${SASS_FOLDERS[@]}
do
    sass --update static/${sass_folder}/sass:static/${sass_folder}/css
done


