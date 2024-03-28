from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/browse', methods=['POST'])
def browse():
    url = request.form['url']
    try:
        response = requests.get(url)
        return response.content
    except Exception as e:
        return str(e)

if __name__ == '__main__':
    app.run(debug=True)
