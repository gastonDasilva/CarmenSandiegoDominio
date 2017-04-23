package AplicationModel

import ar.gaston.carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import Extra.DummyData

@Accessors
@Observable
@SuppressWarnings("all") 
class ExpedientesAppModel  implements Serializable{
	Villano villanoSeleccionado
	List <Villano> villanos = new ArrayList<Villano>()
	
	new(){
		agregarNuevoVillano(new DummyData().crearVillano("Carmen SanDiego"))
		agregarNuevoVillano(new DummyData().crearVillano("Igor Puchesky"))		
	}
	def agregarNuevoVillano(Villano villano) {
		villanos.add(villano)
	}
	
}