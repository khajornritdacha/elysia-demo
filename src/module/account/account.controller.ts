import Elysia from 'elysia';
import { AccountModel } from './account.model';
import { AccountService } from './account.service';

export const accountsController = new Elysia({ prefix: 'accounts' })
	.use(AccountModel)
	.post(
		'/',
		async ({ body }) => {
			return await AccountService.addAccount({
				...body,
				created_on: new Date()
			});
		},
		{
			error(err) {
				console.log(err);
				return err;
			},
			body: 'account.create',
			response: 'account.create.response'
		}
	);
