import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)

		return unaCosa
	}

	method esTodoPesoPar() {
		return self.pesoTotal().even()
	}

	method pesoTotal() {
		return cosas.sum({ cosa => cosa.peso()})
	}

	method tieneAlgoQuePesa(cantidad) {
		return cosas.any({ cosa => cosa.peso() == cantidad })
	}

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

