package ar.gaston.carmenSanDiego

import Extra.RandomExamples
import java.util.List

class Banco extends LugarDeInteres{
	Pais paisProximoDestino
	String CaracteristicaDelPaisDestino
	String CaracteristicaDELasSeñasParticulares
	
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
         un pais con las siguientes caracteristicas: "+CaracteristicaDelPaisDestino+" .
          "+" Ademas recuerdo que la persona tenia estas señas: "+ CaracteristicaDELasSeñasParticulares 
		}
		
	def  void caracteriscaDeLPaisDetinoRandom(){
		// inicializa en los valores:
		// "CaracteristicaDelPaisDestino"con una caracteristica random del pais proximo pais del plan de escape del villano
		// "CaracteristicaDELasSeñasParticulares" caracteristicas random de las señas particulares del villano
		val randomCarac = new RandomExamples()
		CaracteristicaDelPaisDestino = randomCarac.randomIn(paisProximoDestino.caracteristicasDelPais)
		CaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
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
	override nombreLugar() {
		return "Banco"
	}
	
}