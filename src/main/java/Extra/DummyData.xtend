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
	
	
	List<Pais> paises = new ArrayList<Pais>
	List<Villano> villanos = new ArrayList<Villano>
	 List<Caso> casos = new ArrayList<Caso> 
	
	new(){
		this.crearVillanos()
		this.CrearlistaDePaises()
		this.crearCasosDummy
	} 
	
	def getPaises(){
		paises
	}
	
	def getVillanos(){
		villanos
	}
	
	def getCasos(){
		casos
	}
	def void /*List<Villano>*/ crearVillanos(){
		val Villano carmen = crearVillano("Carmen SanDiego")
		//val Villano igor = crearVillano("Igor Puchesky")
		villanos.add(carmen)
		//villanos.add(igor)
		//return villanos
		
	}
	
	def  void/*List<Caso>*/crearCasosDummy() {
		//val List<Caso> casos = new ArrayList<Caso> 
			agregarCaso(crearCaso("Robo Al Faraon",villanos.get(0)))
			//return casos 
	}
	
	
	def  void/*List<Pais>*/ CrearlistaDePaises(){
	val Pais peru = new Pais()
		peru => [
			nombrePais= "Peru"
			agregarCaracteristica("hablan Español")
			agregarCaracteristica("su bandera es roja y blanca")
			agregarCaracteristica("Comen Palomas")
			agregarCaracteristica("Su moneda es el Peso")
			agregarLugarDeInteres(new Embajada(peru)=> [
					setearOcupante(villanos.get(0))
					])
			agregarLugarDeInteres(new Club(peru)=> [
					setearOcupante()
					])
			agregarLugarDeInteres(new Banco(peru)=> [
					setearOcupante()
					])
				]
		val Pais inglaterra = new Pais()
			inglaterra=> [
				nombrePais= "Inglaterra"
				agregarCaracteristica("esta una isla")
				agregarCaracteristica("tiene reynado")
				agregarPaisConexion(peru)
				agregarLugarDeInteres(new Embajada(inglaterra)=> [
					setearInformante()
					])
				agregarLugarDeInteres(new Banco(inglaterra)=> [
					setearInformante()
					])
				agregarLugarDeInteres(new Club(inglaterra)=> [
					setearInformante()
					])		
				]
		
				
		val Pais egipto = new Pais()
			egipto => [	
			nombrePais= "Egipto"
			agregarCaracteristica("se localiza en africa")
			agregarCaracteristica("su capital es El Cairo")
			agregarCaracteristica("Su idioma es el egipcio")
			agregarPaisConexion(inglaterra)
			agregarLugarDeInteres(new Embajada(egipto)=> [
					setearInformante()
					])
			agregarLugarDeInteres(new Biblioteca(egipto)=> [
					setearInformante()
					])
			agregarLugarDeInteres(new Banco(egipto)=> [
					setearInformante()
					])	
			]
			
		val Pais uruguay = new Pais()
			uruguay => [	
			nombrePais= "Uruguay"
			agregarCaracteristica("esta en Sudamerica")
			agregarCaracteristica("su capital es Motevideo")
			agregarPaisConexion(inglaterra)
			agregarPaisConexion(egipto)
			agregarLugarDeInteres(new Embajada(uruguay)=> [
					setearCuidador()
					])
			agregarLugarDeInteres(new Biblioteca(uruguay)=> [
					setearCuidador()
					])
			agregarLugarDeInteres(new Banco(uruguay)=> [
					setearCuidador()
					])	
			]
		this.agregarPaises( uruguay)
		this.agregarPaises( egipto)	
		this.agregarPaises( inglaterra)	
		this.agregarPaises( peru)
		//return paises
	}
	
	
	def crearCaso(String nombreCaso, Villano respo) {
		//val Villano carmen = crearVillano("Carmen SanDiego")			
		new Caso(nombreCaso, respo) => [
				agregarPaisPlanDeEscape(obtenerPaisPorNombre("Egipto"))
				agregarPaisPlanDeEscape(obtenerPaisPorNombre("Inglaterra"))
				agregarPaisPlanDeEscape(obtenerPaisPorNombre("Peru")) 
				reporteDelCaso = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del                
                                 faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III.
                                El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, 
                                su misión como detective   es desifrar el responsable de tal crímen y apresarlo"
                objetoRobado = "tumba del faraón"       
				setearPaisDeLRobo(obtenerPaisPorNombre("Egipto"))
		]
	}
	
	def agregarPaises(Pais pais) {
		paises.add(pais)
	}
	
	def obtenerPaisPorNombre(String nombreP){
		for(var int i = 0 ;i <= paises.size; i++){	
			if(paises.get(i).nombrePais ==nombreP ){
			return paises.get(i)
			}
		}	
	}
	def Villano crearVillano(String nombreV){
		new Villano=> [
			nombre = nombreV
			sexo = "Femenino"
			agregarSeña( " tiene el pelo rubio")
			agregarSeña( "tiene ojos azules")
			agregarSeña( " usa una collar de rubies ")
			agregarSeña( " tenia una bufanda azul")
			agregarHobbie("jugar al futbol")
			agregarHobbie("ver anime")
			agregarHobbie("escuchar musica de los 80")
		]
	}
	
	
	def  agregarCaso(Caso c) {
		casos.add(c)
	}
	
}