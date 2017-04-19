package AplicationModel

import ar.gaston.carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
@SuppressWarnings("all") 
class ExpedientesAppModel  implements Serializable{
	Villano villanoSeleccionado
	ArrayList <Villano> villanos = new ArrayList<Villano>()
}