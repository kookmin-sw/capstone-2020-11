import { Component } from '@angular/core';
import { ActionSheetController } from '@ionic/angular';

@Component({
  selector: 'app-tab2',
  templateUrl: 'list.page.html',
  styleUrls: ['list.page.scss']
})
export class ListPage {

  floorList: any;
  floorNum: string;
  floorData: any;

  constructor(public actionSheetController: ActionSheetController) {
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
          this.floorNum = '4';
          this.floorData = json.floorData[this.floorNum];
          console.log('test\n', this.floorData);
        });
  }

  test() {
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

    const actionSheet = await this.actionSheetController.create({
      header: '미래관',
      buttons: buttonList
    });
    await actionSheet.present();
  }
}
