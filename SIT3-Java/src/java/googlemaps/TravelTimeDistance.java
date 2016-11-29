/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package googlemaps;

import java.io.IOException;
import okhttp3.*;
import org.json.*;
import database.*;

/**
 *
 * @author Gabriel
 */
public class TravelTimeDistance {
    
    private static final String API_KEY = "AIzaSyDHhMko0xpBmWRLZAD30IVCCmnxtgQVfrQ";
    OkHttpClient client = new OkHttpClient();
   
      
    private String destino;
    private String origem;
    
    public void setDestino(String destino)
    {
        this.destino = destino;
    }
    
    public void setOrigem(String origem)
    {
        this.origem = origem;
    }
    
    public String getDestino(){
            return this.destino;
    }
    
    public String getOrigem(){
            return this.origem;
    }
    
    
    
     public String evaluate_distance(String origem, String destino) throws IOException, JSONException, Exception {
    String url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+origem+"&destinations="+destino+"&mode=driving&language=pt-BR&key=" + API_KEY;
    
    Request request = new Request.Builder()
        .url(url)
        .build();

    Response response = client.newCall(request).execute();
    
   
    
        JSONObject obj = new JSONObject(response.body().string());
        //JSONArray arr = obj.getJSONArray("rows").getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("status")
        String status = obj.getJSONArray("rows").getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("duration").getString("text");
  
       
        //for (int i = 0; i < arr.length(); i++)
        //{
            //String status = arr.getJSONObject(0).getString("status");
                   
            return status;
        
        //}

        //return response.body().string();
   
  }
     
     public String getCoordinates(String address)throws IOException, JSONException, Exception {
         String url = "https://maps.googleapis.com/maps/api/geocode/json?address="+address+"&key=" + API_KEY;
         Request request = new Request.Builder()
        .url(url)
        .build();

        Response response = client.newCall(request).execute();
    
   
    
        JSONObject obj = new JSONObject(response.body().string());
        //JSONArray arr = obj.getJSONArray("rows").getJSONObject(0).getJSONArray("elements").getJSONObject(0).getJSONObject("status")
        String lat = String.valueOf(obj.getJSONArray("results").getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lat"));
        String lon = String.valueOf(obj.getJSONArray("results").getJSONObject(0).getJSONObject("geometry").getJSONObject("location").getDouble("lng"));
                
       
        //for (int i = 0; i < arr.length(); i++)
        //{
            //String status = arr.getJSONObject(0).getString("status");
                   
            return lat + ", " + lon;
         
     }
    
    
}
