/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Classe que manipula uma entrada no banco de dados.
 * @author Gabriel
 */

public class DbEntry {
    
   private ArrayList<String> rows; // colunas de uma entrada
   
   public DbEntry() {
       rows = new ArrayList<String>();
   }
   
   public void add(String s) {
       rows.add(s);
   }
   
   public String getItem(int i) {
       return rows.get(i);
   }
   
   public void print()
   {
      Iterator<String> iter;
      iter = rows.iterator();
      
      while (iter.hasNext())
          System.out.println(iter.next());
      
   }
   
      
}
