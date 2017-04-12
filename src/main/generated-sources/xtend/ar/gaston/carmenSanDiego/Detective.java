package ar.gaston.carmenSanDiego;

import ar.gaston.carmenSanDiego.Caso;
import ar.gaston.carmenSanDiego.Pais;
import ar.gaston.carmenSanDiego.Villano;
import java.util.ArrayList;

@SuppressWarnings("all")
public class Detective {
  private ArrayList<Pais> mapamundi = new ArrayList<Pais>();
  
  private ArrayList<Villano> villanos = new ArrayList<Villano>();
  
  private ArrayList<Caso> casos = new ArrayList<Caso>();
  
  public void resolverCaso() {
    Caso _get = this.casos.get(1);
    _get.iniciarCaso();
  }
}
