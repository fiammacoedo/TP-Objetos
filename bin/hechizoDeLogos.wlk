import arma.*
import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*
import feriaDeHechiceria.*
import personaje.*

class Hechizo{
	method pesoExtraArmadura(){
		if(self.poderEsPar()){
			return 2
		}
		else{
			return 1
		}
	}
	
	method poderEsPar(){
		return self.poder().even()
	}
	
	method poder()
	method esPoderoso()
	
	method peso(personaje){
		return 0
	}
	
	method precio(personaje){
		return self.poder()
	}
}

class HechizoDeLogos inherits Hechizo{
	var property nombre
	var property multiplo = 2
	
	constructor(unNombre,unMultiplo){
		nombre = unNombre
		multiplo = unMultiplo
	}
	
	override method poder(){
		return (nombre.size()) * multiplo
	}
	
	override method esPoderoso(){
		return self.poder() > 15
	}
	
	method unidadesExtra(personaje){
		return self.poder()
	}
	
	method precioExtra(personaje,valorBase){
		return valorBase + self.precio(personaje)
	}
	
}

object hechizoBasico inherits Hechizo{
	var property poder = 10
	
	method unidadesExtra(personaje){
		return self.poder()
	}
	
	method precioExtra(personaje,valorBase){
		return valorBase + self.precio(personaje)
	}
	
	override method poder(){
		return poder
	}
	
	override method esPoderoso(){
		return false
	}
}

class HechizoComercial inherits HechizoDeLogos{
	var property porcentaje = 20 
	
	constructor(unNombre,unMultiplo) = super(unNombre,unMultiplo)
	
	override method poder(){
		return super()*porcentaje/100
	}
}
