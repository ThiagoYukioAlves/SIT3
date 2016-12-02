/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package medico;

/**
 *
 * @author Thiago
 */
public class MedicoDO {
    
    private String CRM;
    private String especialidade;
    private String telefone;
    private String nome;
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public void setCRM(String CRM) {
        this.CRM = CRM;
    }
    
    public void setTelefone(String telefone){
        this.telefone = telefone;
    }
    
    public void setEspecialidade(String especialidade){
        this.especialidade = especialidade;
    }
   
    public String getNome(){
        return this.nome;
    }
    
    public String getCRM(){
        return this.CRM;
    }
    
    public String getTelefone(){
        return this.telefone;
    }
    
    public String getEspecialidade(){
        return this.especialidade;
    }
}
