import { Prisma, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export type AccountCreateBody = Prisma.Args<
  typeof prisma.accounts,
  "create"
>["data"];

export abstract class AccountService {
  static async addAccount(accountBody: AccountCreateBody) {
    try {
      const account = await prisma.accounts.create({
        data: accountBody,
        select: {
          user_id: true,
          username: true,
        },
      });

      return account;
    } catch (err) {
      console.log(err);
      throw err;
    }
  }
}
