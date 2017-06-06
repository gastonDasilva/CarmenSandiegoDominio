package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Villano {
	int id 
	String nombre
	String sexo
    List <String> senhasParticulares = new ArrayList<String>()
    List<String> hobbies = new ArrayList<String>()
    
    new()
    {}
    
    new(int id, String n, String s){
		this.id = id
    	nombre = n
    	sexo = s
    }
    
    def nombreVillano(){
    	nombre
    }
    
    def void agregarSeña(String seña){
    	
    	senhasParticulares.add(seña);
    }
    
    def void sacarSeña(String seña){
    	senhasParticulares.remove(seña)
    }
    
    def void agregarHobbie (String h){
    	
    	hobbies.add(h);
    }
    
    def sacarHobbie(String h){
    	hobbies.remove(h)
    }
	
}