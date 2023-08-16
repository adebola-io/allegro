from Source.Server.Database import get_db, app
from Source.Server.EmotionModel import EmotionModel


with app.app_context():
    db = get_db()
    emotion_model = EmotionModel()

    @app.route("/hello")
    def greet_user():
        return '<div>Hello, world!</div>'

    @app.route("/")
    def do_stuff_with_db():
        db = get_db()
        cursor = db.cursor()
        cursor.execute('SELECT User, Host from mysql.user;')
        return '<div>shisdhis</div>'
