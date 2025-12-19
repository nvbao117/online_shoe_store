export function renderChart(res) {
    const container = document.getElementById("chartContainer");
    container.innerHTML = "";

    const { labels, values } = res;
    const max = Math.max(...values, 1);

    const MAX_BAR_HEIGHT = 260; // < container - padding

    values.forEach((val, index) => {
        const bar = document.createElement("div");
        bar.className = "chart-bar ml-5 flex flex-col items-center flex-none w-10";

        // số phía trên
        const valueLabel = document.createElement("span");
        valueLabel.className = "text-xs text-slate-700 mb-2 font-semibold";
        valueLabel.innerText = val;

        // cột
        const inner = document.createElement("div");
        inner.style.height = (val / max * MAX_BAR_HEIGHT) + "px";
        inner.className =
            "w-full bg-gradient-to-t from-blue-500 to-blue-400 rounded-t-lg shadow-md transition-all duration-300";

        // nhãn dưới
        const dateLabel = document.createElement("span");
        dateLabel.className = "text-[11px] text-slate-600 mt-2 font-medium";
        dateLabel.innerText = labels[index];

        bar.appendChild(valueLabel);
        bar.appendChild(inner);
        bar.appendChild(dateLabel);

        container.appendChild(bar);
    });
}
