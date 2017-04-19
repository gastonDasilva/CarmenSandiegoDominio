package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List

class Villano {
	String nombre
	String sexo
    List <String> señasParticulares = new ArrayList<String>()
    List<String> hobbies = new ArrayList<String>()
    
    def void setVillano (String n, String s ){
    	
    	nombre = n;
    	sexo = s;
    }
    
    def nombre(){
    	nombre
    }
    
    def void agregarSeña(String seña){
    	
    	señasParticulares.add(seña);
    }
    
    def void sacarSeña(String seña){
    	señasParticulares.remove(seña)
    }
    
    def void agregarHobbie (String h){
    	
    	hobbies.add(h);
    }
    
    def sacarHobbie(String h){
    	hobbies.remove(h)
    }
	
}