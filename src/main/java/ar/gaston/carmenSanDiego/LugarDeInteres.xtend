package ar.gaston.carmenSanDiego

import org.uqbar.commons.utils.Observable
import java.util.List

@Observable
abstract class LugarDeInteres {
	// Solo pueden ser Club,Embajada,Banco y Biblioteca 
	    Boolean informante = false  //Solo puede haber una persona en el lugar, es decir que solo un booleano puede ser true
		Boolean ocupante = false  
		Boolean cuidador = false 
		Villano vil = null // indica si el villano esta en el lugar de interes o no
		Caso cas 
		
		  
		def  hayInformante() {
			informante
		}

		def hayOcupante() {
			ocupante
		}

		def hayCuidador() {
			cuidador
		}
		def getVillano(){
			vil
		}
		def getCaso(){
			cas
		}
		
		def hayVillanoEnElLugar(){
			if(vil!= null){
			 true
			}else{
				false
			}
		}

		def void setearVillanoEnLugar(Villano v){
			vil = v;
		}
		def String nombreLugar()
		
		
		
		def void setearInformante() {
			// setea un true para que halla un informante en el lugar de interes
			if (this.hayCuidador() || this.hayOcupante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
				  informante = true;
				 }
		}
		
	
		def List<LugarDeInteres> values(){
			
		/*Sin hacer preguntar, en clase como hacerlo  */
		}
		
		def void setearOcupante() {
			//setea un ocupante que puede ser el villano o no  al lugar de interes 
			if (this.hayCuidador() || this.hayInformante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
				  this.ocupante = true;
			     }
		}
		
			def void setearOcupante(Villano villano) {
			//setea un ocupante que puede ser el villano o no  al lugar de interes 
			if (this.hayCuidador() || this.hayInformante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
				  this.ocupante = true;
				  this.vil = villano
			     }
		}

		def void setearCuidador() {
			//setea un true para que halla un cuidador al lugar de interes 
			if (this.hayInformante() || this.hayOcupante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
			      this.cuidador = true;
			     }
			
		}
		
		def String procesar(){
			if(this.hayCuidador()){
				procesarCuidador()
			}else{
				if(this.hayOcupante()){
					procesarOcupante()
				}else{
					if(this.hayInformante()){
						procesarInformante()
					}
				}
			}
		}
		
		def String procesarCuidador() {
			//Prop: verifica si hay un cuidador en el lugar y procesar 
				"CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste" 
		}
		
		def String procesarOcupante (){
			// si el villano esta en el lugar se lo detiene sino se le advierte al detective que el villano esta en la
			// ciudad
				if (vil== null ){
					"CUIDADO DETECTIVE! el villano esta en la ciudad" 
				    }else{
				    	  if(cas.ordenDeArrestoAlVillano == null){
				    	  	 "CUIDADO DETECTIVE!El villano escapo por no tener una orden de arresto"
				    	  }else{
				          "Alto!!"+cas.ordenDeArrestoAlVillano.nombre+" Queda Arrestado" 
				          	}
			             }
			}
		
		def String procesarInformante()
	
	def void setearCaso(Caso c){
		cas = c;
	}
	
		
	
		
		
}