function counter() {
	var p1 = document.getElementById("deathNum");
	var p2 = document.getElementById("allWaterUsed");
	var p3 = document.getElementById("safe");

	let num = parseInt(p1.innerText);
	let num2 = parseInt(p2.innerText);
	let num3 = parseInt(p3.innerText);

	num++;
	num2 += 1000;
	num3--;
	
	p1.innerText = num;
	p2.innerText = num2;
	p3.innerText = num3;

	setTimeout(counter, 2000);

	console.log("num after increment", num)
}