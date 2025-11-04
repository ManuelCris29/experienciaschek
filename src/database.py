import mysql.connector
#from mysql.connector import pooling
"""
database = mysql.connector.connect(
    host='127.0.0.1',
    user='root',
    password='D....odema18****',
    database='check',
    ssl_disabled=True,
    use_pure=True
)
"""

def obtener_conexion():
    return mysql.connector.connect(
        host='127.0.0.1',
        user='root',
        password='D....odema18****',
        database='check',
        ssl_disabled=True,
        use_pure=True  
    )