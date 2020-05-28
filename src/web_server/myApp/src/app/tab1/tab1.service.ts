import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError, map } from 'rxjs/operators';


@Injectable({
    providedIn: 'root'
})
export class ApiService {

    // API path
    // tslint:disable-next-line:variable-name
    base_path = 'http://localhost:3000';
    // base_path = 'http://localhost:3000/students';

    constructor(private http: HttpClient) { }

    // Http Options
    httpOptions = {
        headers: new HttpHeaders({
            'Content-Type': 'application/json'
        })
    };

    // Handle API errors
    handleError(error: HttpErrorResponse) {
        if (error.error instanceof ErrorEvent) {
            // A client-side or network error occurred. Handle it accordingly.
            console.error('An error occurred:', error.error.message);
        } else {
            // The backend returned an unsuccessful response code.
            // The response body may contain clues as to what went wrong,
            console.error(
                `Backend returned code ${error.status}, ` +
                `body was: ${error.error}`);
        }
        // return an observable with a user-facing error message
        return throwError(
            'Something bad happened; please try again later.');
    }


    getList(): Observable<any[]> {
        return this.http
            .get<any[]>(`${this.base_path}/floorData`)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }

    // Update item by id
    updateItem(id, item): Observable<any> {
        return this.http
            .put<any>('http://localhost:3000/testJsonData/' + id, JSON.stringify(item), this.httpOptions)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }
}


