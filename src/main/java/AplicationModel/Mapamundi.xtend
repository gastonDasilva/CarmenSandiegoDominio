package AplicationModel

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.gaston.carmenSanDiego.Pais
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
@SuppressWarnings("all")
class Mapamundi implements Serializable  {
	
	List<Pais> paises = new ArrayList<Pais>
	Pais paisSeleccionado 
	
	def eliminarPaisSeleccionado(){
		paises.remove(paisSeleccionado)
		paisSeleccionado= null
	}
	
	def agregarPais(){
		val p = new Pais()
		paisSeleccionado = p
		paises.add(p)
	}
}