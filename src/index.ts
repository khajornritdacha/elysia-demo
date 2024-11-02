import { swagger } from "@elysiajs/swagger";
import { Elysia } from "elysia";
import { accounts } from "./module/account/account.controller";

const app = new Elysia()
  .use(swagger())
  .use(accounts)
  .get("/", () => "Hello Elysia")
  .listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
