package ar.gaston.carmenSanDiego

import Extra.RandomExamples

class Club extends LugarDeInteres{
	String primerCaracteristicaDELasSeñasParticulares
	String segundaCaracteristicaDELasSeñasParticulares
	
	new(Pais p) {
		super(p)
	}
	
	new() {
	}
	
	override procesarInformante() {
			"Vi a alguien como describe!
            "+this.pistasRelacionadasConElDestinoDelVillano
	}
	def String pistasRelacionadasConElDestinoDelVillano(){
		this.caracteriscaDeLVillano()
		" recuerdo que la persona tenia estas señas: "+primerCaracteristicaDELasSeñasParticulares+" , "+ segundaCaracteristicaDELasSeñasParticulares+" 
		"+ this.darPistaAdicionalDeHobbies()  
		}
		
	def  void caracteriscaDeLVillano(){
		// inicializa en los valores:
		// "primerCaracteristicaDELasSeñasParticulares"con una caracteristicas random de las señas particulares del villano
		// "segundaCaracteristicaDELasSeñasParticulares" con una caracteristicas random de las señas particulares del villano
		val randomCarac = new RandomExamples()
		primerCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
		segundaCaracteristicaDELasSeñasParticulares = randomCarac.randomIn(super.getCaso.getResponsable.getSeñasParticulares)
	}
	
	def String darPistaAdicionalDeHobbies() {
		//Esto retorna en un 70% de la veces una caracteristica ramdom de los hobbies del villano
		val randomCarac = new RandomExamples()
		val randomnumero = new RandomExamples()
		val int i = randomnumero.nextInt(3)
		if (i== 1 ||i== 2 ){// con este hacemos lo probabilidad del 70 % osea si es 1 o 2 entra al if sino sale
			return " Tambien recuerdo haberlo escuchado decir que uno de sus hobbies es "+randomCarac.randomIn(super.getCaso.getResponsable.getHobbies)
		}else{
				return ""
				
			}
	}		
	override nombreLugar() {
		return "Club"
	}
	
}