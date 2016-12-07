/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usuario;

import database.*;
import java.util.UUID;

/**
 *
 * @author Gabriel
 */
public class UsuarioData {
    
    public void incluir(DbTransaction tr, UsuarioDO user) throws Exception
    {
        String query = "INSERT INTO usuario (nome,id_plano,portador_de_deficiencia,data_de_nascimento,telefone,endereco,username,senha,email) VALUES" +
                "('" + user.getNome() + "'," + user.getIdPlano() + "," + user.getPortadorDeDeficiencia() + ",'" + user.getDataDeNascimento() + 
                "','"+ user.getTelefone() + "','" + user.getEndereco() + "','" + user.getUsername() + "','" + user.getSenha() + "','" + user.getEmail() + "')";
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
        usuario.setEmail(results.getItem(0).getItem(10));
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
        usuario.setEmail(results.getItem(0).getItem(10));
        
        return usuario;
    }
    
        public DbCollection retornarAgendaUsuario(DbTransaction tr, String pid) throws Exception {
        DbCollection results = new DbCollection();
        String query = "SELECT * FROM agenda_medicos WHERE id_usuario = "+pid+"";
        results = tr.query(query);
        return results;
     }
    
    
    public DbCollection SelecionarIdUsuario(DbTransaction tr, String user) throws Exception
    {
        DbCollection results = new DbCollection();
        String query = "SELECT id FROM usuario WHERE username = '" +user+ "';";
        results = tr.query(query);
        return results;
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
    
    public void desmarcarConsulta(DbTransaction tr, String id_usuario, String id_consulta) throws Exception
    {
        String query = "UPDATE agenda_medicos SET id_usuario = 0 WHERE id_consulta = "+id_consulta+"" ;
        tr.execute(query);
        
    }
    
    public boolean alterarSenha(DbTransaction tr, UsuarioDO usuario, String senha) throws Exception
    {
        String query = "UPDATE usuario SET senha = '"+senha+"' WHERE username = '"+usuario.getUsername()+"'";
        tr.execute(query);
        System.out.println(usuario.getSenha());
        System.out.println(usuario.getSenhaNova());
        System.out.println(senha);
        return usuario.getSenha().equals(senha);
    }
    
    
    public boolean esqueciMinhaSenha(DbTransaction tr, UsuarioDO usuario) throws Exception
    {
        String uuid = UUID.randomUUID().toString();
        String query = "UPDATE usuario set senha = '"+uuid+"' where username = '"+usuario.getUsername()+"'";
        usuario.setSenha(uuid);
        tr.execute(query);
        return usuario.getSenha().equals(uuid);
    }
    
}
