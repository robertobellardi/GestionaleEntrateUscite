window.onload = function () {
	$("#inserisciEntrata").click(inserisciEntrata);
	$("#inserisciUscita").click(inserisciUscita);

	var d = new Date();
	var day = d.getDate() + "";
	var month = d.getMonth() + 1 + "";

	var data = d.getFullYear() + "-" + month.padStart(2, "0") + "-" + day.padStart(2, "0");

	$("#dataEntrata").attr("max", data);
	$("#dataUscita").attr("max", data);

	richiestaGraficoEntrate();
	richiestaGraficoUscite();
	richiestaConfrontoEntrateUscite();
}

function inserisciEntrata() {
	$(".msg").remove();

	var tipoentrata = $("#tipoentrata").val();
	var valoreentrata = $("#valoreentrata").val();
	var data = $("#dataEntrata").val();

	var ajax = $.post("richiestaInserimentoEntrate", {
		"tipoentrata": tipoentrata,
		"valoreentrata": valoreentrata,
		"data": data
	}, function (ajaxObj, status) {
		console.log("status richiesta inserisciEntrata: " + status);
	}).fail(function (ajaxO, ajaxStatus, ajaxObj) {
		console.log("Errore richiesta inserisciEntrata -> fail");
	}).done(function (ajaxO, ajaxStatus, ajaxObj) {
		if (ajaxO["response"] == "success") {
			successo("#inserisciEntrata");
			richiestaGraficoEntrate();
			richiestaConfrontoEntrateUscite();
		} else
			errore("#inserisciEntrata");
	});
}

function inserisciUscita() {
	$(".msg").remove();

	var spesa = $("#spesa").val();
	var prezzo = $("#prezzo").val();
	var data = $("#dataUscita").val();

	var ajax = $.post("richiestaInserimentoUscite", {
		"spesa": spesa,
		"prezzo": prezzo,
		"data": data
	}, function (ajaxObj, status) {
		console.log("status richiesta inserisciUscita: " + status);
	}).fail(function (ajaxO, ajaxStatus, ajaxObj) {
		console.log("Errore richiesta inserisciUscita -> fail");
	}).done(function (ajaxO, ajaxStatus, ajaxObj) {
		if (ajaxO["response"] == "success") {
			successo("#inserisciUscita");
			richiestaGraficoUscite();
			richiestaConfrontoEntrateUscite();
		} else
			errore("#inserisciUscita");
	});
}

function richiestaGraficoEntrate() {
	var ajax = $.post("richiestaCalcolaGraficoEntrate", {}, function (ajaxObj, status) {
		console.log("status richiesta richiestaGraficoEntrate: " + status);
	}).fail(function (ajaxO, ajaxStatus, ajaxObj) {
		console.log("Errore richiesta richiestaGraficoEntrate -> fail");
	}).done(function (ajaxO, ajaxStatus, ajaxObj) {
		if (ajaxO["entrate1"]) {
			creaGraficoEntrate(ajaxO);
		}
	});
}

function richiestaGraficoUscite() {
	var ajax = $.post("richiestaCalcolaGraficoUscite", {}, function (ajaxObj, status) {
		console.log("status richiesta richiestaGraficoUscite: " + status);
	}).fail(function (ajaxO, ajaxStatus, ajaxObj) {
		console.log("Errore richiesta richiestaGraficoUscite -> fail");
	}).done(function (ajaxO, ajaxStatus, ajaxObj) {
		if (ajaxO["uscite1"]) {
			$("#myChartUscite").remove()
			$("#graficoUscite").append('<canvas id="myChartUscite"></canvas>');
			creaGraficoUscite(ajaxO);
		}
	});
}

function richiestaConfrontoEntrateUscite() {
	var ajax = $.post("richiestaConfrontoEntrateUscite", {}, function (ajaxObj, status) {
		console.log("status richiesta richiestaConfrontoEntrateUscite: " + status);
	}).fail(function (ajaxO, ajaxStatus, ajaxObj) {
		console.log("Errore richiesta richiestaConfrontoEntrateUscite -> fail");
	}).done(function (ajaxO, ajaxStatus, ajaxObj) {
		if (ajaxO["confrontoEntrata1"] || ajaxO["confrontoUscita1"]) {
			$("#myChartConfronto").remove()
			$("#confEntrateUScite").append('<canvas id="myChartConfronto"></canvas>');
			creaGraficoConfrontoEntrateUscite(ajaxO);
		}
	});
}

function creaGraficoEntrate(array) {
	var mesi = ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"];
	var entrateTot = {};
	class objEntrate {
		constructor(mesi, anno) {
			this.id = "";
			this.anno = anno
			this.mesi = mesi;
			this.arrentrate = new Array(12);
			this.arrlabels = new Array(12);

			// Azzeramento array dati: sia i prezzi che le parole
			for (var j = 0; j < 12; j++) {
				this.arrentrate[j] = 0;
				this.arrlabels[j] = "";
			}
		}
	}
	var pos = -1;
	var anno = 0;
	var contAnno = [];

	for (var i = 0; array["entrate" + (i + 1)]; i++) {
		anno = Number((array["entrate" + (i + 1)].data).substring(0, 4));

		// Creazione oggetto entrate tot: 
		// al primo ciclo e quando cambia l'anno devo creare un nuovo oggetto entrata 
		// da aggiungere all'oggetto entrate tot
		if (!array["entrate" + (i)] || (array["entrate" + (i)] && anno != Number((array["entrate" + (i)].data).substring(0, 4)))) {
			contAnno.push(anno);
			entrateTot[anno] = new objEntrate(mesi, anno);
			entrateTot[anno].id = "myChartEntrate" + anno;
		}
		pos = Number((array["entrate" + (i + 1)].data).substring(0, 7).substring(5, 7));
		entrateTot[anno].arrentrate[pos - 1] += array["entrate" + (i + 1)].valore;
		entrateTot[anno].arrlabels[pos - 1] += array["entrate" + (i + 1)].tipo_entrata;
	}

	// Imposto come massimo numero dopo la virgola 2 cifre
	for (i = 0; i < contAnno.length; i++)
		for (var j = 0; j < 12; j++)
			entrateTot[contAnno[i]].arrentrate[j] = Number(entrateTot[contAnno[i]].arrentrate[j]).toFixed(2);

	var html = "";
	// Ciclo sul'oggetto che mi sono creato per ottenere un carosello di grafici
	for (i = 0; i < contAnno.length; i++) {
		$("#" + entrateTot[contAnno[i]].id).remove();
		html = "";
		if (i == 0)
			html += '<div class="carousel-item active"><canvas id="' +
			entrateTot[contAnno[i]].id +
			'"></canvas><span class="badge badge-dark badgeAnno">' +
			entrateTot[contAnno[i]].anno +
			'</span></div>';
		else
			html += '<div class="carousel-item"><canvas id="' +
			entrateTot[contAnno[i]].id +
			'"></canvas><span class="badge badge-dark badgeAnno">' +
			entrateTot[contAnno[i]].anno +
			'</span></div>';

		$("#carosellograficoEntrateLista").append(html);

		var ctx = $("#" + entrateTot[contAnno[i]].id);
		var myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: entrateTot[contAnno[i]].mesi,
				datasets: [{
					label: "Entrate in €",
					data: entrateTot[contAnno[i]].arrentrate,
					backgroundColor: random_rgba(),
					borderColor: random_rgba(),
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
	}
	$('#carosellograficoEntrate').carousel()
}

function creaGraficoUscite(array) {
	var mesi = ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"];
	var backgroundcolor = [random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
	];

	var bordercolor = [random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
		random_rgba(),
	];

	var arrspese = [12];
	var arrprezzo = [12];
	var pos = -1;

	for (var j = 0; j < 12; j++) {
		arrprezzo[j] = 0;
		arrspese[j] = "<ul>";
	}

	for (var i = 0; array["uscite" + (i + 1)]; i++) {
		pos = Number((array["uscite" + (i + 1)].data).substring(0, 7).substring(5, 7));
		arrspese[pos - 1] += "<li>" + array["uscite" + (i + 1)].spesa + " -> " + array["uscite" + (i + 1)].prezzo + " € </li>";
		arrprezzo[pos - 1] += array["uscite" + (i + 1)].prezzo;
	}

	for (var j = 0; j < 12; j++) {
		arrspese[j] += "</ul>";
		arrprezzo[j] = Number(arrprezzo[j]).toFixed(2);
	}

	var ctx = $("#myChartUscite");
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: mesi,
			datasets: [{
				label: "Spesa in €",
				data: arrprezzo,
				backgroundColor: backgroundcolor,
				borderColor: bordercolor,
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			}
		}
	});

	creaTooltip(arrspese, mesi);
}

function creaGraficoConfrontoEntrateUscite(array) {
	var mesi = ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"];

	var arrEntrate = [12];
	var arrUscite = [12];
	var entrateTotali = 0;
	var usciteTotali = 0;
	var pos = -1;

	for (var j = 0; j < 12; j++) {
		arrEntrate[j] = 0;
		arrUscite[j] = 0;
	}

	for (var i = 0; array["confrontoEntrata" + (i + 1)]; i++) {
		pos = Number((array["confrontoEntrata" + (i + 1)].data).substring(0, 7).substring(5, 7));
		arrEntrate[pos - 1] += array["confrontoEntrata" + (i + 1)].valore;
	}

	for (var k = i; array["confrontoUscita" + (k + 1)]; k++) {
		pos = Number((array["confrontoUscita" + (k + 1)].data).substring(0, 7).substring(5, 7));
		arrUscite[pos - 1] += Number(array["confrontoUscita" + (k + 1)].prezzo.toFixed(2));
	}

	for (var j = 0; j < 12; j++) {
		arrEntrate[j] = Number(arrEntrate[j]).toFixed(2);
		arrUscite[j] = Number(arrUscite[j]).toFixed(2);
	}

	for (var j = 0; j < 12; j++) {
		entrateTotali += Number(arrEntrate[j]);
		usciteTotali += Number(arrUscite[j]);
	}

	usciteTotali = usciteTotali.toFixed(2);

	var ctx = $("#myChartConfronto");
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: mesi,
			datasets: [{
					label: "Entrate in €",
					data: arrEntrate,
					backgroundColor: "rgba(2, 185, 2, 0.7)",
					borderColor: "rgba(0, 116, 0, 0.7)",
					borderWidth: 1
				},
				{
					label: "Uscite in €",
					data: arrUscite,
					backgroundColor: "rgba(216, 3, 3, 0.7)",
					borderColor: "rgba(153, 0, 0, 0.7)",
					borderWidth: 1
				}
			],
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			}
		}
	});

	creaResoconto("#resocontoEntrate", entrateTotali, "Guadagno potenziale: ");
	creaResoconto("#resocontoUscite", usciteTotali, "Totale delle spese: ");
	creaResoconto("#resocontoRealeRisparmi", entrateTotali - usciteTotali, "Guadagno reale: ");
}

function creaTooltip(spese, mesi) {
	var colori = ["primary", "primary", "primary", "warning", "warning", "danger", "danger", "danger", "warning", "warning", "info", "info", ]

	for (var i = 0; i < 12; i++) {
		$("#tooltip_mesi").children().remove("#" + mesi[i]);
	}

	for (var i = 0; i < 12; i++) {
		$("#tooltip_mesi").append('<button type="button" id="' + mesi[i] + '" class="btn btn-' + colori[i] + ' tool" data-toggle="tooltip" data-placement="top" title="' + spese[i] + '">' + mesi[i] + "</button>");
	}

	$('[data-toggle="tooltip"]').tooltip({
		'html': true
	});
}

function creaResoconto(id, cifra, label) {
	$(id).children().first().text("");
	$(id).children().first().text(label + cifra);
}

function successo(id) {
	$("#tipoentrata").val("");
	$("#valoreentrata").val("");
	$("#data").val("");

	$("#spesa").val("");
	$("#prezzo").val("");
	$("#dataUscita").val("");

	$(id).after("<h1 class='msg success'>Inserimento avvenuto con successo</h1>");
	$(".success").delay(3000).fadeOut("slow");
}

function errore(id) {
	$(id).after("<h1 class='msg error'>Errore durante l'inserimento</h1>");
}

function random_rgba() {
	var o = Math.round,
		r = Math.random,
		s = 255;
	return 'rgba(' + o(r() * s) + ',' + o(r() * s) + ',' + o(r() * s) + ',' + "0.7" + ')';
}