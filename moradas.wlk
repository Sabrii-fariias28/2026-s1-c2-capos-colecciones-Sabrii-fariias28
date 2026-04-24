object castillo {
  /*El cons es una referecia, no es que siempre va a ser la misma lista. Sino lo qu ees constante es la referecia.*/
  const listaArtefactos = []

  method guardarArtefactos(artefactos) {
    listaArtefactos.addAll(artefactos)
  }
  method artefactosQueHay() {
    return listaArtefactos
  }

  method artefactoMasPoderoso(personaje) {
    return listaArtefactos.max({a => a.poder(personaje)})
  }
}

object fortalezaDeAcero {}
object marmol {}
object marfil {}