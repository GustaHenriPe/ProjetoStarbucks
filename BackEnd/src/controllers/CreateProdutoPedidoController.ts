import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export class CreateProdutoPedidoController {
  public async handle(req: Request, res: Response) {
    try {
      const { ID_Pedido, ID_Produto, Quantidade } = req.body;

      for (const item of req.body.itens) {
        const produto = await prismaClient.produto.findUnique({
          where: { id: item.produtoId },
        });

        if (!produto || produto.estoque < item.quantidade) {
          return res.status(400).json({
            erro: `Produto ${item.produtoId} não disponível em quantidade suficiente.`,
          });
        }
      }

      const novoProdutoPedido = await prismaClient.produtoPedido.create({
        data: { ID_Pedido, ID_Produto, Quantidade },
      });

      return res.status(201).json({ id: novoProdutoPedido.Id });
    } catch (error) {
      console.error("Erro ao adicionar produto ao pedido:", error);
      return res.status(500).json({ erro: "Erro interno do servidor" });
    }
  }
}
