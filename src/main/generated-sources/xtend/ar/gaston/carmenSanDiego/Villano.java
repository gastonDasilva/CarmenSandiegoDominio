package ar.gaston.carmenSanDiego;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class Villano {
  private String nombre;
  
  private String sexo;
  
  private List<String> señasParticulares = new ArrayList<String>();
  
  private List<String> hobbies = new ArrayList<String>();
  
  public void setVillano(final String n, final String s) {
    this.nombre = n;
    this.sexo = s;
  }
  
  public String nombre() {
    return this.nombre;
  }
  
  public void agregarSeña(final String seña) {
    this.señasParticulares.add(seña);
  }
  
  public void agregarHobbie(final String h) {
    this.hobbies.add(h);
  }
}
