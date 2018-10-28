import arma.*
import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import personaje.*
import feriaDeHechiceria.*
import artefacto.*

class Mascara inherits Artefacto{
	var indiceOscuridad
	var property valorMinimo = 4
	
	constructor(unPeso,unosDias,unIndiceOscuridad) = super(unPeso,unosDias){
		indiceOscuridad = unIndiceOscuridad
	}
	
	method unidadesDeLucha(personaje){
		return valorMinimo.max((fuerzaOscura.valor()/2) * indiceOscuridad)
	}
	
	override method pesoExtra(personaje){
		if(!self.esClara()){
			return 0.max(self.unidadesDeLucha(personaje) - 3)
		}
		else{
			return 0
		}
	}
	
	method esClara(){
		return indiceOscuridad == 0
	}
	
	override method precio(personaje){
		return 10*indiceOscuridad
	}
}





