// export function renderChart(values) {
//     const container = document.querySelector(".h-64.flex.items-end");
//     container.innerHTML = ""; // xóa cũ
//
//     const max = Math.max(...values, 1); // tránh chia cho 0
//
//     values.forEach(val => {
//         const bar = document.createElement("div");
//         bar.classList.add("chart-bar", "flex", "flex-col", "items-center", "flex-1", "group");
//
//         const inner = document.createElement("div");
//         inner.style.height = (val / max * 200) + "px";
//         inner.className = "w-full bg-gradient-to-t from-blue-500 to-blue-400 rounded-t-lg shadow-md";
//
//         const label = document.createElement("span");
//         label.className = "text-xs text-slate-600 mt-2 font-medium";
//         label.innerText = val;
//
//         bar.appendChild(inner);
//         bar.appendChild(label);
//         container.appendChild(bar);
//     });
// }


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



// export function renderChart(res) {
//     const container = document.querySelector(".h-64.flex.items-end");
//     container.innerHTML = ""; // xóa cũ
//
//     const max = Math.max(...res.value, 1); // tránh chia cho 0
//
//     res.forEach((labels, val) => {
//         const bar = document.createElement("div");
//         // Giữ nguyên các class cho cột
//         bar.classList.add("chart-bar", "flex", "flex-col", "items-center", "flex-1", "group", "relative"); // Thêm 'relative' để định vị giá trị tuyệt đối nếu cần
//
//         // 1. Tạo phần tử hiển thị giá trị
//         const valueDisplay = document.createElement("span");
//         // Class CSS để định dạng: font đậm, màu nổi bật
//         valueDisplay.className = "text-xs font-bold text-blue-700 mb-1 opacity-0 group-hover:opacity-100 transition-opacity absolute bottom-full pb-1"; // Đặt ở vị trí 'bottom-full' và ẩn khi không hover
//         // Hoặc sử dụng định vị tương đối, đặt ngay trước 'inner'
//         valueDisplay.className = "text-sm font-bold text-blue-700 mb-1";
//         // Gán giá trị
//         valueDisplay.innerText = val.toLocaleString('vi-VN'); // Sử dụng toLocaleString để định dạng số (ví dụ: 1.000.000)
//
//         const inner = document.createElement("div");
//         inner.style.height = (val / max * 200) + "px";
//         // Thêm 'relative' để dễ dàng đặt tooltip (nếu muốn)
//         inner.className = "w-full bg-gradient-to-t from-blue-500 to-blue-400 rounded-t-lg shadow-md";
//
//         const label = document.createElement("span");
//         label.className = "text-xs text-slate-600 mt-2 font-medium";
//         label.innerText = labels;
//
//         // 2. Chèn vào cấu trúc
//         bar.appendChild(valueDisplay); // Chèn giá trị lên đầu tiên
//         bar.appendChild(inner);
//         bar.appendChild(label);
//         container.appendChild(bar);
//     });
// }