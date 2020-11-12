from flask import Flask, render_template, request
from connect import bd
import pandas as pd

app = Flask(__name__)

bd = bd()

@app.route('/')
def index():
    query = 'SELECT * FROM airlines'
    result = bd.connect(query)
    return render_template('index.html', result=result)

if __name__ == "__main__":
    app.run(debug=True)
