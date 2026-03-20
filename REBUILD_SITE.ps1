# ================================
# MAKERHUB COMPETITION REBUILD SCRIPT
# ================================

$base = "C:\MakerHub\makerhub-competition-web\docs"

Write-Host "Rebuilding site..."

# ---------- NAV ----------
$nav = @"
<nav class="navbar">
    <div class="logo">MakerHub</div>
    <ul class="nav-links">
        <li><a href="/makerhub-competition-web/">Home</a></li>
        <li><a href="/makerhub-competition-web/pages/competitions.html">Competitions</a></li>
        <li><a href="/makerhub-competition-web/pages/exhibits.html">Exhibits</a></li>
        <li><a href="/makerhub-competition-web/pages/about.html">About</a></li>
    </ul>
</nav>
"@

Set-Content "$base\components\nav.html" $nav

# ---------- JS ----------
$js = @"
document.addEventListener("DOMContentLoaded", function () {
    const navContainer = document.getElementById("nav-container");

    if (navContainer) {
        fetch("components/nav.html")
            .then(response => response.text())
            .then(data => {
                navContainer.innerHTML = data;
            })
            .catch(error => console.error("Error loading nav:", error));
    }
});
"@

Set-Content "$base\loadComponents.js" $js

# ---------- CSS ----------
$css = @"
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: black;
    color: white;
}

.navbar {
    display: flex;
    justify-content: space-between;
    padding: 15px 30px;
}

.nav-links {
    list-style: none;
    display: flex;
    gap: 25px;
}

.nav-links a {
    color: white;
    text-decoration: none;
}

.hero {
    text-align: center;
    padding: 120px 20px;
    background: linear-gradient(to right, black, #d4af37);
}

.cta-button {
    margin-top: 20px;
    padding: 12px 25px;
    background-color: black;
    color: #d4af37;
}
"@

Set-Content "$base\styles.css" $css

# ---------- INDEX ----------
$index = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MakerHub Competition</title>
<link rel="stylesheet" href="styles.css">
</head>

<body>

<div id="nav-container"></div>
<script src="loadComponents.js"></script>

<section class="hero">
<h1>MakerHub Competition System</h1>
<p>Where Skills Are Built, Tested, and Proven</p>
<button class="cta-button">Join the Movement</button>
</section>

</body>
</html>
"@

Set-Content "$base\index.html" $index

# ---------- TEMPLATE ----------
function Create-Page($path, $title) {
$content = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>$title</title>
<link rel="stylesheet" href="../styles.css">
</head>

<body>

<div id="nav-container"></div>
<script src="../loadComponents.js"></script>

<h1>$title</h1>

</body>
</html>
"@
Set-Content $path $content
}

Create-Page "$base\pages\home.html" "Home"
Create-Page "$base\pages\competitions.html" "Competitions"
Create-Page "$base\pages\exhibits.html" "Exhibits"
Create-Page "$base\pages\about.html" "About"

Write-Host "Rebuild complete."