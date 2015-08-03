/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contabilidad.WebService;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author Frankmer
 */
//@WebService(serviceName = "NominaWebService")
@Path("/hello")
public class NominaWebService {

    /**
     * This is a sample web service operation
     */
    @GET
    @Produces("text/plain")
    @Path("/saludame")
    public String saludame(){
        return "Hola";
    }
    
    @GET
    @Consumes("text/plain")
    @Path("/saludame/{param1}")
    public String saludame(@PathParam("param1") String param1){
        System.out.println("He recibido el param1: "+param1);
        return "Informaacion recibida.";
    }
    
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
}
