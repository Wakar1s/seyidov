-- CreateTable
CREATE TABLE "MediaPageItemRealtion" (
    "id" SERIAL NOT NULL,
    "media_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MediaPageItemRealtion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MediaPageItemRealtion_media_id_item_id_key" ON "MediaPageItemRealtion"("media_id", "item_id");

-- AddForeignKey
ALTER TABLE "MediaPageItemRealtion" ADD CONSTRAINT "MediaPageItemRealtion_media_id_fkey" FOREIGN KEY ("media_id") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MediaPageItemRealtion" ADD CONSTRAINT "MediaPageItemRealtion_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "PageItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
