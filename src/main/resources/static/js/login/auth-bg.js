// File auth-bg.js
// Dùng chung cho các trang login / register / forgot password.
// Nhiệm vụ:
//  - Lấy danh sách video từ window.AUTH_VIDEO_SOURCES (do từng trang set)
//  - Chạy lần lượt từng video, hết thì nhảy sang video tiếp theo, lặp vòng.

(function () {
    const bgVideo = document.getElementById('authBgVideo');

    // Nếu trang này không có video nền thì thôi
    if (!bgVideo) {
        return;
    }

    // Lấy danh sách video từ biến global (mảng chứa URL)
    const videoSources = window.AUTH_VIDEO_SOURCES || [];

    if (!Array.isArray(videoSources) || videoSources.length === 0) {
        console.warn("AUTH_VIDEO_SOURCES đang rỗng hoặc không hợp lệ.");
        return;
    }

    let currentIndex = 0;
    let attempts = 0;
    const maxAttempts = videoSources.length * 2; // Cho phép thử tối đa 2 lần mỗi video

    function playCurrentVideo() {
        if (attempts >= maxAttempts) {
            console.error('Không thể load video sau nhiều lần thử.');
            return;
        }

        bgVideo.src = videoSources[currentIndex];
        bgVideo.load();
        attempts++;

        const playPromise = bgVideo.play();
        if (playPromise !== undefined) {
            playPromise.catch(err => {
                console.warn('Lỗi khi phát video:', videoSources[currentIndex], err);
                // Thử video tiếp theo nếu video hiện tại lỗi
                setTimeout(() => {
                    currentIndex = (currentIndex + 1) % videoSources.length;
                    playCurrentVideo();
                }, 1000);
            });
        }
    }

    // Xử lý lỗi khi video không load được
    bgVideo.addEventListener('error', function () {
        console.warn('Video không thể load:', videoSources[currentIndex]);
        // Chuyển sang video tiếp theo
        currentIndex = (currentIndex + 1) % videoSources.length;
        attempts = 0; // Reset attempts khi chuyển video
        playCurrentVideo();
    });

    // Khi video chạy xong thì chuyển video khác
    bgVideo.addEventListener('ended', function () {
        currentIndex = (currentIndex + 1) % videoSources.length;
        attempts = 0; // Reset attempts khi video chạy thành công
        playCurrentVideo();
    });

    // Bắt đầu phát
    playCurrentVideo();
})();
