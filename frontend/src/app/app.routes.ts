import { Routes } from '@angular/router';
import { LoginComponent } from './features/login/login.component';
import { SignupComponent } from './features/signup/signup.component';
import { ProfileComponent } from './features/profile/profile.component';

export const routes: Routes = [
	{  path: 'profile', loadComponent: () => import('./features/profile/profile.component').then(m => m.ProfileComponent)	},
	{ path: 'login', component: LoginComponent },
	{ path: 'signup', component: SignupComponent },
  { path: 'profile', component: ProfileComponent },
  { path: '', redirectTo: '/login', pathMatch: 'full' } // Default to login
];
