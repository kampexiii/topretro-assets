-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-09-2025 a las 09:44:30
-- Versión del servidor: 10.11.10-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u427060093_topretro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

CREATE TABLE `actores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `biografia` text DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_fallecimiento` date DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  `tipo_principal` varchar(255) DEFAULT NULL COMMENT 'Ej: Actor de Voz, Player, Motion Capture',
  `redes_sociales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`redes_sociales`)),
  `foto_url` varchar(2048) DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `peliculas_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`id`, `nombre`, `slug`, `biografia`, `fecha_nacimiento`, `fecha_fallecimiento`, `nacionalidad`, `tipo_principal`, `redes_sociales`, `foto_url`, `is_popular`, `peliculas_count`, `created_at`, `updated_at`) VALUES
(1, 'Christopher Judge', 'christopher-judge', NULL, NULL, NULL, NULL, 'Actor de voz', NULL, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/actors/christopher-judge/profile.webp', 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(2, 'Sunny Suljic', 'sunny-suljic', NULL, NULL, NULL, NULL, 'Actor de voz', NULL, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/actors/sunny-suljic/profile.webp', 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(3, 'Danielle Bisutti', 'danielle-bisutti', NULL, NULL, NULL, NULL, 'Actriz de voz', NULL, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/actors/danielle-bisutti/profile.webp', 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(4, 'Alastair Duncan', 'alastair-duncan', NULL, NULL, NULL, NULL, 'Actor de voz', NULL, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/actors/alastair-duncan/profile.webp', 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(5, 'Jeremy Davies', 'jeremy-davies', NULL, NULL, NULL, NULL, 'Actor de voz', NULL, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/actors/jeremy-davies/profile.webp', 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes`
--

CREATE TABLE `ajustes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` longtext DEFAULT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'string',
  `grupo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ajustes`
--

INSERT INTO `ajustes` (`id`, `clave`, `valor`, `tipo`, `grupo`, `descripcion`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'TopRetro', 'string', 'general', 'Nombre del sitio mostrado en el header', NULL, '2025-09-03 09:42:39', '2025-09-03 09:42:39'),
(2, 'contact_email', 'support@topretro.es', 'email', 'general', 'Correo de contacto', NULL, '2025-09-03 09:42:39', '2025-09-03 09:42:39'),
(3, 'max_streams', '2', 'int', 'streaming', 'Máx. reproducciones simultáneas', NULL, '2025-09-03 09:42:39', '2025-09-03 09:42:39'),
(4, 'envio_emails', '1', 'bool', 'notificaciones', 'Habilita el envío de emails', NULL, '2025-09-03 09:42:39', '2025-09-03 09:42:39'),
(5, 'modo_mantenimiento', '0', 'bool', 'general', 'Modo mantenimiento (UI)', NULL, '2025-09-03 09:42:39', '2025-09-03 09:42:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banda_sonora_tracks`
--

CREATE TABLE `banda_sonora_tracks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `compositor` varchar(255) DEFAULT NULL,
  `numero_pista` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `duracion_segundos` int(10) UNSIGNED DEFAULT NULL,
  `audio_url` varchar(2048) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `valor` tinyint(3) UNSIGNED NOT NULL COMMENT 'Puntuación de 1 a 10',
  `comentario` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo` enum('genero','plataforma','franquicia','coleccion','otro') NOT NULL DEFAULT 'genero',
  `imagen_url` varchar(2048) DEFAULT NULL,
  `orden` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `peliculas_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `parent_id`, `nombre`, `slug`, `descripcion`, `tipo`, `imagen_url`, `orden`, `is_featured`, `peliculas_count`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Acción', 'accion', NULL, 'genero', NULL, 0, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(2, NULL, 'Aventura', 'aventura', NULL, 'genero', NULL, 0, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(3, NULL, 'Fantasía', 'fantasia', NULL, 'genero', NULL, 0, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(4, NULL, 'PlayStation', 'playstation', NULL, 'plataforma', NULL, 0, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(5, NULL, 'God of War', 'god-of-war', NULL, 'franquicia', NULL, 0, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `biografia` text DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  `estilo_direccion` varchar(255) DEFAULT NULL COMMENT 'Ej: Cinematográfico, Estratégico',
  `premios_destacados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`premios_destacados`)),
  `redes_sociales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`redes_sociales`)),
  `foto_url` varchar(2048) DEFAULT NULL,
  `is_aclamado` tinyint(1) NOT NULL DEFAULT 0,
  `peliculas_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`id`, `nombre`, `slug`, `biografia`, `fecha_nacimiento`, `nacionalidad`, `estilo_direccion`, `premios_destacados`, `redes_sociales`, `foto_url`, `is_aclamado`, `peliculas_count`, `created_at`, `updated_at`) VALUES
(1, 'Kratosworld', 'kratosworld', NULL, NULL, NULL, NULL, NULL, '{\"youtube\": \"https://www.youtube.com/@Kratosworld\"}', NULL, 0, 0, '2025-09-02 15:45:20', '2025-09-02 15:45:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos_usuario`
--

CREATE TABLE `dispositivos_usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `device_name` varchar(255) DEFAULT NULL COMMENT 'Ej: "Chrome en Windows", "iPhone de Pablo"',
  `device_type` enum('web','desktop','mobile','tablet','tv','console','otro') NOT NULL DEFAULT 'web',
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_streaming` tinyint(1) NOT NULL DEFAULT 0,
  `streaming_started_at` timestamp NULL DEFAULT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL COMMENT 'Si tiene fecha, la sesión está revocada',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `added_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Para tu lógica de ordenación en el boot()',
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Para las funciones pin() y unpin()',
  `notify_new_content` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Para las funciones de notificación',
  `category` varchar(255) DEFAULT NULL COMMENT 'Para el scope byCategory()',
  `notes` text DEFAULT NULL COMMENT 'Para las notas personales del usuario',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_tecnicas`
--

CREATE TABLE `ficha_tecnicas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `desarrollador` varchar(255) DEFAULT NULL,
  `distribuidor` varchar(255) DEFAULT NULL,
  `motor_juego` varchar(255) DEFAULT NULL COMMENT 'Ej: Unreal Engine 5, Unity',
  `plataformas_lanzamiento` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`plataformas_lanzamiento`)),
  `anuncio_oficial` date DEFAULT NULL,
  `lanzamiento_inicial` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_peliculas`
--

CREATE TABLE `galeria_peliculas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `imagen_url` varchar(2048) NOT NULL,
  `leyenda` varchar(255) DEFAULT NULL COMMENT 'Descripción o caption de la imagen',
  `tipo` enum('screenshot','arte_conceptual','poster','detras_de_camaras','otro') NOT NULL DEFAULT 'screenshot',
  `orden` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Para ordenar la galería',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `galeria_peliculas`
--

INSERT INTO `galeria_peliculas` (`id`, `pelicula_id`, `imagen_url`, `leyenda`, `tipo`, `orden`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/01.webp', 'Captura 01', 'screenshot', 1, NULL, NULL),
(2, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/02.webp', 'Captura 02', 'screenshot', 2, NULL, NULL),
(3, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/03.webp', 'Captura 03', 'screenshot', 3, NULL, NULL),
(4, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/04.webp', 'Captura 04', 'screenshot', 4, NULL, NULL),
(5, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/05.webp', 'Captura 05', 'screenshot', 5, NULL, NULL),
(6, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/06.webp', 'Captura 06', 'screenshot', 6, NULL, NULL),
(7, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/07.webp', 'Captura 07', 'screenshot', 7, NULL, NULL),
(8, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/08.webp', 'Captura 08', 'screenshot', 8, NULL, NULL),
(9, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/09.webp', 'Captura 09', 'screenshot', 9, NULL, NULL),
(10, 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/gallery/10.webp', 'Captura 10', 'screenshot', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_visualizacion`
--

CREATE TABLE `historial_visualizacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `progreso` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Porcentaje de visualización de 0 a 100',
  `completado` tinyint(1) NOT NULL DEFAULT 0,
  `ultima_vista` timestamp NULL DEFAULT NULL,
  `position_seconds` int(10) UNSIGNED DEFAULT NULL COMMENT 'Segundo exacto donde se detuvo',
  `duration_seconds` int(10) UNSIGNED DEFAULT NULL COMMENT 'Duración total del video en el momento de la visualización',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_visualizacion`
--

INSERT INTO `historial_visualizacion` (`id`, `user_id`, `pelicula_id`, `progreso`, `completado`, `ultima_vista`, `position_seconds`, `duration_seconds`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, '2025-09-05 11:42:14', NULL, NULL, '2025-09-04 18:51:37', '2025-09-05 11:42:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(24) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `pelicula_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dispositivo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `suscripcion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asunto` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `prioridad` enum('baja','media','alta','critica') NOT NULL DEFAULT 'media',
  `estado` enum('abierta','en_curso','resuelta','cerrada','archivada') NOT NULL DEFAULT 'abierta',
  `tipo` enum('tecnico','cuenta','pago','reporte_contenido','sugerencia','otro') NOT NULL DEFAULT 'tecnico',
  `canal` enum('web','email','sistema','app') NOT NULL DEFAULT 'web',
  `categoria` varchar(80) DEFAULT NULL,
  `subcategoria` varchar(80) DEFAULT NULL,
  `impacto` tinyint(3) UNSIGNED DEFAULT NULL,
  `urgencia` tinyint(3) UNSIGNED DEFAULT NULL,
  `sla_vencimiento_at` datetime DEFAULT NULL,
  `asignada_a_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mensajes_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `adjuntos_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ultima_respuesta_por` enum('user','staff') DEFAULT NULL,
  `ultima_respuesta_at` datetime DEFAULT NULL,
  `reabierta_at` datetime DEFAULT NULL,
  `cerrada_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_adjuntos`
--

CREATE TABLE `incidencia_adjuntos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incidencia_id` bigint(20) UNSIGNED NOT NULL,
  `mensaje_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(512) NOT NULL,
  `filename` varchar(191) DEFAULT NULL,
  `mime` varchar(100) DEFAULT NULL,
  `size_bytes` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_etiqueta`
--

CREATE TABLE `incidencia_etiqueta` (
  `incidencia_id` bigint(20) UNSIGNED NOT NULL,
  `etiqueta_id` bigint(20) UNSIGNED NOT NULL,
  `added_by_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_etiquetas`
--

CREATE TABLE `incidencia_etiquetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `slug` varchar(60) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_eventos`
--

CREATE TABLE `incidencia_eventos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incidencia_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_evento` enum('crear','cambiar_estado','cambiar_prioridad','asignar','etiquetar','reabrir','cerrar','comentario','adjunto') NOT NULL,
  `de` text DEFAULT NULL,
  `a` text DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia_mensajes`
--

CREATE TABLE `incidencia_mensajes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incidencia_id` bigint(20) UNSIGNED NOT NULL,
  `author_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `es_staff` tinyint(1) NOT NULL DEFAULT 0,
  `visibilidad` enum('publico','interno') NOT NULL DEFAULT 'publico',
  `mensaje` longtext NOT NULL,
  `attachments_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interaction_tables`
--

CREATE TABLE `interaction_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas_personalizadas`
--

CREATE TABLE `listas_personalizadas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `poster_url` varchar(2048) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `likes_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `items_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `listas_personalizadas`
--

INSERT INTO `listas_personalizadas` (`id`, `user_id`, `name`, `slug`, `description`, `poster_url`, `is_public`, `is_pinned`, `color`, `icon`, `likes_count`, `items_count`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mi Lista', 'mi-lista', 'Favoritos', NULL, 0, 1, NULL, 'star', 0, 0, '2025-09-04 20:20:38', '2025-09-04 20:20:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_personalizada_items`
--

CREATE TABLE `lista_personalizada_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lista_id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `added_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lista_personalizada_items`
--

INSERT INTO `lista_personalizada_items` (`id`, `lista_id`, `pelicula_id`, `added_order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-09-04 20:20:38', '2025-09-04 20:20:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logros`
--

CREATE TABLE `logros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `icono_url` varchar(2048) DEFAULT NULL,
  `puntos_xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rareza` enum('comun','raro','epico','legendario') NOT NULL DEFAULT 'comun',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logro_user`
--

CREATE TABLE `logro_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `logro_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_08_29_135249_create_users_table', 1),
(2, '2025_08_29_135251_create_peliculas_table', 1),
(3, '2025_08_29_135257_create_categorias_table', 1),
(4, '2025_08_29_135257_create_personas_table', 1),
(5, '2025_08_29_135258_create_suscripcions_table', 1),
(6, '2025_08_29_135340_create_interaction_tables', 1),
(7, '2025_08_29_144107_create_pelicula_categoria_table', 1),
(8, '2025_08_29_144618_create_actores_table', 1),
(9, '2025_08_29_144622_create_pelicula_reparto_table', 1),
(10, '2025_08_29_145114_create_directores_table', 1),
(11, '2025_08_29_145119_create_pelicula_director_table', 1),
(12, '2025_08_29_145335_create_paises_table', 1),
(13, '2025_08_29_145342_create_pelicula_pais_table', 1),
(14, '2025_08_29_145904_create_galeria_peliculas_table', 1),
(15, '2025_08_29_150011_create_temporadas_table', 1),
(16, '2025_08_29_150128_create_ficha_tecnicas_table', 1),
(17, '2025_08_29_150131_create_calificaciones_table', 1),
(18, '2025_08_29_150409_create_likes_table', 1),
(19, '2025_08_29_150413_create_favoritos_table', 1),
(20, '2025_08_29_163912_create_historial_visualizacion_table', 1),
(21, '2025_08_29_164923_create_series_table', 1),
(22, '2025_08_29_165030_create_banda_sonora_tracks_table', 1),
(23, '2025_08_29_165034_create_logros_table', 1),
(24, '2025_08_29_165037_create_logro_user_table', 1),
(25, '2025_08_29_170057_create_transacciones_table', 1),
(26, '2025_08_29_172452_create_listas_personalizadas_table', 1),
(27, '2025_08_29_172456_create_lista_personalizada_items_table', 1),
(28, '2025_08_29_172709_create_dispositivos_usuario_table', 1),
(29, '2025_08_29_172843_create_recomendaciones_table', 1),
(30, '2025_08_29_194255_add_avatar_to_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `codigo_iso` varchar(2) NOT NULL COMMENT 'Código ISO 3166-1 alpha-2',
  `continente` varchar(255) DEFAULT NULL,
  `bandera_url` varchar(2048) DEFAULT NULL,
  `peliculas_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `titulo_original` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `sinopsis_corta` text DEFAULT NULL,
  `sinopsis_completa` text DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `duracion_minutos` int(10) UNSIGNED DEFAULT NULL,
  `anio_lanzamiento` year(4) DEFAULT NULL,
  `fecha_estreno` datetime DEFAULT NULL,
  `clasificacion_edad` varchar(255) DEFAULT NULL,
  `calidad_video` varchar(255) DEFAULT NULL,
  `tipo_contenido` varchar(255) DEFAULT NULL COMMENT 'Ej: pelicula, serie',
  `banner_url` text DEFAULT NULL,
  `trailer_url` text DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `poster_url` text DEFAULT NULL,
  `thumbnail_url` text DEFAULT NULL,
  `logo_url` text DEFAULT NULL,
  `video_url_4k` text DEFAULT NULL,
  `video_url_1080p` text DEFAULT NULL,
  `video_url_720p` text DEFAULT NULL,
  `video_url_480p` text DEFAULT NULL,
  `visitas` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `puntuacion_media` double NOT NULL DEFAULT 0,
  `total_votos` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_favoritos` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `idioma_original` varchar(255) DEFAULT NULL,
  `subtitulos_disponibles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`subtitulos_disponibles`)),
  `audio_disponibles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`audio_disponibles`)),
  `es_exclusivo` tinyint(1) NOT NULL DEFAULT 0,
  `es_original` tinyint(1) NOT NULL DEFAULT 0,
  `estado` varchar(255) DEFAULT NULL,
  `presupuesto` decimal(15,2) DEFAULT NULL,
  `recaudacion` decimal(15,2) DEFAULT NULL,
  `ganancias` decimal(15,2) DEFAULT NULL,
  `fecha_agregado` datetime DEFAULT NULL,
  `fecha_actualizado` datetime DEFAULT NULL,
  `fecha_estreno_original` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `titulo_original`, `slug`, `sinopsis_corta`, `sinopsis_completa`, `tagline`, `duracion_minutos`, `anio_lanzamiento`, `fecha_estreno`, `clasificacion_edad`, `calidad_video`, `tipo_contenido`, `banner_url`, `trailer_url`, `video_url`, `poster_url`, `thumbnail_url`, `logo_url`, `video_url_4k`, `video_url_1080p`, `video_url_720p`, `video_url_480p`, `visitas`, `puntuacion_media`, `total_votos`, `total_likes`, `total_favoritos`, `idioma_original`, `subtitulos_disponibles`, `audio_disponibles`, `es_exclusivo`, `es_original`, `estado`, `presupuesto`, `recaudacion`, `ganancias`, `fecha_agregado`, `fecha_actualizado`, `fecha_estreno_original`, `created_at`, `updated_at`) VALUES
(1, 'God of War (2018) — Gameplay Kratosworld', 'God of War (2018)', 'god-of-war-2018', 'Aventura nórdica de Kratos y Atreus. Gameplay completo del canal Kratosworld.', 'Kratos y su hijo Atreus emprenden un viaje por los reinos nórdicos. Captura y edición para visionado continuo.', 'El renacer de Kratos en tierras nórdicas', NULL, '2018', NULL, '16+', '1080p', 'gameplay', 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/banners/hero.webp', NULL, 'https://www.youtube.com/watch?v=mlqQJ9_x5IA', 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/posters/vertical.webp', 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/thumbnails/card.webp', 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/logos/title.webp', NULL, 'https://www.youtube.com/watch?v=mlqQJ9_x5IA', NULL, NULL, 42, 0, 0, 0, 0, 'en', '[\"es-ES\", \"en-US\"]', '[\"es-ES\", \"en-US\"]', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 15:45:20', '2025-09-05 11:42:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_categoria`
--

CREATE TABLE `pelicula_categoria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula_categoria`
--

INSERT INTO `pelicula_categoria` (`id`, `pelicula_id`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_director`
--

CREATE TABLE `pelicula_director` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `director_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula_director`
--

INSERT INTO `pelicula_director` (`id`, `pelicula_id`, `director_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_pais`
--

CREATE TABLE `pelicula_pais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `pais_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_personaje`
--

CREATE TABLE `pelicula_personaje` (
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `personaje_id` bigint(20) UNSIGNED NOT NULL,
  `orden` int(10) UNSIGNED DEFAULT NULL,
  `protagonista` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula_personaje`
--

INSERT INTO `pelicula_personaje` (`pelicula_id`, `personaje_id`, `orden`, `protagonista`) VALUES
(1, 1, 1, 1),
(1, 2, 2, 1),
(1, 3, 3, 0),
(1, 4, 4, 0),
(1, 5, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_reparto`
--

CREATE TABLE `pelicula_reparto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `personaje` varchar(255) DEFAULT NULL,
  `orden` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `es_protagonista` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pelicula_reparto`
--

INSERT INTO `pelicula_reparto` (`id`, `pelicula_id`, `actor_id`, `personaje`, `orden`, `es_protagonista`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Kratos', 1, 1, NULL, NULL),
(2, 1, 2, 'Atreus', 2, 1, NULL, NULL),
(3, 1, 3, 'Freya', 3, 0, NULL, NULL),
(4, 1, 4, 'Mimir', 4, 0, NULL, NULL),
(5, 1, 5, 'Baldur', 5, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `imagen_url` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`id`, `nombre`, `slug`, `actor_id`, `imagen_url`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Kratos', 'kratos', 1, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/characters/kratos/portrait.webp', 'El Fantasma de Esparta, ahora en los reinos nórdicos.', '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(2, 'Atreus', 'atreus', 2, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/characters/atreus/portrait.webp', 'Hijo de Kratos; arquero, curioso y valiente.', '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(3, 'Freya', 'freya', 3, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/characters/freya/portrait.webp', 'Hechicera vana, aliada circunstancial.', '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(4, 'Mimir', 'mimir', 4, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/characters/mimir/portrait.webp', 'La cabeza más sabia de los nueve reinos.', '2025-09-02 15:45:20', '2025-09-02 15:45:20'),
(5, 'Baldur', 'baldur', 5, 'https://cdn.jsdelivr.net/gh/kampexiii/topretro-assets@main/movies/god-of-war-2018/characters/baldur/portrait.webp', 'Antagonista maldito por la invulnerabilidad.', '2025-09-02 15:45:20', '2025-09-02 15:45:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(8,2) NOT NULL DEFAULT 0.00,
  `periodo` enum('mensual','anual') NOT NULL DEFAULT 'mensual',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id`, `slug`, `nombre`, `precio`, `periodo`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'gratis', 'Gratis', 0.00, 'mensual', 1, '2025-09-02 09:43:40', '2025-09-02 09:43:40'),
(2, 'premium', 'Premium', 4.99, 'mensual', 1, '2025-09-02 09:43:40', '2025-09-02 09:43:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones`
--

CREATE TABLE `recomendaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `action` enum('hide','dislike','like','save','view','click') NOT NULL,
  `source` varchar(255) DEFAULT NULL COMMENT 'Origen de la recomendación (homepage, similar, etc.)',
  `score` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Puntuación ponderada de la acción',
  `algorithm_version` varchar(20) DEFAULT NULL COMMENT 'Versión del algoritmo de recomendación usado',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Contexto extra, ej: {"similar_to_id": 123}' CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sinopsis` text DEFAULT NULL,
  `poster_url` varchar(2048) DEFAULT NULL,
  `banner_url` varchar(2048) DEFAULT NULL,
  `logotipo_url` varchar(2048) DEFAULT NULL,
  `fecha_inicio` year(4) DEFAULT NULL,
  `fecha_fin` year(4) DEFAULT NULL,
  `estado` enum('en_emision','finalizada','cancelada') DEFAULT NULL,
  `tipo` enum('saga_principal','spin_off','franquicia','coleccion') NOT NULL DEFAULT 'saga_principal',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `peliculas_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(190) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `precio_mensual` decimal(10,2) DEFAULT NULL,
  `precio_anual` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `features_json` text DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `nombre`, `slug`, `precio_mensual`, `precio_anual`, `descripcion`, `features_json`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Básico', 'basico', 2.99, 29.99, 'Plan básico sin anuncios', '[\"SD\",\"1 dispositivo\"]', 1, '2025-09-02 08:43:54', '2025-09-02 08:43:54'),
(2, 'Estándar', 'estandar', 5.99, 59.99, 'Calidad HD + 2 dispositivos', '[\"HD\",\"2 dispositivos\"]', 1, '2025-09-02 08:43:54', '2025-09-02 08:43:54'),
(3, 'Premium', 'premium', 9.99, 99.99, 'Calidad Full HD + 4 dispositivos', '[\"Full HD\",\"4 dispositivos\",\"Sin anuncios\"]', 1, '2025-09-02 08:43:54', '2025-09-02 08:43:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan` enum('basic','standard','premium','family') NOT NULL DEFAULT 'basic',
  `estado` enum('activa','cancelada','pausada','expirada') NOT NULL DEFAULT 'activa',
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `status` enum('active','suspended','canceled','trial') NOT NULL DEFAULT 'trial',
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `current_period_start` timestamp NULL DEFAULT NULL,
  `current_period_end` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(32) DEFAULT NULL,
  `provider_customer_id` varchar(191) DEFAULT NULL,
  `provider_subscription_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`id`, `user_id`, `plan_id`, `plan`, `estado`, `inicio`, `fin`, `status`, `trial_ends_at`, `current_period_start`, `current_period_end`, `canceled_at`, `created_at`, `updated_at`, `provider`, `provider_customer_id`, `provider_subscription_id`) VALUES
(1, 1, 1, '', 'cancelada', '2025-09-02', NULL, 'trial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, 'basic', 'cancelada', '2025-09-02', NULL, 'trial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 2, 'basic', 'activa', '2025-09-02', NULL, 'trial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE `temporadas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelicula_id` bigint(20) UNSIGNED NOT NULL,
  `numero_temporada` smallint(5) UNSIGNED NOT NULL,
  `titulo` varchar(255) DEFAULT NULL COMMENT 'Título específico de la temporada',
  `sinopsis` text DEFAULT NULL,
  `fecha_estreno` date DEFAULT NULL,
  `poster_url` varchar(2048) DEFAULT NULL,
  `episodios_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `suscripcion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gateway_id` varchar(255) DEFAULT NULL COMMENT 'ID de la transacción en la pasarela de pago (Stripe, etc.)',
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'EUR',
  `tipo` enum('upgrade','downgrade','cancel','resume','charge','refund') NOT NULL,
  `estado` enum('success','failed','pending') NOT NULL DEFAULT 'pending',
  `plan` varchar(255) DEFAULT NULL COMMENT 'Plan asociado en el momento de la transacción',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `xp` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Puntos de experiencia',
  `nivel` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Nivel del usuario',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `is_admin`, `xp`, `nivel`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'kampexiii', 'kampe90@gmail.com', '2025-08-29 17:48:40', '$2y$12$nGWzaWT5YQs4ks/.lUut/.q.vB0ykjYNVkIn6HAi.T/qy78UA5Xg.', 'avatar3.png', 1, 0, 1, NULL, '2025-08-29 17:48:23', '2025-08-29 20:27:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `provider_customer_id` varchar(191) DEFAULT NULL,
  `provider_subscription_id` varchar(191) DEFAULT NULL,
  `status` enum('activa','pausada','cancelada') NOT NULL DEFAULT 'activa',
  `started_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `renews_at` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `plan_id`, `provider_customer_id`, `provider_subscription_id`, `status`, `started_at`, `ends_at`, `renews_at`, `canceled_at`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'cus_SzduqGnaaXu1Ye', NULL, 'activa', '2025-09-02 11:12:00', NULL, NULL, NULL, 'administrador, perpetuo', '2025-09-02 11:12:10', '2025-09-02 11:12:10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actores_slug_unique` (`slug`);

--
-- Indices de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`),
  ADD KEY `idx_ajustes_grupo` (`grupo`),
  ADD KEY `fk_ajustes_user` (`updated_by`);

--
-- Indices de la tabla `banda_sonora_tracks`
--
ALTER TABLE `banda_sonora_tracks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banda_sonora_tracks_pelicula_id_foreign` (`pelicula_id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `calificaciones_user_id_pelicula_id_unique` (`user_id`,`pelicula_id`),
  ADD KEY `calificaciones_pelicula_id_foreign` (`pelicula_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_slug_unique` (`slug`),
  ADD KEY `categorias_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directores_slug_unique` (`slug`);

--
-- Indices de la tabla `dispositivos_usuario`
--
ALTER TABLE `dispositivos_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivos_usuario_user_id_foreign` (`user_id`),
  ADD KEY `dispositivos_usuario_last_seen_at_index` (`last_seen_at`),
  ADD KEY `dispositivos_usuario_revoked_at_index` (`revoked_at`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favoritos_user_id_pelicula_id_unique` (`user_id`,`pelicula_id`),
  ADD KEY `favoritos_pelicula_id_foreign` (`pelicula_id`),
  ADD KEY `favoritos_user_id_added_order_index` (`user_id`,`added_order`);

--
-- Indices de la tabla `ficha_tecnicas`
--
ALTER TABLE `ficha_tecnicas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ficha_tecnicas_pelicula_id_unique` (`pelicula_id`);

--
-- Indices de la tabla `galeria_peliculas`
--
ALTER TABLE `galeria_peliculas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_galeria_pelicula_orden` (`pelicula_id`,`orden`);

--
-- Indices de la tabla `historial_visualizacion`
--
ALTER TABLE `historial_visualizacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `historial_visualizacion_user_id_pelicula_id_unique` (`user_id`,`pelicula_id`),
  ADD KEY `historial_visualizacion_pelicula_id_foreign` (`pelicula_id`),
  ADD KEY `historial_visualizacion_ultima_vista_index` (`ultima_vista`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `idx_incidencias_estado` (`estado`),
  ADD KEY `idx_incidencias_prioridad` (`prioridad`),
  ADD KEY `idx_incidencias_asignada` (`asignada_a_id`),
  ADD KEY `idx_incidencias_user` (`user_id`),
  ADD KEY `idx_incidencias_pelicula` (`pelicula_id`),
  ADD KEY `fk_incidencias_dispositivo` (`dispositivo_id`),
  ADD KEY `fk_incidencias_suscripcion` (`suscripcion_id`);

--
-- Indices de la tabla `incidencia_adjuntos`
--
ALTER TABLE `incidencia_adjuntos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_adj_incidencia` (`incidencia_id`),
  ADD KEY `idx_adj_mensaje` (`mensaje_id`);

--
-- Indices de la tabla `incidencia_etiqueta`
--
ALTER TABLE `incidencia_etiqueta`
  ADD PRIMARY KEY (`incidencia_id`,`etiqueta_id`),
  ADD KEY `fk_tag_etiqueta` (`etiqueta_id`),
  ADD KEY `fk_tag_added_by` (`added_by_user_id`);

--
-- Indices de la tabla `incidencia_etiquetas`
--
ALTER TABLE `incidencia_etiquetas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indices de la tabla `incidencia_eventos`
--
ALTER TABLE `incidencia_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_evt_incidencia` (`incidencia_id`),
  ADD KEY `fk_evt_user` (`user_id`);

--
-- Indices de la tabla `incidencia_mensajes`
--
ALTER TABLE `incidencia_mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mensajes_incidencia` (`incidencia_id`),
  ADD KEY `fk_mensajes_author` (`author_user_id`);

--
-- Indices de la tabla `interaction_tables`
--
ALTER TABLE `interaction_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listas_personalizadas`
--
ALTER TABLE `listas_personalizadas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `listas_personalizadas_slug_unique` (`slug`),
  ADD KEY `listas_personalizadas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `lista_personalizada_items`
--
ALTER TABLE `lista_personalizada_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lista_personalizada_items_lista_id_pelicula_id_unique` (`lista_id`,`pelicula_id`),
  ADD KEY `lista_personalizada_items_pelicula_id_foreign` (`pelicula_id`);

--
-- Indices de la tabla `logros`
--
ALTER TABLE `logros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logros_nombre_unique` (`nombre`);

--
-- Indices de la tabla `logro_user`
--
ALTER TABLE `logro_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logro_user_user_id_logro_id_unique` (`user_id`,`logro_id`),
  ADD KEY `logro_user_logro_id_foreign` (`logro_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paises_nombre_unique` (`nombre`),
  ADD UNIQUE KEY `paises_slug_unique` (`slug`),
  ADD UNIQUE KEY `paises_codigo_iso_unique` (`codigo_iso`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peliculas_slug_unique` (`slug`);

--
-- Indices de la tabla `pelicula_categoria`
--
ALTER TABLE `pelicula_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelicula_categoria_pelicula_id_categoria_id_unique` (`pelicula_id`,`categoria_id`),
  ADD KEY `pelicula_categoria_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `pelicula_director`
--
ALTER TABLE `pelicula_director`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelicula_director_pelicula_id_director_id_unique` (`pelicula_id`,`director_id`),
  ADD KEY `pelicula_director_director_id_foreign` (`director_id`);

--
-- Indices de la tabla `pelicula_pais`
--
ALTER TABLE `pelicula_pais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelicula_pais_pelicula_id_pais_id_unique` (`pelicula_id`,`pais_id`),
  ADD KEY `pelicula_pais_pais_id_foreign` (`pais_id`);

--
-- Indices de la tabla `pelicula_personaje`
--
ALTER TABLE `pelicula_personaje`
  ADD PRIMARY KEY (`pelicula_id`,`personaje_id`),
  ADD KEY `pp_pelicula_idx` (`pelicula_id`),
  ADD KEY `pp_personaje_idx` (`personaje_id`);

--
-- Indices de la tabla `pelicula_reparto`
--
ALTER TABLE `pelicula_reparto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pelicula_reparto_pelicula_id_actor_id_unique` (`pelicula_id`,`actor_id`),
  ADD KEY `pelicula_reparto_actor_id_foreign` (`actor_id`),
  ADD KEY `pelicula_reparto_orden_index` (`orden`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personajes_slug_unique` (`slug`),
  ADD KEY `personajes_actor_id_index` (`actor_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `planes_slug_unique` (`slug`),
  ADD UNIQUE KEY `planes_nombre_unique` (`nombre`);

--
-- Indices de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recomendaciones_pelicula_id_foreign` (`pelicula_id`),
  ADD KEY `recomendaciones_user_id_pelicula_id_index` (`user_id`,`pelicula_id`),
  ADD KEY `recomendaciones_source_index` (`source`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series_slug_unique` (`slug`);

--
-- Indices de la tabla `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_plans_slug_unique` (`slug`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suscripciones_user_idx` (`user_id`),
  ADD KEY `suscripciones_plan_idx` (`plan_id`),
  ADD KEY `suscripciones_provider_customer_idx` (`provider_customer_id`),
  ADD KEY `suscripciones_provider_subscription_idx` (`provider_subscription_id`);

--
-- Indices de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `temporadas_pelicula_id_numero_temporada_unique` (`pelicula_id`,`numero_temporada`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transacciones_user_id_foreign` (`user_id`),
  ADD KEY `transacciones_suscripcion_id_foreign` (`suscripcion_id`),
  ADD KEY `transacciones_gateway_id_index` (`gateway_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_user_idx` (`user_id`),
  ADD KEY `user_subscriptions_plan_idx` (`plan_id`),
  ADD KEY `user_subscriptions_user_status_idx` (`user_id`,`status`),
  ADD KEY `user_subs_provider_customer_idx` (`provider_customer_id`),
  ADD KEY `user_subs_provider_subscription_idx` (`provider_subscription_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actores`
--
ALTER TABLE `actores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `banda_sonora_tracks`
--
ALTER TABLE `banda_sonora_tracks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dispositivos_usuario`
--
ALTER TABLE `dispositivos_usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ficha_tecnicas`
--
ALTER TABLE `ficha_tecnicas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `galeria_peliculas`
--
ALTER TABLE `galeria_peliculas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `historial_visualizacion`
--
ALTER TABLE `historial_visualizacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencia_adjuntos`
--
ALTER TABLE `incidencia_adjuntos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencia_etiquetas`
--
ALTER TABLE `incidencia_etiquetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencia_eventos`
--
ALTER TABLE `incidencia_eventos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencia_mensajes`
--
ALTER TABLE `incidencia_mensajes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interaction_tables`
--
ALTER TABLE `interaction_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listas_personalizadas`
--
ALTER TABLE `listas_personalizadas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lista_personalizada_items`
--
ALTER TABLE `lista_personalizada_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logros`
--
ALTER TABLE `logros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logro_user`
--
ALTER TABLE `logro_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pelicula_categoria`
--
ALTER TABLE `pelicula_categoria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pelicula_director`
--
ALTER TABLE `pelicula_director`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pelicula_pais`
--
ALTER TABLE `pelicula_pais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pelicula_reparto`
--
ALTER TABLE `pelicula_reparto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD CONSTRAINT `fk_ajustes_user` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `banda_sonora_tracks`
--
ALTER TABLE `banda_sonora_tracks`
  ADD CONSTRAINT `banda_sonora_tracks_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificaciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `dispositivos_usuario`
--
ALTER TABLE `dispositivos_usuario`
  ADD CONSTRAINT `dispositivos_usuario_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ficha_tecnicas`
--
ALTER TABLE `ficha_tecnicas`
  ADD CONSTRAINT `ficha_tecnicas_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `galeria_peliculas`
--
ALTER TABLE `galeria_peliculas`
  ADD CONSTRAINT `galeria_peliculas_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_visualizacion`
--
ALTER TABLE `historial_visualizacion`
  ADD CONSTRAINT `historial_visualizacion_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_visualizacion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD CONSTRAINT `fk_incidencias_asignada` FOREIGN KEY (`asignada_a_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencias_dispositivo` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos_usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencias_pelicula` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencias_suscripcion` FOREIGN KEY (`suscripcion_id`) REFERENCES `suscripciones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencias_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `incidencia_adjuntos`
--
ALTER TABLE `incidencia_adjuntos`
  ADD CONSTRAINT `fk_adj_incidencia` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_adj_mensaje` FOREIGN KEY (`mensaje_id`) REFERENCES `incidencia_mensajes` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incidencia_etiqueta`
--
ALTER TABLE `incidencia_etiqueta`
  ADD CONSTRAINT `fk_tag_added_by` FOREIGN KEY (`added_by_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tag_etiqueta` FOREIGN KEY (`etiqueta_id`) REFERENCES `incidencia_etiquetas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tag_incidencia` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `incidencia_eventos`
--
ALTER TABLE `incidencia_eventos`
  ADD CONSTRAINT `fk_evt_incidencia` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_evt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `incidencia_mensajes`
--
ALTER TABLE `incidencia_mensajes`
  ADD CONSTRAINT `fk_mensajes_author` FOREIGN KEY (`author_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mensajes_incidencia` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `listas_personalizadas`
--
ALTER TABLE `listas_personalizadas`
  ADD CONSTRAINT `listas_personalizadas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `lista_personalizada_items`
--
ALTER TABLE `lista_personalizada_items`
  ADD CONSTRAINT `lista_personalizada_items_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `listas_personalizadas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lista_personalizada_items_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `logro_user`
--
ALTER TABLE `logro_user`
  ADD CONSTRAINT `logro_user_logro_id_foreign` FOREIGN KEY (`logro_id`) REFERENCES `logros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `logro_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pelicula_categoria`
--
ALTER TABLE `pelicula_categoria`
  ADD CONSTRAINT `pelicula_categoria_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelicula_categoria_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pelicula_director`
--
ALTER TABLE `pelicula_director`
  ADD CONSTRAINT `pelicula_director_director_id_foreign` FOREIGN KEY (`director_id`) REFERENCES `directores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelicula_director_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pelicula_pais`
--
ALTER TABLE `pelicula_pais`
  ADD CONSTRAINT `pelicula_pais_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelicula_pais_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pelicula_personaje`
--
ALTER TABLE `pelicula_personaje`
  ADD CONSTRAINT `pp_pelicula_fk` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pp_personaje_fk` FOREIGN KEY (`personaje_id`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pelicula_reparto`
--
ALTER TABLE `pelicula_reparto`
  ADD CONSTRAINT `pelicula_reparto_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pelicula_reparto_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `personajes_actor_fk` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD CONSTRAINT `recomendaciones_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recomendaciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD CONSTRAINT `suscripciones_plan_fk` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `suscripciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD CONSTRAINT `temporadas_pelicula_id_foreign` FOREIGN KEY (`pelicula_id`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_suscripcion_id_foreign` FOREIGN KEY (`suscripcion_id`) REFERENCES `suscripciones` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transacciones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_plan_fk` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_subscriptions_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
