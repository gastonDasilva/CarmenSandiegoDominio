package ar.gaston.carmenSanDiego

import java.util.ArrayList

class Detective {
	ArrayList <Pais> mapamundi = new ArrayList<Pais>()
	ArrayList <Villano> villanos = new ArrayList<Villano>()
	ArrayList <Caso> casos = new ArrayList<Caso>()
	
	
	def void resolverCaso(){
		casos.get(1).iniciarCaso()
	}
}