import camion.*
import cosas.*

object almacen {
    var property cosas = #{}

    method almacenarTodo(_cosas) { _cosas.forEach({ cosa => self.almacenar(cosa) }) }

    method almacenar(unaCosa) { cosas.add(unaCosa) }
}

object ruta9 {
    method puedePermitirPasar(vehiculo) {
        return vehiculo.puedeCircularEnRutaDeNivel(20)
    }
}

object caminosVecinales {
    var pesoMaximoPermitido = 1000

    method puedePermitirPasar(vehiculo) {
        return !vehiculo.esPesoExcedido(pesoMaximoPermitido)
    }

    method pesoMaximoPermitido(peso) { pesoMaximoPermitido = peso }
    method pesoMaximoPermitido() { return pesoMaximoPermitido }
}
