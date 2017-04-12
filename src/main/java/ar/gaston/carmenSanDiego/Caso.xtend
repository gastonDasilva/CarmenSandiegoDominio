package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List

class Caso {
	Villano responsable
	List<Pais> planDeEscape = new ArrayList<Pais>(); 
	String reporteDelCaso
	String objetoRobado
	Pais paisDelRobo

	
	def void iniciarCaso (){
		paisDelRobo.recorrerLugaresDeInteres();
		
	}
	
}