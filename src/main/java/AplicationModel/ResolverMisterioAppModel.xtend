package AplicationModel

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
	List<Caso> casos = new ArrayList<Caso>
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
	String primerLugarNombre 
	String segundoLugarNombre 
	String tercerLugarNombre 
	
	new (){	
		agarrarCasoRandom()	
		paisDondeEstoy = casoRandom.getPaisDelRobo
	}
	new (ExpedientesAppModel ex,List<Caso> cas ){
		casos= cas
		exp = ex		
		agarrarCasoRandom()	
		paisDondeEstoy = casoRandom.getPaisDelRobo
		setearNombreLugares(paisDondeEstoy)
		paisDondeEstoy.setearCasoAlugares(casoRandom)
	}
	
	def setearNombreLugares(Pais p){
		//setea los nombre de los lugares en los valores correspondientes
		primerLugarNombre = this.getNombrePrimerLugarDeInteres(p)
		segundoLugarNombre = this.getNombreSegundoLugarDeInteres(p)
		tercerLugarNombre = this.getNombreTercerLugarDeInteres (p)
	}
	def agarrarCasoRandom(){
		 val randomC = new RandomExamples()
		casoRandom = randomC.randomIn(casos)
	}
	
	def String obtenerRecorridoCriminal(){
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
				nombrePaisesRecorrido.add(p)+"->"
			}
	}
	
	def String devolverNombreDeVillanoSiExiste(){
		return "Orden ya emitida:" 
	}
	
	def volverAlPaisAnterior() {
		paisDondeEstoy = paisAnterior
	}
	
	def viajar(Pais pais) {
		paisAnterior = paisDondeEstoy
		paisDondeEstoy = pais
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		paisDondeEstoy.setearCasoAlugares(casoRandom)
		ObservableUtils.firePropertyChanged(this,"paisSeleccionado")
		//this.setearNombreLugares(paisSeleccionado)
	}
	
	def generarOrdenDeArresto() {
		casoRandom.setearOrdenDeArrestoAlVillano(villanoAArrestar)
		paisDondeEstoy.setearCasoAlugares(casoRandom)
		
	}
	
	def agregarPaisAFallidos() {
		//agrega a la lista paisFallido (osea aquellos paises que no tiene info sobre el villano) el pais acual "paisDondeEstoy"
		// si este no se encuentra en dicha lista "PaisFallido" 
		if(paisFallidos.contains(paisDondeEstoy)){
			
		}else{
			  paisFallidos.add(paisDondeEstoy)
			 }
			  
	}
	
	def agregarPaisRecorrido() {
		//agrega el "paisDondeEstoy" a la lista de paisRecorrido si no lo tiene 
			if(paisRecorrido.contains(paisDondeEstoy)){
			
		}else{
			  paisRecorrido.add(paisDondeEstoy)
			  nombrePaisesRecorrido.add((paisDondeEstoy.nombrePais)+"->")
			  nombrePaises =obtenerRecorridoCriminal()
			 }		  
	}
	
	def Boolean devolverTrueSiEsElMismoVillano(){
		if(villanoAArrestar.nombreVillano == casoRandom.responsable.nombreVillano){
			return true
		} else {false}
	}
	def  getNombrePrimerLugarDeInteres(Pais p) {
		//retorna el nombre del primer LugarDeInteres del pais
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		 p.getPrimerLugarDeInteres.nombreLugar
	}
	
	def  getNombreSegundoLugarDeInteres(Pais p) {
		//retorna el nombre del segundo LugarDeInteres del pais
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		 p.getSegundoLugarDeInteres.nombreLugar
	}
	
	def  getNombreTercerLugarDeInteres(Pais p) {
		//retorna el nombre del tercer LugarDeInteres del pais
		ObservableUtils.firePropertyChanged(this,"paisDondeEstoy")
		p.getTercerLugarDeInteres.nombreLugar
	}
	
	def getOrdenDeArrestoNoEmitida() {
		//retorna true si no se hizo una orden de arrestar, osea el villanoAArrestar es null
		if(villanoAArrestar == null){
			 true
		} else {false}
	}
	
}