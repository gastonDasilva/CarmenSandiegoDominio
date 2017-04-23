package ar.gaston.carmenSanDiego;

import Extra.RandomExamples;
import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import ar.gaston.carmenSanDiego.Villano;
import java.util.List;

@SuppressWarnings("all")
public class Club extends LugarDeInteres {
  private String primerCaracteristicaDELasSeñasParticulares;
  
  private String segundaCaracteristicaDELasSeñasParticulares;
  
  public String procesarInformante() {
    String _pistasRelacionadasConElDestinoDelVillano = this.pistasRelacionadasConElDestinoDelVillano();
    return ("Vi a alguien como describe!\r\n            " + _pistasRelacionadasConElDestinoDelVillano);
  }
  
  public String pistasRelacionadasConElDestinoDelVillano() {
    String _xblockexpression = null;
    {
      this.caracteriscaDeLVillano();
      String _darPistaAdicionalDeHobbies = this.darPistaAdicionalDeHobbies();
      _xblockexpression = ((((" recuerdo que la persona tenia estas señas: " + this.primerCaracteristicaDELasSeñasParticulares) + " . ") + this.segundaCaracteristicaDELasSeñasParticulares) + _darPistaAdicionalDeHobbies);
    }
    return _xblockexpression;
  }
  
  public void caracteriscaDeLVillano() {
    final RandomExamples randomCarac = new RandomExamples();
    Caso _caso = super.getCaso();
    Villano _responsable = _caso.getResponsable();
    List<String> _señasParticulares = _responsable.getSeñasParticulares();
    String _randomIn = randomCarac.<String>randomIn(_señasParticulares);
    this.primerCaracteristicaDELasSeñasParticulares = _randomIn;
    Caso _caso_1 = super.getCaso();
    Villano _responsable_1 = _caso_1.getResponsable();
    List<String> _señasParticulares_1 = _responsable_1.getSeñasParticulares();
    String _randomIn_1 = randomCarac.<String>randomIn(_señasParticulares_1);
    this.segundaCaracteristicaDELasSeñasParticulares = _randomIn_1;
  }
  
  public String darPistaAdicionalDeHobbies() {
    final RandomExamples randomCarac = new RandomExamples();
    final RandomExamples randomnumero = new RandomExamples();
    final int i = randomnumero.nextInt(3);
    if (((i == 1) || (i == 2))) {
      Caso _caso = super.getCaso();
      Villano _responsable = _caso.getResponsable();
      List<String> _hobbies = _responsable.getHobbies();
      String _randomIn = randomCarac.<String>randomIn(_hobbies);
      return (" \r\n                   Tambien recuerdo haberlo escuchado \r\n                   dicir que uno de sus hobbies es " + _randomIn);
    } else {
      return "";
    }
  }
  
  public String nombreLugar() {
    return "Club";
  }
}
