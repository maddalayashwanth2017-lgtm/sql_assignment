import mysql.connector 
db_connection = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="YASHwanth@9866",
    database="rocky"
)

print(db_connection)
print("success")

curobj=db_connection.cursor()

curobj.execute("""
CREATE TABLE students(
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT CHECK (age >= 16),
gmail VARCHAR(50) NOT NULL
)
""")

def register():
    name=input("enter your name: ")
    emai=input("enter your email: ")

    











