-- AlterTable
ALTER TABLE "PageCategory" ALTER COLUMN "alias" SET DATA TYPE TEXT,
ALTER COLUMN "title" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "PageItem" ALTER COLUMN "alias" SET DATA TYPE TEXT,
ALTER COLUMN "title" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "PageRelation" (
    "id" SERIAL NOT NULL,
    "category_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PageRelation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PageRelation_category_id_item_id_key" ON "PageRelation"("category_id", "item_id");

-- AddForeignKey
ALTER TABLE "PageRelation" ADD CONSTRAINT "PageRelation_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "PageCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PageRelation" ADD CONSTRAINT "PageRelation_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "PageItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
