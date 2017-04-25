package AplicationModelTest

import AplicationModel.ResolverMisterioAppModel
import org.junit.Before
import AplicationModel.ExpedientesAppModel
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Caso
import java.util.ArrayList
import java.util.List
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Banco
import ar.gaston.carmenSanDiego.Club
import org.junit.Assert
import org.junit.Test

class TestResolverMisterioAppModel {
	
	ResolverMisterioAppModel resolverMisterioApp
	List<Caso> casos = new ArrayList<Caso>
	 Villano carlos = new Villano
	  Pais guyana = new Pais
		
	@Before
    def void setUp() {
    	val ExpedientesAppModel ex = new ExpedientesAppModel()
    	guyana.nombrePais = "Guyana"
		guyana.agregarLugarDeInteres(new Embajada(guyana)=> [
					setearInformante()])
		guyana.agregarLugarDeInteres(new Banco(guyana)=> [
					setearInformante()])
		guyana.agregarLugarDeInteres(new Club(guyana)=> [
					setearInformante()])
    	 carlos => [
			nombre = "Carlos"
			sexo = "Femenino"
			agregarSeña( " tiene el pelo rubio")
			agregarSeña( "tiene ojos azules")
			agregarSeña( " usa una collar de rubies ")
			agregarSeña( " tenia una bufanda azul")
			agregarHobbie("jugar al futbol")
			agregarHobbie("ver anime")
			agregarHobbie("escuchar musica de los 80")
		]
		val Pais peru = new Pais()
			peru => [
			nombrePais= "Peru"
			agregarCaracteristica("hablan Español")
			agregarCaracteristica("su bandera es roja y blanca")
			agregarCaracteristica("Comen Palomas")
			agregarCaracteristica("Su moneda es el Peso")
			agregarLugarDeInteres(new Embajada(peru)=> [
					setearOcupante(carlos)
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
		val Caso caso1 =new Caso("Robo a la casa de Schiavi", carlos) => [
				agregarPaisPlanDeEscape(inglaterra)
				agregarPaisPlanDeEscape(peru) 
				reporteDelCaso = "A las 9 de la mañana en la ciudad de londres robaron la casa de Schiavi"
                objetoRobado = " nokia 1100"       
				setearPaisDeLRobo(inglaterra)
		]
		casos.add(caso1)
    	resolverMisterioApp = new ResolverMisterioAppModel( ex,casos )	
    }
    
    @Test
	def void agarrarCasoRandom_ConUnSoloCasoEnLaListaDeCasosTest() {
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.nombreCaso)
		Assert.assertEquals(1, resolverMisterioApp.casos.size)
	}
	
	@Test
	def void agregarPaisDondeEstoyALaListaDePaisesPorDondePasoElVillanoTest() {
		resolverMisterioApp.agregarPaisRecorrido
		Assert.assertEquals("Inglaterra", resolverMisterioApp.paisRecorrido.get(0).nombrePais)
		Assert.assertEquals(1, resolverMisterioApp.paisRecorrido.size)
		Assert.assertEquals("Inglaterra->", resolverMisterioApp.nombrePaisesRecorrido.get(0))
		Assert.assertEquals(1, resolverMisterioApp.nombrePaisesRecorrido.size)
		Assert.assertEquals("[Inglaterra->]", resolverMisterioApp.nombrePaises)
		
	}
	
	@Test
	def void agregarUnPaisALaListaDePaisesFallidos_OseaPaisesSinInformacionSobreElVillanoTest() {
		resolverMisterioApp.agregarPaisAFallidos
		Assert.assertEquals("Inglaterra", resolverMisterioApp.paisFallidos.get(0).nombrePais)
		Assert.assertEquals(1, resolverMisterioApp.paisFallidos.size)
	}
	
	@Test
	def void generarOrdenDeArrestoHaciaElVillanoCarlos() {
		resolverMisterioApp.villanoAArrestar = carlos
		resolverMisterioApp.generarOrdenDeArresto
		Assert.assertEquals("Carlos", resolverMisterioApp.casoRandom.ordenDeArrestoAlVillano.nombre)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(0).caso.nombreCaso)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(1).caso.nombreCaso)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(2).caso.nombreCaso)
	}
	@Test
	def void viajarAUnPaisTest() {		
		resolverMisterioApp.viajar(guyana)
		Assert.assertEquals("Guyana", resolverMisterioApp.paisDondeEstoy.nombrePais)
		Assert.assertEquals("Inglaterra", resolverMisterioApp.paisAnterior.nombrePais)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(0).caso.nombreCaso)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(1).caso.nombreCaso)
		Assert.assertEquals("Robo a la casa de Schiavi", resolverMisterioApp.paisDondeEstoy.lugaresDeInteres.get(2).caso.nombreCaso)
	}
	
	@Test
	def void VolverAlPaisAnteriorTest() {
		resolverMisterioApp.viajar(guyana)
		Assert.assertEquals("Guyana", resolverMisterioApp.paisDondeEstoy.nombrePais)
		Assert.assertEquals("Inglaterra", resolverMisterioApp.paisAnterior.nombrePais)
		resolverMisterioApp.volverAlPaisAnterior
		Assert.assertEquals("Inglaterra", resolverMisterioApp.paisDondeEstoy.nombrePais)
	}
	
	@Test
	def void devolverTrueSiEsElMismoVillanoTest() {
		val Villano fernando = new Villano
		fernando.nombre = "Fernando"
		resolverMisterioApp.villanoAArrestar = carlos
		Assert.assertTrue(resolverMisterioApp.devolverTrueSiEsElMismoVillano)
		resolverMisterioApp.villanoAArrestar = fernando
		Assert.assertFalse(resolverMisterioApp.devolverTrueSiEsElMismoVillano)
	}	
	
	@Test
	def void getOrdenDeArrestoNoEmitidaTest() {
		Assert.assertTrue(resolverMisterioApp.getOrdenDeArrestoNoEmitida)
		resolverMisterioApp.villanoAArrestar = carlos
		Assert.assertFalse(resolverMisterioApp.getOrdenDeArrestoNoEmitida)
	}
	
	@Test
	def void getNombrePrimerLugarDeInteresTest() {
		Assert.assertEquals("Embajada", resolverMisterioApp.getNombrePrimerLugarDeInteres(guyana))
	}
	
	@Test
	def void getNombreSegundoLugarDeInteresTest() {
		Assert.assertEquals("Banco", resolverMisterioApp.getNombreSegundoLugarDeInteres(guyana))
	}
	
	@Test
	def void getNombreTercerLugarDeInteresTest() {
		Assert.assertEquals("Club", resolverMisterioApp.getNombreTercerLugarDeInteres(guyana))
	}			
}