/*
  Warnings:

  - Added the required column `password` to the `wowza` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "wowza" ADD COLUMN     "password" VARCHAR(100) NOT NULL;
