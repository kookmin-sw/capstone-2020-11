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

  private urlFloor: string;

  private floorList: Array<string>;
  private floorNum: string;
  private floorData: any;
  private totalData: any;

  private runningData: any;
  private interval: any;

  constructor(public actionSheetController: ActionSheetController,
              public route: ActivatedRoute,
              public alertController: AlertController,
              public apiService: ApiService) {
    this.floorNum = route.snapshot.params.floorNum;
    if (this.floorNum == null) {
      this.floorNum = '4';
    }
    this.urlFloor = this.floorNum;
    this.runningData = {
      isRunning: 2
    };
    this.readData();
  }

  alert(floor: object) {
    if (this.runningData.isRunning === 1) {
      this.presentAlert();
    } else {
      const sameFloor = (this.urlFloor === this.floorNum);
      // @ts-ignore
      const name = sameFloor ? floor.name : floor.subName;
      // @ts-ignore
      const goal = sameFloor ? floor.goal : floor.subGoal;
      // @ts-ignore
      const icon = sameFloor ? floor.icon : 'arrow-forward-circle-outline';
      const msg = sameFloor ? `해당 장소로 이동하시겠습니까?` : `해당 장소로 이동을 위해<br/><b>${this.urlFloor}층 ${name}</b>까지 이동하겠습니다.<br/>해당 장소로 이동하시겠습니까?`;
      this.presentConfirm(name, goal, icon, msg);
    }
  }


  readData() {
    this.apiService.getFloorList().subscribe((floorList) => {
      this.floorList = floorList;
      this.apiService.getFloorData().subscribe((floorData) => {
        this.totalData = floorData;
        this.floorData = this.totalData[this.floorNum];
      });

      // 잘못된 경로일시 4층 redirect
      if (!this.floorList.includes(this.urlFloor)) {
        location.href = '/tabs/list/4';
        return;
      }

      // tslint:disable-next-line:no-conditional-assignment
      for (let i = 0, iter; iter = this.floorList[i]; ++i) {
        this.apiService.getRunning(iter).subscribe((data) => {
          if (this.urlFloor === iter) {
            this.runningData = data;
          }
        });
      }
      this.timer();
    });
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
      }
    });

    const actionSheet = await this.actionSheetController.create({
      header: '미래관',
      mode: 'ios',
      buttons: buttonList
    });
    await actionSheet.present();
  }

  async presentAlert() {
    const alert = await this.alertController.create({
      message: '${this.urlFloor}층은 이미 주행중입니다.<br/>잠시 후 다시 이용해 주시기 바랍니다.',
      mode: 'ios',
      buttons: [
        {
          text: '확인',
          handler: () => {
          }
        }
      ]
    });

    await alert.present();
  }

  async presentConfirm(name, goal, icon, msg) {
    const alert = await this.alertController.create({
      header: `${this.floorNum}층 ${name}`,
      message: msg,
      mode: 'ios',
      buttons: [
        {
          text: '취소',
          role: 'cancel',
          handler: () => {
          }
        },
        {
          text: '확인',
          handler: () => {
            this.apiService.getRunning(this.urlFloor).subscribe((data) => {
              if (data.isRunning === 0) {
                this.runningData = {
                  isRunning: 1,
                  icon,
                  name
                };
                this.apiService.updateRunning(this.urlFloor, goal, icon, name).subscribe((d) => {
                  // this.timer();
                  this.floorNum = this.urlFloor;
                });
              } else {
                this.presentAlert();
              }
            });
          }
        }
      ]
    });

    await alert.present();
  }

  private timer() {
    this.interval = setInterval(() => {
      this.apiService.getRunning(this.urlFloor).subscribe((data) => {
        this.runningData = data;
        if (this.runningData.isRunning !== 0) {
          this.floorNum = this.urlFloor;
        }
      });
    }, 1000);
  }
}
