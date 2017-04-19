package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class Caso {
  private String nombreCaso;
  
  private Villano responsable;
  
  private List<Pais> planDeEscape = new ArrayList<Pais>();
  
  private String reporteDelCaso;
  
  private String objetoRobado;
  
  private Pais paisDelRobo;
  
  public String getNombreCaso() {
    return this.nombreCaso;
  }
  
  public Pais getPaisDelRobo() {
    return this.paisDelRobo;
  }
  
  public String getReporteDelCaso() {
    return this.reporteDelCaso;
  }
  
  public void iniciarCaso() {
    this.paisDelRobo.recorrerLugaresDeInteres();
  }
}
