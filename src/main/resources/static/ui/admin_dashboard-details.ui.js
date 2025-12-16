export function renderChart(res) {
    const container = document.querySelector(".h-64.flex.items-end");
    container.innerHTML = ""; // xóa cũ

    const { labels, values } = res; // lấy dữ liệu từ res
    const max = Math.max(...values, 1); // tránh chia cho 0

    values.forEach((val, index) => {
        const bar = document.createElement("div");
        bar.classList.add("chart-bar", "flex", "flex-col", "items-center", "flex-1", "group");

        // Giá trị phía trên cột
        const valueLabel = document.createElement("span");
        valueLabel.className = "text-xs text-slate-600 mb-1 font-medium";
        valueLabel.innerText = val;

        // Cột
        const inner = document.createElement("div");
        inner.style.height = (val / max * 200) + "px";
        inner.className = "w-full bg-gradient-to-t from-blue-500 to-blue-400 rounded-t-lg shadow-md";

        // Ngày phía dưới cột
        const dateLabel = document.createElement("span");
        dateLabel.className = "text-xs text-slate-600 mt-1 font-medium";
        dateLabel.innerText = labels[index];

        // Thêm vào bar theo thứ tự: value -> cột -> ngày
        bar.appendChild(valueLabel);
        bar.appendChild(inner);
        bar.appendChild(dateLabel);

        container.appendChild(bar);
    });
}


