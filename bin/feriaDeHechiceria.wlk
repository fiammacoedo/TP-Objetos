import arma.*
import armadura.*
import collarDivino.*
import cotaDeMalla.*
import fuerzaOscura.*
import hechizoDeLogos.*
import libroDeHechizosYEspejo.*
import mascara.*
import personaje.*

object feriaDeHechiceria{
	
	method venderHechizo(unCliente,unHechizo){
		if(!unCliente.puedePagarHechizo(unHechizo)){
			throw new Exception("El cliente no tiene el dinero suficiente")
		}
		unCliente.gastarMonedas(unHechizo.precio(unCliente) - unCliente.precioHechizoPreferido())
	}
	
	method venderArtefacto(unCliente,unArtefacto,unComerciante){
		if(!unCliente.puedePagarArtefacto(unArtefacto,unComerciante)){
			throw new Exception("El cliente no tiene el dinero suficiente")
		}
		var precioTotalACobrar = unArtefacto.precio(unCliente) + unComerciante.impuestoAdicional(unArtefacto,unCliente)
		unCliente.gastarMonedas(precioTotalACobrar)
	}	
}

class Comerciante{
	var property situacionImpositiva
	var property comision
	var property minimoImponible
	
	constructor(unaSituacion,unaComision,unMinimo){
		situacionImpositiva = unaSituacion
		comision = unaComision
		minimoImponible = unMinimo
	}
	
	method superaMinimo(unArtefacto,unPersonaje){
		return unArtefacto.precio(unPersonaje) > minimoImponible
	}
	
	method impuestoAdicional(unArtefacto,unPersonaje){
		return situacionImpositiva.impuesto(unArtefacto,self,unPersonaje)
	}
	
	method recategorizar(){
		situacionImpositiva.cambiarTipo(self)
	}
	
	method cambioEspontaneoA(unaSituacion){
		self.situacionImpositiva(unaSituacion)
	}
}

object independiente{
	method impuesto(unArtefacto,unComerciante,unPersonaje){
		return unArtefacto.precio(unPersonaje)*unComerciante.comision()/100
	}
	
	method cambiarTipo(unComerciante){
		var comisionActual = unComerciante.comision()
		if(comisionActual * 2 >= 21){
			unComerciante.situacionImpositiva(registrado)
		}else{
			unComerciante.comision(comisionActual*2)
		}
	}
}

object registrado{
	method impuesto(unArtefacto,unComerciante,unPersonaje){
		return unArtefacto.precio(unPersonaje)*0.21
	}
	
	method cambiarTipo(unComerciante){
		unComerciante.situacionImpositiva(impuestoALasGanancias)
	}
}

object impuestoALasGanancias{
	method impuesto(unArtefacto,unComerciante,unPersonaje){
		if(!unComerciante.superaMinimo(unArtefacto,unPersonaje)){
			return 0
		}else{
			return (unArtefacto.precio(unPersonaje) - unComerciante.minimoImponible()) * 0.35
		}
	}
	
	method cambiarTipo(unComerciante){}
}
