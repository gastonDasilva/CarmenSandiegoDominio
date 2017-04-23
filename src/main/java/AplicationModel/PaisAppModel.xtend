package AplicationModel

import ar.gaston.carmenSanDiego.Pais
import java.util.Arrays
import ar.gaston.carmenSanDiego.LugarDeInteres
import org.uqbar.commons.utils.Observable
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class PaisAppModel {
	Pais paisSelec
	LugarDeInteres LugarDeInteresSeleccionado 
	LugarDeInteres LugarDeInteresSeleccionadoASacar
	Pais paisConexionSelecASacar
	Pais paisConexionSelec 
	String caracteristicaASacar
	String caracteristicaAAgregar
	//List<Pais> paisConexionesPosibles = this.paisesConexionesPosibles()
	
	new(Pais pais) {
		paisSelec = pais
	}
	
	def getPaisSelec(){
		paisSelec
	}
	
	def List<LugarDeInteres> getlugaresDeInteresPosibles(){
		//return LugarDeInteres.values
	}
	/* 
	def paisesConexionesPosibles(){
		paisSelec.getPaisConexion
	}*/
	
	def agregarLugarDeInteresSelec(){
		paisSelec.agregarLugarDeInteres(LugarDeInteresSeleccionado)
	}
	
	def eliminarLugarSeleccionado(){
		paisSelec.sacarLugarDeInteres(LugarDeInteresSeleccionadoASacar)
	}
	
	def agregarPaisConexionSelec(){
		paisSelec.agregarPaisConexion(paisConexionSelec)
	}
	
	def eliminarPaisConexionSeleccionado(){
		paisSelec.sacarPaisConexion(paisConexionSelecASacar)
	}
	
	def eliminarCaracteristicaSeleccionado(){
		paisSelec.sacarCaracteristica(caracteristicaASacar)
	}
	
	def agregarCaracteristicaSelec(){
		paisSelec.agregarCaracteristica(caracteristicaAAgregar)
	}
}