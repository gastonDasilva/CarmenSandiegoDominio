package ar.edu.carmenSandiego.ui

import AplicationModel.Mapamundi
import ar.gaston.carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class CrearEditarPaisAppModel {
	Pais pais
	Mapamundi mapamundi
	
	new (Mapamundi mapamundi){
		this.mapamundi = mapamundi
		this.pais = new Pais
	}

	new (Mapamundi mapamundi, Pais pais){
		this.mapamundi = mapamundi
		this.pais = pais
	}
	
	def agregarPais(){
		mapamundi.agregarNuevoPais(pais)
	}

	def editarPais(){
		ObservableUtils.firePropertyChanged(mapamundi, "paises")
		ObservableUtils.firePropertyChanged(mapamundi, "paisSeleccionado")
	}
	
}