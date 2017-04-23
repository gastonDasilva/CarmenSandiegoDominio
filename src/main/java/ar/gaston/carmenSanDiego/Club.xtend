package ar.gaston.carmenSanDiego

import Extra.RandomExamples

class Club extends LugarDeInteres{
	String primerCaracteristicaDELasSeñasParticulares
	String segundaCaracteristicaDELasSeñasParticulares	
	override procesarInformante() {
			"Vi a alguien como describe!
            "+this.pistasRelacionadasConElDestinoDelVillano
	}
	def String pistasRelacionadasConElDestinoDelVillano(){
		this.caracteriscaDeLVillano()
		" recuerdo que la persona tenia estas señas: "+primerCaracteristicaDELasSeñasParticulares+" . "+ segundaCaracteristicaDELasSeñasParticulares
		+ 
		this.darPistaAdicionalDeHobbies()  
		}
		
	def  void caracteriscaDeLVillano(){
		val randomCarac = new RandomExamples()
		primerCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
		segundaCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
	}
	
	def String darPistaAdicionalDeHobbies() {
		val randomCarac = new RandomExamples()
		val randomnumero = new RandomExamples()
		val int i = randomnumero.nextInt(3)
		if (i== 1 ||i== 2 ){
			return " 
                   Tambien recuerdo haberlo escuchado 
                   dicir que uno de sus hobbies es "+randomCarac.randomIn(super.getCaso.getResponsable.getHobbies)
		}else{
				return ""
				
			}
	}		
	override nombreLugar() {
		return "Club"
	}
	
}