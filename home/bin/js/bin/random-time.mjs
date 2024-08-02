function minsec() {
	return Math.floor(Math.random() * 60);
}

const flag = process.argv[3];

const hours = ["9", "10", "11", "19", "20", "21"];

const allHours = Array.from({ length: 24 }, (_, i) => i);

const used = flag === "all" ? allHours : hours;

const index = Math.floor(used.length * Math.random());

console.log(
	`${leftPad(used[index])}:${leftPad(minsec())}:${leftPad(minsec())}`,
);

function leftPad(number) {
	const num = Number(number);

	if (!(typeof num !== number) || Number.isNaN(num) || !Number.isInteger(num))
		throw new Error("Must be correct number");

	if (num < 10) return `0${num}`;

	return `${num}`;
}
