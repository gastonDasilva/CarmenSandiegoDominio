package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Banco;
import ar.gaston.carmenSanDiego.Club;
import ar.gaston.carmenSanDiego.Embajada;
import ar.gaston.carmenSanDiego.Villano;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class LugarDeInteresTest {
  private final Embajada em = new Embajada();
  
  private final Banco ba = new Banco();
  
  private final Club cl = new Club();
  
  private final Villano juancho = new Villano();
  
  @Before
  public void setUp() {
    this.juancho.setVillano("JUancho Sierra", "Masculino ");
    this.juancho.agregarHobbie("jugar al futbol");
    this.juancho.agregarSeña("pelo rojo");
    this.juancho.agregarSeña("piel morena");
    this.juancho.agregarSeña("ojos azules");
    this.em.setearOcupante();
    this.em.setearVillanoEnLugar(this.juancho);
    this.ba.setearOcupante();
    this.cl.setearOcupante();
  }
  
  @Test
  public void testRecorrerLugaresDeInteres() {
    this.em.procesarCuidador();
    Boolean _hayCuidador = this.em.hayCuidador();
    Assert.assertFalse((_hayCuidador).booleanValue());
    Boolean _hayInformante = this.em.hayInformante();
    Assert.assertFalse((_hayInformante).booleanValue());
    Boolean _hayOcupante = this.em.hayOcupante();
    Assert.assertTrue((_hayOcupante).booleanValue());
    this.em.procesarOcupante();
    this.ba.procesarOcupante();
    this.cl.procesarOcupante();
  }
}
