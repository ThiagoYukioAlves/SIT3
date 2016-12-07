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

     public MedicoDO selecionarPorCRM(String CRM) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            MedicoDO MedicoDO;
            MedicoData MedicoData = new MedicoData();
            MedicoDO = MedicoData.selecionarPorCRM(tr, CRM);
            return MedicoDO;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de usuario por username.");
        }
        
        return null; // caso algo deu errado
    }
     
public boolean editar(String id, String nome, String telefone, String CRM, String especialidade) throws Exception {
           try {
                DbTransaction tr = new DbTransaction();
                MedicoData medicoData = new MedicoData();
                medicoData.editar(tr, id, nome, telefone, CRM, especialidade);
                return true;
            }
            catch (Exception e) {
                System.out.println("Erro na edicao de medico");
            }

            return false; // caso algo deu erradoplanoDO = plano.selecionarPorId(request.getParameter("planoid"
        }
     public String PegaIdPorCRM(String CRM) throws Exception{
        
                DbTransaction tr = new DbTransaction();
                MedicoData medicoData = new MedicoData();
                String id;
                id = medicoData.PegaIdPorCRM(tr, CRM);
                return id;
  
     }


}
