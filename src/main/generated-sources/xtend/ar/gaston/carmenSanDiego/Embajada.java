package ar.gaston.carmenSanDiego;

import Extra.RandomExamples;
import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.LugarDeInteres;
import ar.gaston.carmenSanDiego.Pais;
import java.util.List;

@SuppressWarnings("all")
public class Embajada extends LugarDeInteres {
  private Pais paisDestinoRandom;
  
  private String primerCaracteristicaDelPaisDestino;
  
  private String segundaCaracteristicaDelPaisDestino;
  
  public String procesarInformante() {
    String _pistasRelacionadasConElDestinoDelVillano = this.pistasRelacionadasConElDestinoDelVillano();
    return ("Vi a alguien como describe!" + _pistasRelacionadasConElDestinoDelVillano);
  }
  
  public String pistasRelacionadasConElDestinoDelVillano() {
    String _xblockexpression = null;
    {
      this.paisRandomDelDestino();
      this.caracteriscaDeLPaisDetinoRandom();
      _xblockexpression = ((("creo haber oido que tenia planeado ir a \r\n         un pais con las siguientes caracteristicas: " + this.primerCaracteristicaDelPaisDestino) + " , ") + this.segundaCaracteristicaDelPaisDestino);
    }
    return _xblockexpression;
  }
  
  public String nombreLugar() {
    return "Embajada";
  }
  
  public void caracteriscaDeLPaisDetinoRandom() {
    final RandomExamples randomCaracPaisDestino = new RandomExamples();
    List<String> _caracteristicasDelPais = this.paisDestinoRandom.getCaracteristicasDelPais();
    String _randomIn = randomCaracPaisDestino.<String>randomIn(_caracteristicasDelPais);
    this.primerCaracteristicaDelPaisDestino = _randomIn;
    List<String> _caracteristicasDelPais_1 = this.paisDestinoRandom.getCaracteristicasDelPais();
    String _randomIn_1 = randomCaracPaisDestino.<String>randomIn(_caracteristicasDelPais_1);
    this.segundaCaracteristicaDelPaisDestino = _randomIn_1;
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
}
