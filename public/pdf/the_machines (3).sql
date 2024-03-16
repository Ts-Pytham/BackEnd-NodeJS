-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2024 a las 14:47:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `the_machines`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambiente`
--

CREATE TABLE `ambiente` (
  `id_ambiente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ambiente`
--

INSERT INTO `ambiente` (`id_ambiente`, `nombre`) VALUES
(1, 'y15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `nombre`) VALUES
(1, 'agroindustria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(11) NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `hora_mantenimiento` time DEFAULT NULL,
  `descripcion` varchar(300) NOT NULL,
  `tipo_mantenimiento` enum('preventivo','correctivo') NOT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`id_mantenimiento`, `fecha_mantenimiento`, `hora_mantenimiento`, `descripcion`, `tipo_mantenimiento`, `id_maquina`, `id_usuario`) VALUES
(115, '2024-03-08', '07:49:00', 'HOLAAAA', 'preventivo', 35, 118);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id_maquina` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `placa` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `manual` varchar(300) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `estado` enum('activo','inactivo','reparacion') DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_ambiente` int(11) DEFAULT NULL,
  `estado_maquina` enum('activo','inactivo','baja') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maquina`
--

INSERT INTO `maquina` (`id_maquina`, `nombre`, `marca`, `placa`, `modelo`, `cantidad`, `manual`, `serial`, `imagen`, `descripcion`, `estado`, `id_usuario`, `id_area`, `id_ambiente`, `estado_maquina`) VALUES
(34, 'despulpadora', 'lenovo', 'fd34', 'linux', 1, '', 'k45', '', 'maquina registradaaa', 'activo', 115, 1, 1, 'activo'),
(35, 'selladora', 'cafe', '123', 'h1', 1, 'Requerimientos Actualizado 09-11-2023.docx', '32432', 'Img2.jpg', 'maquina activa', 'activo', 118, 1, 1, 'activo'),
(36, 'locutora', 'cafe', '2e3', 'kn', 1, 'Riesgos y peligros.docx', '123', '1.png', 'nuevioo', 'activo', 115, 1, 1, 'activo'),
(37, 'despulpadora', 'lenovo', '123', 'linuz', 1, 'documetaacion.pdf', '32432', 'documetaacion.pdf', 'hola', 'activo', 115, 1, 1, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_mantenimiento`
--

CREATE TABLE `notificacion_mantenimiento` (
  `id_notificacion` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('aceptar','omitir') DEFAULT NULL,
  `comentarios` varchar(100) NOT NULL,
  `tipo_manteniento` enum('preventivo','correctivo') NOT NULL,
  `id_maquina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `rol` enum('administrador','tecnico','usuario') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `identificacion`, `nombres`, `apellidos`, `telefono`, `correo`, `estado`, `contraseña`, `rol`) VALUES
(115, 123555, 'liliana', 'timana', '3202584125', 'lili@gmailo.com', 'activo', '123555', 'tecnico'),
(118, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesa@gmail.com', 'activo', '1193574805', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  ADD PRIMARY KEY (`id_ambiente`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `fk_usuario` (`id_usuario`),
  ADD KEY `fk_maquina` (`id_maquina`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id_maquina`),
  ADD KEY `fk_usuario_maquina` (`id_usuario`),
  ADD KEY `fk_ambientes` (`id_ambiente`),
  ADD KEY `arealinea` (`id_area`);

--
-- Indices de la tabla `notificacion_mantenimiento`
--
ALTER TABLE `notificacion_mantenimiento`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `lineanotificacion` (`id_maquina`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  MODIFY `id_ambiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `notificacion_mantenimiento`
--
ALTER TABLE `notificacion_mantenimiento`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `fk_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD CONSTRAINT `fk_ambientes` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id_ambiente`),
  ADD CONSTRAINT `fk_usuario_maquina` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `maquina_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);

--
-- Filtros para la tabla `notificacion_mantenimiento`
--
ALTER TABLE `notificacion_mantenimiento`
  ADD CONSTRAINT `lineanotificacion` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
