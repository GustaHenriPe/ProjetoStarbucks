import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

export class CreatePedidoController {
  public async handle(req: Request, res: Response) {
    try {
      
      const novoPedido = await prismaClient.pedido.create({
        data: {},
      });

      return res.status(201).json({ id: novoPedido.id });
    } catch (error) {
      console.error("Erro ao criar o pedido:", error);
      return res.status(500).json({ erro: "Erro interno do servidor" });
    }
  }
}
