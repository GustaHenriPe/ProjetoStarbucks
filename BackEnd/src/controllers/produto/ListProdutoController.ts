import { Request, Response } from "express";
import { prismaClient } from "../../database/prismaClient";

export class ListProdutoController {
  public async handle(req: Request, res: Response) {
    try {
      const produtos = await prismaClient.produto.findMany();
      return res.status(200).json(produtos);
    } catch (error) {
      console.error("Erro ao listar os produtos:", error);
      return res.status(500).json({ erro: "Erro interno do servidor" });
    }
  }
}