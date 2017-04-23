package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.Villano;
import com.google.common.base.Objects;
import java.util.List;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public abstract class LugarDeInteres {
  private Boolean informante = Boolean.valueOf(false);
  
  private Boolean ocupante = Boolean.valueOf(false);
  
  private Boolean cuidador = Boolean.valueOf(false);
  
  private Villano vil = null;
  
  private Caso cas;
  
  public Boolean hayInformante() {
    return this.informante;
  }
  
  public Boolean hayOcupante() {
    return this.ocupante;
  }
  
  public Boolean hayCuidador() {
    return this.cuidador;
  }
  
  public boolean hayVillanoEnElLugar() {
    boolean _xifexpression = false;
    boolean _notEquals = (!Objects.equal(this.vil, null));
    if (_notEquals) {
      _xifexpression = true;
    } else {
      _xifexpression = false;
    }
    return _xifexpression;
  }
  
  public void setearVillanoEnLugar(final Villano v) {
    this.vil = v;
  }
  
  public abstract String nombreLugar();
  
  public void setearInformante() {
    boolean _or = false;
    Boolean _hayCuidador = this.hayCuidador();
    if ((_hayCuidador).booleanValue()) {
      _or = true;
    } else {
      Boolean _hayOcupante = this.hayOcupante();
      _or = (_hayOcupante).booleanValue();
    }
    if (_or) {
      System.out.println("Ya hay un individuo en el lugar");
    } else {
      this.informante = Boolean.valueOf(true);
    }
  }
  
  public List<LugarDeInteres> values() {
    return null;
  }
  
  public void setearOcupante() {
    boolean _or = false;
    Boolean _hayCuidador = this.hayCuidador();
    if ((_hayCuidador).booleanValue()) {
      _or = true;
    } else {
      Boolean _hayInformante = this.hayInformante();
      _or = (_hayInformante).booleanValue();
    }
    if (_or) {
      System.out.println("Ya hay un individuo en el lugar");
    } else {
      this.ocupante = Boolean.valueOf(true);
    }
  }
  
  public void setearOcupante(final Villano villano) {
    boolean _or = false;
    Boolean _hayCuidador = this.hayCuidador();
    if ((_hayCuidador).booleanValue()) {
      _or = true;
    } else {
      Boolean _hayInformante = this.hayInformante();
      _or = (_hayInformante).booleanValue();
    }
    if (_or) {
      System.out.println("Ya hay un individuo en el lugar");
    } else {
      this.ocupante = Boolean.valueOf(true);
      this.vil = villano;
    }
  }
  
  public void setearCuidador() {
    boolean _or = false;
    Boolean _hayInformante = this.hayInformante();
    if ((_hayInformante).booleanValue()) {
      _or = true;
    } else {
      Boolean _hayOcupante = this.hayOcupante();
      _or = (_hayOcupante).booleanValue();
    }
    if (_or) {
      System.out.println("Ya hay un individuo en el lugar");
    } else {
      this.cuidador = Boolean.valueOf(true);
    }
  }
  
  public String procesar() {
    String _xifexpression = null;
    Boolean _hayCuidador = this.hayCuidador();
    if ((_hayCuidador).booleanValue()) {
      _xifexpression = this.procesarCuidador();
    } else {
      String _xifexpression_1 = null;
      Boolean _hayOcupante = this.hayOcupante();
      if ((_hayOcupante).booleanValue()) {
        _xifexpression_1 = this.procesarOcupante();
      } else {
        String _xifexpression_2 = null;
        Boolean _hayInformante = this.hayInformante();
        if ((_hayInformante).booleanValue()) {
          _xifexpression_2 = this.procesarInformante();
        }
        _xifexpression_1 = _xifexpression_2;
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }
  
  public String procesarCuidador() {
    return "CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste";
  }
  
  public String procesarOcupante() {
    String _xifexpression = null;
    boolean _equals = Objects.equal(this.vil, null);
    if (_equals) {
      _xifexpression = "CUIDADO DETECTIVE! el villano esta en la ciudad";
    } else {
      String _nombre = this.vil.getNombre();
      String _plus = ("Alto!!" + _nombre);
      _xifexpression = (_plus + " Queda Arrestado");
    }
    return _xifexpression;
  }
  
  public abstract String procesarInformante();
  
  public void setearCaso(final Caso caso) {
    this.cas = caso;
  }
}
