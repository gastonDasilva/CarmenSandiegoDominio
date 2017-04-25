package ar.gaston.carmenSanDiego

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Caso {
	String nombreCaso
	Villano responsable
	List<Pais> planDeEscape = new ArrayList<Pais>(); 
	String reporteDelCaso
	String objetoRobado
	Pais paisDelRobo
	Villano ordenDeArrestoAlVillano
	
	new(String nombre, Villano vres){
		nombreCaso = nombre
		responsable = vres
	}

	def String getNombreCaso(){
		nombreCaso
	}
	
	def agregarPaisPlanDeEscape(Pais p){
		planDeEscape.add(p)
	}
	
	def getPaisDelRobo(){
		paisDelRobo
	}
	def setearPaisDeLRobo (Pais p){
		paisDelRobo = p
	}
	
	def getReporteDelCaso(){
		reporteDelCaso
	}
	
	def getResponsable(){
		responsable
	}

	def setearOrdenDeArrestoAlVillano(Villano villano) {
		ordenDeArrestoAlVillano = villano
	}
	
}