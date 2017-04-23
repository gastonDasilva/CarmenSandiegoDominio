package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
@SuppressWarnings("all")
class MenuAccionesAppModel {
	ExpedientesAppModel exp = new ExpedientesAppModel
	Mapamundi map = new Mapamundi 
	ResolverMisterioAppModel res= new ResolverMisterioAppModel(exp)
}