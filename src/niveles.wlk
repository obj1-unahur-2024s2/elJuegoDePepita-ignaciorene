import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarColisiones()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.gravedad()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.gravedad()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ 
			if(0 < pepita.position().x() and pepita.energia()>0){
				pepita.irA(pepita.position().left(1))
				silvestre.perseguir(pepita)
			}
			})
		keyboard.right().onPressDo({ 
			if(game.width()-1 > pepita.position().x() and pepita.energia()>0){
				pepita.irA(pepita.position().right(1))	
				silvestre.perseguir(pepita)
			}
		})
		// Completar para que se pueda mover arriba y abajo
		keyboard.up().onPressDo({ 
			if(game.height()-1 > pepita.position().y() and pepita.energia()>0){
				pepita.irA(pepita.position().up(1))	
				silvestre.perseguir(pepita)
			}
		})

		keyboard.down().onPressDo({ 
			if(0 < pepita.position().y() and pepita.energia()>0){
				pepita.irA(pepita.position().down(1))	
				silvestre.perseguir(pepita)
			}
		})

		keyboard.c().onPressDo({
			if(game.uniqueCollider(pepita)==manzana or game.uniqueCollider(pepita)==alpiste){
				pepita.come(game.uniqueCollider(pepita))
				game.removeVisual(game.uniqueCollider(pepita))
			}
		})

		
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

	method gravedad() {
	  game.onTick(800, "gravedad", {pepita.caerGravedad()})
	}

}

