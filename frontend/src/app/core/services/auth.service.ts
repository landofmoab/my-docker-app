import { Injectable, inject, signal } from '@angular/core';
import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { tap } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private http = inject(HttpClient);
  private readonly AUTH_TOKEN_KEY = 'auth_token';
  private readonly apiUrl = 'http://localhost:3000/api/v1';

  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    })
  };
  
  // A signal to track if the user is logged in across the app
  currentUser = signal<any>(null);

  login(credentials: any) {
    return this.http.post<any>(`${this.apiUrl}/login`, 
      { user: credentials }, // Devise expects params wrapped in "user"
      { ...this.httpOptions, observe: 'response' } // We need the full response to get headers
    ).pipe(
      tap((res: HttpResponse<any>) => {
        // Grab the 'Authorization' header (Bearer token)
        const token = res.headers.get('Authorization');
        if (token) {
          localStorage.setItem(this.AUTH_TOKEN_KEY, token);
          this.currentUser.set(res.body);
        }
      })
    );
  }

  getToken() {
    return localStorage.getItem(this.AUTH_TOKEN_KEY);
  }

  logout() {
    localStorage.removeItem(this.AUTH_TOKEN_KEY);
    this.currentUser.set(null);
  }

  register(user: any) {
    return this.http.post(`${this.apiUrl}/signup`, { user }, this.httpOptions);
  }
}