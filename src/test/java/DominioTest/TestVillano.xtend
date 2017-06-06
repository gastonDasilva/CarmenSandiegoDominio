package DominioTest

import org.junit.Before
import ar.gaston.carmenSanDiego.Villano
import org.junit.Test
import org.junit.Assert

class TestVillano {
	Villano vil
	@Before
	 def void setUp() {
	 	vil = new Villano
	 }
	 
	 @Test
	def void setearNombreYSexoAlVillanoTest() {
		vil.nombre = "Carlin"
		vil.sexo = "Masculino"
		Assert.assertEquals("Carlin", vil.nombre)
		Assert.assertEquals("Masculino", vil.sexo)
	}
	
    @Test
	def void agregoDosSeñasParticularAlVillanoTest() {
		vil.agregarSeña("Tiene pelo rubio")
		vil.agregarSeña("Tiene ojos Azules")
		Assert.assertEquals("Tiene pelo rubio", vil.senhasParticulares.get(0))
		Assert.assertEquals("Tiene ojos Azules", vil.senhasParticulares.get(1))
	}
	
	@Test
	def void agregoDosSeñasParticularAlVillanoYLuegoSacoUnaSeñaTest() {
		vil.agregarSeña("Tiene pelo rubio")
		vil.agregarSeña("Tiene ojos Azules")
		Assert.assertEquals("Tiene pelo rubio", vil.senhasParticulares.get(0))
		Assert.assertEquals("Tiene ojos Azules", vil.senhasParticulares.get(1))
		vil.sacarSeña("Tiene ojos Azules")
		Assert.assertEquals("Tiene pelo rubio", vil.senhasParticulares.get(0))
		Assert.assertEquals(1, vil.senhasParticulares.size)
	}
	
	@Test
	def void agregoDosHobbiesAlVillanoTest() {
		vil.agregarHobbie("Ver anime")
		vil.agregarHobbie("Jugar al futbol")
		Assert.assertEquals("Ver anime", vil.hobbies.get(0))
		Assert.assertEquals("Jugar al futbol", vil.hobbies.get(1))
	}
	
	@Test
	def void agregarDosHobbiesAlVillanoTestYLuegoSacamosUnHobbie() {
		vil.agregarHobbie("Ver anime")
		vil.agregarHobbie("Jugar al futbol")
		Assert.assertEquals("Ver anime", vil.hobbies.get(0))
		Assert.assertEquals("Jugar al futbol", vil.hobbies.get(1))
		vil.sacarHobbie("Jugar al futbol")
		Assert.assertEquals("Ver anime", vil.hobbies.get(0))
		Assert.assertEquals(1, vil.hobbies.size)
	}
	
}