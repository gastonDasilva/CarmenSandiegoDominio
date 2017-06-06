package AplicationModel

import ar.gaston.carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.apache.commons.lang.StringUtils

@Accessors
@Observable
@SuppressWarnings("all") 
class ExpedientesAppModel  implements Serializable{
	//Villano villanoSeleccionado
	List <Villano> villanos = new ArrayList<Villano>()
	
	new(){	
	}
	new(List <Villano> vill){
		villanos = vill
	}
	def agregarNuevoVillano(Villano villano) {
		villano.id = villanos.size +1
		villanos.add(villano)
	}
	
	def actualizarVillano(Villano villanoActualizado) {
	var Villano villano = getVillano(villanoActualizado.id)
		villano.nombre = villanoActualizado.nombre
		villano.hobbies = villanoActualizado.hobbies
		villano.senhasParticulares = villanoActualizado.senhasParticulares
		villano.sexo = villanoActualizado.sexo
	}
	
/********** creado para app web **************/
	
	def getVillano(int id)
	{
		villanos.findFirst[ it.getId == id ]
	}
	
	def eliminarVillano(int id){
		villanos.removeIf[ it.getId == id ]
	}
	def searchVillanos(String substring){
		if (StringUtils.isBlank(substring)) {
			this.villanos
		} else {
			this.villanos.filter[ it.getNombre.toLowerCase.contains(substring.toLowerCase) ].toList			
		}
	}
	
}