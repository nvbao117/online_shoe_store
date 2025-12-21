import {renderPendingOrders} from "../ui/pending-order.ui.js";
import {fetchPendingOrder} from "../api/pending-order.api.js";

document.addEventListener("DOMContentLoaded", () => {
    document.getElementById("btnPending").addEventListener("click", async () => {
        const orders = await fetchPendingOrder();
        console.log(orders);
        renderPendingOrders(orders);
    });
});

