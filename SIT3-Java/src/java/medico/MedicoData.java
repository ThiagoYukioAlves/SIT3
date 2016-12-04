/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package medico;
import database.*;

/**
 *
 * @author Thiago
 */
public class MedicoData {
    public void incluir(DbTransaction tr, MedicoDO med) throws Exception
    {
        String query = "INSERT INTO medico (nome,CRM,telefone,especialidade) VALUES ('" + med.getNome() + "','" + med.getCRM() + "','" + 
                med.getTelefone()+ "','" + med.getEspecialidade() +"')";
        tr.execute(query);
        
    }
    
    public String obterIdPorNome(DbTransaction tr, String nome) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE nome = '" + nome + "'";
        results = tr.query(query);
        if (results.size() > 0) {
            return results.getItem(0).getItem(0);
        }
        
        return "";
    }
    
    public DbCollection retornarTodosMedicos(DbTransaction tr) throws Exception { 
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico";
        results = tr.query(query);
        return results;
    }
            
    
     public MedicoDO selecionarPorId(DbTransaction tr, String id) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE id = " + id;
        results = tr.query(query);
        MedicoDO med = new MedicoDO();
        med.setNome(results.getItem(0).getItem(3));
        med.setCRM(results.getItem(0).getItem(1));
        med.setTelefone(results.getItem(0).getItem(4));
        med.setEspecialidade(results.getItem(0).getItem(2));
        
        return med;
    }
     
    
    public void remover(DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM medico WHERE id = "+id;
        tr.execute(query);
    }
     
}
