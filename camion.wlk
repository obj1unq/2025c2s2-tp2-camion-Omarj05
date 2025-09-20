import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)

		return unaCosa
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

	method pesoTotal() { return self.cargaTotal() + tara }

	method cargaTotal() { return cosas.sum({ cosa => cosa.peso()}) }

	method pesosDeLasCosasCargadas() { return cosas.map({ cosa => cosa.peso() }) }

	//consultas
	method tieneAlgoQuePesa(cantidad) {
		return cosas.any({ cosa => cosa.peso() == cantidad })
	}

	method puedeCircularEnRutaDeNivel(nivel) { 
		return not (self.esPesoExcedido()) && 
			self.cosasQueSuperenNivelDePeligrosidad(nivel).isEmpty()
	}

	method esTodoPesoPar() { return self.pesoTotal().even() }

	method esPesoExcedido() { return self.pesoTotal() > 2500 }

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
}

