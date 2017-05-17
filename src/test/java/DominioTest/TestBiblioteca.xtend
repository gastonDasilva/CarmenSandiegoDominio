package DominioTest

import ar.gaston.carmenSanDiego.Biblioteca
import ar.gaston.carmenSanDiego.Pais
import org.junit.Test
import org.junit.Assert
import org.junit.Before
import ar.gaston.carmenSanDiego.Caso
import ar.gaston.carmenSanDiego.Villano

class TestBiblioteca {
		Biblioteca bi
	
	@Before
	def void setUp() {
		val juancho = new Villano()
		juancho.nombre = "Juancho"
		juancho.sexo = "Masculino"
		juancho.agregarSeña("Es Rubio")
		juancho.agregarHobbie("ver anime")
		val caso1 = new Caso("Caso1",juancho)
		val argenina = new Pais
		argenina.nombrePais = "Argentina"
		val peru = new Pais
		peru.nombrePais = "Peru"
		peru.agregarCaracteristica("comen palomas")
		val chile = new Pais
		chile.nombrePais = "Chile"
		caso1.agregarPaisPlanDeEscape(argenina)
		caso1.agregarPaisPlanDeEscape(peru)
		caso1.agregarPaisPlanDeEscape(chile)
		bi = new Biblioteca(argenina)
		bi.setearCaso(caso1)
		bi.setearVillanoEnLugar(juancho)	
	}
	
	@Test
	def void obtenerElProximoDestinoDelPlanDeEscapeDelVillanoEstandoEnElPaisArgentinaTest() {
		bi.paisRandomDelDestino
		Assert.assertEquals("Peru", bi.paisProximoDestino.nombrePais)
	}
	
	@Test
	def void obtenerLaUnicaCaracterisicaDelProximoDestinoDelPlanDeEscapeDelVillanoEstandoEnElPaisArgentinaTest() {
		bi.paisRandomDelDestino
		bi.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals("comen palomas", bi.getCaracteristicaDelPaisDestino)
		Assert.assertEquals("Es Rubio", bi.caracteristicaDELasSeñasParticulares)
	}
	
	@Test
	def void obtenerLasPistasRelacionadasConElDestinoDelVillano() {
		bi.paisRandomDelDestino
		bi.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals("creo haber oido que tenia planeado ir 
         a un pais con las siguientes caracteristicas: "+bi.caracteristicaDelPaisDestino+" . 
         "+"Ademas recuerdo que la persona tenia estas señas: "+ bi.caracteristicaDELasSeñasParticulares+ " .
         "+ bi.darPistaAdicionalDeHobbies() , bi.pistasRelacionadasConElDestinoDelVillano)
	}
	
	@Test
	def void procesarInformanteConElPaisProximoBibliotecaTest() {
		Assert.assertEquals("Vi a alguien como describe!"+bi.pistasRelacionadasConElDestinoDelVillano ,bi.procesarInformante)
	}
}