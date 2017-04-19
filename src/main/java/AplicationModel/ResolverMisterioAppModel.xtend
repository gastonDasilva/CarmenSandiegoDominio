package AplicationModel

import ar.gaston.carmenSanDiego.Caso
import java.util.List
import java.util.ArrayList
import Extra.RandomExamples
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Villano

@Accessors
@Observable
@SuppressWarnings("all")
class ResolverMisterioAppModel {
	List<Caso> casos = new ArrayList<Caso>
	Caso casoRandom
	Pais paisDondeEstoy
	List<Pais> paisRecorrido = new ArrayList<Pais>
	List<Pais> paisFallidos = new ArrayList<Pais>
	Villano villanoAArrestar
	
	new (){
	agarrarCasoRandom()	
	paisDondeEstoy = casoRandom.getPaisDelRobo 	
	}
	def agarrarCasoRandom(){
		 val randomC = new RandomExamples()
		casoRandom = randomC.randomIn(casos)
	}
	
	def String devolverNombreDeVillanoSiExiste(){
		if(villanoAArrestar == null){
			return "Orden de arresto sin emitir"
		}else
		{return "Orden ya emitida:" }
	}
	
}