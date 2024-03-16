-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2024 a las 14:27:52
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
(1, 'y15'),
(46, 'vanesa');

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
(1, 'lina'),
(110, 'vanesa');

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
(5, '2024-02-06', '10:28:00', 'registro exitoso', 'correctivo', 5, 70),
(10, '2024-02-09', '06:09:00', 'registro exitoso', 'preventivo', 5, 70),
(87, '2024-03-06', '15:11:00', 'registro exitosoaaaaaaee', 'preventivo', 5, 70);

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
(5, 'kkkk', 'asdasdasxmda', 'sdasdasd', '234', 324, 'null', 'sdasdada', '', 'sdasdsadas', '', 70, 1, 1, 'inactivo'),
(6, 'aaaaaaaaa', 'hp', 'sdsre', '243', 242, 'asfasdasda', 'sdasdada', '', 'sdasdsadas', 'activo', 70, 1, 1, 'inactivo'),
(7, 'sss', 'eñl,dñkemdkd', '3333', '33331', 1, '3w2e', 'eeeew', '1.png', 'holaaaa', 'activo', 70, 1, 1, 'inactivo'),
(8, '', 'cafe', ' cd vdvf', 'linux hola', 1, 'qwwwwqw', 'ew33', '', 'kjdhdhushsdhexitoso', 'activo', 70, 1, 1, 'inactivo'),
(18, 'vanesa', 'cafetera', '333', 'h1', 1, '2nnInstructivonnnADSOnn2556456nnOK___6765d401a29c291___ (1).pdf', '123', '1.png', 'hola', 'activo', 70, 1, 1, 'inactivo'),
(19, 'despulpadora', 'fg4', '123', 'cddx', 1, '2nnInstructivonnnADSOnn2556456nnOK___6765d401a29c291___ (1).pdf', 'wsw3', '1.png', 'hola', 'activo', 70, 1, 1, 'inactivo'),
(20, 'locutora', 'lenovo', '123', 'linuz', 1, '1nnInstructivonnnADSOnn2556456___3765c19d77d9882___ (1).pdf', 'wwww', '1.png', 'dwd23223', 'activo', 70, 1, 1, 'activo'),
(21, 'hola', 'dd', 'dd', 'dd1', 1, 'HUELLA AMBIENTAL DE LAS TIC- REALIZAR RESUMEN.pdf', 'wwww', 'Captura de pantalla 2023-11-29 201850.png', 'dwd23223', 'activo', 70, 1, 1, 'activo'),
(22, 'dd', 'dd', 'dd', 'dddddd', 1, '1.png', 'ss', '1.png', 'sdsd', 'activo', 70, 1, 1, 'activo'),
(23, 'nuevo', 'cc', '123', 'liniux', 1, '1.png', '111', 'HUELLA AMBIENTAL DE LAS TIC- REALIZAR RESUMEN.pdf', '2www', 'activo', 70, 1, 1, 'activo'),
(24, 'kllk', 'dd', 'dd', 'dd', 1, 'tableDownload (1).csv', '11', 'Img.jpg', 'ww', 'activo', 70, 1, 1, 'activo');

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

--
-- Volcado de datos para la tabla `notificacion_mantenimiento`
--

INSERT INTO `notificacion_mantenimiento` (`id_notificacion`, `fecha`, `estado`, `comentarios`, `tipo_manteniento`, `id_maquina`) VALUES
(1, '2023-12-22 00:00:00', NULL, 'werwesd', 'preventivo', 6),
(2, '2024-02-12 00:00:00', NULL, 'hacer mantenimiento', 'preventivo', 5);

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
(70, 1193574805, 'LOLA', 'chavez', '3214349030', 'vane@gmail.com', 'inactivo', '1193574805', 'usuario'),
(73, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesachahjecb@gmailo.com', 'inactivo', '1193574805', 'usuario'),
(74, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesachavez@gmailo.com', 'inactivo', '1193574805', 'usuario'),
(75, 11935748, 'vanesa', 'GALINDEZ', '3214349030', 'vanesachahjecb@gmailo.com', 'inactivo', '11935748', 'administrador'),
(76, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesachavez@gmailo.com', 'inactivo', '1193574805', 'administrador'),
(77, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesachavez@gmailo.com', 'inactivo', '1193574805', 'administrador'),
(78, 1193574805, 'vanesa', 'chavez', '3214349030', 'vanesachavez@gmailo.com', 'inactivo', '1193574805', 'administrador'),
(79, -10942541, 'vanesa', '11', '-987460', 'vanesachahjecb@gmailo.com', 'activo', '-10942541', ''),
(80, -100444, 'sara', '11223', 'tresdoce', 'sara@gmail.com', 'inactivo', '-100444', ''),
(81, -100444, 'sara', '11223', 'tresdoce', 'sara@gmail.com', 'inactivo', '-100444', ''),
(82, 2147483647, 'vanesa', 'chavez', '3214349030', 'vanesachahjeMHcb@gmailo.com', 'activo', '11935748058', 'usuario'),
(83, 2147483647, 'vanesa', 'chavez', '3214349030', 'vanesachahjeMHcb@gmailo.com', 'activo', '11935748058', 'usuario'),
(84, 1193574805, 'yury', 'galindez', '3214349030', 'yury@gmail.com', 'inactivo', '1193574805', 'usuario'),
(85, 12345, 'vanesa', 'chavez', '3214349030', 'vane@gmail.com', 'activo', '12345', 'usuario'),
(86, 0, '', '', '', '', '', '', '');

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
  MODIFY `id_ambiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `notificacion_mantenimiento`
--
ALTER TABLE `notificacion_mantenimiento`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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
