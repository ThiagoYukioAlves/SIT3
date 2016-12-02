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
        String query = "INSERT INTO medico (nome,CRM,telefone) VALUES ('" + med.getNome() + "','" + med.getEndereco() + "','" + 
                med.getTelefone() + "')";
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
    
    public DbCollection retornarTodosHospitais(DbTransaction tr) throws Exception { 
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
        med.setNome(results.getItem(0).getItem(1));
        med.setEndereco(results.getItem(0).getItem(2));
        med.setTelefone(results.getItem(0).getItem(3));
        
        return med;
    }
     
    public DbCollection retornarHospitaisAceitamPlano(DbTransaction tr, String pid) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM medico WHERE id IN (SELECT medico_id FROM planos_de_saude_has_medico WHERE planos_de_saude_id = "+pid+")";
        results = tr.query(query);
        return results;
     }
    
    public void remover(DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM medico WHERE id = "+id;
        tr.execute(query);
    }
     
}
