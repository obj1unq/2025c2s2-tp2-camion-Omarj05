object knightRider {
	method peso() { return 500 } // porque no es un atributo?
	method nivelPeligrosidad() { return 10 }

	method bultos() { return 1 }
}

object arenaAlGranel {
	var peso = 100
	
	method peso() { return peso }

	method nivelPeligrosidad() { return 1 }

	method peso(cantidad) { peso = cantidad }

	method bultos() { return 1 }
}

object bumblebee {
	var estaTransformadoEnAuto = true

	method peso() { return 800 }

	method nivelPeligrosidad() { 
		if (self.estaTransformadoEnAuto()) { return 15 } else { return 30 } 
	}

	method transformarEnAuto() { estaTransformadoEnAuto = true }
	method transformarEnRobot() { estaTransformadoEnAuto = false }

	method estaTransformadoEnAuto() { return estaTransformadoEnAuto }

	method bultos() { return 2 }
}

object paqueteDeLadrillos {
	var cantidadLadrillos = 0

	method peso() { return 2 * cantidadLadrillos}

	method nivelPeligrosidad() { return 2 }

	method cantidadLadrillos(cantidad) { cantidadLadrillos = cantidad }

	method bultos() { 
		if (cantidadLadrillos <= 100) { 
			return 1 
		}
		else if (cantidadLadrillos <= 300) { 
			return 2 
		}
		else { return 3 }
	}
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method peso() {
		if (self.tieneMisiles()) { return 300 } else { return 200 }
	}

	method nivelPeligrosidad() { 
		if (self.tieneMisiles()) { return 100 } else { return 0 } 
	}

	method tieneMisiles() { return tieneMisiles }

	method cargarMisiles() { tieneMisiles = true }
	method descargarMisiles() { tieneMisiles = false }

	method bultos() { if (self.tieneMisiles()) { return 2 } else { return 1 } }
}

object residuosRadioactivos {
	var peso = 100

	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	
	method peso(cantidad) { peso = cantidad }

	method bultos() { return 1 }
}

object contenedorPortuario {
	const property cosas = #{}

	method peso() { return 100 + self.cargaTotal()}

	method cargaTotal() { return cosas.sum({ cosa => cosa.peso()}) }

	method nivelPeligrosidad() {
		if (cosas.isEmpty()) { return 0 }
		else { return self.cosaConMayorNivelDePeligrosidad().nivelPeligrosidad() }
	}

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)

		return unaCosa
	}

	method cosaConMayorNivelDePeligrosidad() {
		return cosas.max({ cosa => cosa.nivelPeligrosidad() })
	}

	//validaciones
	method validarCarga(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("No se puede cargar porque ya está en el contenedor.")
		}
	}

	method validarDescarga(unaCosa) {
		if (!cosas.contains(unaCosa)) {
			self.error("No se puede descargar ya que no está en el contenedor.")
		}
	}

	method bultos() { return 1 + cosas.sum({ cosa => cosa.bultos() }) }
}

object embalajeDeSeguridad {
	var cosa = null

	method peso() { return cosa.peso() }

	method nivelPeligrosidad() { return cosa.nivelPeligrosidad() / 2 }

	method embalar(unaCosa) { cosa = unaCosa }

	method bultos() { return 2 }
}
