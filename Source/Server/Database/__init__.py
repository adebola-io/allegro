from dotenv import load_dotenv
from flask import g, Flask
from flask_sqlalchemy import SQLAlchemy
from typing import Any
import mysql.connector
from os import getenv


# Load environment variables.
load_dotenv()

app = Flask(__name__)
db = SQLAlchemy()

print(app.config.keys())
db.init_app(app)


def init_db():
    '''Function that creates a connection to the database.'''
    g.db = mysql.connector.connect(  # type: ignore
        user=getenv("PS_USERNAME"),
        password=getenv('PS_PASSWORD'),
        host=getenv('PS_HOST'),
        database=getenv('PS_DATABASE'),
        ssl_ca='./cacert.pem'
    )


def get_db() -> mysql.connector.MySQLConnection:
    '''Function that returns the global database connection.'''
    if 'db' not in g:
        init_db()
    return g.db  # type: ignore


@app.teardown_appcontext
def closedb(_: Any):
    '''Close database.'''

    # Check if there is a connection in the global variable g
    if 'db' in g:
        # If yes, close the connection and remove it from g
        g.db.close()
        g.pop('db')


def get_tracks_by_emotion(emotion_id: int, length: int):
    pass
