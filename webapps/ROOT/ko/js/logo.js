const canvas = document.querySelector('.logo');
const ctx = canvas.getContext('2d');
let playerRun = new Image();
playerRun.src = "../others/pngs/run1.png";
let timer = 0;
class Player{
    /**
     * 
     * @param {x} x x좌표 
     * @param {*} y y좌표
     * @param {*} w 넓이 width
     * @param {*} h 높이 height
     */
 constructor (x, y , w, h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

 }
 Draw(){
    if(timer%60==0){
        playerRun.src="../others/pngs/run2.png";
    }else if(timer%30==0){
        playerRun.src="../others/pngs/run1.png";
    }
    	ctx.drawImage(playerRun,this.x,this.y, this.w, this.h);
 }
}
let player = new Player(0,0,canvas.width,canvas.height);

function play(){
    requestAnimationFrame(play);
    ctx.clearRect(0, 0, canvas.width,canvas.height);
    player.Draw();
    timer++;
    if(timer===60){
        timer=0;
    }
}
play();