import wollok.game.*

object manzana {

	method image()= "manzana.png"
	method position() = game.at(4, 4)
	method energiaQueOtorga() = 100
	method teEncontro(algo){
		return false
	}
}

object alpiste {

	method image()= "alpiste.png"
	method position() = game.at(3, 3)
	method energiaQueOtorga() = 100
	method teEncontro(algo){
		return false
	}
}

