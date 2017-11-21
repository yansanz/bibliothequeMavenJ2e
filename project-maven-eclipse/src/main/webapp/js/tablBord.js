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

var requete;

function rechercheDonnee(){
	var donnees = document.getElementById("donnees");
	var url = "search?valeur=" +escape(donnees.value);
	if (window.XMLHttpRequest){
		requete = new XMLHttpRequest();
		requete.open("GET",url,true);
		requete.onreadystatechange = majIHM;
		requete.send(null);
	}else if (window.ActiveXObject){
		requete = new ActiveXObject("Microsoft.XMLHTTP");
		if(requete){
			requete.open("GET",url,true);
			requete.onreadystatechange = majIHM;
			requete.send();
		}
		}else{
			alert("le navigateur ne supporte pas cette techno")
		
	}
}
function majIHM(){
	
	if (requete.readyState == 4) {
		
		if (requete.status == 200) {
			var reponse = JSON.parse(requete.responseText);
			var select = document.getElementById('tableSub');
			if (reponse.length !=0){
				document.getElementById('iTable').style.visibility ='hidden';
				select.innerHTML="";
			for (var i = 0; i <reponse.length; i++){
			
			      var opt = document.createElement('tr');
			      var tdLastName = document.createElement('td');
			      var tdFirstName =   document.createElement('td');
			      var tdEmprunt   = document.createElement('td');
			     
			      var radioButton ='<td><input type="radio" name="choixSub" value="'+reponse[i].id+'" onchange="getId(reponse[i].id)"></td>';
			      var tdRadioButton = document.createElement('radioButton')
			      opt.appendChild(tdRadioButton);
			      opt.appendChild(tdLastName);
			      tdLastName.innerHTML = reponse[i].lastName;
		      
		      opt.appendChild(tdFirstName);
		      tdFirstName.innerHTML = reponse[i].fisrtName;
		      opt.appendChild(tdEmprunt);
		      tdEmprunt.innerHTML = reponse[i].nbrEmprunt;
			      console.log("boucle");
			      opt.value = reponse[i].id;
				 select.appendChild(opt);

				 
			}
			}else{
				document.getElementById('iTable').style.visibility ='visible';
			}
		} else {
		alert('Une erreur est survenue lors de la mise à jour de la page.'+
		'\n\nCode retour = '+requete.statusText);   
		}
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
	document.getElementById('txtCibl13').value = nb;
}