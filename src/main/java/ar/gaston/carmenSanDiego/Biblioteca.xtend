package ar.gaston.carmenSanDiego

import Extra.RandomExamples

class Biblioteca extends LugarDeInteres{
	Pais paisDestinoRandom
	String CaracteristicaDelPaisDestino
	String CaracteristicaDELasSeñasParticulares
	
	override String  procesarInformante() {
		"Vi a alguien como describe!"+this.pistasRelacionadasConElDestinoDelVillano
	}
	
	def String pistasRelacionadasConElDestinoDelVillano(){
		this.paisRandomDelDestino()
		this.caracteriscaDeLPaisDetinoRandom()
		"creo haber oido que tenia planeado ir 
         a un pais con las siguientes caracteristicas: "+CaracteristicaDelPaisDestino+" . 
         "+"Ademas recuerdo que la persona tenia estas señas: "+ CaracteristicaDELasSeñasParticulares
		+ this.darPistaAdicionalDeHobbies() 
		}
	
	def String darPistaAdicionalDeHobbies() {
		val randomCarac = new RandomExamples()
		val randomnumero = new RandomExamples()
		if (randomnumero.nextInt(2)== 1){
			return " tambien recuerdo haberlo escuchado dicir que uno de sus hobbies es 
				 "+randomCarac.randomIn(super.getCaso.getResponsable.getHobbies)
		}else{
				return ""
				
			}
	}
	
	def  void caracteriscaDeLPaisDetinoRandom(){
		val randomCarac = new RandomExamples()
		CaracteristicaDelPaisDestino = randomCarac.randomIn(paisDestinoRandom.caracteristicasDelPais)
		CaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
	}
	def paisRandomDelDestino (){
		val randomPaisDestino = new RandomExamples()
		paisDestinoRandom = randomPaisDestino.randomIn(super.getCaso.planDeEscape)
	}		
	override nombreLugar() {
		return "Biblioteca"
	}
	
}