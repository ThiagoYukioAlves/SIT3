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
    
    public boolean incluir(UsuarioDO usuario) throws Exception 
    {
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioData UserData = new UsuarioData();
            UserData.incluir(tr, usuario);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na inclusao de usuario.");
        }
        
        return false; // caso algo deu errado
    }
    
    public UsuarioDO selecionarPorId(String id) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioDO UserDO;
            UsuarioData UserData = new UsuarioData();
            UserDO = UserData.selecionarPorId(tr, id);
            return UserDO;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de usuario por ID.");
        }
        
        return null; // caso algo deu errado
    }
    
    public DbCollection retornarAgendaUsuario(String pid) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            UsuarioData usuData = new UsuarioData();
            results = usuData.retornarAgendaUsuario(tr, pid);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de meditais que aceitam  certo plano");
        }
        
        return null; // caso algo deu errado
    }
    
    
   public DbCollection SelecionarIdUsuario(String user) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            UsuarioData medData = new UsuarioData();
            results = medData.SelecionarIdUsuario(tr, user);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de meditais que aceitam  certo plano");
        }
        
        return null; // caso algo deu errado
    }
    
    public UsuarioDO selecionarPorUsername(String username) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioDO UserDO;
            UsuarioData UserData = new UsuarioData();
            UserDO = UserData.selecionarPorUsername(tr, username);
            return UserDO;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de usuario por username.");
        }
        
        return null; // caso algo deu errado
    }
    
    public boolean VerificarUsuarioSenha(UsuarioDO usuario)
    {
        
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioData UserData = new UsuarioData();
            boolean resultado;
            resultado = UserData.verificarUsuarioSenha(tr, usuario);
            return resultado;
        }
        catch (Exception e) {
            System.out.println("Erro na  verificacao do login.");
        }
        
        return false; // caso algo deu errado
    } 
    
    public boolean VerificarExistenciaUsername(String username)
    {
        
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioData UserData = new UsuarioData();
            boolean resultado;
            resultado = UserData.verificarExistenciaUsername(tr, username);
            return resultado;
        }
        catch (Exception e) {
            System.out.println("Erro na  verificacao da existencia do username.");
        }
        
        return false; // caso algo deu errado
    } 
    
    public boolean desmarcarConsulta(String id_usuario, String id_consulta) throws Exception 
    {
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioData medData = new UsuarioData();
            medData.desmarcarConsulta(tr, id_usuario, id_consulta);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na inclusao de medico.");
        }
        
        return false; // caso algo deu errado
    }
     
    
}
