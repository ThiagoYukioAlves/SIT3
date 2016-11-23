/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usuario;

import database.*;

/**
 *
 * @author Gabriel
 */
public class Usuario {
    private String nome;
    private String dataDeNascimento;
    private String idPlano;
    private String portadorDeDeficiencia;
    private String telefone;
    private String endereco;
    private String username;
    private String senha;
    
    private DbManager db = new DbManager();
    
    // Funcoes set e get ---
    
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
    
    // --- Fim de funcoes set e get
    
    public void salvarUsuario()
    {
        String query = "INSERT INTO usuario (nome,id_plano,portador_de_deficiencia,data_de_nascimento,telefone,endereco,username,senha) VALUES" +
                "('" + this.nome + "'," + this.idPlano + "," + this.portadorDeDeficiencia + ",'" + this.dataDeNascimento + "','"+ this.telefone +
                "','" + this.endereco + "','" + this.username + "','" + this.senha + "')";
        db.execute(query);
        
    }
}
