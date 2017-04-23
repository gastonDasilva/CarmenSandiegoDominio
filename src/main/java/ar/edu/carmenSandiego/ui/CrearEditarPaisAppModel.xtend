package ar.edu.carmenSandiego.ui

import AplicationModel.Mapamundi
import ar.gaston.carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import ar.gaston.carmenSanDiego.LugarDeInteres
import java.util.List
import java.util.ArrayList
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Biblioteca
import ar.gaston.carmenSanDiego.Banco
import ar.gaston.carmenSanDiego.Club
import org.uqbar.commons.model.UserException

@Accessors
@Observable
@SuppressWarnings("all")
class CrearEditarPaisAppModel {
	//Pais pais
	Mapamundi mapamundi
	Pais paisSelec
	LugarDeInteres lugarDeInteresSeleccionado 
	LugarDeInteres lugarASacar
	Pais paisConexionSelecASacar
	Pais paisConexionSelec 
	String caracteristicaASacar
	String caracteristicaAAgregar
	
	new (Mapamundi mapamundi){
		this.mapamundi = mapamundi
		this.paisSelec = new Pais
	}

	new (Mapamundi mapamundi, Pais pais){
		this.mapamundi = mapamundi
		this.paisSelec = pais
	}
	
	def agregarPais(){
		mapamundi.agregarNuevoPais(paisSelec)
	}

	def editarPais(){
		ObservableUtils.firePropertyChanged(mapamundi, "paises")
		ObservableUtils.firePropertyChanged(mapamundi, "paisSeleccionado")
	}
	
	def paisConexionesPosibles(){
		mapamundi.paises
	}
	
	def List<LugarDeInteres> lugaresDeInteresPosibles(){
		val List<LugarDeInteres> res = new ArrayList<LugarDeInteres>
		val LugarDeInteres emba =new Embajada
			emba.setearCuidador()		
		val LugarDeInteres biblio =	new Biblioteca
			biblio.setearCuidador()		
		val LugarDeInteres banco =	new Banco
			banco.setearCuidador()
		val LugarDeInteres club =	new Club
			club.setearCuidador()	
		res.add(emba)
		res.add(biblio)
		res.add(banco)
		res.add(club)				
		return res
	}
	
	def agregarLugarDeInteresSelec(){
		 if (paisSelec.lugaresDeInteres.size ==3) {
        throw new UserException("El Pais ya tiene el limite establecido de lugares")
    }else{
		paisSelec.agregarLugarDeInteres(lugarDeInteresSeleccionado)
		}
	}
	
	def eliminarLugarSeleccionado(){
		paisSelec.sacarLugarDeInteres(lugarASacar)
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