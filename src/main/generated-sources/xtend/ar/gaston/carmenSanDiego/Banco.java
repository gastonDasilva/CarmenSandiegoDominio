package ar.gaston.carmenSanDiego;

import Extra.RandomExamples;
import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.List;

@SuppressWarnings("all")
public class Banco extends LugarDeInteres {
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
      _xblockexpression = (((("creo haber oido que tenia planeado ir a\r\n         un pais con las siguientes caracteristicas: " + this.CaracteristicaDelPaisDestino) + " .\r\n          ") + " Ademas recuerdo que la persona tenia estas señas: ") + this.CaracteristicaDELasSeñasParticulares);
    }
    return _xblockexpression;
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
    return "Banco";
  }
}
