package AplicationModel

import ar.gaston.carmenSanDiego.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class VillanoAppModel {
	
	Villano villanoSelec
	String señaSeleccionadaASacar
	String señaAAgregar
	String hobbiesASacar
	String hobbiesAAgregar
	
	
	new(Villano v) {
		villanoSelec = v
	}
	
	def eliminarSeñaSeleccionado(){
		villanoSelec.sacarSeña(señaSeleccionadaASacar)
	}
	
	def agregarSeñaSelec(){
		villanoSelec.agregarSeña(señaAAgregar)
	}
	
	def agregarhobbieSelec(){
		villanoSelec.agregarHobbie(hobbiesAAgregar)
	}
	
	def eliminarHobbieSeleccionado(){
		villanoSelec.sacarHobbie(hobbiesASacar)
	}
	
}