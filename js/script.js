// Obtener los elementos del menú y del botón hamburguesa
const menuToggle = document.getElementById('menu-toggle');
const navMenu = document.getElementById('nav-menu');

// Añadir el evento de clic para alternar la clase 'active' en el menú
menuToggle.addEventListener('click', () => {
  menuToggle.classList.toggle('active');
  navMenu.classList.toggle('active');
});

// Obtener todos los enlaces dentro del menú
const menuLinks = navMenu.querySelectorAll('a');

// Añadir evento de clic para cada enlace
menuLinks.forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault(); // Evita el comportamiento predeterminado del enlace
    
    // Cerrar el menú al hacer clic en un enlace
    menuToggle.classList.remove('active');
    navMenu.classList.remove('active');
    
    // Obtener el destino del enlace (por ejemplo, "#inicio", "#servicios", etc.)
    const targetId = link.getAttribute('href');
    
    // Desplazar la página a la sección correspondiente
    const targetSection = document.querySelector(targetId);
    if (targetSection) {
      targetSection.scrollIntoView({
        behavior: 'smooth', // Desplazamiento suave
        block: 'start' // Alineación en la parte superior de la sección
      });
    }
  });
});
