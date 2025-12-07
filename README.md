# Online Shoe Store

## 📖 Hướng Dẫn Quy Trình Git & GitHub Cho Team

Tài liệu này quy định quy trình làm việc (workflow) của team để đảm bảo code luôn sạch, dễ quản lý và tránh xung đột (conflict).

### 🛠 1. Setup Dự Án (Lần đầu tiên)

1.  **Clone repository về máy:**
    ```bash
    git clone <link-repo>
    cd shoe_store
    ```

### 🔄 2. Quy Trình Làm Việc Hàng Ngày (Workflow)

Mỗi khi bắt đầu một tính năng mới hoặc sửa lỗi, hãy tuân thủ 5 bước sau:

#### Bước 1: Cập nhật branch chính (dev)
Luôn đảm bảo bạn đang ở branch gốc và code của bạn là mới nhất.
```bash
git checkout dev
git pull origin dev
```

#### Bước 2: Tạo branch mới
**Tuyệt đối không code trực tiếp trên `dev`**. Hãy tạo branch riêng theo quy tắc đặt tên:
*   Tính năng mới: `feature/ten-tinh-nang` (VD: `feature/login-page`, `feature/cart-logic`)
*   Sửa lỗi: `bugfix/ten-loi` (VD: `bugfix/fix-header-css`)
*   Hotfix (gấp): `hotfix/ten-loi`

```bash
git checkout -b feature/ten-tinh-nang-cua-ban
```

#### Bước 3: Code và Commit
Thực hiện thay đổi code. Khi commit, hãy viết message rõ ràng, dễ hiểu.
```bash
git add .
git commit -m "Mô tả ngắn gọn những gì bạn đã làm"
```
*   ✅ Tốt: `"Thêm giao diện đăng nhập"`, `"Sửa lỗi hiển thị giá sản phẩm"`
*   ❌ Tệ: `"fix"`, `"update"`, `"abc"`

#### Bước 4: Push code lên GitHub
```bash
git push origin feature/ten-tinh-nang-cua-ban
```

#### Bước 5: Tạo Pull Request (PR)
1.  Truy cập repository trên GitHub.
2.  Nhấn nút **Compare & pull request**.
3.  Viết tiêu đề và mô tả PR (làm gì, ảnh hưởng ra sao).
4.  Tag thành viên khác vào mục **Reviewers** để họ kiểm tra code.
5.  Sau khi được approve, tiến hành **Merge** vào `dev`.

---

### ⚠️ 3. Xử Lý Xung Đột (Conflict)

Nếu khi Merge hoặc Pull báo lỗi **Conflict**, đừng lo lắng:
1.  Git sẽ đánh dấu các file bị conflict.
2.  Mở file đó lên, bạn sẽ thấy các dòng `<<<<<<< HEAD`, `=======`, `>>>>>>>`.
3.  Chọn code đúng (giữ code cũ, lấy code mới, hoặc kết hợp cả hai) và xóa các ký tự đánh dấu đi.
4.  Sau khi sửa xong:
    ```bash
    git add .
    git commit -m "Resolve conflict"
    git push
    ```

---

### 🔄 4. Cập Nhật Code Mới Từ Dev (Sync)
**Tình huống:** Bạn đang code tính năng A, nhưng Team vừa merge tính năng B vào `dev`. Bạn muốn lấy tính năng B về để code tiếp mà không mất tính năng A.

**Cách làm:**
1.  **Commit** code hiện tại của bạn (dù chưa xong cũng phải commit để lưu lại).
2.  **Cập nhật branch dev:**
    ```bash
    git checkout dev
    git pull origin dev
    ```
3.  **Merge dev vào branch của bạn:**
    ```bash
    git checkout feature/ten-branch-cua-ban
    git merge dev
    ```
4.  Nếu có conflict, xem lại **Mục 3**.

---

### � 5. Các Quy Tắc Chung Cần Tuân Thủ

#### 1. Quy tắc đặt tên (Naming Convention)
*   **Biến & Hàm:** Sử dụng `camelCase`.
    *   VD: `getUserInfo()`, `cartTotal`, `isLoggedIn`.
*   **Class & Component:** Sử dụng `PascalCase`.
    *   VD: `UserController`, `HeaderComponent`.
*   **Database (Cột & Bảng):** Sử dụng `snake_case`.
    *   VD: `user_id`, `created_at`, `product_orders`.
*   **Hằng số (Constant):** Sử dụng `UPPER_CASE_SNAKE`.
    *   VD: `MAX_UPLOAD_SIZE`, `DEFAULT_PAGE_LIMIT`.

#### 2. Code Style & Chất Lượng Code
*   **Clean Code:** Xóa hết các dòng `console.log`, code bị comment (commented-out code) không dùng đến trước khi push.
*   **Format:** Luôn format code (Ctrl+Alt+L trong IDE hoặc dùng Prettier) trước khi commit.
*   **Comment:** Viết comment cho các đoạn logic phức tạp, khó hiểu. Không comment những thứ hiển nhiên.
*   **Hardcode:** Hạn chế hardcode (VD: không viết cứng chuỗi kết nối DB hay API URL trong code, hãy đưa vào file config/env).

#### 3. Quy tắc Commit Message
Nên viết commit có tiền tố để dễ phân loại:
*   `[Feature]`: Tính năng mới.
*   `[Fix]`: Sửa lỗi.
*   `[Refactor]`: Tối ưu code mà không thay đổi tính năng.
*   `[Docs]`: Sửa tài liệu.
*   **Ví dụ:** `[Feature] Thêm chức năng reset mật khẩu`, `[Fix] Sửa lỗi layout trên mobile`.

#### 4. Quy tắc Pull Request (PR)
*   **Phạm vi:** Mỗi Pull Request chỉ nên giải quyết **một vấn đề cụ thể**. Không gộp chung việc sửa nhiều lỗi và thêm tính năng vào cùng 1 PR (khó review).
*   **Self-test:** Tự kiểm tra kỹ chức năng của mình chạy ổn định trước khi nhờ người khác review.
*   **Review:** PR bắt buộc phải có ít nhất **1 approve** từ thành viên khác mới được merge vào `dev`.

### �📝 6. Một Số Lệnh Git Cơ Bản
| Chức năng | Lệnh |
| :--- | :--- |
| Kiểm tra trạng thái file | `git status` |
| Xem lịch sử commit | `git log` |
| Hủy các thay đổi chưa add | `git checkout .` |
| Xem danh sách branch | `git branch` |
| Xóa branch (sau khi merge) | `git branch -d ten-branch` |

---
**Lưu ý:** Luôn giao tiếp với team khi chuẩn bị merge những thay đổi lớn!
