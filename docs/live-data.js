const DEMO_COMPETITIONS = [
  {
    title: "CNC Speed Challenge",
    description: "Machine a precision aluminum part within tolerance under time constraints.",
    level: "Intermediate",
    category: "Manufacturing",
    status: "Static demo"
  },
  {
    title: "Robotics Assembly Challenge",
    description: "Teams assemble and program a robotic system to complete a timed task.",
    level: "Advanced",
    category: "Robotics",
    status: "Static demo"
  }
];

window.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("competition-list");
  if (!container) return;

  container.innerHTML = DEMO_COMPETITIONS.map(data => `
    <article class="reference-card">
      <h3>${data.title}</h3>
      <p>${data.description}</p>
      <p><strong>Level:</strong> ${data.level}</p>
      <p><strong>Category:</strong> ${data.category}</p>
      <p><strong>Status:</strong> ${data.status}</p>
    </article>
  `).join("");
});
