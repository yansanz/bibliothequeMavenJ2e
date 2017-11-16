document.getElementById('zonRech').style.visibility = "hidden";
document.getElementById('zonRechSub').style.visibility = "hidden";

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
	modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
function choixAdd(n) {
	if (n == 1) {
		document.getElementById('txtCibl7').value = "sub";
	} else {
		document.getElementById('txtCibl7').value = "book";
	}
	document.add.submit();

}

function rechAuteur() {
	var btnBoxAuteur = document.getElementById('boxA');
	var txtBox = document.getElementById("boxA").value;
	boxG.value = "";
	txtTitre.value = "";

}
function rechAuteurTexUp() {
	document.getElementById('boxA').value = "";
}
function popUpInfo2() {
	var popup = document.getElementById("myPopup2");
	popup.classList.toggle("show");
}
function rechAuteurUp() {
	document.getElementById('namAut').value = "";
	document.getElementById('prenAut').value = "";
	document.getElementById('agAut').value = "";
}
function modeBook() {
	document.getElementById('zonRech').style.visibility = "visible";
	document.getElementById('zonRechSub').style.visibility = "hidden";
}
function modeSub() {
	document.getElementById('zonRech').style.visibility = "hidden";
	document.getElementById('zonRechSub').style.visibility = "visible";
}
function rechTitre() {

	boxG.value = "";
	boxA.value = "";
}
function rechGenre() {
	boxA.value = "";
	txtTitre.value = "";
}
function getIsbn(isbn) {
	document.getElementById('txtCibl1').value = isbn;
	document.getElementById('txtCibl3').value = isbn;
	document.getElementById('txtCibl5').value = isbn;
}

function getId(id) {
	document.getElementById('txtCibl2').value = id;
	document.getElementById('txtCibl4').value = id;
	document.getElementById('txtCibl6').value = id;
}
function getIdCopy(nb) {
	document.getElementById('txtCibl1').value = nb;
	document.getElementById('txtCibl5').value = nb;
	document.getElementById('txtCibl7').value = nb;
	document.getElementById('txtCibl10').value = nb;
}