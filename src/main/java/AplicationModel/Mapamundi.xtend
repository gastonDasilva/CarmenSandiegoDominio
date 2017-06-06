package AplicationModel

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.gaston.carmenSanDiego.Pais
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.apache.commons.lang.StringUtils
import ar.gaston.carmenSanDiego.Caso

@Accessors
@Observable
@SuppressWarnings("all")
class Mapamundi implements Serializable  {
	
	List<Pais> paises = new ArrayList<Pais>
	Pais paisSeleccionado
	
	new(){	
	} 
	new(List<Pais> ps ){
		paises = ps
	}
	
	def eliminarPaisSeleccionado(){
		paises.remove(paisSeleccionado)
		paisSeleccionado= null
	}
	
	def agregarNuevoPais(Pais pais) {
		this.eliminarPais((pais.id))
		paises.add(pais)
	}
	
	def setearCasoALugares(Caso cas){
	for(Pais p : paises)
		{
		p.setearCasoAlugares(cas);
		}
	}
	def aceptarPaisEditado() {
		
		ObservableUtils.firePropertyChanged(this, "paises")
	}
	
	def getPais(int id)
	{
		paises.findFirst[it.getId == id ]
	}
	def eliminarPais(int id)
	{
		paises.removeIf[ it.getId == id ]
	}
	def searchPaises(String substring)
	{
		if (StringUtils.isBlank(substring)) {
			this.paises
		} else {
			this.paises.filter[ it.getNombrePais.toLowerCase.contains(substring.toLowerCase) ].toList			
		}
	}
	
	
}