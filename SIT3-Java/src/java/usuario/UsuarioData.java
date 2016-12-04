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
public class UsuarioData {
    
    public void incluir(DbTransaction tr, UsuarioDO user) throws Exception
    {
        String query = "INSERT INTO usuario (nome,id_plano,portador_de_deficiencia,data_de_nascimento,telefone,endereco,username,senha) VALUES" +
                "('" + user.getNome() + "'," + user.getIdPlano() + "," + user.getPortadorDeDeficiencia() + ",'" + user.getDataDeNascimento() + 
                "','"+ user.getTelefone() + "','" + user.getEndereco() + "','" + user.getUsername() + "','" + user.getSenha() + "')";
        tr.execute(query);
        
    }
    
    public UsuarioDO selecionarPorId(DbTransaction tr, String id) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM usuario WHERE id = " + id;
        results = tr.query(query);
        UsuarioDO usuario = new UsuarioDO();
        usuario.setNome(results.getItem(0).getItem(1));
        usuario.setPortadorDeDeficiencia(results.getItem(0).getItem(2));
        usuario.setDataDeNascimento(results.getItem(0).getItem(3));
        usuario.setTelefone(results.getItem(0).getItem(4));
        usuario.setPrivilegio(results.getItem(0).getItem(5));    
        usuario.setEndereco(results.getItem(0).getItem(6));
        usuario.setSenha(results.getItem(0).getItem(7));
        usuario.setIdPlano(results.getItem(0).getItem(8));
        usuario.setUsername(results.getItem(0).getItem(9));
        
        return usuario;
    }
    
    public UsuarioDO selecionarPorUsername(DbTransaction tr, String username) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM usuario WHERE username = '" + username+ "'";
        results = tr.query(query);
        UsuarioDO usuario = new UsuarioDO();
        usuario.setNome(results.getItem(0).getItem(1));
        usuario.setPortadorDeDeficiencia(results.getItem(0).getItem(2));
        usuario.setDataDeNascimento(results.getItem(0).getItem(3));
        usuario.setTelefone(results.getItem(0).getItem(4));
        usuario.setPrivilegio(results.getItem(0).getItem(5));    
        usuario.setEndereco(results.getItem(0).getItem(6));
        usuario.setSenha(results.getItem(0).getItem(7));
        usuario.setIdPlano(results.getItem(0).getItem(8));
        usuario.setUsername(results.getItem(0).getItem(9));
        
        return usuario;
    }
    
    public boolean verificarUsuarioSenha(DbTransaction tr, UsuarioDO user) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM usuario WHERE username = '" + user.getUsername() + "' AND senha = '" + user.getSenha() + "'";
        results = tr.query(query);
        
        if (results.size() < 1){
            return false;
        }
        else {
            return true;
        }
        
    }
    
    public boolean verificarExistenciaUsername(DbTransaction tr, String username) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM usuario WHERE username = '" + username + "'";
        results = tr.query(query);
        
        if (results.size() < 1){
            return false;
        }
        else {
            return true;
        }
    }
    
    public boolean alterarSenha(DbTransaction tr, UsuarioDO usuario, String senha) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "UPDATE usuario SET senha = '"+senha+"' WHERE username='"+usuario.getUsername()+"'";
        results = tr.query(query);
        usuario.setSenha(senha);
        if (results.getItem(0).getItem(7).equals(senha)){
            return true;
        }
        else{
            return false;
        }
    }
}