package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Villano;
import com.google.common.base.Objects;

@SuppressWarnings("all")
public abstract class LugarDeInteres {
  private Boolean informante = Boolean.valueOf(false);
  
  private Boolean ocupante = Boolean.valueOf(false);
  
  private Boolean cuidador = Boolean.valueOf(false);
  
  private Villano vil = null;
  
  public Boolean hayInformante() {
    return this.informante;
  }
  
  public Boolean hayOcupante() {
    return this.ocupante;
  }
  
  public Boolean hayCuidador() {
    return this.cuidador;
  }
  
  public void setearVillanoEnLugar(final Villano v) {
    this.vil = v;
  }
  
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
  
  public void procesar() {
    this.procesarCuidador();
    this.procesarOcupante();
  }
  
  public void procesarCuidador() {
    Boolean _hayCuidador = this.hayCuidador();
    if ((_hayCuidador).booleanValue()) {
      System.out.println("CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste");
    }
  }
  
  public void procesarOcupante() {
    Boolean _hayOcupante = this.hayOcupante();
    if ((_hayOcupante).booleanValue()) {
      boolean _equals = Objects.equal(this.vil, null);
      if (_equals) {
        System.out.println("CUIDADO DETECTIVE! el villano esta en la ciudad");
      } else {
        String _nombre = this.vil.nombre();
        String _plus = ("Alto!!" + _nombre);
        String _plus_1 = (_plus + " Queda Arrestado");
        System.out.println(_plus_1);
      }
    }
  }
  
  public abstract void procesarInformante();
}
