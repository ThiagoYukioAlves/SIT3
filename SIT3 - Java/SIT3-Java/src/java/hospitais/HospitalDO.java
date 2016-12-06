/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitais;

/**
 *
 * @author Gabriel
 */
public class HospitalDO {
    
    private String nome;
    private String endereco;
    private String telefone;
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    public void setTelefone(String telefone){
        this.telefone = telefone;
    }
   
    public String getNome(){
        return this.nome;
    }
    
    public String getEndereco(){
        return this.endereco;
    }
    
    public String getTelefone(){
        return this.telefone;
    }
            
}
