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

	method pesoTotal() { return self.cargaTotal() + tara }

	method cargaTotal() { return cosas.sum({ cosa => cosa.peso()}) }

	method tieneAlgoQuePesa(cantidad) {
		return cosas.any({ cosa => cosa.peso() == cantidad })
	}

	method esTodoPesoPar() { return self.pesoTotal().even() }

	method esPesoExcedido() { return self.pesoTotal() > 2500 }

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
}

