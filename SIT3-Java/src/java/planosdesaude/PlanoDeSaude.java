/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package planosdesaude;

import database.*;

/**
 *
 * @author Gabriel
 * 
 */
public class PlanoDeSaude {
    
        
    public String retornaSelectDePlanos() throws Exception 
    // Essa funcao retorna um select em html preenchido com todos os planos de saude
    {
       try {
            DbTransaction tr = new DbTransaction();
            DbCollection lista_planos;
            PlanoDeSaudeData planoData = new PlanoDeSaudeData();
            lista_planos = planoData.retornarTodosPlanos(tr);
            
            String s = "<select id=\"idPlano\" name=\"idPlano\">" +
                     "<option disabled selected value> -- selecione -- </option>";

             int i = 0;

            while (i < lista_planos.size())
            {
                s = s + "<option value=\""+
                        lista_planos.getItem(i).getItem(0)+
                        "\">"+
                        lista_planos.getItem(i).getItem(1)+
                        "</option>";     
                i++;

            }
            s = s + "</select>";
            return s;
            
        
        }
        catch (Exception e) {
            System.out.println("Erro recuperando planos de saude.");
        }
        
        return "ERRO!"; // caso algo deu errado
        
              
    }
    
   public DbCollection retornarPlanosAceitosHospital(String id_hosp) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            PlanoDeSaudeData planoData = new PlanoDeSaudeData();
            results = planoData.retornarPlanosAceitosHospital(tr, id_hosp);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de planos aceitos por hospital");
        }
        
        return null; // caso algo deu errado
    }
   
      public DbCollection retornarPlanosNaoAceitosHospital(String id_hosp) throws Exception
    {
        try {
            DbTransaction tr = new DbTransaction();
            DbCollection results;
            PlanoDeSaudeData planoData = new PlanoDeSaudeData();
            results = planoData.retornarPlanosNaoAceitosHospital(tr, id_hosp);
            return results;
        }
        catch (Exception e) {
            System.out.println("Erro na recuperacao de planos nao aceitos por hospital");
        }
        
        return null; // caso algo deu errado
    }
      
       public boolean removerRelacaoHospitalPlano(String hid, String pid) throws Exception {
           try {
                DbTransaction tr = new DbTransaction();
                PlanoDeSaudeData planoData = new PlanoDeSaudeData();
                planoData.removerRelacaoHospitalPlano(tr, hid, pid);
                return true;
            }
            catch (Exception e) {
                System.out.println("Erro na remocao de relacao plano-hospital");
            }

            return false; // caso algo deu errado
        }
       
       public boolean incluirRelacaoHospitalPlano(String hid, String pid) throws Exception {
           try {
                DbTransaction tr = new DbTransaction();
                PlanoDeSaudeData planoData = new PlanoDeSaudeData();
                planoData.incluirRelacaoHospitalPlano(tr, hid, pid);
                return true;
            }
            catch (Exception e) {
                System.out.println("Erro na inclusao de relacao plano-hospital");
            }

            return false; // caso algo deu errado
        }
       
       public PlanoDeSaudeDO selecionarPorId( String id) throws Exception {
            try {
                 DbTransaction tr = new DbTransaction();
                 PlanoDeSaudeDO planoDO;
                 PlanoDeSaudeData planoData = new PlanoDeSaudeData();
                 planoDO = planoData.selecionarPorId(tr, id);
                 return planoDO;
             }
             catch (Exception e) {
                 System.out.println("Erro na recuperacao de plano por ID.");
             }

             return null; // caso algo deu errado
       }
       
       }
            

  
