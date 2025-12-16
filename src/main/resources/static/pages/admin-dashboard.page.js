import {fetchDashboardStats, fetchFilteredStatistics} from "../api/admin-dashboard.api.js";
import {renderSummary} from "../ui/admin_dashboard-summary.ui.js";
import {renderChart} from "../ui/admin_dashboard-details.ui.js";

const buttons = document.querySelectorAll(".time-btn");
const customFilter = document.getElementById("custom-filter");
const startDateInput = document.getElementById("start-date");
const endDateInput = document.getElementById("end-date");
const applyBtn = customFilter.querySelector("button");

function formatDate(date) {
    return date.toISOString().split("T")[0];
}

function getDateRange(type) {
    const today = new Date();
    let from, to;

    switch (type) {
        case "today":
            from = to = formatDate(today);
            break;

        case "7days":
            to = formatDate(today);
            from = formatDate(new Date(today.setDate(today.getDate() - 6)));
            break;

        case "1month":
            to = formatDate(today);
            from = formatDate(new Date(today.setMonth(today.getMonth() - 1)));
            break;

        case "1year":
            to = formatDate(today);
            from = formatDate(new Date(today.setFullYear(today.getFullYear() - 1)));
            break;
    }

    return {from, to};
}

buttons.forEach(btn => {
    btn.addEventListener("click", async () => {

        // active button
        buttons.forEach(b => {
            b.classList.remove("active")
            b.classList.add("hover:text-blue-600")
        });
        btn.classList.add("active",);
        btn.classList.remove("hover:text-blue-600");


        const value = btn.dataset.value;

        // nếu là bộ lọc tùy chỉnh
        if (value === "option-time") {
            customFilter.classList.remove("hidden");
            return;
        }

        // ngược lại → ẩn custom filter
        customFilter.classList.add("hidden");

        const {from, to} = getDateRange(value);
        const data = await fetchDashboardStats(from, to);
        renderSummary(data);
    });
});

// Khi nhấn "Áp dụng" bộ lọc tùy chỉnh
applyBtn.addEventListener("click", async () => {
    const from = startDateInput.value;
    const to = endDateInput.value;
    if (!from || !to) {
        alert("Vui lòng chọn đầy đủ ngày");
        return;
    }
    if (from > to) {
        alert("Từ ngày không được lớn hơn đến ngày");
        return;
    }
    const data = await fetchDashboardStats(from, to);
    renderSummary(data);
});

// Mặc định chọn "Hôm nay"
const todayBtn = document.querySelector('.time-btn[data-value="today"]');
if (todayBtn) {
    todayBtn.click();
}





// Detail filter
document.getElementById("filterBtn").addEventListener("click", async () => {
    const payload = {
        unit: document.getElementById("unitSelect").value.toUpperCase(),
        type: document.getElementById("typeSelect").value.toUpperCase(),
        fromDate: document.getElementById("fromDate").value,
        toDate: document.getElementById("toDate").value
    };

    const res = await fetchFilteredStatistics(payload);
    renderChart(res, payload.unit); // lấy values riêng
});

