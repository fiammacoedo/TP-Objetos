import arma.*
import armadura.*
import collarDivino.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*

class CotaDeMalla{
	var unidadesExtra
	
	constructor(unasUnidadesExtra){
		unidadesExtra = unasUnidadesExtra
	}
	
	method unidadesExtra(personaje){
		return unidadesExtra
	}
	
	method precioExtra(personaje,valorBase){
		return self.unidadesExtra(personaje)/2
	}
	
	method pesoExtraArmadura(){
		return 1
	}
}