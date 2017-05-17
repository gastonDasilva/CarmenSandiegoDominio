package DominioTest

import org.junit.Before
import ar.gaston.carmenSanDiego.Banco
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Caso
import org.junit.Assert
import org.junit.Test

class TestBanco {
	Banco ba
	
	@Before
	def void setUp() {
		val juancho = new Villano()
		juancho.nombre = "Juancho"
		juancho.sexo = "Masculino"
		juancho.agregarSeña("Es Rubio")
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
		ba = new Banco(argenina)
		ba.setearCaso(caso1)
		ba.setearVillanoEnLugar(juancho)	
	}
	
	@Test
	def void obtenerElProximoDestinoDelPlanDeEscapeDelVillanoEstandoEnElPaisArgentinaTest() {
		ba.paisRandomDelDestino
		Assert.assertEquals("Peru", ba.paisProximoDestino.nombrePais)
	}
	
	@Test
	def void obtenerLaUnicaCaracterisicaDelProximoDestinoDelPlanDeEscapeDelVillanoEstandoEnElPaisArgentinaYLaSeñaDelVillanoTest() {
		ba.paisRandomDelDestino
		ba.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals("comen palomas", ba.getCaracteristicaDelPaisDestino)
		Assert.assertEquals("Es Rubio", ba.caracteristicaDELasSeñasParticulares)
	}
	
	@Test
	def void obtenerLasPistasRelacionadasConElDestinoDelVillano() {
		ba.paisRandomDelDestino
		ba.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals(
		"creo haber oido que tenia planeado ir a
         un pais con las siguientes caracteristicas: "+ba.caracteristicaDelPaisDestino+" .
          "+" Ademas recuerdo que la persona tenia estas señas: "+ ba.caracteristicaDELasSeñasParticulares  ,ba.pistasRelacionadasConElDestinoDelVillano) 
          }
    @Test
	def void procesarInformanteConElPaisProximoBancoTest() {
		Assert.assertEquals("Vi a alguien como describe!"+ba.pistasRelacionadasConElDestinoDelVillano ,ba.procesarInformante)
	}      
          
}