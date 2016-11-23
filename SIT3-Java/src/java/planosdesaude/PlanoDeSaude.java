/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planosdesaude;

import database.*;

/**
 *
 * @author Gabriel
 */
public class PlanoDeSaude {
    
    //atributos de classe
    private String nome;
    
    //objetos para manusear o banco de dados
    private DbCollection lista_planos = new DbCollection();
    private DbManager db = new DbManager();
       
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public String getNome(){
        return this.nome;
    }
    
    public String retornaSelectDePlanos() throws Exception 
    {
        
       lista_planos = db.query("SELECT * FROM planos_de_saude"); 
       
       String s = "<select id=\"idPlano\" name=\"idPlano\">" +
                 "<option disabled selected value> -- selecione -- </option>";
                             
         int i = 0;
         
        while (i < lista_planos.size())
        {
            s = s + "<option value=\""+
                    lista_planos.getItem(i).getItem(0)+
                    "\">"+
                    lista_planos.getItem(i).getItem(1)+
                    "</option>";     
            i++;
            
        }
        s = s + "</select>";
        return s;
    }
    
   
}
