import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*
import artefacto.*

class Arma inherits Artefacto{
	method unidadesDeLucha(personaje){
		return 3
	}
	
	override method precio(personaje){
		return self.peso(personaje) * 5
	}
	
	override method pesoExtra(personaje){
		return 0
	}
}