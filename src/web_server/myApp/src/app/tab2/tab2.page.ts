import { Component } from '@angular/core';
import { ActionSheetController } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';
import { AlertController } from '@ionic/angular';
import { ApiService } from '../service/ApiService';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {

  private urlFloor: string;

  private floorList: any;
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
    console.log('ctor floorNum', this.floorNum);
    if (this.floorNum == null) {
      this.floorNum = '4';
    }
    this.urlFloor = this.floorNum;
    console.log('urlFloor', this.urlFloor);
    // this.isRunning = 1;
    this.runningData = {
      isRunning: 1
    };
    this.readData();
  }

  alert(floor: object) {
    console.log('alert & isRunning');
    if (this.runningData.isRunning === 1) {
      this.presentAlert();
    } else {
      // msg = '<string${msg}></string> 해당 장소로 이동하시겠습니까?';
      // confirm(msg);
      const sameFloor = this.urlFloor === this.floorNum;
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
    console.log('read_data');
    this.apiService.getFloorList().subscribe((floorList) => {
      console.log('json server floorList', floorList);
      this.floorList = floorList;
      this.apiService.getFloorData().subscribe((floorData) => {
        console.log('json server floorData', floorData);
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
        console.log(iter);
        this.apiService.getRunning(iter).subscribe((data) => {
          console.log('json server running', data);
          if (this.urlFloor === iter) {
            this.runningData = data;
            console.log('running data', this.runningData);
            if (this.runningData.isRunning !== 0) {
              console.log('readData start timer');
              this.timer();
            }
          }
        });
      }
    });
  }

  testScrollToTop() {
    document.querySelector('ion-content').scrollToTop(500);
  }

  async presentActionSheet() {
    const buttonList = [];
    // let idx = 0;
    // console.log(this.floorList);

    // tslint:disable-next-line:forin
    for (const iter of this.floorList) {
      // console.log('버튼', button);
      buttonList.push({
        text: String(iter + '층'),
        icon: 'arrow-redo-circle-outline',
        handler: () => {
          // console.log('click action', this.floorList[iter] + '\'s sheet!');
          // location.href = '/tabs/tab4/' + this.floorList[iter];
          // this.navCtrl.navigateForward('/tabs/tab4/' + this.floorList[iter] );
          this.floorNum = iter;
          this.floorData = this.totalData[this.floorNum];
        }
      });
      // idx += 1;
    }

    buttonList.push({
      text: '취소',
      icon: 'close',
      role: 'cancel',
      handler: () => {
        console.log('Cancel clicked');
      }
    });

    // console.log('버튼 리스트', buttonList);

    const actionSheet = await this.actionSheetController.create({
      header: '미래관',
      buttons: buttonList
    });
    await actionSheet.present();
  }

  async presentAlert() {
    const alert = await this.alertController.create({
      // header: '주행중 알림',
      // subHeader: 'Subtitle',
      message: `${this.urlFloor}층은 이미 주행중입니다.<br/>잠시 후 다시 이용해 주시기 바랍니다.`,
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

  async presentConfirm(name, goal, icon, msg) {
    const alert = await this.alertController.create({
      // header: '운행 여부',
      header: `${this.floorNum}층 ${name}`,
      // subHeader: 'confirm test',
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
            this.runningData = {
              isRunning: 1,
              icon,
              name
            };
            this.apiService.updateRunning(this.urlFloor, goal, icon, name).subscribe((d) => {
              this.timer();
            });
          }
        }
      ]
    });

    await alert.present();
  }

  private timer() {
    this.floorNum = this.urlFloor;
    console.log('timer floorNum', this.floorNum);
    this.interval = setInterval(() => {
      // document.querySelector('#page_list').setAttribute('class', 'page_list');
      const st = new Date().getTime();
      // const floorNumber = inputFloorNumber.toString();
      this.apiService.getRunning(this.urlFloor).subscribe((data) => {
        const et = new Date().getTime();
        console.log('interval get json server running data', data);
        // console.log('et :', et, ', st :', st);
        // console.log('using time :', (et - st));
        if (this.runningData.isRunning === 0) {
          console.log('interval runningData === 0');
          clearInterval(this.interval);
          return;
        }

        if (data.isRunning === 0) {
          console.log('clear interval');
          this.runningData = data;
          clearInterval(this.interval);
        } else {
          this.runningData.isRunning = data.isRunning;
        }
      });
    }, 1000);
  }

  timecheck() {
    let totTime = 0;
    for (let i = 0; i < 100; ++i) {
      const st = new Date();
      console.log('st :', st);
      this.apiService.testTimeCheck().subscribe((data) => {
        const et = new Date();
        console.log('et :', et, ', st :', st);
        console.log('time :', ( et.getTime() - st.getTime() ));
        totTime += (et.getTime() - st.getTime());
      });
    }
    console.log('totTime :', totTime);
  }
}
