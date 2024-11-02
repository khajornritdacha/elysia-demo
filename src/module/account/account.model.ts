import Elysia, { t } from "elysia";

export const AccountModel = new Elysia().model({
  "account.create": t.Object({
    email: t.String(),
    password: t.String(),
    username: t.String(),
    created_on: t.Optional(t.Date()),
  }),
  "account.create.response": t.Object({
    user_id: t.Number(),
    username: t.String(),
  }),
});
