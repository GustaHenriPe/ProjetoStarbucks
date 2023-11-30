/*
  Warnings:

  - You are about to drop the column `descricao` on the `pedidos` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `pedidos` table. All the data in the column will be lost.
  - You are about to drop the column `preco` on the `pedidos` table. All the data in the column will be lost.
  - You are about to drop the column `quantidade` on the `pedidos` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "pedidos" DROP COLUMN "descricao",
DROP COLUMN "nome",
DROP COLUMN "preco",
DROP COLUMN "quantidade";

-- CreateTable
CREATE TABLE "produtos" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "preco" DECIMAL(65,30) NOT NULL,
    "descricao" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "produtos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itens_pedidos" (
    "Id" SERIAL NOT NULL,
    "ID_Pedido" TEXT NOT NULL,
    "ID_Produto" INTEGER NOT NULL,
    "Quantidade" INTEGER NOT NULL,

    CONSTRAINT "itens_pedidos_pkey" PRIMARY KEY ("Id")
);

-- AddForeignKey
ALTER TABLE "itens_pedidos" ADD CONSTRAINT "itens_pedidos_ID_Pedido_fkey" FOREIGN KEY ("ID_Pedido") REFERENCES "pedidos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itens_pedidos" ADD CONSTRAINT "itens_pedidos_ID_Produto_fkey" FOREIGN KEY ("ID_Produto") REFERENCES "produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
