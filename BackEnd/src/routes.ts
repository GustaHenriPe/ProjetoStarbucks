import { Router } from "express";
import { CreatePedidoController } from "./controllers/CreatePedidoController";
import { CreateProdutoController } from "./controllers/produto/CreateProdutoController";
import { CreateProdutoPedidoController } from "./controllers/CreateProdutoPedidoController";
import { ListProdutoController } from "./controllers/produto/ListProdutoController";

const router = Router();

const createPedido = new CreatePedidoController();

const createProduto = new CreateProdutoController();
const listProduto = new ListProdutoController();
const createProdutoPedido = new CreateProdutoPedidoController();

router.post("/pedido", createPedido.handle);

router.post("/produto", createProduto.handle);
router.get("/produto", listProduto.handle)

router.post("/produtoPedido", createProdutoPedido.handle);

export { router };
