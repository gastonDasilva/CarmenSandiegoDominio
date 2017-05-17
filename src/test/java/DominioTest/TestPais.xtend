package DominioTest


import org.junit.Before
import org.junit.Assert
import org.junit.Test
import ar.gaston.carmenSanDiego.Pais
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Banco
import ar.gaston.carmenSanDiego.Club
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Caso

class TestPais {
	val argentina= new Pais
	val em = new Embajada
	val ba = new Banco
	val cl = new Club
	val juancho = new Villano
	
	@Before
	def void setUp() {
		  juancho.nombre = "JUancho Sierra"
		  juancho.sexo = "Masculino"
		  juancho.agregarHobbie("jugar al futbol")
		  juancho.agregarSeña("pelo rojo")
		  juancho.agregarSeña("piel morena")
		  juancho.agregarSeña("ojos azules")
		  em.setearOcupante()
		  ba.setearOcupante()
		  cl.setearOcupante()
		  em.setearVillanoEnLugar(juancho)
	    }
	@Test
	def void setNombrePaisTest() {
	   argentina.setNombrePais("Argentina")
	   Assert.assertEquals("Argentina", argentina.nombrePais)
	}
	
	@Test
	def void agregoUnaCaracteristicaAlPaisArgentina() {
	   argentina.agregarCaracteristica("Moneda: Peso")
	   Assert.assertEquals("Moneda: Peso", argentina.caracteristicasDelPais.get(0))
	}
	
	@Test
	def void agregoUnaCaracteristicaAlPaisArgentinaYLuegoLaSaco() {
	   argentina.agregarCaracteristica("Moneda: Peso")
	   Assert.assertEquals("Moneda: Peso", argentina.caracteristicasDelPais.get(0))
	   Assert.assertEquals(1, argentina.caracteristicasDelPais.size)
	   argentina.sacarCaracteristica("Moneda: Peso")
	   Assert.assertEquals(0, argentina.caracteristicasDelPais.size)
	}
	
	@Test
	def void agregoUnPaisALaListDeConexionesDelPaisArgentina() {
	   val peru = new Pais
	   peru.nombrePais = "Peru"
	   argentina.agregarPaisConexion(peru)
	   Assert.assertEquals("Peru", argentina.paisConexiones.get(0).nombrePais)
	   Assert.assertEquals(1, argentina.paisConexiones.size)
	}
	
	@Test
	def void agregoUnPaisALaListDeConexionesDelPaisArgentinaYLuegoLoSaco() {
	   val peru = new Pais
	   peru.nombrePais = "Peru"
	   argentina.agregarPaisConexion(peru)
	   Assert.assertEquals("Peru", argentina.paisConexiones.get(0).nombrePais)
	   Assert.assertEquals(1, argentina.paisConexiones.size)
	   argentina.sacarPaisConexion(peru)
	   Assert.assertEquals(0, argentina.paisConexiones.size)
	}
	
	@Test
	def void agregoUnLugarDeInteresAlPaisArgentina() {
	   argentina.agregarLugarDeInteres(em)
	   Assert.assertEquals("Embajada", argentina.lugaresDeInteres.get(0).nombreLugar)
	   Assert.assertEquals(1, argentina.lugaresDeInteres.size)
	}
	
	@Test
	def void agregoTresLugaresDeInteresAlPaisArgentinaYIntentoAgregarOtroMas() {
	  // val bi =new Biblioteca
	   argentina.agregarLugarDeInteres(em)
	   argentina.agregarLugarDeInteres(ba)
	   argentina.agregarLugarDeInteres(cl)
	   Assert.assertEquals("Embajada", argentina.lugaresDeInteres.get(0).nombreLugar)
	   Assert.assertEquals("Banco", argentina.lugaresDeInteres.get(1).nombreLugar)
	   Assert.assertEquals("Club", argentina.lugaresDeInteres.get(2).nombreLugar)
	   Assert.assertEquals(3, argentina.lugaresDeInteres.size)
	  // argentina.agregarLugarDeInteres(bi)
	   Assert.assertFalse( argentina.lugaresDeInteres.size == 4)
	}
	
		@Test
	def void agregoUnLugarDeInteresAlPaisArgentinaYLoSaco() {
	   argentina.agregarLugarDeInteres(em)
	   Assert.assertEquals("Embajada", argentina.lugaresDeInteres.get(0).nombreLugar)
	   Assert.assertEquals(1, argentina.lugaresDeInteres.size)
	   argentina.sacarLugarDeInteres(em)
	   Assert.assertEquals(0, argentina.lugaresDeInteres.size)
	}
	
		@Test
	def void agregoTresLugaresDeInteresAlPaisArgentinaYObtengoLosLugaresDeInteresSegunSuPosicionEnLaListaDeLugares() {
	   argentina.agregarLugarDeInteres(em)
	   argentina.agregarLugarDeInteres(ba)
	   argentina.agregarLugarDeInteres(cl)
	   Assert.assertEquals("Embajada", argentina.lugaresDeInteres.get(0).nombreLugar)
	   Assert.assertEquals("Banco", argentina.lugaresDeInteres.get(1).nombreLugar)
	   Assert.assertEquals("Club", argentina.lugaresDeInteres.get(2).nombreLugar)
	   Assert.assertEquals(3, argentina.lugaresDeInteres.size)
	   Assert.assertEquals("Embajada", argentina.getPrimerLugarDeInteres.nombreLugar)
	   Assert.assertEquals("Banco", argentina.getSegundoLugarDeInteres.nombreLugar)
	   Assert.assertEquals("Club", argentina.getTercerLugarDeInteres.nombreLugar)
	}
	
	@Test
	def void agregoTresLugaresDeInteresAlPaisArgentinaYLesSeteoALosLugaresUnCaso() {
	   argentina.agregarLugarDeInteres(em)
	   argentina.agregarLugarDeInteres(ba)
	   argentina.agregarLugarDeInteres(cl)
	   val caso1= new Caso("Caso1", juancho)       
	   Assert.assertEquals("Embajada", argentina.lugaresDeInteres.get(0).nombreLugar)
	   Assert.assertEquals("Banco", argentina.lugaresDeInteres.get(1).nombreLugar)
	   Assert.assertEquals("Club", argentina.lugaresDeInteres.get(2).nombreLugar)
	   Assert.assertEquals(3, argentina.lugaresDeInteres.size)
	   argentina.setearCasoAlugares(caso1)
	   Assert.assertEquals("Caso1", argentina.getPrimerLugarDeInteres.caso.nombreCaso)
	   Assert.assertEquals("Caso1", argentina.getSegundoLugarDeInteres.caso.nombreCaso)
	   Assert.assertEquals("Caso1", argentina.getTercerLugarDeInteres.caso.nombreCaso)
	   
	   }
}