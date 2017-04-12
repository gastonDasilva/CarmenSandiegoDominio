package ar.gaston.carmenSanDiego


import org.junit.Before
import org.junit.Assert
import org.junit.Test

class TestPais {
	val argentina= new Pais
	val em = new Embajada
	val ba = new Banco
	val cl = new Club
	val juancho = new Villano
	
	  @Before
	    def void setUp() {
		  juancho.setVillano("JUancho Sierra", "Masculino ")
		  juancho.agregarHobbie("jugar al futbol")
		  juancho.agregarSeña("pelo rojo")
		  juancho.agregarSeña("piel morena")
		  juancho.agregarSeña("ojos azules")
		  em.setearOcupante()
		  ba.setearOcupante()
		  cl.setearOcupante()
		  em.setearVillanoEnLugar(juancho)
	   argentina.setNombrePais("Argentina")
	   argentina.agregarCaracteristica("bandera celeste y blanca")
	   argentina.agregarCaracteristica("Moneda Peso");
	   argentina.agregarCaracteristica("Casa de gobierno rosada")
	   argentina.agregarLugarDeInteres(em)
	   argentina.agregarLugarDeInteres(ba)
	   argentina.agregarLugarDeInteres(cl)
	   argentina.agregarPaisConexion(null)
	   
	    }
	@Test
	def void testRecorrerLugarDeInteresCon1Villano() {
		Assert.assertEquals(3, argentina.getCaracteristicasDelPais().size())
		Assert.assertEquals(3, argentina.getlugaresDeInteres().size())
		Assert.assertTrue(em.hayOcupante())
		argentina.recorrerLugaresDeInteres()
		
	}
}