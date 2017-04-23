package AplicationModel

import ar.gaston.carmenSanDiego.LugarDeInteres
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
@SuppressWarnings("all")
class LugaresDeInteresAppModel {
	ResolverMisterioAppModel resM
	LugarDeInteres lugar
	
	new(ResolverMisterioAppModel r,LugarDeInteres l){
		resM =r
		lugar = l
	}
	}