/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package medico;

import database.*;

/**
 *
 * @author thiago
 */
public class Medico {
    private String nome;
    private String especialidade;
    private String CRM;
    private String telefone;

    
    private DbManager db = new DbManager();
    
    // Funcoes set e get ---
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
      
    public void setCRM(String CRM) {
        this.CRM = CRM;
    }
    
    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }
    

    
    public String getNome(){
        return this.nome;
    }
    
    public String getTelefone() {
        return this.telefone;
    }
      
    public String getCRM() {
        return this.CRM;
    }
    
    public String getEspecialidade() {
        return this.especialidade;
    }
    
    


    
    // --- Fim de funcoes set e get
    
    public void salvarMedico()
    {
        String query = "INSERT INTO medico (CRM,especialidade,nome,telefone) VALUES" +
                "('" + this.CRM + "'," + this.especialidade + "," + this.nome + ",'" + this.telefone + "')";
        db.execute(query);
        
    }
}