package ar.gaston.carmenSanDiego

import Extra.RandomExamples
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Embajada extends LugarDeInteres {
	Pais paisProximoDestino
	String primerCaracteristicaDelPaisDestino
	String segundaCaracteristicaDelPaisDestino
	
	new(Pais p) {
		super(p)
	}
	
	new() {
	}
	
	override procesarInformante() {
			"Vi a alguien como describe!"+this.pistasRelacionadasConElDestinoDelVillano
			
	}
	
	def String pistasRelacionadasConElDestinoDelVillano(){
		
		this.paisRandomDelDestino()
		this.caracteriscaDeLPaisDetinoRandom()
		"creo haber oido que tenia planeado ir a 
         un pais con las siguientes caracteristicas: "+primerCaracteristicaDelPaisDestino+" , "+segundaCaracteristicaDelPaisDestino
		}
	override String nombreLugar() {
		return "Embajada"
	}
	
	def  void caracteriscaDeLPaisDetinoRandom(){
		// inicializa en los valores "primerCaracteristicaDelPaisDestino" y
		// "segundaCaracteristicaDelPaisDestino" caracteristicas random del proximo pais del plan de escape del villano
		val randomCaracPaisDestino = new RandomExamples()
		primerCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisProximoDestino.caracteristicasDelPais)
		segundaCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisProximoDestino.caracteristicasDelPais)
	}
	def paisRandomDelDestino (){
		//obtiene el proximo pais del plan de escape 
		paisProximoDestino = this.sacarElProximoDestinoDelPlanDeEscape(super.getPaisLugar, super.getCaso.planDeEscape)
	}
	
	def Pais sacarElProximoDestinoDelPlanDeEscape(Pais pais, List<Pais> planDeEscape) { 
		// obtiene el pais siguiente del plan de escape desde el pais donde estoy parado  
		for(var int i = 0 ;i <= planDeEscape.size; i++){	
			if(planDeEscape.get(i).nombrePais ==pais.nombrePais ){
			return planDeEscape.get(i+1)
			}
		}	
	 }
}