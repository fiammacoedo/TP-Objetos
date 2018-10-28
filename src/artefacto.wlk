import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*
import arma.*

class Artefacto {
	const peso
	var diasAntiguedad
	
	constructor(unPeso,unosDias){
		peso = unPeso
		diasAntiguedad = unosDias
	}
	
	method peso(personaje){
		return peso - self.factorDeCorreccion() + self.pesoExtra(personaje)
	}
	
	method factorDeCorreccion(){
		return 1.min(diasAntiguedad/100)
	}
	
	method pesoExtra(personaje)
	method precio(personaje)
}
