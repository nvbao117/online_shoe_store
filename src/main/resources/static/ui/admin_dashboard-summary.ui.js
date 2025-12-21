function formatCurrency(value) {
    return new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND"
    }).format(value);
}

export function renderSummary(data) {
    // ===== SUMMARY =====
    document.getElementById("totalOrders").textContent =
        data.summary.totalOrders;

    document.getElementById("totalProducts").textContent =
        data.summary.totalProducts;

    document.getElementById("totalRevenue").textContent =
        formatCurrency(data.summary.revenue);



    // ===== TOP SELLING =====
    const topSellingBody = document.getElementById("topSellingBody");
    topSellingBody.innerHTML = "";

    if (data.topSelling.length === 0) {
        topSellingBody.innerHTML = `
        <tr>
          <td class="text-slate-400 italic">Không có dữ liệu</td>
        </tr>
      `;
    } else {
        data.topSelling.forEach((item, index) => {
            topSellingBody.innerHTML += `
          <tr class="hover:bg-green-50/30 transition">
                        <td class="px-4 py-3 font-semibold text-slate-700">
                            ${index + 1}
                        </td>
                        <td class="px-4 py-3 font-medium text-slate-900">
                            ${item.productName}
                        </td>
                        <td
                          class="px-4 py-3 text-right font-bold text-green-700"
                        >
                            ${item.totalSold}
                        </td>
                        <td class="px-4 py-3 text-right text-slate-600">10</td>
                        <td class="px-4 py-3 text-center">
                          <button
                            class="text-blue-600 hover:text-blue-800 hover:underline font-medium"
                          >
                            Xem / Cập nhật
                          </button>
                        </td>
                      </tr>
        `;
        });
    }
    // Kiểm tra nếu danh sách `topSelling` tồn tại và không rỗng
    if (data.topSelling && data.topSelling.length > 0) {
        // Lấy sản phẩm đầu tiên (bán chạy nhất)
        const topProduct = data.topSelling[0];
        // Gán giá trị sản phẩm đầu danh sách và số lượng
        document.getElementById("top1Product").textContent = topProduct.productName;
        document.getElementById("slTop1Product").textContent = `SL: ${topProduct.totalSold}`;
    } else {
        // Khi không có dữ liệu
        document.getElementById("top1Product").textContent = "Không có dữ liệu";
        document.getElementById("slTop1Product").textContent = "SL: Không có";
    }

    // ===== TOP SLOW =====
    const topSlowBody = document.getElementById("topSlowBody");
    topSlowBody.innerHTML = "";

    data.topSlow.forEach((item, index) => {
        topSlowBody.innerHTML += `
        <tr class="hover:bg-red-50/30 transition">
                        <td class="px-4 py-3 font-semibold text-slate-700">
                            ${index + 1}
                        </td>
                        <td class="px-4 py-3 font-medium text-slate-900">
                            ${item.productName}
                        </td>
                        <td class="px-4 py-3 text-right font-bold text-red-700">
                            ${item.totalSold}
                        </td>
                        <td class="px-4 py-3 text-right text-slate-600">80</td>
                        <td class="px-4 py-3 text-center">
                          <button
                            class="text-red-600 hover:text-red-800 hover:underline font-medium"
                          >
                            Giảm giá / Xả kho
                          </button>
                        </td>
                      </tr>
      `;
    });


// ===== ORDER STATUS CIRCLE =====
    const summary = data.summary;

    const newOrders        = summary.newOrders || 0;
    const processingOrders = summary.processingOrders || 0;
    const completedOrders  = summary.completedOrders || 0;
    const cancelledOrders  = summary.cancelledOrders || 0;
    const returnedOrders   = summary.returnedOrders || 0;

    const totalOrders =
        newOrders +
        processingOrders +
        completedOrders +
        cancelledOrders +
        returnedOrders;

    if (totalOrders === 0) {
        // reset chart nếu không có dữ liệu
        ["chart-new","chart-processing","chart-completed","chart-cancelled","chart-returned"]
            .forEach(id => {
                const c = document.getElementById(id);
                c.setAttribute("stroke-dasharray", `0 999`);
                c.setAttribute("stroke-dashoffset", "0");
            });
        return;
    }

    const r = 40;
    const C = 2 * Math.PI * r;

// % từng trạng thái
    const newPct        = newOrders / totalOrders;
    const processingPct = processingOrders / totalOrders;
    const completedPct  = completedOrders / totalOrders;
    const cancelledPct  = cancelledOrders / totalOrders;
    const returnedPct   = returnedOrders / totalOrders;

// chiều dài từng segment
    const newLen        = C * newPct;
    const processingLen = C * processingPct;
    const completedLen  = C * completedPct;
    const cancelledLen  = C * cancelledPct;
    const returnedLen   = C * returnedPct;

// elements
    const newCircle        = document.getElementById("chart-new");
    const processingCircle = document.getElementById("chart-processing");
    const completedCircle  = document.getElementById("chart-completed");
    const cancelledCircle  = document.getElementById("chart-cancelled");
    const returnedCircle   = document.getElementById("chart-returned");

// ===== vẽ donut đúng thứ tự =====

// 1. New
    newCircle.setAttribute("stroke-dasharray", `${newLen} ${C}`);
    newCircle.setAttribute("stroke-dashoffset", "0");

// 2. Processing
    processingCircle.setAttribute("stroke-dasharray", `${processingLen} ${C}`);
    processingCircle.setAttribute("stroke-dashoffset", `-${newLen}`);

// 3. Completed
    completedCircle.setAttribute("stroke-dasharray", `${completedLen} ${C}`);
    completedCircle.setAttribute(
        "stroke-dashoffset",
        `-${newLen + processingLen}`
    );

// 4. Cancelled
    cancelledCircle.setAttribute("stroke-dasharray", `${cancelledLen} ${C}`);
    cancelledCircle.setAttribute(
        "stroke-dashoffset",
        `-${newLen + processingLen + completedLen}`
    );

// 5. Returned
    returnedCircle.setAttribute("stroke-dasharray", `${returnedLen} ${C}`);
    returnedCircle.setAttribute(
        "stroke-dashoffset",
        `-${newLen + processingLen + completedLen + cancelledLen}`
    );


// ===== TEXT =====
    document.getElementById("chart-main-percent").innerText =
        Math.round(newPct * 100) + "%";
    document.getElementById("chart-main-label").innerText = "Mới";

    document.getElementById("percent-new").innerText =
        Math.round(newPct * 100) + "%";
    document.getElementById("percent-processing").innerText =
        Math.round(processingPct * 100) + "%";
    document.getElementById("percent-completed").innerText =
        Math.round(completedPct * 100) + "%";
    document.getElementById("percent-cancelled").innerText =
        Math.round(cancelledPct * 100) + "%";
    document.getElementById("percent-returned").innerText =
        Math.round(returnedPct * 100) + "%";
}


