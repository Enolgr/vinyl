// Obtener los elementos del menú y del botón hamburguesa
const menuToggle = document.getElementById("menu-toggle");
const navMenu = document.getElementById("nav-menu");
const menuLinks = navMenu.querySelectorAll("a");

// Alternar el menú hamburguesa
menuToggle.addEventListener("click", () => {
  menuToggle.classList.toggle("active"); // Cambia la clase al icono
  navMenu.classList.toggle("active"); // Muestra/oculta el menú
});

// Añadir desplazamiento suave y cerrar el menú al hacer clic en un enlace, excepto en "History"
menuLinks.forEach((link) => {
  link.addEventListener("click", (e) => {
    // Verificar si el enlace es "History"
    if (!link.classList.contains('history-toggle')) {
      e.preventDefault(); // Evita el comportamiento predeterminado del enlace

      // Cerrar el menú
      menuToggle.classList.remove("active");
      navMenu.classList.remove("active");

      // Obtener el destino del enlace
      const targetId = link.getAttribute("href");
      const targetSection = document.querySelector(targetId);

      if (targetSection) {
        targetSection.scrollIntoView({
          behavior: "smooth",
          block: "start",
        });
      } else {
        console.error(`Sección con ID ${targetId} no encontrada`);
      }
    }
  });
});

// Obtener el enlace "History" y el submenú
const historyToggle = document.querySelector('.history-toggle');
const historySubmenu = document.querySelector('.history-submenu');

// Añadir evento de clic para alternar el submenú
historyToggle.addEventListener('click', (e) => {
  e.preventDefault(); // Evitar comportamiento predeterminado del enlace

  historyToggle.classList.toggle('active'); // Cambia el estado de "History"
  historySubmenu.classList.toggle('active'); // Alterna la visibilidad del submenú
});
