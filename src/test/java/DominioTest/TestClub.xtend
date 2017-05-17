package DominioTest

import ar.gaston.carmenSanDiego.Club
import ar.gaston.carmenSanDiego.Caso
import ar.gaston.carmenSanDiego.Pais
import org.junit.Before
import ar.gaston.carmenSanDiego.Villano
import org.junit.Assert
import org.junit.Test

class TestClub {
	Club cl
	
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
		caso1.agregarPaisPlanDeEscape(argenina)
		cl = new Club(argenina)
		cl.setearCaso(caso1)
		cl.setearVillanoEnLugar(juancho)
			
	}
	
	@Test
	def void obtenerLaUnicaCaracteriscaDeLVillanoTest() {
		// solo pruebo con una caracteristica de las señas del villano ya que el ramdom es dificl de testear 
		cl.caracteriscaDeLVillano
		Assert.assertEquals("Es Rubio", cl.primerCaracteristicaDELasSeñasParticulares)
		Assert.assertEquals("Es Rubio", cl.segundaCaracteristicaDELasSeñasParticulares)
	}
	
	@Test
	def void darLaUnicaPistaAdicionalDeHobbiesTest() {
		// solo pruebo con una caracteristica de las señas del villano ya que el ramdom es dificl de testear 
		//Debido al random aveces tira verde y otras Rojo el test porque depende de la implementacion del metodo "darPistaAdicionalDeHobbies" ya que es random 
		cl.caracteriscaDeLVillano
		Assert.assertEquals(" Tambien recuerdo haberlo escuchado decir que uno de sus hobbies es "+cl.caso.responsable.hobbies.get(0) , cl.darPistaAdicionalDeHobbies)
	}
	
	@Test
	def void procesarInformanteDelClubConUnaSolaCaracteristicaTest() {
		Assert.assertEquals("Vi a alguien como describe!
            "+cl.pistasRelacionadasConElDestinoDelVillano ,cl.procesarInformante)
            
          
	}
	
}