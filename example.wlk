class Nave {
  var velocidad 
  var direccion
  var combustible

  method acelerar(cuanto) {
    velocidad = (cuanto + velocidad).min(100000)
  }

  method desacelerar(cuanto) {
    velocidad = (cuanto - velocidad).max(0)
  }

  method irHaciaElSol() {
    direccion = 10
  }

  method escaparDelSol() {
    direccion = -10
  }

  method ponerseParaleloAlSol() {
    direccion = 0
  }

  method acercarseUnPocoAlSol() {
    direccion = (direccion + 1).min(10)
  }

  method alejarseUnPocoDelSol() {
    direccion = (direccion - 1).max(-10)
  }

  method prepararViaje() {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }

  method cargarCombustible(cantidad) {
    combustible = combustible + cantidad
  }

  method descargarCombustible(cantidad) {
    combustible = combustible - cantidad
  }

  method cantidadDeComnustible() {
    return combustible
  }

  method velocidad() {
    return velocidad
  }
}

class NavesBalizas inherits Nave {
    var colorBaliza 

    method cambiarColorDeBaliza(colorNuevo) {
      colorBaliza = colorNuevo
    }

    override method prepararViaje() {
      super()
      self.cambiarColorDeBaliza("Verde")
    }

    method name() {
      
    }
}

class NavesDePasajeros inherits Nave {
  const cantidadDePasajeros
  var cantidadDeRacionesDeComidas = 0
  var cantidadDeRacionesDeBebidas = 0

  method cantidadDePasajeros() {
    return cantidadDePasajeros
  }

  method cargarCantidadDeRacionesDeComida(cantidadDeRaciones) {
    cantidadDeRacionesDeComidas = cantidadDeRaciones * cantidadDePasajeros
  }

  method cargarCantidadDeRacionesDeBebidas(cantidadDerRaciones) {
    cantidadDeRacionesDeBebidas = cantidadDerRaciones * cantidadDePasajeros
  }

  override method prepararViaje() {
    super()
    self.cargarCantidadDeRacionesDeComida(4)
    self.cargarCantidadDeRacionesDeBebidas(6)
  }
}

class NavesDeCombate inherits Nave {
  var estaVisible 
  var misilesDesplegados
  const mensajesEmitidos = []

  method ponerseVisible() {
    estaVisible = true
  }

  method ponerseInvisible() {
    estaVisible = false
  }

  method estaVisible() {
    return estaVisible
  }

  method desplegarMisiles() {
    misilesDesplegados = true
  }

  method replegarMisiles() {
    misilesDesplegados = false
  }

  method misilesDesplegados() {
    return misilesDesplegados
  }

  method emitirMensaje(mensaje) {
    mensajesEmitidos.add(mensaje)
  }

  method mensajesEmitidos() {
    return mensajesEmitidos
  }

  method primerMensajeEmitido() {
    return mensajesEmitidos.first()
  }

  method ultimoMensajeEmitido() {
    return mensajesEmitidos.last()
  }

  method esEscueta() {
    return mensajesEmitidos.any({mensaje => mensaje.length() > 30})
  }

  method emitioMensaje(mensaje) {
    return mensajesEmitidos.contains(mensaje)
  }

  override method prepararViaje() {
    super()
    self.acelerar(5000)
    self.acelerar(15000)
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitirMensaje("Saliendo en misión")
  }
}

class NaveHospital inherits NavesDePasajeros {
  var quirofanosPreparados

  method prepararQuirofanos() {
    quirofanosPreparados = true
  }

  method quirofanoNoPreparado() {
    quirofanosPreparados = false
  }
}

class NaveDeCombateSigilosa inherits NavesDeCombate {
  method estaTranquila(nave) {
    if(nave.cantidadDeComnustible() >= 4000 and nave.velocidad() <= 1200)
  }
}