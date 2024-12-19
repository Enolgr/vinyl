// Obtener los elementos del menú y del botón hamburguesa
const menuToggle = document.getElementById('menu-toggle');
const navMenu = document.getElementById('nav-menu');
const menuLinks = navMenu.querySelectorAll('a');

// Alternar el menú hamburguesa
menuToggle.addEventListener('click', () => {
  menuToggle.classList.toggle('active'); // Cambia la clase al icono
  navMenu.classList.toggle('active'); // Muestra/oculta el menú
});

// Añadir desplazamiento suave y cerrar el menú al hacer clic en un enlace
menuLinks.forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault(); // Evita el comportamiento predeterminado del enlace

    // Cerrar el menú
    menuToggle.classList.remove('active');
    navMenu.classList.remove('active');

    // Obtener el destino del enlace
    const targetId = link.getAttribute('href');
    const targetSection = document.querySelector(targetId);

    if (targetSection) {
      targetSection.scrollIntoView({
        behavior: 'smooth',
        block: 'start',
      });
    } else {
      console.error(`Sección con ID ${targetId} no encontrada`);
    }
  });
});
