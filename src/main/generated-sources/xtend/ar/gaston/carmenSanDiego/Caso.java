package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Observable
@Accessors
@SuppressWarnings("all")
public class Caso {
  private String nombreCaso;
  
  private Villano responsable;
  
  private List<Pais> planDeEscape = new ArrayList<Pais>();
  
  private String reporteDelCaso;
  
  private String objetoRobado;
  
  private Pais paisDelRobo;
  
  private Villano ordenDeArrestoAlVillano;
  
  public Caso(final String nombre, final Villano vres) {
    this.nombreCaso = nombre;
    this.responsable = vres;
  }
  
  public String getNombreCaso() {
    return this.nombreCaso;
  }
  
  public boolean agregarPaisPlanDeEscape(final Pais p) {
    return this.planDeEscape.add(p);
  }
  
  public Pais getPaisDelRobo() {
    return this.paisDelRobo;
  }
  
  public Pais setearPaisDeLRobo(final Pais p) {
    return this.paisDelRobo = p;
  }
  
  public String getReporteDelCaso() {
    return this.reporteDelCaso;
  }
  
  public Villano getResponsable() {
    return this.responsable;
  }
  
  public void iniciarCaso() {
    this.paisDelRobo.recorrerLugaresDeInteres();
  }
  
  public Villano setearOrdenDeArrestoAlVillano(final Villano villano) {
    return this.ordenDeArrestoAlVillano = villano;
  }
  
  public void setNombreCaso(final String nombreCaso) {
    this.nombreCaso = nombreCaso;
  }
  
  public void setResponsable(final Villano responsable) {
    this.responsable = responsable;
  }
  
  @Pure
  public List<Pais> getPlanDeEscape() {
    return this.planDeEscape;
  }
  
  public void setPlanDeEscape(final List<Pais> planDeEscape) {
    this.planDeEscape = planDeEscape;
  }
  
  public void setReporteDelCaso(final String reporteDelCaso) {
    this.reporteDelCaso = reporteDelCaso;
  }
  
  @Pure
  public String getObjetoRobado() {
    return this.objetoRobado;
  }
  
  public void setObjetoRobado(final String objetoRobado) {
    this.objetoRobado = objetoRobado;
  }
  
  public void setPaisDelRobo(final Pais paisDelRobo) {
    this.paisDelRobo = paisDelRobo;
  }
  
  @Pure
  public Villano getOrdenDeArrestoAlVillano() {
    return this.ordenDeArrestoAlVillano;
  }
  
  public void setOrdenDeArrestoAlVillano(final Villano ordenDeArrestoAlVillano) {
    this.ordenDeArrestoAlVillano = ordenDeArrestoAlVillano;
  }
}
