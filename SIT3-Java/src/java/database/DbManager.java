/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author Gabriel
 */


import java.sql.*;
import java.text.SimpleDateFormat;

        
public class DbManager {
    
    private final String driverName = "org.sqlite.JDBC";
    private final String jdbc = "jdbc:mysql";
    private String dbUrl = "jdbc:mysql://localhost/mydb";
    private final String uid = "root";
    private final String pwd = "si1234";
    private final int timeout = 30;
    
    private Connection conn;
    
    public String getDriverName() { return driverName; }
    public String getJdbc() { return jdbc; }
    public String getDbUrl() { return dbUrl; }
    public int getTimeout() { return timeout; }
    
    
    public void execute(String str) 
    {
                    // Setando parámetros para conectar com o servidor de banco de dados
                  
               Statement statement = null;

               try
               {
                   // fazendo a conexão com o servidor
                   // carregando driver certo para conexão
                   Class.forName("com.mysql.jdbc.Driver");
                   conn = DriverManager.getConnection(this.dbUrl, this.uid, this.pwd);
                   statement = conn.createStatement();
                   PreparedStatement ps = null;
                   
                   ps = conn.prepareStatement(str);

                   // insertando parámetros lidos
                       ps.executeUpdate();


                   } // try
                    catch (ClassNotFoundException e)
                   {
                       System.out.println("Opps I can't find the JDBC Driver!");
                       e.printStackTrace();
                   }
                   catch (SQLException e)
                   {
                       System.out.println("There was a problem with the SQL!");
                       e.printStackTrace();
                   }
                   finally
                   {
                       // fechando conexão com o servidor
                       if (conn != null)
                       {
                           try
                           {
                               conn.close();
                           }
                           catch (Exception e)
                           {
                               e.printStackTrace();
                           }
                       }
                   }

       }
    
    
    public DbCollection query(String q) throws Exception{
        
        
         Connection conn = null;
            ResultSet results = null;
            Statement statement = null;
            DbCollection collection = new DbCollection();

            try
            {               
                
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(this.dbUrl, this.uid, this.pwd);
        
        
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(q);
           
                 stmt.setQueryTimeout(timeout);
                    while(rs.next())
                        {
                            DbEntry newEntry = new DbEntry();
                            int i = 1;
                            while (true)
                            {
                                try {
                                    newEntry.add(rs.getString(i));
                                    
                                    i++;
                                } catch (SQLException e) {break;}                                                    
                            }
                            collection.add(newEntry);
                            
                        }
        
                 
            } catch (Exception e) {ResultSet rs = null;}
    
       
        return collection;
    }
       
    public void LOL()  throws Exception{
    
            
        // register the driver 
        String sDriverName = "org.sqlite.JDBC";
 
        // now we set up a set of fairly basic string variables to use in the body of the code proper
        String sTempDb = "hello.db";
        String sJdbc = "jdbc:sqlite";
        String sDbUrl = sJdbc + ":" + sTempDb;
        // which will produce a legitimate Url for SqlLite JDBC :
        // jdbc:sqlite:hello.db
        int iTimeout = 30;
       
        
          SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm,ss");//dd/MM/yyyy
          java.util.Date now = new java.util.Date();
          String strDate = sdfDate.format(now);
        
        
        String sMakeTable = "CREATE TABLE IF NOT EXISTS dates(id numeric, date datetime)";
        String sMakeInsert = "INSERT INTO dates VALUES(0,'" + strDate + " ')";
        String sMakeSelect = "SELECT date from dates";
        
 
        // create a database connection
        Connection conn = DriverManager.getConnection(sDbUrl);
        try {
            Statement stmt = conn.createStatement();
            try {
                stmt.setQueryTimeout(iTimeout);
                stmt.executeUpdate( sMakeTable );
                stmt.executeUpdate( sMakeInsert );
                ResultSet rs = stmt.executeQuery(sMakeSelect);
                try {
                    while(rs.next())
                        {
                            String sResult = rs.getString("date");
                            System.out.println(sResult);
                        }
                } finally {
                    try { rs.close(); } catch (Exception ignore) {}
                }
            } finally {
                try { stmt.close(); } catch (Exception ignore) {}
            }
        } finally {
            try { conn.close(); } catch (Exception ignore) {}
        }
    }
    
}
    
 
