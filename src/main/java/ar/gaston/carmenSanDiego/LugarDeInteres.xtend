package ar.gaston.carmenSanDiego

abstract class LugarDeInteres {
	// Solo pueden ser Club,Embajada,Banco y Biblioteca 
	    Boolean informante = false  //Solo puede haber una persona en el lugar, es decir que solo un booleano puede ser true
		Boolean ocupante = false  
		Boolean cuidador = false 
		Villano vil = null // indica si el villano esta en el lugar de interes o no 
		
		  
		def  hayInformante() {
			informante
		}

		def hayOcupante() {
			ocupante
		}

		def hayCuidador() {
			cuidador
		}

		def void setearVillanoEnLugar(Villano v){
			vil = v;
		}
		
		
		def void setearInformante() {
			// setea un true para que halla un informante en el lugar de interes
			if (this.hayCuidador() || this.hayOcupante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
				  informante = true;
				 }
		}
		
		def void setearOcupante() {
			//setea un ocupante que puede ser el villano o no  al lugar de interes 
			if (this.hayCuidador() || this.hayInformante()){
				System.out.println("Ya hay un individuo en el lugar" );
			}else{
				  this.ocupante = true;
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
		
		def void procesar(){
			
			this.procesarCuidador()
			this.procesarOcupante
			//this.procesarInformante
		}
		
		def void procesarCuidador() {
			//Prop: verifica si hay un cuidador en el lugar y procesar 
			if (this.hayCuidador()){
				System.out.println("CUIDADOR: Te equivocaste de pais bato, mejor volve por donde viniste" );
			   }
		}
		
		def void procesarOcupante (){
			// si el villano esta en el lugar se lo detiene sino se le advierte al detective que el villano esta en la
			// ciudad
			
			if(this.hayOcupante()){
				if (vil== null ){
					System.out.println("CUIDADO DETECTIVE! el villano esta en la ciudad" );
				    }else{
				          System.out.println("Alto!!"+vil.nombre+" Queda Arrestado" );
			             }
			}
		}
		
		def void procesarInformante()
		// depende de cada lugar la informacion que da 
		
		
	
		
		
}