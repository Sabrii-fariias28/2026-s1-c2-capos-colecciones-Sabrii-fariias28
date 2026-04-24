import capos.*
import moradas.*

object caterina {
  method poder() {
    return 28
  }

  method morada() {
    return fortalezaDeAcero
  }

  method esDebil() {
    return rolando.poderPelea() > self.poder()
  }
}

object archibaldo {
  method poder() {
    return 16
  }
    method morada() {
    return marmol
  }

  method esDebil() {
    return rolando.poderPelea() > self.poder()
  }
}

object astra {
  method poder() {
    return 14
  }
    method morada() {
    return marfil
  }

  method esDebil() {
    return rolando.poderPelea() > self.poder()
  }
}

