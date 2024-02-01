-- CreateTable
CREATE TABLE "PageItem" (
    "id" SERIAL NOT NULL,
    "alias" VARCHAR(255),
    "title" VARCHAR(255) NOT NULL,
    "anonce" TEXT,
    "content" TEXT NOT NULL,
    "public_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PageItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PageItem_alias_key" ON "PageItem"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "PageItem_title_key" ON "PageItem"("title");
