package AplicationModel

import Extra.DummyData
import Extra.RandomExamples
import ar.gaston.carmenSanDiego.Caso
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Villano
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
@SuppressWarnings("all")
class ResolverMisterioAppModel {
	//List<Caso> casos = new ArrayList<Caso>
	List<Caso> casos = new DummyData().crearCasosDummy
	Caso casoRandom
	Pais paisDondeEstoy
	Pais paisAnterior
	Pais paisSeleccionado
	List<Pais> paisRecorrido = new ArrayList<Pais>
	List<Pais> paisFallidos = new ArrayList<Pais>
	Villano villanoAArrestar
	ExpedientesAppModel exp
	List<String> nombrePaisesRecorrido = new ArrayList<String>
	String nombrePaises 
	
	new (){	
		agarrarCasoRandom()	
		paisDondeEstoy = casoRandom.getPaisDelRobo
	}
	new (ExpedientesAppModel ex){
		exp = ex		
		agarrarCasoRandom()	
		paisDondeEstoy = casoRandom.getPaisDelRobo
	}
	
	def agarrarCasoRandom(){
		 val randomC = new RandomExamples()
		casoRandom = randomC.randomIn(casos)
	}
	
	def String obtenerRecorridoCriminal(){
		/*if(paisRecorrido.empty){
			return ""
		}else{*/ 
			ObservableUtils.firePropertyChanged(this,"paisRecorrido")
			if(nombrePaisesRecorrido.empty){
				
			}else{
					
	         return nombrePaisesRecorrido.toString
	         }
			 //}
	}
	
	def String nombreCaso(){
		casoRandom.nombreCaso
	}
	
	def   nombreDeLosPaisesRecorrido(){
		
		for( String p: nombrePaisesRecorrido){
				nombrePaisesRecorrido.add(p)+"<-"
			}
	}
	
	def String devolverNombreDeVillanoSiExiste(){
		/*if(villanoAArrestar == null){
			return "Orden de arresto sin emitir"
		}else*/
		return "Orden ya emitida:" 
	}
	
	def volverAlPaisAnterior() {
		paisDondeEstoy = paisAnterior
	}
	
	def viajar(ar.gaston.carmenSanDiego.Pais pais) {
		paisAnterior = paisDondeEstoy
		paisDondeEstoy = pais
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
	}
	
	def generarOrdenDeArresto() {
		casoRandom.setearOrdenDeArrestoAlVillano(villanoAArrestar)
		paisDondeEstoy.setearCasoAlugares(casoRandom)
		
	}
	
	def agregarPaisAFallidos() {
		if(paisFallidos.contains(paisDondeEstoy)){
			
		}else{
			  paisFallidos.add(paisDondeEstoy)
			 }
			  
	}
	
	def agregarPaisRecorrido() {
			if(paisRecorrido.contains(paisDondeEstoy)){
			
		}else{
			  paisRecorrido.add(paisDondeEstoy)
			  nombrePaisesRecorrido.add((paisDondeEstoy.nombrePais)+"<-")
			  nombrePaises =obtenerRecorridoCriminal()
			 }		  
	}
	
	def Boolean devolverTrueSiEsElMismoVillano(){
		if(villanoAArrestar.nombreVillano == casoRandom.responsable.nombreVillano){
			return true
		} else {false}
	}
	def  getNombrePrimerLugarDeInteres() {
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		 paisDondeEstoy.getPrimerLugarDeInteres.nombreLugar
	}
	
	def  getNombreSegundoLugarDeInteres() {
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		 paisDondeEstoy.getSegundoLugarDeInteres.nombreLugar
	}
	
	def  getNombreTercerLugarDeInteres() {
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		paisDondeEstoy.getTercerLugarDeInteres.nombreLugar
	}
	
}