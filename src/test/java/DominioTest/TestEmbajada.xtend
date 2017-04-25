package DominioTest

import org.junit.Before
import ar.gaston.carmenSanDiego.Embajada
import org.junit.Test
import ar.gaston.carmenSanDiego.Pais
import org.junit.Assert
import ar.gaston.carmenSanDiego.Caso

class TestEmbajada {
	Embajada emb
	
	@Before
	def void setUp() {
		val caso1 = new Caso("Caso1",null)
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
		emb = new Embajada(argenina)
		emb.setearCaso(caso1)
			
	}
	
	
	@Test
	def void obtenerElProximoDestinoDelPlanDeEscapeDelVillanoEstandoEnElPaisArgentinaTest() {
		emb.paisRandomDelDestino
		Assert.assertEquals("Peru", emb.paisProximoDestino.nombrePais)
	}
	
	@Test
	def void obtenerLaUnicaCaracteriscaDeLPaisDetinoRandomTest() {
		// solo pruebo con uno ya que el ramdom es dificl de testear 
		emb.paisRandomDelDestino
		emb.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals("comen palomas", emb.primerCaracteristicaDelPaisDestino)
		Assert.assertEquals("comen palomas", emb.segundaCaracteristicaDelPaisDestino)
	}
	
	@Test
	def void obtenerLaUnicaPistaRelacionadasConElDestinoDelVillanoTest() {
		emb.paisRandomDelDestino
		emb.caracteriscaDeLPaisDetinoRandom
		Assert.assertEquals("creo haber oido que tenia planeado ir a 
         un pais con las siguientes caracteristicas: "+emb.primerCaracteristicaDelPaisDestino+" , "+emb.segundaCaracteristicaDelPaisDestino,
          emb.pistasRelacionadasConElDestinoDelVillano)
	}
	
	@Test
	def void procesarInformanteConElPaisProximoConUnaSolaCaracteristicaTest() {
		Assert.assertEquals("Vi a alguien como describe!"+emb.pistasRelacionadasConElDestinoDelVillano ,emb.procesarInformante)
	}
			
}