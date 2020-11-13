import pymysql

class bd:
    # To connect MySQL database 
    def connect(self):
        conn = pymysql.connect( 
                host='', 
                user='',  
                password = '', 
                db='', 
                ) 
        
        return conn

        


