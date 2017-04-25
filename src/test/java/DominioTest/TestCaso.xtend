package DominioTest

import ar.gaston.carmenSanDiego.Caso
import org.junit.Before
import ar.gaston.carmenSanDiego.Pais
import org.junit.Test
import org.junit.Assert
import ar.gaston.carmenSanDiego.Villano

class TestCaso {
	Caso caso1
		@Before
	def void setUp() {
		 caso1 = new Caso("Caso1",null)
	}
	
	@Test
	def void agregarUnPaisAlPlanDeEscapeDelVillanoTest() {
		val argenina = new Pais
		argenina.nombrePais = "Argentina"
		caso1.agregarPaisPlanDeEscape(argenina)
		Assert.assertEquals("Argentina", caso1.planDeEscape.get(0).nombrePais)
		Assert.assertEquals(1, caso1.planDeEscape.size)
	}
	
	@Test
	def void agregarDosPaisesAlPlanDeEscapeDelVillanoTest() {
		val argenina = new Pais
		argenina.nombrePais = "Argentina"
		caso1.agregarPaisPlanDeEscape(argenina)
		Assert.assertEquals("Argentina", caso1.planDeEscape.get(0).nombrePais)
		Assert.assertEquals(1, caso1.planDeEscape.size)
		val chile = new Pais
		chile.nombrePais = "Chile"
		caso1.agregarPaisPlanDeEscape(chile)
		Assert.assertEquals("Chile", caso1.planDeEscape.get(1).nombrePais)
		Assert.assertEquals(2, caso1.planDeEscape.size)
	}
	
	@Test
	def void setearUnPaisDeLRoboAlCasoTest() {
		val argenina = new Pais
		argenina.nombrePais = "Argentina"
		caso1.setearPaisDeLRobo(argenina)
		Assert.assertEquals("Argentina", caso1.paisDelRobo.nombrePais)
	}
	
	@Test
	def void setearOrdenDeArrestoAlVillano() {
		val juancho = new Villano
		juancho.nombre = "Juancho"
		caso1.setearOrdenDeArrestoAlVillano(juancho)
		Assert.assertEquals("Juancho", caso1.ordenDeArrestoAlVillano.nombre)
	}	
}