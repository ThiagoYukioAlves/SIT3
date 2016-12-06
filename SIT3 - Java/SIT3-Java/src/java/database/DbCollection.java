/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import database.DbEntry;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Uma coleção de objetos DbEntry
 * @author Gabriel
 */
public class DbCollection {
    
    public ArrayList<DbEntry> entriesList;
    
    public DbCollection(){
        entriesList = new ArrayList<DbEntry>();
    }
    
    public void add(DbEntry e){
        entriesList.add(e);
    }
    
    public DbEntry getItem(int i){
        return entriesList.get(i);
    }
    
    public int size()
    {
        return entriesList.size();
    }
    
      
    
    public void print()
    {
        Iterator<DbEntry> iter;
        iter = entriesList.iterator();
        
        while (iter.hasNext())
        {
            System.out.println("--Entrada--");
            iter.next().print();
            System.out.println();
        }
        
    }
    
    
}
