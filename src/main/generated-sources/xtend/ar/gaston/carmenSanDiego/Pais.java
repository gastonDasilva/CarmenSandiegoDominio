package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.LugarDeInteres;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors/* 
@TransactionalAndObservable */
@SuppressWarnings("all")
public class Pais {
  private String nombrePais;
  
  private List<String> caracteristicasDelPais = new ArrayList<String>();
  
  private List<Pais> paisConexiones = new ArrayList<Pais>();
  
  private ArrayList<LugarDeInteres> lugaresDeInteres = new ArrayList<LugarDeInteres>();
  
  public void setNombrePais(final String n) {
    this.nombrePais = n;
  }
  
  public void agregarCaracteristica(final String c) {
    this.caracteristicasDelPais.add(c);
  }
  
  public List<String> getCaracteristicasDelPais() {
    return this.caracteristicasDelPais;
  }
  
  public void agregarPaisConexion(final Pais p) {
    this.paisConexiones.add(p);
  }
  
  public List<Pais> getPaisConexion() {
    return this.paisConexiones;
  }
  
  public void agregarLugarDeInteres(final LugarDeInteres l) {
    boolean _contains = this.lugaresDeInteres.contains(l);
    if (_contains) {
      System.out.println((("Error el lugar de interes" + l) + "ya esta en la lista"));
    } else {
      this.lugaresDeInteres.add(l);
    }
  }
  
  public List<LugarDeInteres> getlugaresDeInteres() {
    return this.lugaresDeInteres;
  }
  
  public void recorrerLugaresDeInteres() {
    final Consumer<LugarDeInteres> _function = new Consumer<LugarDeInteres>() {
      public void accept(final LugarDeInteres it) {
        it.procesar();
      }
    };
    this.lugaresDeInteres.forEach(_function);
  }
  
  @Pure
  public String getNombrePais() {
    return this.nombrePais;
  }
  
  public void setCaracteristicasDelPais(final List<String> caracteristicasDelPais) {
    this.caracteristicasDelPais = caracteristicasDelPais;
  }
  
  @Pure
  public List<Pais> getPaisConexiones() {
    return this.paisConexiones;
  }
  
  public void setPaisConexiones(final List<Pais> paisConexiones) {
    this.paisConexiones = paisConexiones;
  }
  
  @Pure
  public ArrayList<LugarDeInteres> getLugaresDeInteres() {
    return this.lugaresDeInteres;
  }
  
  public void setLugaresDeInteres(final ArrayList<LugarDeInteres> lugaresDeInteres) {
    this.lugaresDeInteres = lugaresDeInteres;
  }
}
