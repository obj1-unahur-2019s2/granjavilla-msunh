import wollok.game.*
import hector.*
import oso.*
import cultivos.*
import direcciones.*

object juegoGranja {

	var personajeActual = hector

//  var elOsoSeMueve = false
	method configurarTeclado() {
		keyboard.s().onPressDo({ game.say(hector, "hola gente")})
			// y todas las otras
		self.configurarMovimientos()
	}

	method configurarMovimientos() {
		keyboard.up().onPressDo({ 
			if (personajeActual.position().y() < game.height() - 1) 
			{personajeActual.position(personajeActual.position().up(1))}
			})
		keyboard.down().onPressDo({ 
			if (personajeActual.position().y() > 0) 
			{personajeActual.position(personajeActual.position().down(1))}
			})
		keyboard.left().onPressDo({ 
			if (personajeActual.position().x() < 0) 
			{personajeActual.position(personajeActual.position().left(1))}
			})
		keyboard.right().onPressDo({ 
			if (personajeActual.position().x() < 0  ) 
			{personajeActual.position(personajeActual.position().right(1))}
			})			
			
		
	// falta abajo, izq, der
	}

	method configurarPersonajes() {
		game.addVisual(hector)
		game.addVisual(oso)
	}
	
	method configurarColisiones(){
		game.whenCollideDo(oso, { objeto => objeto.teChocoelOso()})
	}
	
	method configurarAcciones(){
		game.onTick(1000, "movimientoOso", { oso.moverEnDireccion(este)})
		
	}

}

