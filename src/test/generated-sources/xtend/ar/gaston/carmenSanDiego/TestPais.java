package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Banco;
import ar.gaston.carmenSanDiego.Club;
import ar.gaston.carmenSanDiego.Embajada;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class TestPais {
  private final Pais argentina = new Pais();
  
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
    this.ba.setearOcupante();
    this.cl.setearOcupante();
    this.em.setearVillanoEnLugar(this.juancho);
    this.argentina.setNombrePais("Argentina");
    this.argentina.agregarCaracteristica("bandera celeste y blanca");
    this.argentina.agregarCaracteristica("Moneda Peso");
    this.argentina.agregarCaracteristica("Casa de gobierno rosada");
    this.argentina.agregarLugarDeInteres(this.em);
    this.argentina.agregarLugarDeInteres(this.ba);
    this.argentina.agregarLugarDeInteres(this.cl);
    this.argentina.agregarPaisConexion(null);
  }
  
  @Test
  public void testRecorrerLugarDeInteresCon1Villano() {
    List<String> _caracteristicasDelPais = this.argentina.getCaracteristicasDelPais();
    int _size = _caracteristicasDelPais.size();
    Assert.assertEquals(3, _size);
    List<LugarDeInteres> _lugaresDeInteres = this.argentina.getlugaresDeInteres();
    int _size_1 = _lugaresDeInteres.size();
    Assert.assertEquals(3, _size_1);
    Boolean _hayOcupante = this.em.hayOcupante();
    Assert.assertTrue((_hayOcupante).booleanValue());
    this.argentina.recorrerLugaresDeInteres();
  }
}
