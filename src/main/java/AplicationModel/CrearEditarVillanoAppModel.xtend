package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.gaston.carmenSanDiego.Villano
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class CrearEditarVillanoAppModel {
	Villano vil
	ExpedientesAppModel exp
	
	
	new (ExpedientesAppModel e){
		this.exp = e
		this.vil = new Villano
	}

	new (ExpedientesAppModel e, Villano v){
		this.exp = e
		this.vil = v
	}
	
	def agregarVillano(){
		exp.agregarNuevoVillano(vil)
	}

	def editarVillano(){
		ObservableUtils.firePropertyChanged(exp, "villanos")
		ObservableUtils.firePropertyChanged(exp, "villanoSeleccionado")
	}
}