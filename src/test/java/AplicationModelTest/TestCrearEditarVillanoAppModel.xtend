package AplicationModelTest

import org.junit.Before
import AplicationModel.CrearEditarVillanoAppModel
import AplicationModel.ExpedientesAppModel
import org.junit.Test
import ar.gaston.carmenSanDiego.Villano
import org.junit.Assert

class TestCrearEditarVillanoAppModel {
	CrearEditarVillanoAppModel crearEditarVill

	 @Before
	 def void setUp() {
	 	val Villano luisinho = new Villano
		luisinho.nombre = "Luisinho Da Silva"
		luisinho.sexo =  "Masculino"
	 	val ExpedientesAppModel exp = new ExpedientesAppModel()
	 	crearEditarVill = new CrearEditarVillanoAppModel(exp,luisinho)
	  }
	  
	 @Test
	 def void agregarSeñaSelecTest() {
		crearEditarVill.agregarVillano
		Assert.assertEquals("Luisinho Da Silva", crearEditarVill.exp.villanos.get(0).nombre)
		Assert.assertEquals(1, crearEditarVill.exp.villanos.size)
	}
}
	  