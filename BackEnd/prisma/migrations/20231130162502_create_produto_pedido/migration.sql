/*
  Warnings:

  - You are about to drop the `itens_pedidos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "itens_pedidos" DROP CONSTRAINT "itens_pedidos_ID_Pedido_fkey";

-- DropForeignKey
ALTER TABLE "itens_pedidos" DROP CONSTRAINT "itens_pedidos_ID_Produto_fkey";

-- DropTable
DROP TABLE "itens_pedidos";

-- CreateTable
CREATE TABLE "produtos_pedidos" (
    "Id" SERIAL NOT NULL,
    "ID_Pedido" TEXT NOT NULL,
    "ID_Produto" INTEGER NOT NULL,
    "Quantidade" INTEGER NOT NULL,

    CONSTRAINT "produtos_pedidos_pkey" PRIMARY KEY ("Id")
);

-- AddForeignKey
ALTER TABLE "produtos_pedidos" ADD CONSTRAINT "produtos_pedidos_ID_Pedido_fkey" FOREIGN KEY ("ID_Pedido") REFERENCES "pedidos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "produtos_pedidos" ADD CONSTRAINT "produtos_pedidos_ID_Produto_fkey" FOREIGN KEY ("ID_Produto") REFERENCES "produtos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
