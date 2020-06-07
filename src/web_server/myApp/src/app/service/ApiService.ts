import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';


@Injectable({
    providedIn: 'root'
})
export class ApiService {

    // server ip
    // tslint:disable-next-line:variable-name
    // base_ip = 'http://localhost';
    // tslint:disable-next-line:variable-name
    base_ip = 'http://15.164.164.49';

    // server port
    // tslint:disable-next-line:variable-name
    base_port = '3000';

    // API path
    // tslint:disable-next-line:variable-name
    base_path = `${this.base_ip}:${this.base_port}`;

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

    getRunning(floorNum): Observable<any> {
        return this.http
            .get<any>(`${this.base_path}/running/${floorNum}`)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }

    updateRunning(floorNum, goalState, icon, name): Observable<any> {
        const data = {
            isRunning: 1,
            goalState: goalState.toString(),
            icon: icon.toString(),
            name: name.toString()
        };
        return this.http
            .put<any>(`${this.base_path}/running/${floorNum}`, JSON.stringify(data), this.httpOptions)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }

    getFloorList(): Observable<any> {
        return this.http
            .get<any>(`${this.base_path}/floorList`)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }

    getFloorData(): Observable<any> {
        return this.http
            .get<any>(`${this.base_path}/floorData`)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }

    testTimeCheck(): Observable<any> {
        return this.http
            .get<any>(`http://15.164.164.49:3000/running`)
            .pipe(
                retry(2),
                catchError(this.handleError)
            );
    }
}


