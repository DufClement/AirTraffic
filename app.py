from flask import Flask, render_template, request
from connect import bd
import pandas as pd
from pandas import DataFrame
from IPython.display import HTML

app = Flask(__name__)

bd = bd()

@app.route('/')
def index():
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

@app.route('/question2')
def question2():
    question = 2
    query = "SELECT COUNT(DISTINCT faa) AS 'Nombre aéroports' FROM airports;"
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()

    query2 = "SELECT COUNT(DISTINCT carrier) AS 'Nombre de compagnies' FROM airlines;"
    cursor.execute(query2)
    output2 = cursor.fetchall()

    query3 = "SELECT COUNT(DISTINCT distance) AS 'Nombre de destinations' FROM flights;"
    cursor.execute(query3)
    output3 = cursor.fetchall()

    query4 = "SELECT COUNT(DISTINCT tailnum) AS 'Nombre avions' FROM flights;"
    cursor.execute(query4)
    output4 = cursor.fetchall()

    query5 = "SELECT COUNT(DISTINCT tz) AS 'Nombre de fuseaux horaires' FROM airports;"
    cursor.execute(query5)
    output5 = cursor.fetchall()

    result = []
    for i in output:
        result.append(i)

    result2 = []
    for i in output2:
        result2.append(i)

    result3 = []
    for i in output3:
        result3.append(i)

    result4 = []
    for i in output4:
        result4.append(i)

    result5 = []
    for i in output5:
        result5.append(i)

    return render_template('index.html', result=output, result2=output2, result3=output3, result4=output4, result5=output5, question=question)


@app.route('/question3')
def question3():
    question = 3
    query = "SELECT faa, name FROM airports WHERE dst = 'N'"
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()
    result = []
    for i in output:
        result.append(i)

    return render_template('index.html', result=result, question=question)

@app.route('/question5')
def question5():
    question = 5
    query = "SELECT airlines.name, COUNT(flights.dest) AS 'Nombre de destinations desservies' FROM flights INNER JOIN airlines ON airlines.carrier = flights.carrier GROUP BY airlines.name;"
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()
    result = []
    for i in output:
        result.append(i)

    return render_template('index.html', result=result, question=question)


@app.route('/question6')
def question6():
    question = 6
    query = "SELECT DISTINCT flight, dest FROM flights WHERE dest = 'IAH' OR dest = 'HOU';"
    connect = bd.connect()
    cursor = connect.cursor()
    cursor.execute(query)
    output = cursor.fetchall()

    query2 = "SELECT flight, dest FROM flights WHERE origin = 'NYC' and dest = 'SEA';"
    cursor.execute(query2)
    output2 = cursor.fetchall()

    query3 = "SELECT DISTINCT airlines.name FROM flights LEFT JOIN airlines ON flights.carrier = airlines.carrier WHERE flights.dest = 'SEA';"
    cursor.execute(query3)
    output3 = cursor.fetchall()

    query4 = "SELECT DISTINCT flight, dest FROM flights WHERE dest = 'SEA';"
    cursor.execute(query4)
    output4 = cursor.fetchall()

    result = []
    for i in output:
        result.append(i)

    result2 = []
    for i in output2:
        result2.append(i)

    result3 = []
    for i in output3:
        result3.append(i)

    result4 = []
    for i in output4:
        result4.append(i)

    return render_template('index.html', result=result, result2=result2, result3=result3, result4=result4, question=question)


@app.route('/question7')
def question7():
    question = 7
    query = "SELECT flights.flight, airlines.name FROM airlines INNER JOIN flights ON flights.carrier = airlines.carrier GROUP BY airlines.name;"
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
