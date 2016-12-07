/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usuario;

/**
 *
 * @author Gabriel
 */
public class UsuarioDO {
    private String nome;
    private String dataDeNascimento;
    private String idPlano;
    private String portadorDeDeficiencia;
    private String telefone;
    private String endereco;
    private String username;
    private String senha;
    private String privilegio; 
    private String senhaNova;
    private String email;
  
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
        
    public void setDataDeNascimento(String dataDeNascimento){
        this.dataDeNascimento = dataDeNascimento;
    }
    
    public void setIdPlano(String idPlano){
        this.idPlano = idPlano;
    }
    
    public void setPortadorDeDeficiencia(String portadorDeDeficiencia){
        this.portadorDeDeficiencia = portadorDeDeficiencia;
    }
    
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public void setEndereco(String endereco){
        this.endereco = endereco;
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    
    public void setSenha(String senha){
        this.senha = senha;
    }
    
    public void setPrivilegio(String privilegio){
        this.privilegio = privilegio;
    }
    
    public void setSenhaNova(String senha){
        this.senhaNova = senha;
    }
    
    public String getNome(){
        return this.nome;
    }
    
    public String getDataDeNascimento(){
        return this.dataDeNascimento;
    }
    
    public String getPortadorDeDeficiencia(){
        return this.portadorDeDeficiencia;
    }
    
    public String getIdPlano(){
        return this.idPlano;
    }
    
    public String getTelefone(){
        return this.telefone;
    }
    
    public String getEndereco(){
        return this.endereco;
    }
    
    public String getUsername(){
        return this.username;
    }
    
    public String getSenha(){
        return this.senha;
    }
    
    public String getPrivilegio(){
        return this.privilegio;
    }
    
    public String getSenhaNova(){
        return this.senhaNova;
    }
    
    public String getEmail(){
        return this.email;
    }
    
}
