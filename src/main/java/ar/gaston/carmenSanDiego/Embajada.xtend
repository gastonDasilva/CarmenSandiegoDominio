package ar.gaston.carmenSanDiego

import Extra.RandomExamples

class Embajada extends LugarDeInteres {
	Pais paisDestinoRandom
	String primerCaracteristicaDelPaisDestino
	String segundaCaracteristicaDelPaisDestino
	
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
		val randomCaracPaisDestino = new RandomExamples()
		primerCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisDestinoRandom.caracteristicasDelPais)
		segundaCaracteristicaDelPaisDestino = randomCaracPaisDestino.randomIn(paisDestinoRandom.caracteristicasDelPais)
	}
	def paisRandomDelDestino (){
		val randomPaisDestino = new RandomExamples()
		paisDestinoRandom = randomPaisDestino.randomIn(super.getCaso.planDeEscape)
	}
	
}