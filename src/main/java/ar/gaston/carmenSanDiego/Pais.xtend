package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Pais {
	String nombrePais
	List <String> caracteristicasDelPais = new ArrayList<String>()
	List <Pais> paisConexiones = new ArrayList<Pais>()
	List<LugarDeInteres> lugaresDeInteres= new ArrayList<LugarDeInteres>() //limite son 3 lugares sin repetidos
	
	def void setNombrePais(String n){
		nombrePais= n
	}
	def getNombrePais(){
		nombrePais
	}
	
	
	def void agregarCaracteristica(String c){
		caracteristicasDelPais.add(c)
	}
	
	def List <String> getCaracteristicasDelPais(){	
		caracteristicasDelPais
		
	}
	
	def sacarCaracteristica(String c){
		caracteristicasDelPais.remove(c)
		
	}
	
	def void agregarPaisConexion(Pais p){
		paisConexiones.add(p)
	}
	
	def sacarPaisConexion(Pais p){
		paisConexiones.remove(p)
	}
	
	def List <Pais> getPaisConexion(){	
		paisConexiones
		
	}
	
	def void agregarLugarDeInteres(LugarDeInteres l){
		if (lugaresDeInteres.contains(l)){
			System.out.println("Error el lugar de interes"+ l+ "ya esta en la lista" );
		   } 
		    else
		        {
		        lugaresDeInteres.add(l)	
	            }
	       }
	def sacarLugarDeInteres(LugarDeInteres l){
		lugaresDeInteres.remove(l)
	}       
	       
 	def List <LugarDeInteres> getlugaresDeInteres(){	
		lugaresDeInteres
		
	}
	
	def LugarDeInteres getPrimerLugarDeInteres(){
		return lugaresDeInteres.get(0)
	}
	
	def LugarDeInteres getSegundoLugarDeInteres(){
		return lugaresDeInteres.get(1)
	}
	
	def LugarDeInteres getTercerLugarDeInteres(){
		return lugaresDeInteres.get(2)
	}
	       
	def void recorrerLugaresDeInteres(){
		
	//	for (int i= 0;i != lugaresDeInteres.size(); i++ ){
	       lugaresDeInteres.forEach[ procesar ]
		}
	
	def setearCasoAlugares(Caso caso) {
		for( LugarDeInteres l: lugaresDeInteres){
				l.setearCaso(caso)
			}
	}
		
	//}
	
}

