object knightRider {
	method peso() { return 500 } // porque no es un atributo?
	method nivelPeligrosidad() { return 10 }
}

object arenaAlGranel {
	var peso = 1000
	
	method peso() { return peso }

	method nivelPeligrosidad() { return 1 }

	method peso(cantidad) { peso = cantidad }
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
}

object paqueteDeLadrillos {
	var cantidadLadrillos = 0

	method peso() { return 2 * cantidadLadrillos}

	method nivelPeligrosidad() { return 2 }

	method cantidadLadrillos(cantidad) { cantidadLadrillos = cantidad }
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
}

object residuosRadioactivos {
	var peso = 100

	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	
	method peso(cantidad) { peso = cantidad }
}
