package Extra

import java.util.List
import java.util.ArrayList
import ar.gaston.carmenSanDiego.Caso
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Club
import ar.gaston.carmenSanDiego.Biblioteca
import ar.gaston.carmenSanDiego.Banco

class DummyData {
	
	
	def List<Caso>crearCasosDummy() {
		val List<Caso> casos = new ArrayList<Caso> 
			agregarCaso(crearCaso("Robo Al Faraon"),casos)
			return casos 
	}
	
	def crearCaso(String string) {
		val Villano carmen = crearVillano("Carmen SanDiego")
		val Pais peru = new Pais()
		peru => [
			nombrePais= "Peru"
			agregarCaracteristica("es grande")
			agregarCaracteristica("su bandera es roja y blanca")
			agregarLugarDeInteres(new Embajada=> [
					setearOcupante(carmen)
					])
			agregarLugarDeInteres(new Club=> [
					setearOcupante()
					])
			agregarLugarDeInteres(new Banco=> [
					setearOcupante()
					])
				]
		val Pais inglaterra = new Pais()
			inglaterra=> [
				nombrePais= "Inglaterra"
				agregarCaracteristica("es una isla")
				agregarCaracteristica("tiene reyna")
				agregarPaisConexion(peru)
				agregarLugarDeInteres(new Embajada=> [
					setearInformante()
					])
				agregarLugarDeInteres(new Club=> [
					setearInformante()
					])
				agregarLugarDeInteres(new Biblioteca=> [
					setearInformante()
					])		
				]
		
		val Pais uruguay = new Pais()
			uruguay => [	
			nombrePais= "Uruguay"
			agregarCaracteristica("esta en Sudamerica")
			agregarCaracteristica("su capital es Motevideo")
			agregarPaisConexion(inglaterra)
			agregarLugarDeInteres(new Embajada=> [
					setearCuidador()
					])
			agregarLugarDeInteres(new Biblioteca=> [
					setearCuidador()
					])
			agregarLugarDeInteres(new Banco=> [
					setearCuidador()
					])	
			]				
		val Pais egipto = new Pais()
			egipto => [	
			nombrePais= "Egipto"
			agregarCaracteristica("esta en africa")
			agregarCaracteristica("su capital es El Cairo")
			agregarPaisConexion(inglaterra)
			agregarPaisConexion(uruguay)
			agregarLugarDeInteres(new Embajada=> [
					setearInformante()
					])
			agregarLugarDeInteres(new Biblioteca=> [
					setearInformante()
					])
			agregarLugarDeInteres(new Banco=> [
					setearInformante()
					])	
			]
			
				
		
		new Caso("Robo del Faraon", carmen) => [
				agregarPaisPlanDeEscape(inglaterra)
				agregarPaisPlanDeEscape(peru) 
				reporteDelCaso = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del                
                                 faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III.
                                El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
                                su misión como detective   es desifrar el responsable de tal crímen y apresarlo"
                objetoRobado = "tumba del faraón"       
				setearPaisDeLRobo(egipto)
		]
	}
	
	def Villano crearVillano(String nombreV){
		new Villano=> [
			nombre = nombreV
			sexo = "Femenino"
			agregarSeña( "pelo rubio")
			agregarSeña( "gordo")
			agregarHobbie("jugar al futbol")
			agregarHobbie("ver anime")
		]
	}
	
	
	def  agregarCaso(Caso c, List<Caso> cas) {
		cas.add(c)
	}
	
}