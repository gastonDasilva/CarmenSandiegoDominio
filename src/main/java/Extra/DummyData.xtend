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
import AplicationModel.ExpedientesAppModel
import AplicationModel.Mapamundi
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DummyData {
	
	
	Mapamundi paises = new Mapamundi
	ExpedientesAppModel expediente = new ExpedientesAppModel
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
		val elAleph = new Villano(2, "El Aleph","Masculino")
			elAleph.agregarSeña( " tiene el pelo rubio")
			elAleph.agregarSeña( "tiene ojos azules")
			elAleph.agregarSeña( " usa una collar de rubies ")
			elAleph.agregarSeña( " tenia una bufanda azul")
			elAleph.agregarHobbie("jugar al futbol")
			elAleph.agregarHobbie("ver anime")
			elAleph.agregarHobbie("escuchar musica de los 80")		
			
			
		expediente.agregarNuevoVillano(new Villano(1, "Carlos","Masculino"))
		expediente.agregarNuevoVillano(elAleph)
		expediente.agregarNuevoVillano(new Villano(3, "Igor Brodie","Masculino"))
		expediente.agregarNuevoVillano(new Villano(4, "Carmen San Diego","Femenino"))
		expediente.agregarNuevoVillano(new Villano(5, "Juan Perez","Masculino"))
		//villanos.add(igor)
		//return villanos
		
	}
	
	def  void/*List<Caso>*/crearCasosDummy() {
		//val List<Caso> casos = new ArrayList<Caso> 
			agregarCaso(crearCaso("Robo Al Faraon",expediente.villanos.get(0)))
			//return casos 
	}
	
	
	def  void/*List<Pais>*/ CrearlistaDePaises(){
	
		val Pais argentina = new Pais("Argentina",1)
		argentina.agregarCaracteristica("hablan Español")
			argentina.agregarCaracteristica("su bandera es celeste y blanca")
			argentina.agregarCaracteristica("Comen Asado")
			argentina.agregarCaracteristica("Su moneda es el Peso Argentino")
			argentina.agregarLugarDeInteres(new Embajada(argentina)=> [
					setearInformante()
					])

			argentina.agregarLugarDeInteres(new Club(argentina)=> [
					setearInformante()
					])
			argentina.agregarLugarDeInteres(new Banco(argentina)=> [
					setearInformante()
					])
		val peru = new Pais("Peru",2)
		peru.agregarLugarDeInteres(new Embajada(peru)=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Banco(peru)=> [
					setearOcupante()
					])
		peru.agregarLugarDeInteres(new Biblioteca(peru)=> [
					setearOcupante(expediente.getVillano(2))
					])
		peru.agregarCaracteristica("hablan Español")
		peru.agregarCaracteristica("su bandera es roja y blanca")
		peru.agregarCaracteristica("Comen Palomas")
		peru.agregarCaracteristica("Su moneda es el Peso")
		val españa = new Pais( "España",3)
		val bolivia = new Pais("Bolivia",4)
		bolivia.agregarLugarDeInteres(new Embajada(bolivia))
		bolivia.agregarLugarDeInteres(new Club(bolivia))
		bolivia.agregarLugarDeInteres(new Biblioteca(bolivia))
		val francia = new Pais("Francia",5)
		francia.agregarLugarDeInteres(new Embajada(francia))
		francia.agregarLugarDeInteres(new Club(francia))
		francia.agregarLugarDeInteres(new Biblioteca(francia))
		argentina.agregarPaisConexion(peru)
		argentina.agregarPaisConexion(francia)
		argentina.agregarPaisConexion(bolivia)
		bolivia.agregarPaisConexion(argentina)
		paises.agregarNuevoPais(argentina)
		paises.agregarNuevoPais(peru)
		paises.agregarNuevoPais(españa)
		paises.agregarNuevoPais(bolivia)
		paises.agregarNuevoPais(francia)
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
		paises.agregarNuevoPais(pais)
	}
	
	def obtenerPaisPorNombre(String nombreP){
		paises.paises.findFirst[it.nombrePais == nombreP]
			
	}
//	def Villano crearVillano(String nombreV){
//		new Villano=> [
//			nombre = nombreV
//			sexo = "Femenino"
//			agregarSeña( " tiene el pelo rubio")
//			agregarSeña( "tiene ojos azules")
//			agregarSeña( " usa una collar de rubies ")
//			agregarSeña( " tenia una bufanda azul")
//			agregarHobbie("jugar al futbol")
//			agregarHobbie("ver anime")
//			agregarHobbie("escuchar musica de los 80")
//		]
//	}
	
	
	def  agregarCaso(Caso c) {
		casos.add(c)
	}
	
	def caso() {
		var random = new RandomExamples()
		random.randomIn(this.casos)
	}
	
}