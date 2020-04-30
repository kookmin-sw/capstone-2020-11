import { Component } from '@angular/core';
import { ActionSheetController } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {

  floorList: any;
  floorNum: string;
  floorData: any;

  constructor(public actionSheetController: ActionSheetController,
              public route: ActivatedRoute,
              public navCtrl: NavController) {
    this.floorNum = route.snapshot.params.floorNum;
    console.log('ctor floorNum', this.floorNum);
    if (this.floorNum == null) {
      this.floorNum = '4';
    }
    this.readData();
  }

  alert(idx: number, msg: string) {
    if (idx % 2) {
      alert('이미 주행중입니다.\n' +
          '잠시 후 다시 이용해 주시기 바랍니다.');
    } else {
      msg += '해당 장소로 이동하시겠습니까?';
      confirm(msg);
    }
  }


  readData() {
    console.log('read_data');
    fetch('assets/data/floor.json').then(res => res.json())
        .then(json => {
          this.floorList = json.floorList;
          // this.floorNum = '4';
          this.floorData = json.floorData[this.floorNum];
          console.log('test\n', this.floorData);
        });
  }

  testScrollToTop() {
    document.querySelector('ion-content').scrollToTop(500);
  }

  async presentActionSheet() {
    const buttonList = [];
    let idx = 0;
    console.log(this.floorList);

    // tslint:disable-next-line:forin
    for (const iter in this.floorList) {
      // console.log('버튼', button);
      buttonList.push({
        text: String(this.floorList[iter] + '층'),
        icon: 'arrow-redo-circle-outline',
        handler: () => {
          console.log('click action', this.floorList[iter] + '\'s sheet!');
          // location.href = '/tabs/tab4/' + this.floorList[iter];
          this.navCtrl.navigateForward('/tabs/tab4/' + this.floorList[iter] );
        }
      });
      idx += 1;
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
}
