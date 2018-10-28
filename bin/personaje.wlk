import arma.*
import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import feriaDeHechiceria.*

class Personaje{
	var property valorBase = 3
	var property hechizoPreferido
	var property artefactos
	var property valorBaseLucha = 1
	var property monedas = 100
	const capacidadMaxima
	
	constructor(unHechizoPreferido,unosArtefactos,unaCapacidad){
		hechizoPreferido = unHechizoPreferido
		artefactos = unosArtefactos
		capacidadMaxima = unaCapacidad
	}
	
	method nivelHechiceria(){
		return valorBase * hechizoPreferido.poder() + fuerzaOscura.valor()
	}
	
	method seCreePoderoso(){
		return hechizoPreferido.esPoderoso()	
	}

	method agregarArtefacto(artefacto){
		artefactos.add(artefacto)
	}
	
	method removerArtefacto(artefacto){
		artefactos.remove(artefacto)
	}
	
	method valorLucha(){
		return valorBaseLucha + artefactos.sum({unArtefacto => unArtefacto.unidadesDeLucha(self)})
	}
	
	method tieneMasLuchaQueHechiceria(){
		return self.valorLucha() > self.nivelHechiceria()
	}
	
	method mejorPertenencia(){
		var pertenenciasRestantes = artefactos.filter({unArtefacto => unArtefacto != espejo})
		return pertenenciasRestantes.max({unArtefacto => unArtefacto.unidadesDeLucha(self)}) //maximo segun unidades de lucha
	}
	
	method poderMejorPertenencia(){
		return self.mejorPertenencia().unidadesDeLucha(self)	
	}
	
	method estaCargado(){
		return artefactos.size() >= 5
	}
	
	method precioHechizoPreferido(){
		return (hechizoPreferido.precio(self)/2)
	}
	
	method comprarHechizo(unHechizo){
		feriaDeHechiceria.venderHechizo(self,unHechizo)
		hechizoPreferido = unHechizo
	}
	
	method comprarArtefacto(unArtefacto,unComerciante){
		if(!self.tieneCapacidadPara(unArtefacto)){
			self.error("No puede cargar este artefacto, ya que supera su capacidad maxima")
		}
		feriaDeHechiceria.venderArtefacto(self,unArtefacto,unComerciante)
		self.agregarArtefacto(unArtefacto)
	}
	
	method gastarMonedas(cantidad){
		monedas -= 0.max(cantidad)
	}
	
	method puedePagarHechizo(unHechizo){
		return monedas - unHechizo.precio(self) + self.precioHechizoPreferido() >= 0
	}
	
	method puedePagarArtefacto(unArtefacto,unComerciante){
		return monedas - unArtefacto.precio(self) - unComerciante.impuestoAdicional(unArtefacto,self) >= 0
	}
	
	method cumplirObjetivo(){
		monedas += 10
	}
	
	method pesoActual(){
		return artefactos.sum({unArtefacto => unArtefacto.peso(self)})
	}
	
	method tieneCapacidadPara(unArtefacto){
		return unArtefacto.peso(self) + self.pesoActual() <= capacidadMaxima
	}
}

class NPC inherits Personaje{
	var property tipoNPC
	
	constructor(unHechizoPreferido,unosArtefactos,unaCapacidad,unTipo) = super(unHechizoPreferido,unosArtefactos,unaCapacidad){
		tipoNPC = unTipo
	}
	
	override method valorLucha(){
		return super()*tipoNPC.multiplicador()
	}
	
}

object facil{
	const property multiplicador = 1
}

object moderado{
	const property multiplicador = 2
}

object dificil{
	const property multiplicador = 4
}
