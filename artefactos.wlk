import capos.*

object espada {
    var cantidadUsos = 0
   
    method poder(personaje) {
      if(cantidadUsos == 0){
        return personaje.poderBase()
      } else {
        return (personaje.poderBase()) / 2
      }
    }

    method utilizar() {
      cantidadUsos += 1
    }
}

object collar{
    var cantidadUsos = 0
    method poder(personaje) {
      if(personaje.poderBase()  > 6 ){
        return 3 + cantidadUsos
      } else{
        return 3
      }
    }
    method utilizar() {
      cantidadUsos += 1
    }
}
object armadura{

    method poder(personaje) {
      return 6
    }

    method utilizar() {}
}
object libro{
    const hechizos = [bendicion,invisibilidad,invocacion]
    method poder(personaje) {
      if(hechizos.isEmpty()){
        return 0
      } else {
        return ((hechizos.get(0)).poder(personaje))
      }
    }

    method utilizar() {
      hechizos.remove(hechizos.get(0))
    }
}

object bendicion {
  method poder(personaje) {
    return 4
  }
}

object invisibilidad {
  method poder(personaje) {
    return personaje.poderBase()
  }
}

object invocacion {
  method poder(personaje) {
    return (castillo.artefactoMasPoderoso(personaje)).poder(personaje)
  }
}
