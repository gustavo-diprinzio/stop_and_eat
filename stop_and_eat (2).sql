-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 03:02:31
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stop_and_eat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_registrados`
--

CREATE TABLE `clientes_registrados` (
  `id_cliente` int(5) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes_registrados`
--

INSERT INTO `clientes_registrados` (`id_cliente`, `apellido`, `nombre`, `dni`, `contraseña`) VALUES
(1, 'Di Prinzio', 'Gustavo', 43873054, '46bf70c1051cea2f2d6f5de1462b5f65'),
(2, 'Navoni', 'Matias', 45331571, 'ac0ddf9e65d57b6a56b2453386cd5db5'),
(3, 'Fernandez', 'Agustin', 43789652, '6b30d765ff2c19f84a5aab6b35de52c6'),
(7, 'cliente no registrado', NULL, NULL, NULL),
(8, 'Palacios', 'Sandra', 40811054, 'eeafbf4d9b3957b139da7b7f2e7f2d4a'),
(9, 'Badeigts', 'Santi', 12345678, '13bdd79d40ef0f1e3f69d2e548ae92f8'),
(10, 'Dixon', 'Daryl', 77778889, '7ca71535907a2c199316eb0ea5032d63'),
(11, 'Di Prinzio', 'Gabi', 45698712, '0e7870c8deb4d67e5637d2ff28cae780'),
(12, 'Mezar', 'Oscar', 77783216, '5025095b7a3b145ef78246c2b6714fd8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerentes`
--

CREATE TABLE `gerentes` (
  `id_gerente` int(5) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dni` int(8) NOT NULL,
  `contraseña` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gerentes`
--

INSERT INTO `gerentes` (`id_gerente`, `apellido`, `nombre`, `dni`, `contraseña`) VALUES
(1, 'Moles', 'Sergio', 87654321, 'e15b8295c36d1c0544a23277aba91387'),
(2, 'Ingerto', 'Mariano', 3012345, 'fe915644400aba1a8c272fc955b0c5b4'),
(3, 'Shelby', 'Thomas', 12398740, '2dc979d8571788e647e49a10223acae8'),
(4, 'Navoni', 'Matias', 22, 'ac0ddf9e65d57b6a56b2453386cd5db5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `nombre_menu` varchar(50) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre_menu`, `precio`) VALUES
(1, 'menu1', 550),
(2, 'menu2', 630),
(3, 'menu3', 800),
(4, 'menu4', 1200),
(5, 'menu5', 500),
(6, 'menu6', 400),
(7, 'menu7', 900),
(8, 'menu8', 200),
(9, 'menu9', 150),
(10, 'menu10', 150),
(11, 'menu11', 777),
(19, 'menu19', 999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_productos`
--

CREATE TABLE `menu_productos` (
  `id_menu` int(5) NOT NULL,
  `id_producto` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu_productos`
--

INSERT INTO `menu_productos` (`id_menu`, `id_producto`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(19, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(5) NOT NULL,
  `monto` double NOT NULL,
  `metodo_de_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `monto`, `metodo_de_pago`) VALUES
(118, 4800, 'tarjeta'),
(119, 5289.4, 'tarjeta'),
(120, 4240, 'efectivo'),
(121, 1030, 'tarjeta'),
(122, 1030, 'efectivo'),
(123, 1030, 'efectivo'),
(124, 824, 'efectivo'),
(125, 1030, 'efectivo'),
(126, 0, 'efectivo'),
(127, 0, 'tarjeta'),
(128, 0, 'efectivo'),
(129, 0, 'efectivo'),
(130, 0, 'efectivo'),
(131, 1760, 'tarjeta'),
(132, 0, 'efectivo'),
(133, 0, 'efectivo'),
(134, 0, 'efectivo'),
(135, 0, 'efectivo'),
(136, 0, 'tarjeta'),
(137, 0, 'tarjeta'),
(138, 630, 'efectivo'),
(139, 2520, 'tarjeta'),
(140, 2860, 'tarjeta'),
(141, 400, 'efectivo'),
(142, 400, 'tarjeta'),
(143, 1200, 'efectivo'),
(144, 200, 'tarjeta'),
(145, 160, 'efectivo'),
(146, 160, 'efectivo'),
(147, 200, 'efectivo'),
(148, 1100, 'efectivo'),
(149, 550, 'efectivo'),
(150, 0, 'efectivo'),
(151, 944, 'efectivo'),
(152, 0, 'efectivo'),
(153, 1650, 'efectivo'),
(154, 1100, 'efectivo'),
(155, 440, 'efectivo'),
(156, 440, 'tarjeta'),
(157, 0, 'efectivo'),
(158, 0, 'efectivo'),
(159, 0, 'efectivo'),
(160, 640, 'tarjeta'),
(161, 2550, 'tarjeta'),
(162, 640, 'tarjeta'),
(163, 0, 'tarjeta'),
(164, 550, 'tarjeta'),
(165, 550, 'tarjeta'),
(166, 550, 'tarjeta'),
(167, 550, 'tarjeta'),
(168, 0, 'tarjeta'),
(169, 0, 'tarjeta'),
(170, 1100, 'tarjeta'),
(171, 440, 'tarjeta'),
(172, 0, 'tarjeta'),
(173, 0, 'tarjeta'),
(174, 0, 'tarjeta'),
(175, 440, 'tarjeta'),
(176, 0, 'tarjeta'),
(177, 0, 'tarjeta'),
(178, 0, 'tarjeta'),
(179, 0, 'tarjeta'),
(180, 0, 'tarjeta'),
(181, 0, 'tarjeta'),
(182, 504, 'tarjeta'),
(183, 0, 'tarjeta'),
(184, 0, 'tarjeta'),
(185, 440, 'tarjeta'),
(186, 0, 'tarjeta'),
(187, 0, 'tarjeta'),
(188, 0, 'tarjeta'),
(189, 0, 'tarjeta'),
(190, 440, 'tarjeta'),
(191, 0, 'tarjeta'),
(192, 0, 'tarjeta'),
(193, 0, 'tarjeta'),
(194, 0, 'tarjeta'),
(195, 440, 'tarjeta'),
(196, 0, 'tarjeta'),
(197, 0, 'tarjeta'),
(198, 504, 'tarjeta'),
(199, 504, 'tarjeta'),
(200, 160, 'tarjeta'),
(201, 0, 'tarjeta'),
(202, 0, 'tarjeta'),
(203, 0, 'tarjeta'),
(204, 160, 'tarjeta'),
(205, 0, 'tarjeta'),
(206, 120, 'tarjeta'),
(207, 120, 'tarjeta'),
(208, 120, 'tarjeta'),
(209, 640, 'tarjeta'),
(210, 640, 'tarjeta'),
(211, 640, 'tarjeta'),
(212, 640, 'tarjeta'),
(213, 640, 'tarjeta'),
(214, 640, 'tarjeta'),
(215, 640, 'tarjeta'),
(216, 640, 'tarjeta'),
(217, 640, 'tarjeta'),
(218, 640, 'tarjeta'),
(219, 640, 'tarjeta'),
(220, 640, 'tarjeta'),
(221, 640, 'tarjeta'),
(222, 640, 'tarjeta'),
(223, 640, 'tarjeta'),
(224, 640, 'tarjeta'),
(225, 640, 'tarjeta'),
(226, 640, 'tarjeta'),
(227, 160, 'tarjeta'),
(228, 504, 'tarjeta'),
(229, 640, 'tarjeta'),
(230, 320, 'tarjeta'),
(231, 320, ''),
(232, 320, ''),
(233, 320, ''),
(234, 500, 'tarjeta'),
(235, 500, 'efectivo'),
(236, 400, 'tarjeta'),
(237, 400, 'tarjeta'),
(238, 200, 'tarjeta'),
(239, 200, 'tarjeta'),
(240, 200, 'tarjeta'),
(241, 1200, 'efectivo'),
(242, 0, 'efectivo'),
(243, 200, 'efectivo'),
(244, 0, 'efectivo'),
(245, 550, 'efectivo'),
(246, 1100, 'efectivo'),
(247, 2280, 'tarjeta'),
(248, 2910, 'efectivo'),
(249, 2200, 'efectivo'),
(250, 0, 'efectivo'),
(251, 0, 'efectivo'),
(252, 1100, 'tarjeta'),
(253, 550, 'efectivo'),
(254, 0, 'efectivo'),
(255, 0, 'efectivo'),
(256, 0, 'efectivo'),
(257, 0, 'efectivo'),
(258, 0, 'efectivo'),
(259, 0, 'efectivo'),
(260, 0, 'efectivo'),
(261, 0, 'efectivo'),
(262, 0, 'efectivo'),
(263, 0, 'efectivo'),
(264, 0, ''),
(265, 0, 'efectivo'),
(266, 0, ''),
(267, 0, 'efectivo'),
(268, 0, ''),
(269, 0, ''),
(270, 550, ''),
(271, 0, ''),
(272, 0, ''),
(273, 1100, 'efectivo'),
(274, 1100, 'tarjeta'),
(275, 1650, 'efectivo'),
(276, 0, 'efectivo'),
(277, 0, 'efectivo'),
(278, 0, 'efectivo'),
(279, 0, 'efectivo'),
(280, 550, 'efectivo'),
(281, 2440, 'efectivo'),
(282, 0, 'tarjeta'),
(283, 160, 'efectivo'),
(284, 3620, 'tarjeta'),
(285, 3776, 'efectivo'),
(286, 1650, 'efectivo'),
(287, 400, 'tarjeta'),
(288, 2360, 'tarjeta'),
(289, 6780, 'efectivo'),
(290, 1430, 'tarjeta'),
(291, 5750, 'efectivo'),
(292, 1900, 'efectivo'),
(293, 1180, 'efectivo'),
(294, 1180, 'efectivo'),
(295, 3070, 'efectivo'),
(296, 3070, 'efectivo'),
(297, 3070, 'efectivo'),
(298, 3070, 'efectivo'),
(299, 3070, 'efectivo'),
(300, 3070, 'efectivo'),
(301, 3070, 'efectivo'),
(302, 3070, 'efectivo'),
(303, 3070, 'efectivo'),
(304, 3070, 'efectivo'),
(305, 3070, 'efectivo'),
(306, 3070, 'efectivo'),
(307, 3070, 'efectivo'),
(308, 3070, 'efectivo'),
(309, 1100, 'efectivo'),
(310, 1030, 'tarjeta'),
(311, 880, 'tarjeta'),
(312, 440, 'efectivo'),
(313, 440, 'efectivo'),
(314, 880, 'efectivo'),
(315, 2200, 'efectivo'),
(316, 550, 'tarjeta'),
(317, 1100, 'efectivo'),
(318, 1100, 'efectivo'),
(319, 550, 'efectivo'),
(320, 1100, 'tarjeta'),
(321, 2728, 'efectivo'),
(322, 4264, 'tarjeta'),
(323, 4264, 'tarjeta'),
(324, 4264, 'tarjeta'),
(325, 1848, 'efectivo'),
(326, 4710, 'tarjeta'),
(327, 3340, 'tarjeta'),
(328, 1430, 'tarjeta'),
(329, 6110, 'efectivo'),
(330, 3664.8, 'efectivo'),
(331, 2864, 'efectivo'),
(332, 10301.6, 'tarjeta'),
(333, 1008, 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` varchar(50) NOT NULL,
  `id_cliente` int(5) NOT NULL,
  `id_pago` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `fecha`, `estado`, `id_cliente`, `id_pago`) VALUES
(21, '2022-10-12 03:56:58', 'en proceso', 3, 118),
(22, '2022-10-12 04:12:11', 'en proceso', 1, 118),
(23, '2022-10-12 04:25:16', 'en proceso', 2, 135),
(24, '2022-10-12 04:26:35', 'en proceso', 3, 136),
(25, '2022-10-12 04:28:09', 'en proceso', 3, 137),
(33, '2022-10-13 01:12:19', 'en proceso', 1, 145),
(35, '2022-10-13 01:34:56', 'en proceso', 2, 150),
(36, '2022-10-13 01:41:23', 'en proceso', 1, 152),
(37, '2022-10-13 02:10:34', 'en proceso', 3, 156),
(38, '2022-10-13 02:14:11', 'en proceso', 1, 157),
(40, '2022-10-13 07:12:49', 'en proceso', 1, 162),
(45, '2022-10-13 09:22:52', 'en proceso', 1, 168),
(46, '2022-10-13 09:25:51', 'en proceso', 1, 171),
(47, '2022-10-13 09:29:29', 'en proceso', 1, 177),
(48, '2022-10-14 09:40:11', 'en proceso', 1, 204),
(49, '2022-10-14 11:48:25', 'en proceso', 1, 221),
(51, '2022-10-15 12:42:52', 'en proceso', 7, 237),
(52, '2022-10-15 01:18:24', 'en proceso', 7, 240),
(53, '2022-10-15 01:20:38', 'en proceso', 7, 241),
(54, '2022-10-15 01:24:13', 'en proceso', 7, 242),
(55, '2022-10-15 01:33:49', 'en proceso', 7, 243),
(56, '2022-10-15 01:34:30', 'en proceso', 7, 244),
(57, '2022-10-15 01:35:20', 'en proceso', 7, 245),
(58, '2022-10-15 01:37:47', 'en proceso', 7, 246),
(59, '2022-10-15 04:39:31', 'en proceso', 7, 247),
(60, '2022-10-15 04:44:03', 'en proceso', 7, 248),
(61, '2022-10-15 06:01:40', 'en proceso', 7, 249),
(62, '2022-10-15 06:02:07', 'en proceso', 7, 250),
(63, '2022-10-15 06:02:37', 'en proceso', 7, 251),
(64, '2022-10-15 07:30:13', 'en proceso', 7, 252),
(65, '2022-10-15 07:33:05', 'en proceso', 7, 253),
(66, '2022-10-15 07:33:17', 'en proceso', 7, 254),
(67, '2022-10-15 07:33:42', 'en proceso', 7, 255),
(68, '2022-10-15 07:36:32', 'en proceso', 7, 256),
(69, '2022-10-15 07:38:40', 'en proceso', 7, 257),
(70, '2022-10-15 07:40:03', 'en proceso', 7, 258),
(71, '2022-10-15 07:41:52', 'en proceso', 7, 259),
(72, '2022-10-15 07:42:06', 'en proceso', 7, 260),
(73, '2022-10-15 07:42:06', 'en proceso', 7, 261),
(74, '2022-10-15 07:46:33', 'en proceso', 7, 262),
(75, '2022-10-15 07:48:21', 'en proceso', 7, 263),
(77, '2022-10-15 07:58:19', 'en proceso', 7, 265),
(79, '2022-10-15 07:59:31', 'en proceso', 7, 267),
(85, '2022-10-15 08:16:58', 'en proceso', 7, 273),
(86, '2022-10-15 08:17:39', 'en proceso', 7, 274),
(87, '2022-10-15 08:18:12', 'en proceso', 7, 275),
(88, '2022-10-15 08:18:30', 'en proceso', 7, 276),
(89, '2022-10-15 08:19:58', 'en proceso', 7, 277),
(90, '2022-10-15 08:24:28', 'en proceso', 7, 278),
(91, '2022-10-15 08:28:07', 'en proceso', 7, 279),
(92, '2022-10-15 08:28:24', 'en proceso', 7, 280),
(93, '2022-10-15 08:37:17', 'en proceso', 7, 281),
(94, '2022-10-15 08:39:41', 'en proceso', 7, 282),
(95, '2022-10-15 08:40:54', 'en proceso', 2, 283),
(96, '2022-10-15 11:49:25', 'en proceso', 7, 284),
(97, '2022-10-15 11:50:37', 'en proceso', 3, 285),
(98, '2022-10-16 12:16:31', 'en proceso', 7, 286),
(99, '2022-10-16 12:18:16', 'en proceso', 7, 287),
(100, '2022-10-16 12:22:43', 'en proceso', 7, 288),
(101, '2022-10-16 12:33:54', 'en proceso', 7, 289),
(102, '2022-10-16 12:35:18', 'en proceso', 7, 290),
(103, '2022-10-16 12:36:07', 'en proceso', 7, 291),
(104, '2022-10-16 12:45:02', 'en proceso', 7, 292),
(105, '2022-10-16 01:08:52', 'en proceso', 7, 293),
(106, '2022-10-16 01:09:44', 'en proceso', 7, 294),
(107, '2022-10-16 01:10:25', 'en proceso', 7, 295),
(108, '2022-10-16 01:11:53', 'en proceso', 7, 296),
(109, '2022-10-16 01:18:33', 'en proceso', 7, 297),
(110, '2022-10-16 01:19:13', 'en proceso', 7, 298),
(111, '2022-10-16 01:19:58', 'en proceso', 7, 299),
(112, '2022-10-16 01:20:34', 'en proceso', 7, 300),
(113, '2022-10-16 01:20:36', 'en proceso', 7, 301),
(114, '2022-10-16 01:20:44', 'en proceso', 7, 302),
(115, '2022-10-16 01:20:45', 'en proceso', 7, 303),
(116, '2022-10-16 01:20:46', 'en proceso', 7, 304),
(117, '2022-10-16 01:21:13', 'en proceso', 7, 305),
(118, '2022-10-16 01:21:14', 'en proceso', 7, 306),
(119, '2022-10-16 01:22:09', 'en proceso', 7, 307),
(120, '2022-10-16 01:22:28', 'en proceso', 7, 308),
(121, '2022-10-17 03:28:32', 'en proceso', 7, 309),
(122, '2022-10-17 03:29:40', 'en proceso', 7, 310),
(123, '2022-10-17 07:46:49', 'en proceso', 1, 311),
(124, '2022-10-17 07:53:50', 'en proceso', 2, 312),
(125, '2022-10-17 07:54:15', 'en proceso', 2, 313),
(126, '2022-10-17 07:54:51', 'en proceso', 1, 314),
(127, '2022-10-18 09:41:34', 'en proceso', 7, 315),
(128, '2022-10-19 12:28:42', 'en proceso', 7, 316),
(129, '2022-10-19 12:29:50', 'en proceso', 7, 317),
(130, '2022-10-19 12:41:55', 'en proceso', 7, 318),
(131, '2022-10-19 12:43:33', 'en proceso', 7, 319),
(132, '2022-10-19 09:19:31', 'en proceso', 7, 320),
(133, '2022-10-21 05:23:08', 'Completado', 1, 321),
(134, '2022-10-21 05:30:27', 'Completado', 2, 322),
(135, '2022-10-21 05:30:45', 'Completado', 2, 323),
(136, '2022-10-21 05:30:47', 'Completado', 2, 324),
(137, '2022-10-21 05:33:30', 'Completado', 3, 325),
(141, '2022-10-21 08:02:41', 'Completado', 7, 329),
(142, '2022-10-21 08:04:07', 'Completado', 11, 330),
(143, '2022-10-21 08:39:17', 'Completado', 1, 331),
(144, '2022-10-25 09:47:38', 'Completado', 12, 332),
(145, '2022-10-25 09:56:41', 'Completado', 2, 333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_menu`
--

CREATE TABLE `pedido_menu` (
  `id_pedido` int(5) NOT NULL,
  `id_menu` int(5) NOT NULL,
  `cantidad_menu` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_menu`
--

INSERT INTO `pedido_menu` (`id_pedido`, `id_menu`, `cantidad_menu`) VALUES
(58, 1, 2),
(59, 1, 3),
(59, 1, 1),
(60, 1, 3),
(61, 1, 4),
(62, 1, 0),
(63, 1, 0),
(64, 1, 2),
(65, 1, 1),
(66, 1, 0),
(67, 1, 0),
(68, 1, 0),
(69, 1, 0),
(70, 1, 0),
(71, 1, 0),
(72, 1, 0),
(73, 1, 0),
(74, 1, 0),
(75, 1, 0),
(77, 1, 0),
(79, 1, 0),
(79, 1, 1),
(85, 1, 2),
(86, 1, 2),
(87, 1, 3),
(88, 1, 0),
(89, 1, 0),
(90, 1, 0),
(91, 1, 0),
(92, 1, 1),
(93, 1, 1),
(93, 2, 3),
(94, 1, 0),
(94, 2, 0),
(95, 1, 0),
(95, 2, 0),
(96, 1, 2),
(96, 2, 4),
(97, 1, 4),
(97, 2, 4),
(98, 1, 3),
(99, 1, 0),
(100, 1, 2),
(100, 2, 2),
(101, 1, 1),
(101, 2, 1),
(101, 3, 1),
(101, 4, 4),
(101, 4, 4),
(102, 2, 1),
(102, 3, 1),
(103, 1, 1),
(103, 3, 2),
(103, 4, 3),
(103, 4, 3),
(104, 1, 2),
(104, 3, 1),
(105, 1, 1),
(105, 2, 1),
(106, 1, 1),
(106, 2, 1),
(107, 1, 1),
(107, 2, 4),
(108, 1, 1),
(108, 2, 4),
(109, 1, 1),
(109, 2, 4),
(110, 1, 1),
(110, 2, 4),
(111, 1, 1),
(111, 2, 4),
(112, 1, 1),
(112, 2, 4),
(113, 1, 1),
(113, 2, 4),
(114, 1, 1),
(114, 2, 4),
(115, 1, 1),
(115, 2, 4),
(116, 1, 1),
(116, 2, 4),
(117, 1, 1),
(117, 2, 4),
(118, 1, 1),
(118, 2, 4),
(119, 1, 1),
(119, 2, 4),
(120, 1, 1),
(120, 2, 4),
(121, 1, 2),
(122, 2, 1),
(122, 6, 1),
(133, 1, 1),
(133, 2, 2),
(133, 3, 2),
(134, 1, 4),
(135, 1, 4),
(136, 1, 4),
(137, 1, 1),
(137, 2, 2),
(137, 8, 1),
(137, 9, 2),
(137, 1, 3),
(137, 2, 2),
(137, 7, 2),
(137, 1, 1),
(137, 5, 1),
(137, 6, 1),
(137, 2, 3),
(137, 2, 1),
(137, 3, 1),
(141, 1, 3),
(141, 2, 2),
(141, 3, 1),
(141, 4, 2),
(142, 9, 1),
(142, 10, 2),
(142, 11, 3),
(142, 7, 2),
(143, 1, 1),
(143, 2, 1),
(143, 3, 2),
(143, 6, 2),
(144, 1, 11),
(144, 2, 1),
(144, 3, 4),
(144, 19, 3),
(145, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(5) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `stock`) VALUES
(1, 'shelby burger', 20),
(2, 'viper burger', 0),
(3, 'tiger burger', 10),
(4, 'nashe v5 burger', 98),
(5, 'pollo frito', 67),
(6, 'papas con cheddar', 124),
(7, 'rabas', 43),
(8, 'coca cola', 158),
(9, 'fanta', 133),
(10, 'sprite', 140),
(11, 'brother aa', 120),
(19, 'DZ burger', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `id_prueba` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_cliente` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`id_prueba`, `name`, `id_cliente`) VALUES
(1, 'Jose', 0),
(2, 'asd', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_pedido` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `fecha`, `id_pedido`) VALUES
(1, '0000-00-00 00:00:00', 104),
(2, '2022-10-15 01:20:38', 100),
(3, '2022-09-15 01:20:38', 95),
(4, '2022-10-16 01:08:52', 105),
(5, '2022-10-16 01:09:44', 106),
(6, '2022-10-16 01:10:25', 107),
(7, '2022-10-16 01:11:53', 108),
(8, '2022-10-16 01:18:33', 109),
(9, '2022-10-16 01:19:13', 110),
(10, '2022-10-16 01:19:58', 111),
(11, '2022-10-16 01:20:34', 112),
(12, '2022-10-16 01:20:36', 113),
(13, '2022-10-16 01:20:44', 114),
(14, '2022-10-16 01:20:45', 115),
(15, '2022-10-16 01:20:46', 116),
(16, '2022-10-16 01:21:13', 117),
(17, '2022-10-16 01:21:14', 118),
(18, '2022-10-16 01:22:09', 119),
(19, '2022-10-16 01:22:28', 120),
(20, '2022-10-17 03:28:32', 121),
(21, '2022-10-17 03:29:40', 122),
(23, '2022-10-17 07:46:49', 123),
(27, '2022-10-17 07:53:50', 124),
(28, '2022-10-17 07:54:15', 125),
(29, '2022-10-17 07:54:51', 126),
(30, '2022-10-18 09:41:34', 127),
(32, '2022-10-19 12:28:42', 128),
(33, '2022-10-19 12:29:50', 129),
(34, '2022-10-19 12:41:55', 130),
(35, '2022-10-19 12:43:33', 131),
(36, '2022-10-19 09:19:31', 132),
(37, '2022-10-21 08:39:17', 143),
(38, '2022-10-21 08:39:17', 143),
(39, '2022-10-21 08:39:17', 143),
(40, '2022-10-21 08:39:17', 143),
(41, '2022-10-25 09:47:38', 144),
(42, '2022-10-25 09:47:38', 144),
(43, '2022-10-25 09:47:38', 144),
(44, '2022-10-25 09:47:38', 144),
(45, '2022-10-25 09:56:41', 145);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes_registrados`
--
ALTER TABLE `clientes_registrados`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `gerentes`
--
ALTER TABLE `gerentes`
  ADD PRIMARY KEY (`id_gerente`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `menu_productos`
--
ALTER TABLE `menu_productos`
  ADD KEY `fk_id_producto.productos` (`id_producto`),
  ADD KEY `fk_menu_menuProductos` (`id_menu`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk.id_cliente.clientesRegistrados` (`id_cliente`),
  ADD KEY `fk.id_pago.pago` (`id_pago`);

--
-- Indices de la tabla `pedido_menu`
--
ALTER TABLE `pedido_menu`
  ADD KEY `fk_id_menu.menu` (`id_menu`),
  ADD KEY `fk_idpedido.pedido` (`id_pedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `prueba`
--
ALTER TABLE `prueba`
  ADD PRIMARY KEY (`id_prueba`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_id_pedido.pedido` (`id_pedido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes_registrados`
--
ALTER TABLE `clientes_registrados`
  MODIFY `id_cliente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `gerentes`
--
ALTER TABLE `gerentes`
  MODIFY `id_gerente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `prueba`
--
ALTER TABLE `prueba`
  MODIFY `id_prueba` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `menu_productos`
--
ALTER TABLE `menu_productos`
  ADD CONSTRAINT `fk_id_producto.productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_menuProductos` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk.id_cliente.clientesRegistrados` FOREIGN KEY (`id_cliente`) REFERENCES `clientes_registrados` (`id_cliente`),
  ADD CONSTRAINT `fk.id_pago.pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`);

--
-- Filtros para la tabla `pedido_menu`
--
ALTER TABLE `pedido_menu`
  ADD CONSTRAINT `fk_id_menu.menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `fk_idpedido.pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_id_pedido.pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
