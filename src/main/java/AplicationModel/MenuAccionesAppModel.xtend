package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import Extra.DummyData

@Accessors
@Observable
@SuppressWarnings("all")
class MenuAccionesAppModel {
	var DummyData dum = new DummyData()
	ExpedientesAppModel exp = dum.expediente
	Mapamundi map = dum.paises
	ResolverMisterioAppModel res= new ResolverMisterioAppModel(exp,dum.getCasos)
}
