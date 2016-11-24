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
    private String estado;

    
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
    
    public void setEstado(String estado){
        this.estado = estado;
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
    
    public String getEstado() {
        return this.estado;
    }
    
    


    
    // --- Fim de funcoes set e get
    
    public void salvarMedico()
    {
        String query = "INSERT INTO medico (CRM,especialidade,nome,telefone) VALUES" +
                "('" + this.CRM + "','" + this.especialidade + "','" + this.nome + "','" + this.telefone + "')";
        db.execute(query);
        
    }
    
    // Transforma o objeto que chega do banco de dados em uma tabela
    public DbCollection consultaMedicos() throws Exception{
        DbCollection queryMedicos = db.query("select * from medico");
        String[][] tabelaMedicos;
        
        for(int i = 0; i < queryMedicos.size(); i++){
            
        }
        
        return tabelaMedicos;
    }
}
