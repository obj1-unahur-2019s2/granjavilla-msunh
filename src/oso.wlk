import wollok.game.*

object oso {
	var property position = new Position(x = 3, y = 7)
	
	method image() = "oso.png"
	
	method moverEnDireccion(direccion){
		self.position (direccion.siguientePosicion(self.position()))
	}
	
}