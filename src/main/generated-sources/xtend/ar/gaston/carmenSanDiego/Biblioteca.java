package ar.gaston.carmenSanDiego;

import Extra.RandomExamples;
import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.List;

@SuppressWarnings("all")
public class Biblioteca extends LugarDeInteres {
  private Pais paisDestinoRandom;
  
  private String CaracteristicaDelPaisDestino;
  
  private String CaracteristicaDELasSeñasParticulares;
  
  public String procesarInformante() {
    String _pistasRelacionadasConElDestinoDelVillano = this.pistasRelacionadasConElDestinoDelVillano();
    return ("Vi a alguien como describe!" + _pistasRelacionadasConElDestinoDelVillano);
  }
  
  public String pistasRelacionadasConElDestinoDelVillano() {
    String _xblockexpression = null;
    {
      this.paisRandomDelDestino();
      this.caracteriscaDeLPaisDetinoRandom();
      String _darPistaAdicionalDeHobbies = this.darPistaAdicionalDeHobbies();
      _xblockexpression = ((((("creo haber oido que tenia planeado ir \r\n         a un pais con las siguientes caracteristicas: " + this.CaracteristicaDelPaisDestino) + " . \r\n         ") + "Ademas recuerdo que la persona tenia estas señas: ") + this.CaracteristicaDELasSeñasParticulares) + _darPistaAdicionalDeHobbies);
    }
    return _xblockexpression;
  }
  
  public String darPistaAdicionalDeHobbies() {
    final RandomExamples randomCarac = new RandomExamples();
    final RandomExamples randomnumero = new RandomExamples();
    int _nextInt = randomnumero.nextInt(2);
    boolean _equals = (_nextInt == 1);
    if (_equals) {
      Caso _caso = super.getCaso();
      Villano _responsable = _caso.getResponsable();
      List<String> _hobbies = _responsable.getHobbies();
      String _randomIn = randomCarac.<String>randomIn(_hobbies);
      return (" tambien recuerdo haberlo escuchado dicir que uno de sus hobbies es \r\n\t\t\t\t " + _randomIn);
    } else {
      return "";
    }
  }
  
  public void caracteriscaDeLPaisDetinoRandom() {
    final RandomExamples randomCarac = new RandomExamples();
    List<String> _caracteristicasDelPais = this.paisDestinoRandom.getCaracteristicasDelPais();
    String _randomIn = randomCarac.<String>randomIn(_caracteristicasDelPais);
    this.CaracteristicaDelPaisDestino = _randomIn;
    Caso _caso = super.getCaso();
    Villano _responsable = _caso.getResponsable();
    List<String> _señasParticulares = _responsable.getSeñasParticulares();
    String _randomIn_1 = randomCarac.<String>randomIn(_señasParticulares);
    this.CaracteristicaDELasSeñasParticulares = _randomIn_1;
  }
  
  public Pais paisRandomDelDestino() {
    Pais _xblockexpression = null;
    {
      final RandomExamples randomPaisDestino = new RandomExamples();
      Caso _caso = super.getCaso();
      List<Pais> _planDeEscape = _caso.getPlanDeEscape();
      Pais _randomIn = randomPaisDestino.<Pais>randomIn(_planDeEscape);
      _xblockexpression = this.paisDestinoRandom = _randomIn;
    }
    return _xblockexpression;
  }
  
  public String nombreLugar() {
    return "Biblioteca";
  }
}
