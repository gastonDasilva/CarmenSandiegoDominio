package AplicationModelTest

import AplicationModel.ExpedientesAppModel
import org.junit.Before
import org.junit.Test
import ar.gaston.carmenSanDiego.Villano
import org.junit.Assert

class TestExpedientesAppModel {
	ExpedientesAppModel expApp
	
	@Before
	 def void setUp() {
	 	expApp = new ExpedientesAppModel()
	 }
	 
	 @Test
	def void agregarNuevoVillanoTest() {
		val Villano luisinho = new Villano
		luisinho.setVillano("Luisinho Da Silva", "Masculino")
		expApp.agregarNuevoVillano(luisinho)
		Assert.assertEquals("Luisinho Da Silva", expApp.villanos.get(0).nombre)
	}
}