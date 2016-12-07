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
    
    public boolean alterarSenha(UsuarioDO usuario,String senha) throws Exception 
    {
        try {
            DbTransaction tr = new DbTransaction();
            UsuarioData UserData = new UsuarioData();
            UserData.alterarSenha(tr, usuario,senha);
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
    public boolean editar(String id, String nome, String telefone, String data, String idPlano, String privilegio, String portador, String endereco, String username, String senha) throws Exception {
           try {
                DbTransaction tr = new DbTransaction();
                UsuarioData usuarioData = new UsuarioData();
                usuarioData.editar(tr, id,nome,telefone, data, idPlano, privilegio, portador, endereco, username, senha);
                return true;
            }
            catch (Exception e) {
                System.out.println("Erro na inclusao de relacao plano-hospital");
            }

            return false; // caso algo deu erradoplanoDO = plano.selecionarPorId(request.getParameter("planoid"
        }
     public String PegaIdPorUsername(String username) throws Exception{
        
                DbTransaction tr = new DbTransaction();
                UsuarioData usuarioData = new UsuarioData();
                String id;
                id = usuarioData.PegaIdPorUsername(tr, username);
                return id;
  
     }
}
