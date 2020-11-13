import pymysql

class bd:
    # To connect MySQL database 
    def connect(self):
        conn = pymysql.connect( 
                host='db4free.net', 
                user='airtrafficjtc',  
                password = "YB5LLXhj9s@@Car", 
                db='airtraffic', 
                ) 
        
        return conn

        


