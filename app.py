# Импорты
from flask import Flask, render_template, request
from flask_socketio import SocketIO
from datetime import datetime
from time import sleep

app = Flask(__name__)
socketio = SocketIO(app, cors_allowed_origins="*", async_mode='eventlet')  # изменено с 'gevent' на 'eventlet'

# Хранилище истории сообщений
message_history = []

@app.route('/')
def index():
    return render_template('index.html')

# Подключение
@socketio.on('connect')
def handle_connect():
    # Логирование
    print(f'Client connected: {request.sid}')

# Отключение
@socketio.on('disconnect')
def handle_disconnect():
    # Логирование
    print(f'Client disconnected: {request.sid}')

# Вход в чат
@socketio.on('join_room')
def handle_join_room(data):
    username = data.get('username', 'Гость')
    room = data.get('room', 'main_chat')
    socketio.emit('status', {'msg': f'{username} присоединился к чату'}, room=room)
    sleep(0.1)
    socketio.emit('message_history', message_history, to=request.sid)
    # Логирование
    print(f'{username} успешно вошёл в чат {room}')

# Отправка сообщений
@socketio.on('send_message')
def handle_send_message(data):
    username = data['username']
    text = data['text']
    timestamp = datetime.now().strftime('%H:%M')
    message = {
        'username': username,
        'text': text,
        'timestamp': timestamp
    }
    message_history.append(message)
    # Логирование
    print(f'Сообщение добавлено в историю: {message}')
    socketio.emit('new_message', message, room=data.get('room', 'main_chat'))
    # Логирование
    print('Отправляем new_message всем в комнате')

# Мейн
if __name__ == '__main__':
    socketio.run(app, use_reloader=False)
