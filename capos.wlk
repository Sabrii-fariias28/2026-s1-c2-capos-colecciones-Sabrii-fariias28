object ronaldo {
  const listaArtefactos = #{}
  var capacidadMax = 2
  var morada = castillo
  var historial = []
  
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

  method historia() {
    return
  }
}

object espada {}
object libro{}
object collar{}
object armadura{}

object castillo {
  /*El cons es una referecia, no es que siempre va a ser la misma lista. Sino lo qu ees constante es la referecia.*/
  const listaArtefactos = []

  method guardarArtefactos(artefactos) {
    listaArtefactos.addAll(artefactos)
  }
  method artefactosQueHay() {
    return listaArtefactos
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