-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 30-01-2025 a las 08:27:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vinylstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albums`
--

CREATE TABLE `albums` (
  `id_album` int(11) NOT NULL,
  `nombre_album` varchar(500) NOT NULL,
  `artista` int(11) NOT NULL,
  `genero` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `albums`
--

INSERT INTO `albums` (`id_album`, `nombre_album`, `artista`, `genero`, `precio`, `descripcion`, `publicado`, `img`) VALUES
(1, 'Cowboys de la A3', 1, 1, 25, 'Cowboys de la A3 es el segundo álbum de estudio de la banda española Arde Bogotá, lanzado en 2023. El disco narra un viaje por carretera desde su Cartagena natal hacia el resto del país, reflejando experiencias y emociones en cada una de sus 12 canciones.', 1, 'https://i.scdn.co/image/ab67616d0000b273f877753076ae48397c1a789f'),
(2, 'Una idea, pero es triste', 2, 3, 23, 'Una idea, pero es triste es el álbum debut de la banda española La Paloma, lanzado en 2022. El disco combina sonidos de rock alternativo y post-punk, destacando por sus letras introspectivas y atmósferas envolventes.', 1, 'https://i.scdn.co/image/ab67616d0000b2739fb92a3f48103288f76c481d'),
(3, 'PO2054AZ', 3, 14, 28, 'PO2054AZ es un EP del artista gallego Sen Senra, lanzado en 2019. Este trabajo muestra una evolución en su estilo, incorporando elementos de R&B y música urbana, consolidándolo como una de las promesas del panorama musical español.', 1, 'https://i.scdn.co/image/ab67616d0000b273a20024d0998151c34e0edffd'),
(4, 'Chato', 4, 2, 20, 'Chato es un sencillo del artista español Barry B, lanzado en 2020. La canción fusiona ritmos urbanos con letras emotivas, reflejando las vivencias personales del cantante.', 1, 'https://i.scdn.co/image/ab67616d0000b27367a7c155a10861046380e5ee'),
(5, 'Balanceo', 5, 3, 24, 'Balanceo es el tercer álbum de estudio del dúo catalán Cala Vento, lanzado en 2019. El disco destaca por su energía y letras que abordan temas personales y sociales, consolidando su posición en la escena indie española.', 1, 'https://i.scdn.co/image/ab67616d0000b273153441ebf60378ae0e904f5f'),
(6, 'Volcano', 6, 13, 26, 'Volcano es el segundo álbum de la banda británica Jungle, lanzado en 2018. Este trabajo continúa con su característico sonido funk y soul moderno, incorporando ritmos más electrónicos y bailables.', 1, 'https://i.scdn.co/image/ab67616d0000b27377619f14cb03e11baf5761d1'),
(7, 'I Go', 7, 4, 22, 'I Go es un sencillo de la DJ y productora surcoreana Peggy Gou, lanzado en 2021. La canción combina elementos de house y techno, y se ha convertido en un éxito en las pistas de baile internacionales.', 1, 'https://i.scdn.co/image/ab6761610000e5ebffbd43b1e54eb09a8c824f53'),
(8, 'Californication', 8, 1, 29, 'Californication es el séptimo álbum de estudio de la banda estadounidense Red Hot Chili Peppers, lanzado en 1999. El disco marcó un cambio hacia un sonido más melódico y reflexivo, incluyendo éxitos como Scar Tissue y Otherside.', 1, 'https://i.scdn.co/image/ab67616d00001e0294d08ab63e57b0cae74e8595'),
(9, 'II', 9, 4, 25, 'II es el segundo álbum del trío alemán Moderat, lanzado en 2016. El disco fusiona elementos de electrónica y pop, consolidando su reputación en la escena musical internacional.', 1, 'https://i.scdn.co/image/ab67616d0000b2731e59786a357e89cac748f317'),
(10, 'BBO', 10, 6, 21, 'BBO es un sencillo colaborativo entre los artistas españoles Hoke y Louis Amoeba, lanzado en 2020. La canción destaca por su fusión de rap y jazz, mostrando la versatilidad de ambos músicos.', 1, 'https://i.scdn.co/image/ab67616d0000b2735c55f6850bebf0a64b373b3c'),
(11, 'Ultrabelleza', 11, 8, 22, 'Ultrabelleza es el primer álbum de estudio de la cantante española María José Llergo, lanzado en 2021. El disco combina flamenco tradicional con toques contemporáneos, resaltando la poderosa voz de la artista.', 1, 'https://i.scdn.co/image/ab67616d0000b2737fa5c3cd1f9b369101a19ba8'),
(12, 'Supernova', 12, 15, 25, 'Supernova es un EP del artista español Ralphie Choo, lanzado en 2021. Este trabajo mezcla géneros como el pop y la electrónica, destacando por su frescura y originalidad.', 1, 'https://i.scdn.co/image/ab67616d0000b273b7f10f0193599b4fc4993681'),
(13, 'Amor o Dinero', 13, 1, 22, 'Amor o Dinero es el álbum debut de la banda española Drugos, lanzado en 2020. El disco presenta una mezcla de rock y pop, con letras que abordan temas cotidianos y generacionales.', 1, 'https://i.scdn.co/image/ab67616d00001e02d45b2f184648f38b7f299af3'),
(14, 'Salvavidas de Hielo', 14, 3, 27, 'Salvavidas de Hielo es el decimotercer álbum de estudio del cantautor uruguayo Jorge Drexler, lanzado en 2017. El disco se caracteriza por su minimalismo y el uso predominante de la guitarra como único instrumento.', 1, 'https://i.scdn.co/image/ab67616d0000b2734062d0b07c3a74ab73632475'),
(15, 'Actual Life 2', 15, 4, 24, 'Actual Life 2 es el segundo álbum del productor británico Fred Again, lanzado en 2021. El disco recopila experiencias personales y sonidos cotidianos, transformándolos en música electrónica emotiva.', 1, 'https://i.scdn.co/image/ab67616d0000b2736b8a4828e057b7dc1c4a4d39'),
(16, 'El Hombre de las Mil Lunas', 16, 9, 23, 'El Hombre de las Mil Lunas es el segundo álbum del cantante español Carlos Ares, lanzado en 2019. Este trabajo muestra una evolución en su estilo, incorporando influencias del pop y la música urbana.', 1, 'https://i.scdn.co/image/ab67616d0000b273351bdbf0b194fb7f24d9a7aa'),
(17, 'Changing Light', 17, 5, 24, 'Changing Light es el quinto álbum de la cantante estadounidense Mirah, lanzado en 2014. Presenta una mezcla de indie pop y folk con letras introspectivas.', 1, 'https://i.scdn.co/image/ab67616d0000b27301f9da72aef1b5ade2454b2c'),
(18, 'Harry\'s House', 18, 2, 28, 'Harry\'s House es el tercer álbum de estudio del cantante británico Harry Styles, lanzado en 2022. El disco explora una variedad de estilos, desde el pop hasta el funk y el R&B, consolidando su carrera en solitario.', 1, 'https://i.scdn.co/image/ab67616d0000b2732e8ed79e177ff6011076f5f0'),
(19, 'Woodstock', 19, 1, 26, 'Woodstock es el octavo álbum de la banda estadounidense Portugal. The Man, lanzado en 2017. Incluye el exitoso sencillo Feel It Still, que les valió reconocimiento internacional.', 0, 'https://i.scdn.co/image/ab67616d0000b273af52c228c9619ff6298b08cd'),
(20, 'Jazz Is for Ordinary People', 20, 5, 22, 'Jazz Is for Ordinary People es un álbum conceptual del compositor francés Berlioz, lanzado en 2019. El disco busca acercar el jazz al público general, fusionándolo con elementos de música clásica y contemporánea.', 1, 'https://i.scdn.co/image/ab67616d0000b2738bde4da6b36de54eb970fc40'),
(21, 'Toldos Verdes', 21, 3, 20, 'Toldos Verdes es el álbum debut de la banda española Toldos Verdes, lanzado en 2018. El disco combina influencias de rock alternativo y pop, destacando por sus melodías pegajosas y letras introspectivas.', 1, 'https://i.scdn.co/image/ab67616d0000b273e648ecf83834fbecfd72c401'),
(22, 'Elige Tu Propia Aventura', 22, 1, 23, 'Elige Tu Propia Aventura es el segundo álbum de la banda madrileña Carolina Durante, lanzado en 2022. El disco mantiene su característico sonido punk-pop, abordando temáticas juveniles y cotidianas con un toque irónico.', 1, 'https://i.scdn.co/image/ab67616d0000b2731fbe9ca7f0de7b7c7713654b'),
(23, 'Carlangas', 23, 9, 23, 'Carlangas es el álbum debut en solitario de Carlos Hernández, conocido como Carlangas, lanzado en 2023. Tras su paso por Novedades Carminha, este trabajo explora sonidos más personales y experimentales.', 1, 'https://i.scdn.co/image/ab67616d0000b27385c7de284967303f77897473'),
(24, 'Alcalá Norte', 24, 3, 21, 'Alcalá Norte es el primer álbum de la banda homónima, lanzado en 2021. El disco fusiona rock urbano con toques de blues, reflejando la vida en los barrios periféricos de Madrid.', 1, 'https://i.scdn.co/image/ab67616d0000b273595e1bf8555752b5c6479ac6'),
(25, 'Calle Liberación', 25, 11, 25, 'Calle Liberación es el cuarto álbum de estudio del trío madrileño Sexy Zebras, lanzado en 2021. El disco destaca por su energía y letras que abordan temas de libertad y autoafirmación.', 1, 'https://i.scdn.co/image/ab67616d0000b2730ace22d5804bff60e44313fb'),
(26, 'Que le den por culo a tus amigos', 26, 11, 21, 'Que le den por culo a tus amigos es el sexto álbum de la banda española Los Punsetes, lanzado en 2017. Fieles a su estilo, presentan letras mordaces y un sonido pop-rock contundente.', 1, 'https://i.scdn.co/image/ab67616d0000b273e9a7a8a90703137902ed3a0d'),
(27, 'Action Adventure', 27, 4, 27, 'Action Adventure es el séptimo álbum del productor estadounidense DJ Shadow, lanzado en 2023. El disco es instrumental y muestra una evolución hacia sonidos más melódicos y cinematográficos.', 1, 'https://i.scdn.co/image/ab67616d0000b27334c8920faf316228bcc18eb1'),
(28, 'Still Slippin Vol. 1', 28, 4, 24, 'Still Slippin Vol. 1 es el mixtape debut del productor británico Joy Orbison, lanzado en 2021. Combina elementos de garage, house y electrónica experimental, reflejando su evolución artística.', 1, 'https://i.scdn.co/image/ab67616d0000b273966e75adbd78c77fa9e359b2'),
(29, 'Andromicfms 4', 29, 12, 20, 'Andromicfms 4 es el cuarto volumen de la serie de mixtapes del artista español Yung Beef, lanzado en 2020. El trabajo destaca por su estilo trap y letras crudas, consolidando su posición en la escena urbana.', 1, 'https://i.scdn.co/image/ab67616d0000b273a224026a114983ddba9525b2'),
(30, 'El Madrileño', 30, 8, 30, 'El Madrileño es el tercer álbum de estudio del artista español C. Tangana, lanzado en 2021. El disco fusiona géneros como el flamenco, la rumba y el trap, contando con múltiples colaboraciones y siendo aclamado por la crítica.', 1, 'https://i.scdn.co/image/ab67616d0000b273a408c78e231f716383a58eb3'),
(31, 'Enema of the State', 31, 11, 27, 'Enema of the State es el tercer álbum de estudio de la banda estadounidense Blink-182, lanzado en 1999. Con éxitos como All the Small Things y What\'s My Age Again?, el disco es un referente del pop-punk de finales de los 90.', 1, 'https://i.scdn.co/image/ab67616d0000b2736da502e35a7a3e48de2b0f74'),
(43, 'Blossom', 39, 7, 22, '\"Blossom\" es el cuarto álbum de Iseo & Dodosound, lanzado en 2022. Este trabajo fusiona reggae, dub y electrónica, destacando por su sonido innovador y letras introspectivas.', 0, './backend/uploads/ab67616d0000b273a50c68310f23b7c07609cebb.jpeg'),
(44, 'Are You Experienced', 41, 1, 25, 'Are You Experienced es el álbum debut de la banda angloamericana de rock Jimi Hendrix Experience, publicado en 1967 a través del sello discográfico Track Records.', 1, './backend/uploads/ab67616d0000b273c9adfbd773852e286faed040.jpeg'),
(45, 'Mismo Sitio, Distinto Lugar', 42, 3, 22, 'Mismo Sitio, Distinto Lugar es una invitación al epicentro mismo de Vetusta Morla para asistir en primera persona a una reafirmación de su esencia, cimentada, irónicamente, en una agitada metamorfosis. El álbum refleja de manera fragmentada un proceso de transformación, siendo a la vez el proceso en sí, su relato y el resultado del mismo', 1, './backend/uploads/1511885438_220718_1512040995_album_normal.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `id_artista` int(11) NOT NULL,
  `nombre_artista` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id_artista`, `nombre_artista`) VALUES
(1, 'Arde Bogotá'),
(2, 'La Paloma'),
(3, 'Sen Senra'),
(4, 'Barry B'),
(5, 'Cala Vento'),
(6, 'Jungle'),
(7, 'Peggy Gou'),
(8, 'Red Hot Chili Peppers'),
(9, 'Moderat'),
(10, 'Hoke & Luis Amoeba'),
(11, 'María José Llergo'),
(12, 'Ralphie Choo'),
(13, 'Drugos'),
(14, 'Jorge Drexler'),
(15, 'Fred Again'),
(16, 'Carlos Ares'),
(17, 'Ironsides'),
(18, 'Harry Styles'),
(19, 'Portugal The Man'),
(20, 'Berlioz'),
(21, 'Toldos Verdes'),
(22, 'Carolina Durante'),
(23, 'Carlangas'),
(24, 'Alcalá Norte'),
(25, 'Sexy Zebras'),
(26, 'Los Punsetes'),
(27, 'DJ Shadow'),
(28, 'Joy Orbison'),
(29, 'Yung Beef'),
(30, 'C. Tangana'),
(31, 'Blink 182'),
(33, 'Depeche Mode'),
(39, 'Iseo & DodoSound'),
(41, 'Jimi Hendrix'),
(42, 'Vetusta Morla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre_genero` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre_genero`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Indie'),
(4, 'Electrónica'),
(5, 'Jazz'),
(6, 'Hip Hop'),
(7, 'Reggae'),
(8, 'Flamenco'),
(9, 'Folk'),
(10, 'Experimental'),
(11, 'Punk'),
(12, 'Trap'),
(13, 'Soul'),
(14, 'R&B'),
(15, 'Fusión');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `fk_id_artista` (`artista`),
  ADD KEY `fk_genero` (`genero`);

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id_artista`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albums`
--
ALTER TABLE `albums`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `fk_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `fk_id_artista` FOREIGN KEY (`artista`) REFERENCES `artistas` (`id_artista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
