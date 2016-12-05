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

        
public class DbTransaction {
    
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
    
    
    public void execute(String str) throws Exception 
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
       

    
}
    
 
