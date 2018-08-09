/**********************************************************************************
	Image Roll Over
***********************************************************************************/

function preload(imgObj,imgSrc) {
	if (document.images) {
		eval(imgObj+' = new Image()')
		eval(imgObj+'.src = "'+imgSrc+'"')
	}
}


function allHide() {

	LayerSH('sub01','hide');
	LayerSH('sub02','hide');
	LayerSH('sub03','hide');
	LayerSH('sub04','hide');
	LayerSH('sub05','hide');
	LayerSH('sub06','hide');
	LayerSH('sub07','hide');
	LayerSH('sub08','hide');

}

function oneShow(LayerName,Status) {
	allHide();
	LayerSH(LayerName,Status);
	
}

/**********************************************************************************
new 
***********************************************************************************/
