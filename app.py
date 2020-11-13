from flask import Flask, render_template, request
from connect import bd
import pandas as pd
from pandas import DataFrame
from IPython.display import HTML

app = Flask(__name__)

bd = bd()

@app.route('/')
def index():
    query = 'SELECT * FROM airlines'
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()
    return render_template('index.html', result=output)

@app.route('/question1')
def question1():
    question = 1
    query = 'SELECT * FROM airlines'
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()
    result = []
    for i in output:
        result.append(i)

    return render_template('index.html', result=result, question=question)


if __name__ == "__main__":
    app.run(debug=True)
