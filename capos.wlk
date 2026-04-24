import moradas.*
import enemigos.*

object rolando {
  const listaArtefactos = #{}
  var capacidadMax = 2
  var morada = castillo
  var historial = []
  var poderBase = 5
  const enemigos = #{caterina,archibaldo,astra}

  /*Si usara lista tengo que usar verificacion para que el elemento no este antes en la mochila, si usaramos conjunto no pasa*/
  method recolectar(artefacto) {
    historial = historial + [artefacto]
    if(self.tieneEspacio()){
    listaArtefactos.add(artefacto)
    }
  }

  method historial() {
    return historial
  }

  method tieneEspacio() {
    return listaArtefactos.size() < capacidadMax
  }

  method capacidad(capacidad) {
    capacidadMax = capacidad
  }

  method artefactosQueLleva() {
    return listaArtefactos
  }

  method llegarA(_morada) {
    _morada.guardarArtefactos(listaArtefactos)
    listaArtefactos.clear()
  }

  method posesiones() {
    return listaArtefactos.asList() + castillo.artefactosQueHay()
  }

  method posee(artefacto) {
    return self.posesiones().contains(artefacto)
  }

  method poderBase() {
    return poderBase
  }

  method poderPelea() {
    const poderPelea = listaArtefactos.sum({artefacto => artefacto.poder(self)})
    return poderBase + poderPelea
  }

  method lucharBatalla() {
    listaArtefactos.forEach({artefacto => artefacto.utilizar()})
    poderBase += 1
  }

  method morada(_morada) {
    morada = _morada
  }

  method puedeVencerEnemigos() {
    return self.enemigos().filter({enemigo => enemigo.esDebil()})
  }

  method enemigos() {
    return enemigos
  }

  method moradasConquistables() {
    return self.puedeVencerEnemigos().map({enemigo => enemigo.morada()})
  }

  method esPoderoso() {
    return self.enemigos().all({enemigo => enemigo.esDebil()})
  }

  method poderBase(_poderBase) {
    poderBase = _poderBase
  }
}

/*
Es anemico porque no se mandan mensajes a la mochila, sino que se usa a ronaldo para enviar los mensajes.
Como la mochila solo le pertenece a Ronaldo y nadie mas, deberia estar deltro del objeto ronaldo.
object mochila {
  var capacidad = 2

  method capacidad() {
    return capacidad
  }

  method cambiarCapacidad(_capacidad) {
    capacidad = _capacidad
  }
}
*/


/*Ejemplo en la clase:
No es escalable, esta codeado con anticipacion, es una referencia global
  method llegarAlCastillo() {
    castillo.guardarArtefactos(listaArtefactos)
    listaArtefactos.clear()
  }
*/

/*Ejemplo de la clase: Esta mal, porque no es trabajo de ronaldo
encontrar el mas poderoso del castillo, sino que es responsabilidad
del castillo
object ronaldo {
  method artefactoMasPoderosoDeLaMorada(){
    return castillo.listaArtefactos().max()({a => a.poder()})
}
}
*/