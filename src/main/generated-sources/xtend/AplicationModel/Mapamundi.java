package AplicationModel;

import ar.gaston.carmenSanDiego.Pais;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class Mapamundi implements Serializable {
  private List<Pais> paises = new ArrayList<Pais>();
  
  private Pais paisSeleccionado;
  
  public Pais eliminarPaisSeleccionado() {
    Pais _xblockexpression = null;
    {
      this.paises.remove(this.paisSeleccionado);
      _xblockexpression = this.paisSeleccionado = null;
    }
    return _xblockexpression;
  }
  
  public boolean agregarPais() {
    boolean _xblockexpression = false;
    {
      final Pais p = new Pais();
      this.paisSeleccionado = p;
      _xblockexpression = this.paises.add(p);
    }
    return _xblockexpression;
  }
  
  @Pure
  public List<Pais> getPaises() {
    return this.paises;
  }
  
  public void setPaises(final List<Pais> paises) {
    this.paises = paises;
  }
  
  @Pure
  public Pais getPaisSeleccionado() {
    return this.paisSeleccionado;
  }
  
  public void setPaisSeleccionado(final Pais paisSeleccionado) {
    this.paisSeleccionado = paisSeleccionado;
  }
}
