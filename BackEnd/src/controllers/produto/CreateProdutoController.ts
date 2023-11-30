import { Request, Response } from "express";
import { prismaClient } from "../../database/prismaClient";

export class CreateProdutoController {
  public async handle(req: Request, res: Response) {
    try {
      const { nome, preco, descricao, foto, estoque } = req.body;
      
      const novoProduto = await prismaClient.produto.create({
        data: { nome, preco, descricao, foto, estoque },
      });

      return res.status(201).json( novoProduto );
    } catch (error) {
      console.error("Erro ao criar o produto:", error);
      return res.status(500).json({ erro: "Erro interno do servidor" });
    }
  }
}
