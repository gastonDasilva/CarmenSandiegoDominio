package DominioTest

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ar.gaston.carmenSanDiego.Embajada
import ar.gaston.carmenSanDiego.Banco
import ar.gaston.carmenSanDiego.Club
import ar.gaston.carmenSanDiego.Villano
import ar.gaston.carmenSanDiego.Caso

class TestLugarDeInteres {
	val em= new Embajada
	val ba = new Banco
	val cl = new Club
	val juancho = new Villano
	Caso caso1 = new Caso("Caso1",juancho)
	
   @Before
	    def void setUp() {
		juancho.setVillano("JUancho Sierra", "Masculino ");
	    juancho.agregarHobbie("jugar al futbol");
		juancho.agregarSeña("pelo rojo");
	    juancho.agregarSeña("piel morena");
		juancho.agregarSeña("ojos azules");
		em.setearCaso(caso1)
        ba.setearCaso(caso1)
        cl.setearCaso(caso1)
	    }

	@Test
	def void testSetearOcupanteEnLosLugaresDeInteres() {
		em.setearOcupante(juancho);
		ba.setearOcupante();
		cl.setearOcupante();
		Assert.assertFalse(em.hayCuidador());
		Assert.assertFalse(em.hayInformante());
		Assert.assertTrue (em.hayOcupante());

	}
	@Test
	def void testSetearInformantesEnLosLugaresDeInteres() {
		em.setearInformante();
		ba.setearInformante();
		cl.setearInformante();
		Assert.assertFalse(em.hayCuidador());
		Assert.assertTrue(em.hayInformante());
		Assert.assertFalse (em.hayOcupante());

	}
	
	@Test
	def void testSetearCuidadoresEnLosLugaresDeInteres() {
		em.setearCuidador();
		ba.setearCuidador();
		cl.setearCuidador();
		Assert.assertTrue(em.hayCuidador());
		Assert.assertFalse(em.hayInformante());
		Assert.assertFalse (em.hayOcupante());
	}
	
	@Test
	def void VerificoSiHayUnVillanoEnElLugarAlSetearleUnOcupanteConDichoVillano() {
	    em.setearOcupante(juancho);
		ba.setearOcupante();
		cl.setearOcupante();
		Assert.assertTrue(em.hayVillanoEnElLugar);	
	}
	
	@Test
	def void VerificoSiHayUnVillanoEnElLugarAlSetearleUnOcupanteQueNoEsElVillano() {
	    em.setearOcupante();
		ba.setearOcupante();
		cl.setearOcupante();
		Assert.assertFalse(em.hayVillanoEnElLugar);	
	}
	
    @Test
	def void testSetearCuidadoresEnLosLugaresDeInteresYluegoProcesar() {
		em.setearCuidador();
		ba.setearCuidador();
		cl.setearCuidador();
		Assert.assertEquals("CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste", em.procesar)
		Assert.assertEquals("CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste", ba.procesar)
		Assert.assertEquals("CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste", cl.procesar)
	}
	
	@Test
	def void testSetearOcupantesSinVillano_EnLosLugaresDeInteres_YluegoProcesar() {
		em.setearOcupante();
		ba.setearOcupante();
		cl.setearOcupante();
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", em.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", ba.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", cl.procesar)
	}
	
	   @Test
	def void testSetearOcupantesConVillanoPeroSinOrdenDeArresto_EnLosLugaresDeInteres_YluegoProcesar() {
		em.setearOcupante(juancho);
		ba.setearOcupante();
		cl.setearOcupante();
		Assert.assertEquals("CUIDADO DETECTIVE!El villano escapo por no tener una orden de arresto", em.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", ba.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", cl.procesar)
	}
	
    @Test
	def void testSetearOcupantesConVillanoYConOrdenDeArresto_EnLosLugaresDeInteres_YluegoProcesar() {
		em.setearOcupante(juancho);
		ba.setearOcupante();
		cl.setearOcupante();
		caso1.ordenDeArrestoAlVillano = juancho
		Assert.assertEquals("Alto!!"+caso1.ordenDeArrestoAlVillano.nombre+" Queda Arrestado", em.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", ba.procesar)
		Assert.assertEquals("CUIDADO DETECTIVE! el villano esta en la ciudad", cl.procesar)
	}
}