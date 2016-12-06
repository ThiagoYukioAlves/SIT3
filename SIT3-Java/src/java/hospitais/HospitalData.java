/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitais;

import database.DbCollection;
import database.DbTransaction;


/**
 *
 * @author Gabriel
 */
public class HospitalData {
    
    public void incluir(DbTransaction tr, HospitalDO hosp) throws Exception
    {
        String query = "INSERT INTO hospitais (nome,endereco,telefone) VALUES ('" + hosp.getNome() + "','" + hosp.getEndereco() + "','" + 
                hosp.getTelefone() + "')";
        tr.execute(query);
        
    }
    
    public String obterIdPorNome(DbTransaction tr, String nome) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM hospitais WHERE nome = '" + nome + "'";
        results = tr.query(query);
        if (results.size() > 0) {
            return results.getItem(0).getItem(0);
        }
        
        return "";
    }
    
    public DbCollection retornarTodosHospitais(DbTransaction tr) throws Exception { 
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM hospitais";
        results = tr.query(query);
        return results;
    }
            
    
     public HospitalDO selecionarPorId(DbTransaction tr, String id) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM hospitais WHERE id = " + id;
        results = tr.query(query);
        HospitalDO hosp = new HospitalDO();
        hosp.setNome(results.getItem(0).getItem(1));
        hosp.setEndereco(results.getItem(0).getItem(2));
        hosp.setTelefone(results.getItem(0).getItem(3));
        
        return hosp;
    }
     
    public DbCollection retornarHospitaisAceitamPlano(DbTransaction tr, String pid) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM hospitais WHERE id IN (SELECT hospitais_id FROM planos_de_saude_has_hospitais WHERE planos_de_saude_id = "+pid+")";
        results = tr.query(query);
        return results;
     }
    public DbCollection retornarHospitaisNaoAceitamPlano(DbTransaction tr, String pid) throws Exception {
         DbCollection results = new DbCollection();
        String query = "SELECT * FROM hospitais WHERE id NOT IN (SELECT hospitais_id FROM planos_de_saude_has_hospitais WHERE planos_de_saude_id = "+pid+")";
        results = tr.query(query);
        return results;
     }
    
    public void remover(DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM hospitais WHERE id = "+id;
        tr.execute(query);
    }
     
    
}
