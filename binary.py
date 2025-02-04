import mysql.connector

#Establish connection to database

connection=mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="ankit"
)

# Test connection 

if connection.is_connected():
    print("connection successful")
else:
    print("Error connecting")

cursor=connection.cursor()
with open ("hello.png",'rb') as file:
    bindata=file.read()

#Insert sql query 

new="INSERT INTO localhost(Images) Values(%s)"
cursor.execute(new,(bindata,))
connection.commit()

cursor.close()
connection.close()
