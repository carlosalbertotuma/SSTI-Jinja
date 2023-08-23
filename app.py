from flask import Flask, render_template, request

app = Flask(__name__)
app.static_folder = 'static'
app.static_folder = 'templates'
app.config['MAX_CONTENT_LENGTH'] = None

@app.route('/', methods=['GET', 'POST'])
def index():
    output = None
    if request.method == 'POST':
        codigo = request.form['codigo']
        try:
            exec_result = eval(codigo)
            output = str(exec_result)
        except Exception as e:
            output = f"Erro: {str(e)}"
    return render_template('index.html', output=output)

if __name__ == '__main__':
    app.run(debug=True)
