import { Prisma, PrismaClient } from "@prisma/client";

const mockAccountsData: Prisma.accountsCreateInput[] = [
  {
    email: "random1",
    password: "password",
    username: "random1",
    created_on: new Date(),
  },
];

const prisma = new PrismaClient();
async function main() {
  console.log("Start seeding...");
  const accounts = await prisma.accounts.createMany({
    data: mockAccountsData,
  });
  console.log("Created accounts: ", accounts);
}

main()
  .then(async (res) => {
    await prisma.$disconnect();
  })
  .catch(async (err) => {
    console.log(err);
    await prisma.$disconnect();
    process.exit(1);
  });
