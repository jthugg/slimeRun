let chk = true;
function instruction() {
/* let option = "width = 840, height = 600,scrollbars = no, location = no, status= no, toolbars = no "*/
		if(chk) {
			document.querySelector("#instrt").style = "display: inline-block;";
			chk = false;
		}
		else {
			document.querySelector("#instrt").style = "display: none;";
			chk = true;
		}
}