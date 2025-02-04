from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)

# MySQL configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root' 
app.config['MYSQL_DB'] = 'Webpage' 

# Initialize MySQL
mysql = MySQL(app)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']

       
        cur = mysql.connection.cursor()
        # Insert data into the database
        cur.execute('''INSERT INTO users (name, email) VALUES (%s, %s)''', (name, email))
        # Commit changes to the database
        mysql.connection.commit()
        # Close the cursor
        cur.close()

        return redirect('/success')

    return render_template('index.html')

@app.route('/success')
def success():
    return 'User data saved successfully!'

if __name__ == '__main__':
    app.run(debug=True)