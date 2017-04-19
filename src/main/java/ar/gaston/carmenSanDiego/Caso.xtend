package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List


class Caso {
	String nombreCaso
	Villano responsable
	List<Pais> planDeEscape = new ArrayList<Pais>(); 
	String reporteDelCaso
	String objetoRobado
	Pais paisDelRobo

	def String getNombreCaso(){
		nombreCaso
	}
	
	def getPaisDelRobo(){
		paisDelRobo
	}
	def getReporteDelCaso(){
		reporteDelCaso
	}
	
	def void iniciarCaso (){
		paisDelRobo.recorrerLugaresDeInteres();
		
	}
	
}