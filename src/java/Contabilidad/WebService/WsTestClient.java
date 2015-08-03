/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.WebService;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 *
 * @author alberto
 */
public class WsTestClient {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         try {
 
		Client client = Client.create();
 
//		WebResource webResource = client
//		   .resource("http://104.131.181.21/DCPws/rest/moneda/cod/EUR");
                
                WebResource webResource = client
		   .resource("http://104.131.181.21/DCPws/rest/indiceI/periodo/201501");
                
                /*WebResource webResource = client
		   .resource("http://104.131.181.21/DCPws/rest/historialC/40222760239");*/
 
		ClientResponse response = webResource.accept("application/json")
                   .get(ClientResponse.class);
 
		if (response.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ response.getStatus());
		}
 
		String output = response.getEntity(String.class);
 
		System.out.println("Output from Server .... \n");
		System.out.println(output);
 
	  } catch (Exception e) {
 
		e.printStackTrace();
 
	  }
    }
    
}