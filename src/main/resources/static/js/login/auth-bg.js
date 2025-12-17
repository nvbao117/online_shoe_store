// File auth-bg.js
// Dùng chung cho các trang login / register / forgot password.

(function () {
    const bgVideo = document.getElementById('authBgVideo');

    // Nếu trang này không có video nền thì thôi
    if (!bgVideo) return;

    // Lấy danh sách video từ biến global (mảng chứa URL)
    const videoSources = window.AUTH_VIDEO_SOURCES || [];

    if (!Array.isArray(videoSources) || videoSources.length === 0) {
        console.warn("AUTH_VIDEO_SOURCES đang rỗng hoặc không hợp lệ.");
        return;
    }

    // Random 1 video mỗi lần vào trang
    const pickedIndex = Math.floor(Math.random() * videoSources.length);
    const pickedSrc = videoSources[pickedIndex];

    // Loop video đó (không chuyển video liên tục nữa)
    bgVideo.loop = true;

    // Một số trình duyệt có thể cần muted=true để autoplay ổn định
    bgVideo.muted = true;

    let started = false;

    function startVideo() {
        if (started) return;
        started = true;

        // Set src và play
        bgVideo.src = pickedSrc;
        bgVideo.load();

        const playPromise = bgVideo.play();
        if (playPromise !== undefined) {
            playPromise.catch(err => {
                // Autoplay có thể bị chặn ở một số trình duyệt -> không sao, vẫn có poster
                console.warn('Autoplay bị chặn hoặc không thể phát video:', pickedSrc, err);
            });
        }
    }

    // Nếu load lỗi -> ẩn video để poster/ảnh nền vẫn hiển thị (tránh màn đen)
    bgVideo.addEventListener('error', function () {
        console.warn('Video không thể load:', pickedSrc);
        bgVideo.style.display = 'none';
        document.body.classList.add('auth-fallback-bg');
    });

    // Tab ẩn thì pause để giảm CPU, quay lại thì play lại
    document.addEventListener('visibilitychange', function () {
        if (document.hidden) {
            try { bgVideo.pause(); } catch (e) {}
        } else {
            // Chỉ play lại nếu đã start
            if (started) {
                const p = bgVideo.play();
                if (p) p.catch(() => {});
            }
        }
    });

    // Chờ trang load xong rồi mới start (mượt hơn)
    window.addEventListener('load', function () {
        // Ưu tiên requestIdleCallback nếu có
        if ('requestIdleCallback' in window) {
            window.requestIdleCallback(startVideo, { timeout: 1500 });
        } else {
            setTimeout(startVideo, 200);
        }
    });
})();
