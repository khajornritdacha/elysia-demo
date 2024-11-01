-- CreateEnum
CREATE TYPE "colors" AS ENUM ('Cherry', 'Natural Ash', 'White Ash', 'Red Oak', 'Natural Oak', 'Walnut');

-- CreateTable
CREATE TABLE "accounts" (
    "user_id" SERIAL NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(50) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "created_on" TIMESTAMP(6) NOT NULL,
    "last_login" TIMESTAMP(6),

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customer_id" INTEGER NOT NULL,
    "customer_name" VARCHAR(25) NOT NULL,
    "customer_address" VARCHAR(30),
    "city" VARCHAR(20),
    "postal_code" VARCHAR(9),

    CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "order_line" (
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "ordered_quantity" INTEGER,

    CONSTRAINT "order_line_pk" PRIMARY KEY ("order_id","product_id")
);

-- CreateTable
CREATE TABLE "ordert" (
    "order_id" INTEGER NOT NULL,
    "order_date" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "customer_id" INTEGER NOT NULL,

    CONSTRAINT "order_pk" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "product" (
    "product_id" INTEGER NOT NULL,
    "product_description" VARCHAR(50),
    "product_finish" "colors",
    "standard_price" DECIMAL(8,2),

    CONSTRAINT "product_pk" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "user" (
    "user_id" SERIAL NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(50) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "created_on" TIMESTAMP(6) NOT NULL,
    "last_login" TIMESTAMP(6),

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_username_key" ON "accounts"("username");

-- CreateIndex
CREATE UNIQUE INDEX "accounts_email_key" ON "accounts"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "order_line" ADD CONSTRAINT "order_line_fk1" FOREIGN KEY ("order_id") REFERENCES "ordert"("order_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "order_line" ADD CONSTRAINT "order_line_fk2" FOREIGN KEY ("product_id") REFERENCES "product"("product_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ordert" ADD CONSTRAINT "order_fk" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
