/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitais;

import database.*;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Gabriel
 */
public class MapaEmergencia {
    
    private DbCollection lista_hospitais = new DbCollection();
    private DbTransaction db = new DbTransaction();
    
    public void ConsultaBanco(String q) throws Exception
    {
        lista_hospitais = db.query(q);
    }
    
    public String RetornaSelect()
    {

         String s = "<select id=\"end\" name=\"end\">";

        
         int i = 0;
         
        while (i < lista_hospitais.size())
        {
            s = s + "<option value=\"";
            s = s + lista_hospitais.getItem(i).getItem(1);
            s = s + "\">";
            s = s + lista_hospitais.getItem(i).getItem(2);
            s = s + "</option>";     
            i++;
            
        }
        s = s + "</select>";
        return s;
    }
    public String RetornaTabela(){
        String t =  "<table>" +  "<tr>" +
                "    <th>Hospital</th>" +
                "    <th>Tempo de ida</th>" +
                "    <th>Tempo de espera (Google Maps)</th>" +
                "    <th>Tempo total</th>" +
                "    <th>Endereco</th>" +
                "  </tr>";
        
        int j = 0;
        
        while (j< lista_hospitais.size())
        {
            t = t + "<tr>" +
"    <td>"+lista_hospitais.getItem(j).getItem(2)+"</td>" +
"    <td></td>" +
"    <td></td>" +
"    <td></td>" +
"    <td>"+lista_hospitais.getItem(j).getItem(1)+"</td>" +
"    </tr>";
            j++;
        }
        t = t +"</table>";
        return t;
    }

    
    
}
