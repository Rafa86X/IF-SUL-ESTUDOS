const EventEmitter = require("events");

class Pedido extends EventEmitter {
  pedido = "";
  criarPedido(p) {
    this.pedido = p;
    console.log("Pedido criado:", p);
    this.emit("novoPedido", p);
  }
  cancelarPedido() {
    console.log("Cancelado:", this.pedido);
    this.emit("cancelPedido", this.pedido);
  }
}

module.exports = Pedido;
