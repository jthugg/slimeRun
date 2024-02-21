// 캔버스 불러옴
const canvas = document.querySelector('#game');
canvas.width = window.innerWidth - 1;
canvas.height = window.innerHeight - 1;
const ctx = canvas.getContext('2d');
let run = false;
let backBGMRun=false;

/**
 * @param 점수
 */
let score; 
let scoreText;
/**
 * @param 최고점수
 */
let highscore = document.score.HS.value;
let highscoreText;
/**
 * @param 플레이어
 */
let player;
/**
 * @param 중력
 */
let gravity;
 /**
  * @param 장애물
  */
let obstacles = [];

let gameSpeed;
//키보드 입력
let keys = {};
// 플레이어 이미지
let playerRun = new Image();
playerRun.src = "./img/run1.png";

let playerDead = new Image();
playerDead.src = "./img/dead.png";

//장애물 이미지
let obstacleImg = new Image();
obstacleImg.src = "./img/Obstacle.png";

let obstacleImg2 = new Image();
obstacleImg2.src = "./img/Obstacle2.png";


let animation1;
let animation2;
let animation3;

//배경음악
let backBGM = new Audio();
backBGM.src = "./bgm/backBgm.mp3"
backBGM.loop = true;

//점프 BGM
let JumpBGM = new Audio();
JumpBGM.src="./bgm/Jump.mp3";
//Event Listeners
document.addEventListener('keydown', (evt) => {
   keys[evt.code] = true;
})
document.addEventListener('keyup', (evt) => {
   keys[evt.code] = false;
})

class Player{
   /**
    * 
    * @param {x} x x좌표 
    * @param {*} y y좌표
    * @param {*} w 넓이 width
    * @param {*} h 높이 height
    * @param {*} c 색상
    */
   constructor (x, y , w, h, c) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.c = c;

      this.dy = 0;
      this.jumpForce= canvas.height*3/100;
      this.originalHeight = h;
      this.grounded = false;
      this.jumpTimer = 0;
   }

   Animate() {
      // Jump // space바 누를 시 점프
      if(keys['Space'] || keys['KeyW']) {
         this.Jump();
      }
      else{
         this.jumpTimer = 0;
      }
   
      //아래 화살표 누를 시 숙임
      if(keys['ArrowDown'] || keys['KeyS']) {
         this.h = this.originalHeight / 2;
      }
      else{
         this.h = this.originalHeight;
      }
   
      this.y += this.dy;
   
      //Gravity 중력.
      if(this.y + this.h < canvas.height) {
         this.dy += gravity;
         this.grounded = false;
      }
      else {
         this.dy = 0;
         this.grounded = true;
         this.y = canvas.height - this. h;
      }
   
      this.Draw();
   }
   Jump() {
      if(this.grounded && this.jumpTimer == 0) {
         JumpBGM.play();
         this.jumpTimer = 1;
         this.dy = -this.jumpForce;
      }
      else if( this.jumpTimer > 0 && this.jumpTimer< canvas.height*1/100) {
         this.jumpTimer++;
         this.dy = -1 * (this.jumpForce + (this.jumpTimer/ 50));
      }
   }
   Draw() {
      //히트박스 만큼 박스 생성
      //ctx.beginPath();
      // ctx.fillStyle = this.c;
      // ctx.fillRect(this.x, this.y, this.w, this.h);
      //ctx.closePath();
   
      //점프 시 다른 이미지
      if(keys['Space'] || keys['KeyW']) {
         playerRun.src = "./img/jump.png";
      }
      else if(keys['ArrowDown'] || keys['KeyS']) {
         playerRun.src = "./img/sliding.png";
      }
      else {
         if(score%30==0) {
            playerRun.src="./img/run2.png";
         }
         else if(score%15==0) {
            playerRun.src="./img/run1.png";
         }
      }
      ctx.drawImage(playerRun,this.x,this.y, this.w, this.h);
   }
   Dead() {
      this.h = this.originalHeight / 2;
      this.y = canvas.height - this.h;
      ctx.drawImage(playerDead,this.x,this.y,this.w,this.h);
   }
}

class Obstacles{
    constructor(x,y,w,h,c,type){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
        this.type = type;
        this.dx = -gameSpeed;
    }

    Update () {
        this.x += this.dx;
        this.Draw();
        this.dx=-gameSpeed;

    }

    Draw () {
      //히트박스 만큼 박스 생성
        // ctx.beginPath();
        // ctx.fillStyle = this.c;
        // ctx.fillRect(this.x, this.y, this.w, this.h);
        // ctx.closePath();

        //type=== 1 이면 위에 장애물.
        if(this.type===1){
            obstacleImg.src="./img/Obstacle2.png";
        }else{
            obstacleImg.src = "./img/Obstacle.png";
         }
         ctx.drawImage(obstacleImg,this.x,this.y, this.w, this.h);
    }
}
// Game Functions
function SpawnObstacle() {
    let size = randomIntRange(7, 12);
    let type = randomIntRange(0, 1);

    let canW = canvas.width*size/100; // 캔버스의 전체 넓이에서 size 의 퍼센트를 구함.
    let canH = canvas.height*size/100; // size가 10 이면 10% 

    let obstacle = new Obstacles(canvas.width + canW, canvas.height - canH, canW, canH, 'blue',type);

    if(type == 1){
        obstacle.y -= player.originalHeight -10;
    }
    obstacles.push(obstacle);
}

class Text {
    /**
     * 
     * @param {t} text 텍스트 
     * @param {x} x 표시할 x 좌표 
     * @param {y} y 표시할 y 좌표
     * @param {a} align 위치. (left, center, right)
     * @param {c} color 색상
     * @param {s} size 크기
     */
    constructor(t, x, y, a, c, s){
        this.t = t;
        this.x = x;
        this.y = y;
        this.a = a;
        this.c = c;
        this.s = s;
    }

    Draw(){
        ctx.beginPath();
        ctx.fillStyle = this.c;
        ctx.font = this.s + "px sans-serif";
        ctx.textAlign = this.a;
        ctx.fillText(this.t, this.x, this.y);
        ctx.closePath();
    }
}

// SpawnObstacle();

function randomIntRange(min, max){
    return Math.round(Math.random() * (max - min) + min);
}

const backIMG = new Image();
backIMG.src = "./img/backImg.png";
class backgroundImg {
    constructor(x, y, w, h){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }
    Draw(){
        ctx.drawImage(backIMG,this.x,this.y,this.w,this.h);
        //   console.log(backIMG);
    }
}

//파라미터 받아옴.
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

// 배경 화면 초기 좌표. x , y, width, height
let backImg = new backgroundImg(0, 0, canvas.width, canvas.height);
let backImg2 = new backgroundImg(backImg.x+canvas.width, 0,canvas.width,canvas.height);

/**
 * 배경화면 무한루프
 */
function drawBackImg() {
  
    backImg.Draw(); 
    backImg2.Draw();
    backImg.x = backImg.x-gameSpeed;
    backImg2.x = backImg2.x - gameSpeed;
    if(backImg.x <0 ){
      //  console.log("backImg의 x 는 0 보다 작음 : "+ backImg.x);
        backImg2.x = backImg.x+canvas.width;
    }
    if(backImg2.x < 0){
      //  console.log("backIMg2의 x 는 0 보다 작음.: "+backImg2.x);
        backImg.x = backImg2.x+canvas.width;
        backImg.Draw();
    }
}
function start () {

    ctx.font = "20px sans-serif";
    
    
    gameSpeed = 6;
    gravity = 1;
    
    score = 0;
    
    
   /* 
    // 최고점수 가져옴
    if(localStorage.getItem('highscore')){
        highscore = localStorage.getItem('highscore');
    }
    */
    player = new Player(25,0,canvas.width*10/100,canvas.height*10/100,"red");
    
    scoreText = new Text("Score: "+ score, 25, 25, "left", "#212121", "20");
    highscoreText = new Text("Highscore: " + highscore, canvas.width -25, 25,"right" ,"#212121", "20");
    SpawnObstacle();
    animation1 = requestAnimationFrame(Update);
}

let initialSpawnTimer = 250;
let spawnTimer = initialSpawnTimer;
function Update(){
    animation2 = requestAnimationFrame(Update); // 프레임마다 이 함수 실행.
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    drawBackImg();
    //플레이어 캐릭터 생성
    player.Animate();
    
    
    spawnTimer--;
    if(spawnTimer <= 0){
        SpawnObstacle();
        spawnTimer = initialSpawnTimer - gameSpeed * 8;
        
        if(spawnTimer < 60) {
            spawnTimer = 60;
        }
    }
    
    //Spawn Enemies
    for (let i = 0; i <obstacles.length; i++){
        let o = obstacles[i];
        
        //왼쪽 끝으로 이동하면 삭제
        if(o.x + o.w < 0) {
            obstacles.splice(i, 1);
        }
        
        //game over
        if(
            player.x < o.x + o.w &&
            player.x + player.w > o.x &&
            player.y < o.y+ o.h &&
            player.y + player.h > o.y
            ){
                GameOver();
            }
            
            o.Update();
        }
        
        
        score++;
        scoreText.t = "Score: " + score;
        scoreText.Draw();
        
        // 최고점수 갱신
        if(score > highscore) {
            highscore = score;
             highscoreText.t = "Highscore : " + highscore;
    }
    
    highscoreText.Draw();

    gameSpeed += 0.003;
    
}

//임시 메뉴

function menu(){
    const cw = canvas.width / 2;
    const ch = canvas.height / 2;
    let text = "게임을 시작하려면 아무 키나 눌러주세요."
    const textWidth = ctx.measureText(text).width;
    ctx.beginPath();
    ctx.fillStyle = "#212121";
    ctx.font = 25 + "px sans-serif";
    ctx.textAlign = "center"; 
    ctx.fillText(text, cw-(textWidth/2) , ch); // text , x , y
    ctx.closePath();
}

//game over 메뉴
function GameOver(){
    obstacles = [];
   // score = 0;
    spawnTimer = initialSpawnTimer;
    gameSpeed = 6;

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBackImg();
    player.Dead();

   // window.localStorage.setItem('highscore', highscore);
    cancelAnimationFrame(animation1);
    cancelAnimationFrame(animation2);
   document.score.nSC.value = score;
   document.score.submit();
   /*
      let reStart = confirm("Game Over! 다시 시작 하시겠습니까?");
      if(reStart){
      start();
   }
   else{
   }*/

}
// 게임 로딩 후 menu() 실행.
document.addEventListener('DOMContentLoaded',()=>{
   menu();
   
})

//게임 시작.
document.addEventListener('keydown',()=>{
   if(run===false){
        if(keys['Space']){
         console.log(run);
           if(backBGMRun===false){
            backBGM.play();
            backBGMRun=true;
           }
            run= true;
            life=true;
            start();
        }
   }
})
//if(run===true){
//   document.addEventListener('keydown',()=>{
//        if(keys['Escape']){
//         menu();
//      }
//   })
//}