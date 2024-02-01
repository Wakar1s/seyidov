-- CreateTable
CREATE TABLE "NewsItem" (
    "id" SERIAL NOT NULL,
    "alias" TEXT,
    "title" TEXT NOT NULL,
    "anonce" TEXT,
    "content" TEXT NOT NULL,
    "public_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "NewsItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsCategory" (
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER NOT NULL DEFAULT 0,
    "alias" TEXT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "NewsCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsRelation" (
    "id" SERIAL NOT NULL,
    "category_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "NewsRelation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MediaNewsItemRealtion" (
    "id" SERIAL NOT NULL,
    "media_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MediaNewsItemRealtion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NewsItem_alias_key" ON "NewsItem"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "NewsItem_title_key" ON "NewsItem"("title");

-- CreateIndex
CREATE UNIQUE INDEX "NewsCategory_alias_key" ON "NewsCategory"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "NewsCategory_title_key" ON "NewsCategory"("title");

-- CreateIndex
CREATE UNIQUE INDEX "NewsRelation_category_id_item_id_key" ON "NewsRelation"("category_id", "item_id");

-- CreateIndex
CREATE UNIQUE INDEX "MediaNewsItemRealtion_media_id_item_id_key" ON "MediaNewsItemRealtion"("media_id", "item_id");

-- AddForeignKey
ALTER TABLE "NewsRelation" ADD CONSTRAINT "NewsRelation_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "NewsCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewsRelation" ADD CONSTRAINT "NewsRelation_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "NewsItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MediaNewsItemRealtion" ADD CONSTRAINT "MediaNewsItemRealtion_media_id_fkey" FOREIGN KEY ("media_id") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MediaNewsItemRealtion" ADD CONSTRAINT "MediaNewsItemRealtion_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "NewsItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
