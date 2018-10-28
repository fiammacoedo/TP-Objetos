import arma.*
import armadura.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*
import artefacto.*

class CollarDivino inherits Artefacto{
	var property cantidadDePerlas = 5
	
	constructor(unPeso,unosDias) = super(unPeso,unosDias)
	
	method unidadesDeLucha(personaje){
		return cantidadDePerlas
	}
	
	override method precio(personaje){
		return cantidadDePerlas * 2
	}
	
	override method pesoExtra(personaje){
		return cantidadDePerlas*0.5
	}
	
}
