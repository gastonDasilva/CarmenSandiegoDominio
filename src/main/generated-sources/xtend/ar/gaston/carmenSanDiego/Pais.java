package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.UserException;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class Pais {
  private String nombrePais;
  
  private List<String> caracteristicasDelPais = new ArrayList<String>();
  
  private List<Pais> paisConexiones = new ArrayList<Pais>();
  
  private List<LugarDeInteres> lugaresDeInteres = new ArrayList<LugarDeInteres>();
  
  public void setNombrePais(final String n) {
    this.nombrePais = n;
  }
  
  public String getNombrePais() {
    return this.nombrePais;
  }
  
  public void agregarCaracteristica(final String c) {
    this.caracteristicasDelPais.add(c);
  }
  
  public List<String> getCaracteristicasDelPais() {
    return this.caracteristicasDelPais;
  }
  
  public boolean sacarCaracteristica(final String c) {
    return this.caracteristicasDelPais.remove(c);
  }
  
  public void agregarPaisConexion(final Pais p) {
    this.paisConexiones.add(p);
  }
  
  public boolean sacarPaisConexion(final Pais p) {
    return this.paisConexiones.remove(p);
  }
  
  public List<Pais> getPaisConexion() {
    return this.paisConexiones;
  }
  
  public void agregarLugarDeInteres(final LugarDeInteres l) {
    boolean _contains = this.lugaresDeInteres.contains(l);
    if (_contains) {
      String _nombreLugar = l.nombreLugar();
      String _plus = ("Error el lugar de interes " + _nombreLugar);
      String _plus_1 = (_plus + " ya esta en la lista");
      throw new UserException(_plus_1);
    } else {
      this.lugaresDeInteres.add(l);
    }
  }
  
  public boolean sacarLugarDeInteres(final LugarDeInteres l) {
    return this.lugaresDeInteres.remove(l);
  }
  
  public List<LugarDeInteres> getlugaresDeInteres() {
    return this.lugaresDeInteres;
  }
  
  public LugarDeInteres getPrimerLugarDeInteres() {
    return this.lugaresDeInteres.get(0);
  }
  
  public LugarDeInteres getSegundoLugarDeInteres() {
    return this.lugaresDeInteres.get(1);
  }
  
  public LugarDeInteres getTercerLugarDeInteres() {
    return this.lugaresDeInteres.get(2);
  }
  
  public void recorrerLugaresDeInteres() {
    final Consumer<LugarDeInteres> _function = new Consumer<LugarDeInteres>() {
      public void accept(final LugarDeInteres it) {
        it.procesar();
      }
    };
    this.lugaresDeInteres.forEach(_function);
  }
  
  public void setearCasoAlugares(final Caso caso) {
    for (final LugarDeInteres l : this.lugaresDeInteres) {
      l.setearCaso(caso);
    }
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
  public List<LugarDeInteres> getLugaresDeInteres() {
    return this.lugaresDeInteres;
  }
  
  public void setLugaresDeInteres(final List<LugarDeInteres> lugaresDeInteres) {
    this.lugaresDeInteres = lugaresDeInteres;
  }
}
