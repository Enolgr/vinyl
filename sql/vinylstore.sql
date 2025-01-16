-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-01-2025 a las 10:34:20
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
  `publicado` tinyint(1) NOT NULL,
  `img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `albums`
--

INSERT INTO `albums` (`id_album`, `nombre_album`, `artista`, `genero`, `precio`, `publicado`, `img`) VALUES
(1, 'Cowboys de la A3', 1, 3, 25, 1, 'https://i.scdn.co/image/ab67616d0000b273f877753076ae48397c1a789f'),
(2, 'Una idea, pero es triste', 2, 3, 23, 1, 'https://i.scdn.co/image/ab67616d0000b2739fb92a3f48103288f76c481d'),
(3, 'PO2054AZ', 3, 14, 28, 1, 'https://i.scdn.co/image/ab67616d0000b273a20024d0998151c34e0edffd'),
(4, 'Chato', 4, 6, 20, 1, 'https://i.scdn.co/image/ab67616d0000b27367a7c155a10861046380e5ee'),
(5, 'Balanceo', 5, 3, 24, 1, 'https://i.scdn.co/image/ab67616d0000b273153441ebf60378ae0e904f5f'),
(6, 'Volcano', 6, 13, 26, 1, 'https://i.scdn.co/image/ab67616d0000b27377619f14cb03e11baf5761d1'),
(7, 'I Go', 7, 4, 22, 1, 'https://i.scdn.co/image/ab6761610000e5ebffbd43b1e54eb09a8c824f53'),
(8, 'Californication', 8, 1, 29, 1, 'https://i.scdn.co/image/ab67616d00001e0294d08ab63e57b0cae74e8595'),
(9, 'II', 9, 4, 25, 1, 'https://i.scdn.co/image/ab67616d0000b2731e59786a357e89cac748f317'),
(10, 'BBO', 10, 6, 21, 1, 'https://i.scdn.co/image/ab67616d0000b2735c55f6850bebf0a64b373b3c'),
(11, 'Ultrabelleza', 11, 8, 22, 1, 'https://i.scdn.co/image/ab67616d0000b2737fa5c3cd1f9b369101a19ba8'),
(12, 'Supernova', 12, 15, 25, 1, 'https://i.scdn.co/image/ab67616d0000b273b7f10f0193599b4fc4993681'),
(13, 'Amor o Dinero', 13, 12, 22, 1, 'https://i.scdn.co/image/ab67616d00001e02d45b2f184648f38b7f299af3'),
(14, 'Salvavidas de Hielo', 14, 9, 27, 1, 'https://i.scdn.co/image/ab67616d0000b2734062d0b07c3a74ab73632475'),
(15, 'Actual Life 2', 15, 4, 24, 1, 'https://i.scdn.co/image/ab67616d0000b2736b8a4828e057b7dc1c4a4d39'),
(16, 'El Hombre de las Mil Lunas', 16, 9, 23, 1, 'https://i.scdn.co/image/ab67616d0000b273351bdbf0b194fb7f24d9a7aa'),
(17, 'Changing Light', 17, 5, 24, 1, 'https://i.scdn.co/image/ab67616d0000b27301f9da72aef1b5ade2454b2c'),
(18, 'Harry\'s House', 18, 14, 28, 1, 'https://i.scdn.co/image/ab67616d0000b2732e8ed79e177ff6011076f5f0'),
(19, 'Woodstock', 19, 1, 26, 1, 'https://i.scdn.co/image/ab67616d0000b273af52c228c9619ff6298b08cd'),
(20, 'Jazz Is for Ordinary People', 20, 5, 22, 1, 'https://i.scdn.co/image/ab67616d0000b2738bde4da6b36de54eb970fc40'),
(21, 'Toldos Verdes', 21, 10, 20, 1, 'https://i.scdn.co/image/ab67616d0000b273e648ecf83834fbecfd72c401'),
(22, 'Elige Tu Propia Aventura', 22, 11, 23, 1, 'https://i.scdn.co/image/ab67616d0000b2731fbe9ca7f0de7b7c7713654b'),
(23, 'Carlangas', 23, 9, 23, 1, 'https://i.scdn.co/image/ab67616d0000b27385c7de284967303f77897473'),
(24, 'Alcalá Norte', 24, 3, 21, 1, 'https://i.scdn.co/image/ab67616d0000b273595e1bf8555752b5c6479ac6'),
(25, 'Calle Liberación', 25, 11, 25, 1, 'https://i.scdn.co/image/ab67616d0000b2730ace22d5804bff60e44313fb'),
(26, 'Que le den por culo a tus amigos', 26, 11, 21, 1, 'https://i.scdn.co/image/ab67616d0000b273e9a7a8a90703137902ed3a0d'),
(27, 'Action Adventure', 27, 4, 27, 1, 'https://i.scdn.co/image/ab67616d0000b27334c8920faf316228bcc18eb1'),
(28, 'Still Slippin Vol. 1', 28, 4, 24, 1, 'https://i.scdn.co/image/ab67616d0000b273966e75adbd78c77fa9e359b2'),
(29, 'Andromicfms 4', 29, 12, 20, 1, 'https://i.scdn.co/image/ab67616d0000b273a224026a114983ddba9525b2'),
(30, 'El Madrileño', 30, 8, 30, 1, 'https://i.scdn.co/image/ab67616d0000b273a408c78e231f716383a58eb3'),
(31, 'Enema of the State', 31, 11, 27, 1, 'https://i.scdn.co/image/ab67616d0000b2736da502e35a7a3e48de2b0f74');

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
(31, 'Blink 182');

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
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
