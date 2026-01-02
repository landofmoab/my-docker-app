import { HttpInterceptorFn } from '@angular/common/http';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const token = localStorage.getItem('auth_token');

  // If we have a token, clone the request and add the Header
  if (token) {
    const authReq = req.clone({
      setHeaders: {
        Authorization: token
      }
    });
    return next(authReq);
  }

  // If no token, just pass the original request through
  return next(req);
};