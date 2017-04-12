package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@TransactionalAndObservable
class Pais {
	String nombrePais
	List <String> caracteristicasDelPais = new ArrayList<String>()
	List <Pais> paisConexiones = new ArrayList<Pais>()
	ArrayList<LugarDeInteres> lugaresDeInteres= new ArrayList<LugarDeInteres>() //limite son 3 lugares sin repetidos
	
	def void setNombrePais(String n){
		nombrePais= n
	}
	
	def void agregarCaracteristica(String c){
		caracteristicasDelPais.add(c)
	}
	
	def List <String> getCaracteristicasDelPais(){	
		caracteristicasDelPais
		
	}
	
	def void agregarPaisConexion(Pais p){
		paisConexiones.add(p)
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
	       
 	def List <LugarDeInteres> getlugaresDeInteres(){	
		lugaresDeInteres
		
	}
	       
	def void recorrerLugaresDeInteres(){
		
	//	for (int i= 0;i != lugaresDeInteres.size(); i++ ){
	       lugaresDeInteres.forEach[ procesar ]
		}
		
	//}
	
}

