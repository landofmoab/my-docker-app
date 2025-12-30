import { Routes } from '@angular/router';

export const routes: Routes = [
	{
		path: 'profile',
		loadComponent: () => import('./features/profile/profile.component').then(m => m.ProfileComponent)
	}
];
