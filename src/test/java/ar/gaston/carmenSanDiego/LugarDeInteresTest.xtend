package ar.gaston.carmenSanDiego

import org.junit.Assert
import org.junit.Before
import org.junit.Test


class LugarDeInteresTest {
	val em= new Embajada
	val ba = new Banco
	val cl = new Club
	val juancho = new Villano
	
   @Before
	    def void setUp() {
		juancho.setVillano("JUancho Sierra", "Masculino ");
	    juancho.agregarHobbie("jugar al futbol");
		juancho.agregarSeña("pelo rojo");
	    juancho.agregarSeña("piel morena");
		juancho.agregarSeña("ojos azules");
		em.setearOcupante();
		em.setearVillanoEnLugar(juancho);
		ba.setearOcupante();
		cl.setearOcupante();
	    }

	@Test
	def void testRecorrerLugaresDeInteres() {
		em.procesarCuidador();
		Assert.assertFalse(em.hayCuidador());
		Assert.assertFalse(em.hayInformante());
		Assert.assertTrue (em.hayOcupante());
		em.procesarOcupante();
		ba.procesarOcupante();
		cl.procesarOcupante();
	}
}