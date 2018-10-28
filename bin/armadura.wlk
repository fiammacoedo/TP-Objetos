import arma.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import artefacto.*
import feriaDeHechiceria.*

class Armadura inherits Artefacto{
	var property refuerzo
	var property valorBase
	
	constructor(unPeso,unosDias,unRefuerzo,unValorBase) = super(unPeso,unosDias){
		refuerzo = unRefuerzo
		valorBase = unValorBase
	}
	
	method unidadesDeLucha(personaje){
			return valorBase + refuerzo.unidadesExtra(personaje)
	}
	
	override method precio(personaje){
		return refuerzo.precioExtra(personaje,valorBase)
	} 
	
	override method pesoExtra(personaje){
		return refuerzo.pesoExtraArmadura()
	}
}

object bendicion{
	method unidadesExtra(personaje){
		return personaje.nivelHechiceria()
	}
	
	method precioExtra(personaje,valorBase){
		return valorBase
	}
	
	method pesoExtraArmadura(){
		return 0
	}
}

object ninguno{
	method unidadesExtra(personaje){
		return 0
	}
	
	method precioExtra(personaje,valorBase){
		return 2
	}
	
	method pesoExtraArmadura(){
		return 0
	}
}