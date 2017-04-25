package AplicationModel

import ar.gaston.carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
@SuppressWarnings("all") 
class ExpedientesAppModel  implements Serializable{
	Villano villanoSeleccionado
	List <Villano> villanos = new ArrayList<Villano>()
	
	new(){	
	}
	new(List <Villano> vill){
		villanos = vill
	}
	def agregarNuevoVillano(Villano villano) {
		villanos.add(villano)
	}
	
}