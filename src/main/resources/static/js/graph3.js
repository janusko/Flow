var userScript3 = (function() {

	const ctx = document.getElementById("myChart3").getContext("2d");


	const data = {
		labels: [
			'SOUTH AMERICA',
			'OCEANIA',
			'EUROPE',
			'NORTH AMERICA',
			'CENTRAL AMERICA',
			'AFRICA', 
			'ASIA',
		],
		datasets: [{
			label: 'RENEWALBLE FRESHWATER',
			data: [30428, 29225, 25389, 12537, 8397, 4135, 7110],
			backgroundColor: [
				'rgba(0, 210, 255, 0.2)',
				'rgba(237, 103, 135, 0.2)',
				'rgb(0, 102, 204, 0.2)',
				'rgb(201, 203, 207, 0.2)',
				'rgb(0,51, 102, 0.2)',
				'rgb(255, 153, 255, 0.2)',
				'rgb(102, 0, 102, 0.2)',
			]
		}]
	};

	const config = {
		type: 'polarArea',
		data: data,
		options: {}
	};

	const myChart3 = new Chart(ctx, config);
	console.log("array", labels, dataArray, "query", totalArray);

})(this);