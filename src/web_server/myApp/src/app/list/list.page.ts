import { Component } from '@angular/core';
import { ActionSheetController } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';
import { AlertController } from '@ionic/angular';
import { ApiService } from '../service/ApiService';

@Component({
  selector: 'app-tab2',
  templateUrl: 'list.page.html',
  styleUrls: ['list.page.scss']
})
export class ListPage {

  private floorList: any;
  private floorNum: string;
  private floorData: any;
  private totalData: any;

  private isRunning: number;
  private interval: any;

  constructor(public actionSheetController: ActionSheetController,
              public route: ActivatedRoute,
              public alertController: AlertController,
              public apiService: ApiService) {
    this.floorNum = route.snapshot.params.floorNum;
    if (this.floorNum == null || this.floorNum === undefined) {
      this.floorNum = '4';
    }
    this.isRunning = 1;
    this.readData();
  }

  alert(idx: number, msg: string) {
    if (this.isRunning === 1) {
      this.presentAlert();
    } else {
      this.presentConfirm(msg, '해당 장소로 이동하시겠습니까?');
    }
  }


  readData() {
    console.log('read_data');
    this.apiService.getFloorList().subscribe((floorList) => {
      console.log('json server floorList', floorList);
      this.floorList = floorList;
      this.apiService.getFloorData().subscribe((floorData) => {
        console.log('json server floorData', floorData);
        this.totalData = floorData;
        this.floorData = this.totalData[this.floorNum];
      });
    });

    this.apiService.getRunning().subscribe((data) => {
      console.log('json server running', data);
      this.isRunning = data.isRunning;
      if (this.isRunning === 1) {
        this.timer();
      }
    });
  }

  testScrollTop() {
    document.querySelector('ion-content').scrollToTop(500);
  }

  async presentActionSheet() {
    const buttonList = [];

    for (const iter of this.floorList) {
      buttonList.push({
        text: String(iter + '층'),
        icon: 'arrow-redo-circle-outline',
        handler: () => {
          this.floorNum = iter;
          this.floorData = this.totalData[this.floorNum];
        }
      });
    }

    buttonList.push({
      text: '취소',
      icon: 'close',
      role: 'cancel',
      handler: () => {
        console.log('Cancel clicked');
      }
    });

    const actionSheet = await this.actionSheetController.create({
      header: '미래관',
      buttons: buttonList
    });
    await actionSheet.present();
  }

  async presentAlert() {
    const alert = await this.alertController.create({
      message: '이미 주행중입니다.<br/>잠시 후 다시 이용해 주시기 바랍니다.',
      buttons: [
        {
          text: '확인',
          handler: () => {
            console.log('alert click');
          }
        }
      ]
    });

    await alert.present();
  }

  async presentConfirm(head, msg) {
    const alert = await this.alertController.create({
      header: head,
      message: msg,
      buttons: [
        {
          text: '취소',
          role: 'cancel',
          handler: () => {
            console.log('confirm cancel click');
          }
        },
        {
          text: '확인',
          handler: () => {
            console.log('confirm ok click');
            this.isRunning = 1;
            this.apiService.updateRunning(head).subscribe((d) => {
              this.timer();
            });
          }
        }
      ]
    });

    await alert.present();
  }

  private timer() {
    this.interval = setInterval(() => {
      this.apiService.getRunning().subscribe((data) => {
        console.log('interval get json server running data');
        if (this.isRunning === 0) {
          clearInterval(this.interval);
          return;
        }

        if (data.isRunning === 0) {
          console.log('clear interval');
          this.isRunning = 0;
          clearInterval(this.interval);
        }
      });
    }, 1000);
  }
}
