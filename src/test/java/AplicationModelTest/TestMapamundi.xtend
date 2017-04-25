package AplicationModelTest

import org.junit.Before
import AplicationModel.Mapamundi
import org.junit.Test
import ar.gaston.carmenSanDiego.Pais
import org.junit.Assert

class TestMapamundi {
	Mapamundi map	
    
    @Before
    def void setUp() {
    	map = new Mapamundi()
    	
    }
    
    @Test
	def void agregarNuevoPaisTest() {
		val Pais argentina = new Pais()
		argentina.nombrePais = "Argentina"
		map.agregarNuevoPais(argentina)
		Assert.assertEquals("Argentina", map.paises.get(0).nombrePais)
		Assert.assertEquals(1, map.paises.size)
	}
	
    @Test
	def void eliminarPaisSeleccionadoTest() {
		val Pais argentina = new Pais()
		argentina.nombrePais = "Argentina"
		map.agregarNuevoPais(argentina)
		Assert.assertEquals("Argentina", map.paises.get(0).nombrePais)
		Assert.assertEquals(1, map.paises.size)
		map.paisSeleccionado = argentina
		map.eliminarPaisSeleccionado
		Assert.assertEquals(0, map.paises.size)
	}
	
    @Test
	def void aceptarPaisEditado() {
		val Pais argentina = new Pais()
		argentina.nombrePais = "Argentina"
		map.agregarNuevoPais(argentina)
		Assert.assertEquals("Argentina", map.paises.get(0).nombrePais)
		Assert.assertEquals(1, map.paises.size)
		argentina.nombrePais = "Peru"
		map.paisSeleccionado = argentina
		map.aceptarPaisEditado
		Assert.assertEquals("Peru", map.paises.get(0).nombrePais)
	}	
    
  }