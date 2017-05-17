package AplicationModelTest

import org.junit.Before
import ar.edu.carmenSandiego.ui.CrearEditarPaisAppModel
import AplicationModel.Mapamundi
import ar.gaston.carmenSanDiego.Pais
import org.junit.Test
import org.junit.Assert
import ar.gaston.carmenSanDiego.Embajada

class TestCrearEditarPaisAppModel {
	CrearEditarPaisAppModel crearEditarPais
	
	 @Before
	 def void setUp() {
	 	val Mapamundi map = new Mapamundi()
	 	val Pais argentina = new Pais()
		argentina.nombrePais = "Argentina"
	 	crearEditarPais = new CrearEditarPaisAppModel(map, argentina)
	 }
	 
	@Test
	def void agregarPaisTest() {
		crearEditarPais.agregarPais
		Assert.assertEquals("Argentina",crearEditarPais.mapamundi.paises.get(0).nombrePais)
	}
	
	@Test
	def void paisConexionesPosiblesTest() {
		crearEditarPais.agregarPais
		Assert.assertEquals(1,crearEditarPais.paisConexionesPosibles.size)
	}
	
	@Test
	def void agregarLugarDeInteresSeleccionadoEmbajadaTest() {
		val Embajada embajada1= new Embajada()
		crearEditarPais.lugarDeInteresSeleccionado = embajada1
		crearEditarPais.agregarLugarDeInteresSelec
		Assert.assertEquals("Embajada",crearEditarPais.paisSelec.lugaresDeInteres.get(0).nombreLugar)
	}
	
	@Test
	def void EliminarLugarDeInteresSeleccionadoEmbajadaTest() {
		val Embajada embajada1= new Embajada()
		crearEditarPais.lugarDeInteresSeleccionado = embajada1
		crearEditarPais.agregarLugarDeInteresSelec
		Assert.assertEquals("Embajada",crearEditarPais.paisSelec.lugaresDeInteres.get(0).nombreLugar)
		crearEditarPais.lugarASacar = embajada1
		crearEditarPais.eliminarLugarSeleccionado
		Assert.assertEquals(0,crearEditarPais.paisSelec.lugaresDeInteres.size)
	}
	
	@Test
	def void agregarPaisConexionSelecTest() {
		val Pais peru= new Pais()
		peru.nombrePais = "Peru"
		crearEditarPais.paisConexionSelec = peru
		crearEditarPais.agregarPaisConexionSelec
		Assert.assertEquals("Peru",crearEditarPais.paisSelec.paisConexiones.get(0).nombrePais)
	}
	
	@Test
	def void eliminarPaisConexionSeleccionadoTest() {
		val Pais peru= new Pais()
		peru.nombrePais = "Peru"
		crearEditarPais.paisConexionSelec = peru
		crearEditarPais.agregarPaisConexionSelec
		Assert.assertEquals("Peru",crearEditarPais.paisSelec.paisConexiones.get(0).nombrePais)
		crearEditarPais.paisConexionSelecASacar = peru
		crearEditarPais.eliminarPaisConexionSeleccionado
		Assert.assertEquals(0,crearEditarPais.paisSelec.paisConexiones.size)
	}
	
	@Test
	def void agregarCaracteristicaSelecTest() {
		crearEditarPais.caracteristicaAAgregar = "Su moneda es el Peso"
		crearEditarPais.agregarCaracteristicaSelec
		Assert.assertEquals("Su moneda es el Peso",crearEditarPais.paisSelec.caracteristicasDelPais.get(0))
	}
	
	@Test
	def void eliminarCaracteristicaSeleccionado() {
		crearEditarPais.caracteristicaAAgregar = "Su moneda es el Peso"
		crearEditarPais.agregarCaracteristicaSelec
		Assert.assertEquals("Su moneda es el Peso",crearEditarPais.paisSelec.caracteristicasDelPais.get(0))
		Assert.assertEquals(1,crearEditarPais.paisSelec.caracteristicasDelPais.size)
		crearEditarPais.caracteristicaASacar = "Su moneda es el Peso"
		crearEditarPais.eliminarCaracteristicaSeleccionado
		Assert.assertEquals(0,crearEditarPais.paisSelec.caracteristicasDelPais.size)
	}
	
}