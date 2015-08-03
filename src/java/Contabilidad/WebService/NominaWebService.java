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
import Contabilidad.DAO.EntradaContableDAO;
import Contabilidad.Model.EntradaContable;
import Contabilidad.DAO.UsuarioDAO;
import Contabilidad.Model.Usuario;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Frankmer
 */
//@WebService(serviceName = "NominaWebService")
@Path("/NominaContabilidad")
public class NominaWebService {

    /**
     * This is a sample web service operation
     */
    
    @GET
    @Consumes("text/plain")
    @Path("RegistrarAsiento/{param1}/User/{param2}/PW/{param3}")
    public String RegistrarAsiento(@PathParam("param1") String Monto, @PathParam("param2") String Usuario, @PathParam("param3") String pw){
        String message = null;
        String Descripcion = "Pago Nomina";
        String ModuloContabilidad = "GAS";
        int IdCuentaContableDB = 3;
        int IdCuentaContableCR = 1007;
        //int Usuario = 0;
        Calendar c2 = new GregorianCalendar();
        String dia = Integer.toString(c2.get(Calendar.DATE));
        String mes = Integer.toString(c2.get(Calendar.MONTH));
        String annio = Integer.toString(c2.get(Calendar.YEAR));
        String getFechaAsiento= annio+"-"+mes+"-"+dia;
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");;
        Date FechaAsiento=null;
        try{    
            FechaAsiento = formatter.parse(getFechaAsiento);
        }catch (ParseException ex){
            ex.printStackTrace();
        }
        System.out.println(FechaAsiento+"\n");
        Double MontoAsiento = Double.parseDouble(Monto);
        int Estado = 1;
        int IdTipoMoneda = 1;
        String NickName = Usuario;
        String Password = pw;
        List<Usuario> usuarios = UsuarioDAO.validarUsuario(NickName, Password);
        if(!usuarios.isEmpty()){
            int rol = 0;
            int UserId =0;
            for(Usuario usuario : usuarios){
                rol = usuario.getRol();
                UserId = usuario.getIdUsuario(); 
            }
            if(rol == 4 && UserId == 5){
                int NumeroDocumento = EntradaContableDAO.UltimoDocumentoContable() + 1;
                EntradaContable entradaContableDB = new EntradaContable(Descripcion, ModuloContabilidad, IdCuentaContableDB, "DB", UserId, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda, NumeroDocumento);
                EntradaContable entradaContableCR = new EntradaContable(Descripcion, ModuloContabilidad, IdCuentaContableCR, "CR", UserId, FechaAsiento, MontoAsiento, Estado, IdTipoMoneda, NumeroDocumento);
                EntradaContableDAO.agregarEntradaContable(entradaContableDB);
                EntradaContableDAO.agregarEntradaContable(entradaContableCR);
                message = "El asiento se ha registrado exitosamente.";
            }else{
                message = "No cuenta con los permisos necesarios para registar el asiento";
            }
        }else{
            message = "Error al identificar usuario";
        }      
        return message; 
    }
}
