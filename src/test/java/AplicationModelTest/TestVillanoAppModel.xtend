package AplicationModelTest

import AplicationModel.VillanoAppModel
import org.junit.Before
import ar.gaston.carmenSanDiego.Villano
import org.junit.Test
import org.junit.Assert

class TestVillanoAppModel {
	VillanoAppModel villanoApp
	Villano luis = new Villano
	
	 @Before
	  def void setUp() {
	    	luis.setVillano("Luis ortega", "Masculino")
	    	villanoApp = new VillanoAppModel(luis)
	    	villanoApp.señaAAgregar = "Tiene pelo rubio"
	    	villanoApp.señaSeleccionadaASacar =  "Tiene pelo rubio"
	    	villanoApp.hobbiesAAgregar = "Ver anime"
	    	villanoApp.hobbiesASacar =  "Ver anime"
	    	
	    	
	    }
	@Test
	def void agregarSeñaSelecTest() {
		villanoApp.agregarSeñaSelec
		Assert.assertEquals("Tiene pelo rubio", luis.getSeñasParticulares.get(0))
	}
	
	@Test
	def void eliminarSeñaSeleccionadoTest() {
		villanoApp.agregarSeñaSelec
		Assert.assertEquals("Tiene pelo rubio", luis.getSeñasParticulares.get(0))
		Assert.assertEquals(1, luis.getSeñasParticulares.size)
		villanoApp.eliminarSeñaSeleccionado
		Assert.assertEquals(0, luis.getSeñasParticulares.size)
	}
	
	@Test
	def void agregarHobbieSelecTest() {
		villanoApp.agregarhobbieSelec
		Assert.assertEquals("Ver anime", luis.getHobbies.get(0))
	}
	
		@Test
	def void eliminarHobbieSeleccionadoTest() {
		villanoApp.agregarhobbieSelec
		Assert.assertEquals("Ver anime", luis.getHobbies.get(0))
		Assert.assertEquals(1, luis.getHobbies.size)
		villanoApp.eliminarHobbieSeleccionado
		Assert.assertEquals(0, luis.getHobbies.size)
	}
	   
}