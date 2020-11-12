import pymysql

class bd:
    # To connect MySQL database 
    def connect(self, query):
        conn = pymysql.connect( 
                host='', 
                user='',  
                password = "", 
                db='', 
                ) 
           
        cur = conn.cursor()
        qry = query
        cur.execute(qry) 
        output = cur.fetchall() 
        return output
        


