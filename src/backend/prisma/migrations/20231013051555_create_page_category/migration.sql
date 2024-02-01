-- CreateTable
CREATE TABLE "PageCategory" (
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER NOT NULL DEFAULT 0,
    "alias" VARCHAR(255),
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PageCategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PageCategory_alias_key" ON "PageCategory"("alias");

-- CreateIndex
CREATE UNIQUE INDEX "PageCategory_title_key" ON "PageCategory"("title");
