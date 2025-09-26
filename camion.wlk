import cosas.*
import almacenYCaminos.*

object camion {
	const property cosas = #{}
	const property taraDelCamion = 1000
	var destino = almacen

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method sufrirAccidente() {
		cosas.forEach({ cosa => cosa.sufrirAccidente()})
	}

	method transportarCargaHaciaDestinoPor(camino) { self.transportar(destino, camino) }

	method transportar(_destino, camino) {
		self.validarPermisoDeViaje(camino)
		_destino.almacenarTodo(cosas)
		cosas.clear()
	}

	method cosaDeNivelDePeligrosidad(nivel) {
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == nivel })
	}

	method cosasQueSuperenNivelDePeligrosidad(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method cosasMasPeligrosasQue(unaCosa) {
		return self.cosasQueSuperenNivelDePeligrosidad(unaCosa.nivelPeligrosidad())
	}

	method cosaMasPesada() {
		self.validarExistenciaDeCosas()
		return cosas.max({ cosa => cosa.peso() })
	}

	method pesoTotal() { return self.cargaTotal() + taraDelCamion }

	method cargaTotal() { return cosas.sum({ cosa => cosa.peso()}) }

	method pesosDeLasCosasCargadas() { return cosas.map({ cosa => cosa.peso() }) }

	method cantidadDeBultos() { return cosas.sum({ cosa => cosa.bultos() }) }

	method destino(_destino) { destino = _destino }
	method destino() { return destino } // para tests

	//consultas
	method tieneAlgoQuePesa(cantidad) {
		return cosas.any({ cosa => cosa.peso() == cantidad })
	}

	method puedeCircularEnRutaDeNivel(nivel) { 
		return not (self.esPesoExcedido(2500)) && 
			self.cosasQueSuperenNivelDePeligrosidad(nivel).isEmpty()
	}

	method esTodoPesoPar() { return cosas.all({ cosa => cosa.peso().even() }) }

	method esPesoExcedido(limiteMaximoDePeso) { return self.pesoTotal() > limiteMaximoDePeso }

	method tieneAlgoQuePesaEntre(minimo, maximo) {
		return cosas.any({ cosa => cosa.peso().between(minimo, maximo)})
	}

	//validaciones
	method validarCarga(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("No se puede cargar porque ya está en el camión.")
		}
	}

	method validarDescarga(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("No se puede descargar ya que no está en el camión.")
		}
	}

	method validarExistenciaDeCosas() {
		if (cosas.isEmpty()) {
			self.error("No hay cosas en el camión.")
		}
	}

	method validarPermisoDeViaje(camino) {
		if (!camino.puedePermitirPasar(self)) {
			self.error("El camión no tiene permitido viajar por este camino.")
		}
	}
}

