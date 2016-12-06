/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package medico;
import database.*;

/**
 *
 * @author Thiago
 */
public class Medico {
    public boolean incluir(MedicoDO med) throws Exception 
    {
        try {
            DbTransaction tr = new DbTransaction();
            MedicoData medData = new MedicoData();
            medData.incluir(tr, med);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na inclusao de medico.");
        }
        
        return false; // caso algo deu errado
    }
    
    public MedicoDO selecionarPorId(String id) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            MedicoDO medDO;
            MedicoData medData = new MedicoData();
            medDO = medData.selecionarPorId(tr, id);
            return medDO;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de medico por ID.");
        }
        
        return null; // caso algo deu errado
    }
    
    
     public String obterIdPorNome(String nome) throws Exception
    {
        String id;
        
        try {
            DbTransaction tr = new DbTransaction();
            MedicoDO medDO;
            MedicoData medData = new MedicoData();
            id = medData.obterIdPorNome(tr, nome);
            return id;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de medico por nome.");
        }
        
        return null; // caso algo deu errado
    }
     
   
     
     public DbCollection retornarTodosMedicos() throws Exception { 
         try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            MedicoData medData = new MedicoData();
            results = medData.retornarTodosMedicos(tr);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de todos os medicos");
        }
        
        return null; // caso algo deu errado
     }
     
     public boolean remover(String id) throws Exception {
          try {
            DbTransaction tr = new DbTransaction();
            MedicoData medData = new MedicoData();
            medData.remover(tr, id);
            return true;
        }
        catch (Exception e) {
            System.out.println("Erro na remocao de medico.");
        }
        
        return false; // caso algo deu errado
     }
}
