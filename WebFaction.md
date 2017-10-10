# WebFaction virtualenv exclude project packages
Adding the following empty file inside the virtualenv directory in your WebFaction python project forces pip to exclude global python packages i.e. Django

```bash
touch $VENV_PATH/lib/$PYTHON/sitecustomize.py
```

