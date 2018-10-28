import arma.*
import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*
import artefacto.*

object espejo inherits Artefacto(20,0){
	method unidadesDeLucha(personaje){
		if(personaje.artefactos() == [self]){
			return 0
		}else{
			return personaje.poderMejorPertenencia()
		}
	}
	
	override method precio(personaje){
		return 90
	}
	
	override method pesoExtra(personaje){
		return 0
	}
}
	

class LibroDeHechizos{
	var hechizos
	
	constructor(unosHechizos){
		hechizos = unosHechizos
	}
	
	method poder(){
		var hechizosPoderosos = hechizos.filter({unHechizo => unHechizo.esPoderoso()})
		return hechizosPoderosos.sum({unHechizo => unHechizo.poder()})
	}
	
	method precio(personaje){
		return hechizos.size() * 10 + self.poder() 
	}
}

/*
En el caso del libro de hechizos, es necesario crear una clase de este ya que pueden existir diferentes libros con diferentes cantidades y tipos de hechizos.
En el caso del espejo, es conveniente crear un unico objeto espejo ya que al no tener variables no hay forma de diferenciar un espejo de otro,
todos tienen el mismo comportamiento.
*/