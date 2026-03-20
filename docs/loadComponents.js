document.addEventListener("DOMContentLoaded", function () {
    const navContainer = document.getElementById("nav-container");

    if (navContainer) {
        fetch("components/nav.html")
            .then(response => response.text())
            .then(data => {
                navContainer.innerHTML = data;
            });
    }
});
