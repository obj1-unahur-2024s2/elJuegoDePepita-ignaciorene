import pepita.*
import wollok.game.*

object nido {

	method image()="nido.png"
	method position() = game.at(game.width()-2, game.height()-2)

	method teEncontro(algo){
		algo.image("pepita-grande.png")
		game.say(algo, "¡GANE!")
	}
}

object silvestre {

	var property position = game.at(3,0)
	method image() = "silvestre.png"
	
	method perseguir(objetivo){
		if(objetivo.position().x()>self.position().x()){
			position= self.position().right(1)
		}
		if(objetivo.position().x()<self.position().x() and self.position().x()>3){
			position= self.position().left(1)
		}
	}

	method teEncontro(algo){
		algo.image("pepita-gris.png")
		game.say(algo, "¡PERDI!")
	}
}

