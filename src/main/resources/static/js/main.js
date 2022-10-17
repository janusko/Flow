var userScript = (function() {

	const ctx = document.getElementById("myChart").getContext("2d");

	let totalArrayFromHTML = document.querySelector("#totalWater");

	let totalArray = totalArrayFromHTML.innerText;

	let delayed;

	let labels = [];

	const createLabel = () => {
		let flag = false;
		let num = 0;
		for (const eachLetter of totalArray) {

			if (eachLetter == "0" || eachLetter == "1" || eachLetter == "2" || eachLetter == "3" || eachLetter == "4" || eachLetter == "5" || eachLetter == "6" || eachLetter == "7" || eachLetter == "8" || eachLetter == "9") {
				flag = true;
			}
			if (flag && eachLetter == "[" || flag && eachLetter == "]" || flag && eachLetter == "," || flag && eachLetter == " ") {
				flag = false;
				num++
				labels.push(num);
			}
		}
	}

	let dataArray = [];

	const createData = () => {
		let flag = false;
		let num = "";
		for (const eachLetter of totalArray) {

			if (eachLetter == "0" || eachLetter == "1" || eachLetter == "2" || eachLetter == "3" || eachLetter == "4" || eachLetter == "5" || eachLetter == "6" || eachLetter == "7" || eachLetter == "8" || eachLetter == "9") {
				flag = true;
				num += eachLetter;
			}
			if (flag && eachLetter == "[" || flag && eachLetter == "]" || flag && eachLetter == "," || flag && eachLetter == " ") {
				flag = false;
				dataArray.push(num);
				num = "";
			}
		}
	}

	createLabel();
	createData();

	let gradient = ctx.createLinearGradient(0, 0, 0, 400);
	gradient.addColorStop(0, '#ff6384');
	gradient.addColorStop(1, "rgba(0, 210, 255, 0.1)");

	const data = {
		labels,
		datasets: [
			{
				label: 'My Water Consumption',
				backgroundColor: gradient,
				borderColor: 'rgb(255, 99, 132)',
				data: dataArray,
				fill: true,
				borderColor: "rgba(0, 210, 255, 0.3)",
				pointBackgroundColor: "rgba(180, 195, 199, 0.4)",
				tension: .2,
			}]
	};

	const config = {
		type: 'line',
		data: data,
		options: {

			animation: {
				onComplete: () => {
					delayed = true;
				},
				delay: (context) => {
					let delay = 0;
					if (context.type === "data" && context.mode === "default" && !delayed) {
						delay = context.dataIndex * 300 + context.datasetIndex * 100;
					}
					return delay;
				}
			},
			radius: 5,
			hitRadius: 30,
			hoverRadius: 12,
			responsive: true,
			scales: {
				y: {
					ticks: {
						callback: function(value) {
							return value + " liters ";
						},
					},
				},
			},
		},
	};

	const myChart = new Chart(ctx, config);
	console.log("array", labels, dataArray, "query", totalArray);

})(this);