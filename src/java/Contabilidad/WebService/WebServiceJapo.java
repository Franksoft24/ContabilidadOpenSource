/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.WebService;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import Contabilidad.WebService.Tasas;
import java.util.ArrayList;
import java.util.List;
import com.sun.jersey.json.impl.*;
/**
 *
 * @author Frankmer
 */
public class WebServiceJapo {
//    Client client = Client.create();
//    public List<Tasas> obtenerTasa(){
//        List<Tasas> tasas= new ArrayList<Tasas>();
//        String[] Monedas = {"DOP", "USD","EUR"};
//        Tasas tasa = new Tasas();
//        for(int i = 0; i<Monedas.length; i++){
//            try{
//                WebResource webResource = client
//                   .resource("http://104.131.181.21/DCPws/rest/moneda/cod/"+Monedas[i]);
//                ClientResponse response = webResource.accept("application/xml")
//                   .get(ClientResponse.class);
//                if (response.getStatus() != 200) {
//		   throw new RuntimeException("Failed : HTTP error code : "
//			+ response.getStatus());
//		}
//                String output = response.getEntity(String.class);
//                //tasa.setCompra(output.getAtributte("tasaCompra"));
//            }catch(Exception e){
//                
//            }
//        }
//        return tasas;
//    }
    
}
