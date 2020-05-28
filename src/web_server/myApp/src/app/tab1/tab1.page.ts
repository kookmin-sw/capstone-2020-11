import { Component } from '@angular/core';
import { ApiService } from './tab1.service';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {

  constructor(private apiService: ApiService) {
    const test = {
      1 : ['2', '3', '4'],
      val : {
        test: 'sibal',
        test2: 'why this has red line??'
      }
    };
    console.log(test);

    // const floorData = this.apiService.testGetList();
    // const floorData2 = this.apiService.getList();
    // console.log('floorData', floorData);
    // console.log(floorData.subscribe(data => {
    //   console.log(data);
    // }));
    // tslint:disable-next-line:no-conditional-assignment
    // for (let i = 0, iter: any; iter = floorData[i]; ++i) {
    //   console.log(iter);
    // }
    // console.log('floorData2', floorData2);
    // floorData2.subscribe((data) => {
    //     console.log(data);
    // });
    // console.log('floorData2.data', floorData2['data']);
    //
    // const updateData = apiService.updateItem(1, {test_ionic: 'change!!!'});
    // updateData.subscribe((data) => {
    //   console.log(data);
    // });
  }

}
