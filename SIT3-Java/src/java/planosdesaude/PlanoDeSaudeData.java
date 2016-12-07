/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planosdesaude;

import database.DbCollection;
import database.DbTransaction;


/**
 *
 * @author Gabriel
 */
public class PlanoDeSaudeData {
    
    public void incluir(DbTransaction tr, PlanoDeSaudeDO plano) throws Exception
    {
        String query = "INSERT INTO planos_de_saude (nome_plano) VALUES ('" + plano.getNome() + "')";
        tr.execute(query);
    }
//    
//    public void alternar(DbTransaction tr, PlanoDeSaudeDO plano) throws Exception
//    {
//        String query = "update planos_de_saude set nome_plano='toscao' where id =9";
//        tr.execute(query);
//    }
    
    public String obterIdPorNome(DbTransaction tr, String nome) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM planos_de_saude WHERE nome_plano = '" + nome + "'";
        results = tr.query(query);
        if (results.size() > 0) {
            return results.getItem(0).getItem(0);
        }
        
        return "";
    }
    
   public PlanoDeSaudeDO selecionarPorId(DbTransaction tr, String id) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM planos_de_saude WHERE id =" + id;
        results = tr.query(query);
        PlanoDeSaudeDO plano = new PlanoDeSaudeDO();
        plano.setNome(results.getItem(0).getItem(1));
        return plano;
    }
    
    public DbCollection retornarTodosPlanos(DbTransaction tr) throws Exception
    {
        String query = "SELECT * FROM planos_de_saude";
        DbCollection results = new DbCollection();
        results = tr.query(query);
        return results;
    }
    
    public DbCollection retornarPlanosAceitosHospital(DbTransaction tr, String id) throws Exception
    {
        String query = "SELECT * FROM planos_de_saude WHERE id IN (SELECT planos_de_saude_id FROM planos_de_saude_has_hospitais WHERE hospitais_id = "+id+")";
        DbCollection results = new DbCollection();
        results = tr.query(query);
        return results;
    }
    
    public DbCollection retornarPlanosNaoAceitosHospital(DbTransaction tr, String id) throws Exception
    {
        String query = "SELECT * FROM planos_de_saude WHERE id NOT IN (SELECT planos_de_saude_id FROM planos_de_saude_has_hospitais WHERE hospitais_id = "+id+")";
        DbCollection results = new DbCollection();
        results = tr.query(query);
        return results;
    }
    
    public void removerRelacaoHospitalPlano(DbTransaction tr, String hid, String pid) throws Exception
    {
        String query = "DELETE FROM planos_de_saude_has_hospitais WHERE hospitais_id = " + hid + " AND planos_de_saude_id = " + pid;
        tr.execute(query);
    }
    
    public void incluirRelacaoHospitalPlano(DbTransaction tr, String hid, String pid) throws Exception {
        String query = "INSERT INTO planos_de_saude_has_hospitais (hospitais_id,planos_de_saude_id) VALUES ("+hid+","+pid+")";
        tr.execute(query);
    }
    public void remover(DbTransaction tr, String id) throws Exception
    {
        String query = "DELETE FROM planos_de_saude WHERE id = "+id;
        tr.execute(query);
    }
    public void editar(DbTransaction tr, String plano, String nome) throws Exception
    {
        String query = "UPDATE planos_de_saude SET nome_plano = '" + nome + "'WHERE id = " + plano;
        tr.execute(query);
    }
    
}
