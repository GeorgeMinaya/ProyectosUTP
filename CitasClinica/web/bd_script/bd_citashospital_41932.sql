-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2024 a las 07:36:00
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
-- Base de datos: `bd_citashospital_41932`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMedico` (IN `p_ID_Medico` VARCHAR(36), IN `p_Nombre` VARCHAR(100), IN `p_Apellido` VARCHAR(100), IN `p_Email` VARCHAR(100), IN `p_Teléfono` VARCHAR(20))   BEGIN
    UPDATE Medico
    SET Nombre = p_Nombre,
        Apellido = p_Apellido,
        Email = p_Email,
        Teléfono = p_Teléfono
    WHERE ID_Medico = p_ID_Medico;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarConsultorio` (IN `p_Codigo_Consultorio` VARCHAR(50), IN `p_Piso` INT)   BEGIN
    INSERT INTO Consultorio (ID_Consultorio, Codigo_Consultorio, Piso, Fecha_Registro, Activo)
    VALUES (UUID(), p_Codigo_Consultorio, p_Piso, NOW(), 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEspecialidad` (IN `p_Nombre_Especialidad` VARCHAR(100), IN `p_Descripcion` TEXT)   BEGIN
    INSERT INTO Especialidad (ID_Especialidad, Nombre_Especialidad, Descripción, Fecha_Registro, Activo)
    VALUES (UUID(), p_Nombre_Especialidad, p_Descripcion, NOW(), 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMedico` (IN `p_Nombre` VARCHAR(100), IN `p_Apellido` VARCHAR(100), IN `p_CMP` VARCHAR(20), IN `p_ID_Especialidad` VARCHAR(36), IN `p_Teléfono` VARCHAR(20), IN `p_Email` VARCHAR(100), IN `p_Horario_Disponible` VARCHAR(100))   BEGIN
    INSERT INTO Medico (ID_Medico, Nombre, Apellido, CMP, ID_Especialidad, Teléfono, Email, Horario_Disponible, Fecha_Registro, Activo)
    VALUES (UUID(), p_Nombre, p_Apellido, p_CMP, p_ID_Especialidad, p_Teléfono, p_Email, p_Horario_Disponible, NOW(), 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPaciente` (IN `p_DNI` VARCHAR(15), IN `p_Nombre` VARCHAR(100), IN `p_Apellido` VARCHAR(100), IN `p_Fecha_Nacimiento` DATE, IN `p_Direccion` VARCHAR(255), IN `p_Teléfono` VARCHAR(20), IN `p_Email` VARCHAR(100))   BEGIN
    INSERT INTO Paciente (ID_Paciente, DNI, Nombre, Apellido, Fecha_Nacimiento, Dirección, Teléfono, Email, Fecha_Registro, Activo)
    VALUES (UUID(), p_DNI, p_Nombre, p_Apellido, p_Fecha_Nacimiento, p_Direccion, p_Teléfono, p_Email, NOW(), 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuarioMedico` (IN `p_DNI_CMP` VARCHAR(20), IN `p_Password` VARCHAR(250))   BEGIN
    INSERT INTO Usuario (ID_Usuario, DNI_CMP, Password, ID_Rol)
    VALUES (UUID(), p_DNI_CMP, p_Password, '5f75b1c8-a7bc-11ef-8150-a85e45542dfb');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuarioPaciente` (IN `p_DNI_CMP` INT(20), IN `p_Password` INT(250))   BEGIN
    INSERT INTO Usuario (ID_Usuario, DNI_CMP, Password, ID_Rol)
    VALUES (UUID(), p_DNI_CMP, p_Password, '492ba4a3-a7bc-11ef-8150-a85e45542dfb');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MiProcedimiento` ()   BEGIN
    DECLARE soy_un_parametro VARCHAR(10);

    -- Asignar un valor a la variable
    SET soy_un_parametro = 'Hola';

    -- Utilizar la variable
    SELECT soy_un_parametro;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID_Cita` varchar(36) NOT NULL,
  `Fecha_Hora_Cita` datetime NOT NULL,
  `Estado_Cita` varchar(50) NOT NULL,
  `ID_Paciente` varchar(36) DEFAULT NULL,
  `ID_Medico` varchar(36) DEFAULT NULL,
  `ID_Consultorio` varchar(36) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `ID_Consultorio` varchar(36) NOT NULL,
  `Codigo_Consultorio` varchar(50) NOT NULL,
  `Piso` int(11) NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`ID_Consultorio`, `Codigo_Consultorio`, `Piso`, `Fecha_Registro`, `Activo`) VALUES
('099e8086-a7bf-11ef-8150-a85e45542dfb', 'C104', 1, '2024-11-21 05:13:38', 1),
('099e8e0a-a7bf-11ef-8150-a85e45542dfb', 'C105', 1, '2024-11-21 05:13:38', 1),
('5f5cc29f-a7be-11ef-8150-a85e45542dfb', 'C101', 1, '2024-11-21 05:08:29', 1),
('7df9aced-a7bf-11ef-8150-a85e45542dfb', 'C201', 2, '2024-11-21 05:14:48', 1),
('7df9bc88-a7bf-11ef-8150-a85e45542dfb', 'C202', 2, '2024-11-21 05:14:48', 1),
('7df9c988-a7bf-11ef-8150-a85e45542dfb', 'C203', 2, '2024-11-21 05:14:48', 1),
('7df9d701-a7bf-11ef-8150-a85e45542dfb', 'C204', 2, '2024-11-21 05:14:48', 1),
('7df9e591-a7bf-11ef-8150-a85e45542dfb', 'C205', 2, '2024-11-21 05:14:48', 1),
('8f68e3e4-a7be-11ef-8150-a85e45542dfb', 'C102', 1, '2024-11-21 05:09:47', 1),
('8f68ee3a-a7be-11ef-8150-a85e45542dfb', 'C103', 1, '2024-11-21 05:09:47', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `ID_Especialidad` varchar(36) NOT NULL,
  `Nombre_Especialidad` varchar(100) NOT NULL,
  `Descripción` text DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`ID_Especialidad`, `Nombre_Especialidad`, `Descripción`, `Fecha_Registro`, `Activo`) VALUES
('79d07f5a-8db1-11ef-939a-a85e45542dfb', 'Cardiología', 'Especialidad médica que se encarga del estudio y tratamiento del corazón.', '2024-10-18 19:31:26', 1),
('79d65357-8db1-11ef-939a-a85e45542dfb', 'Neurología', 'Rama de la medicina que se ocupa de las enfermedades del sistema nervioso.', '2024-10-18 19:31:26', 1),
('79dd1fb9-8db1-11ef-939a-a85e45542dfb', 'Dermatología', 'Especialidad médica dedicada al estudio de la piel.', '2024-10-18 19:31:26', 1),
('79fac0cb-8db1-11ef-939a-a85e45542dfb', 'Pediatría', 'Especialidad médica que se encarga de la salud de los niños.', '2024-10-18 19:31:26', 1),
('7a0031ec-8db1-11ef-939a-a85e45542dfb', 'Ginecología', 'Especialidad médica que se dedica al cuidado del sistema reproductor femenino.', '2024-10-18 19:31:26', 1),
('7a08adae-8db1-11ef-939a-a85e45542dfb', 'Traumatología', 'Rama de la medicina que estudia las lesiones traumáticas del aparato locomotor.', '2024-10-18 19:31:26', 1),
('7a0f2033-8db1-11ef-939a-a85e45542dfb', 'Oftalmología', 'Especialidad médica que se encarga de las enfermedades de los ojos.', '2024-10-18 19:31:26', 1),
('7a14b60c-8db1-11ef-939a-a85e45542dfb', 'Oncología', 'Rama de la medicina dedicada al diagnóstico y tratamiento del cáncer.', '2024-10-18 19:31:26', 1),
('7a199b98-8db1-11ef-939a-a85e45542dfb', 'Endocrinología', 'Especialidad médica que estudia el sistema endocrino y sus trastornos.', '2024-10-18 19:31:26', 1),
('7a1f739f-8db1-11ef-939a-a85e45542dfb', 'Psiquiatría', 'Rama de la medicina que se ocupa del estudio y tratamiento de trastornos mentales.', '2024-10-18 19:31:26', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_medico`
--

CREATE TABLE `historial_medico` (
  `ID_Historial` varchar(36) NOT NULL,
  `Detalles` text DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `ID_Paciente` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `ID_Medico` varchar(36) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `CMP` varchar(20) NOT NULL,
  `ID_Especialidad` varchar(36) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Horario_Disponible` varchar(100) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`ID_Medico`, `Nombre`, `Apellido`, `CMP`, `ID_Especialidad`, `Teléfono`, `Email`, `Horario_Disponible`, `Fecha_Registro`, `Activo`) VALUES
('1dbb8227-8db2-11ef-939a-a85e45542dfb', 'Juan', 'Pérez', 'CMP001', '79d07f5a-8db1-11ef-939a-a85e45542dfb', '555-1234', 'juan.perez@correo.com', '08:00 - 16:00', '2024-10-18 19:36:01', 1),
('1dc22a94-8db2-11ef-939a-a85e45542dfb', 'Carlos', 'Sánchez', 'CMP002', '79d07f5a-8db1-11ef-939a-a85e45542dfb', '555-2345', 'carlos.sanchez@correo.com', '09:00 - 17:00', '2024-10-18 19:36:01', 1),
('1dc8edc0-8db2-11ef-939a-a85e45542dfb', 'María', 'García', 'CMP003', '79d65357-8db1-11ef-939a-a85e45542dfb', '555-3456', 'maria.garcia@correo.com', '10:00 - 18:00', '2024-10-18 19:36:01', 1),
('1dd7aa21-8db2-11ef-939a-a85e45542dfb', 'Luis', 'Fernández', 'CMP004', '79d65357-8db1-11ef-939a-a85e45542dfb', '555-4567', 'luis.fernandez@correo.com', '08:00 - 14:00', '2024-10-18 19:36:01', 1),
('1dddb851-8db2-11ef-939a-a85e45542dfb', 'Anna', 'Rodriguez', 'CMP005', '79dd1fb9-8db1-11ef-939a-a85e45542dfb', '555-5679', 'ana.rodriguez@correo.com', '14:00 - 20:00', '2024-10-18 19:36:01', 1),
('1df92210-8db2-11ef-939a-a85e45542dfb', 'Márta', 'Gómez', 'CMP007', '79fac0cb-8db1-11ef-939a-a85e45542dfb', '555-7890', 'marta.gomez@correo.com', '08:00 - 16:00', '2024-10-18 19:36:01', 1),
('1dff4c40-8db2-11ef-939a-a85e45542dfb', 'Miguel', 'López', 'CMP008', '7a0031ec-8db1-11ef-939a-a85e45542dfb', '555-8901', 'miguel.lopez@correo.com', '09:00 - 17:00', '2024-10-18 19:36:01', 1),
('1e07b558-8db2-11ef-939a-a85e45542dfb', 'Laura', 'Díaz', 'CMP009', '7a08adae-8db1-11ef-939a-a85e45542dfb', '555-9012', 'laura.diaz@correo.com', '10:00 - 18:00', '2024-10-18 19:36:01', 1),
('407d5737-8e75-11ef-93b1-a85e45542dfb', 'GEORGE', 'MINAYA', 'CMP010', '7a0f2033-8db1-11ef-939a-a85e45542dfb', '983563998', 'Gminaya6524@gmail.com', '', '2024-10-19 18:52:51', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID_Paciente` varchar(36) NOT NULL,
  `DNI` varchar(15) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_Rol` varchar(36) NOT NULL,
  `Nombre_Rol` varchar(100) NOT NULL,
  `Descripción` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_Rol`, `Nombre_Rol`, `Descripción`) VALUES
('0c8d77bb-a7bc-11ef-8150-a85e45542dfb', 'Administrador', 'Administrador del sistema'),
('492ba4a3-a7bc-11ef-8150-a85e45542dfb', 'Paciente', 'Paciente a la espera de atención'),
('5f75b1c8-a7bc-11ef-8150-a85e45542dfb', 'Médico', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` varchar(36) NOT NULL,
  `DNI_CMP` varchar(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ID_Rol` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `DNI_CMP`, `Password`, `ID_Rol`) VALUES
('c1183552-a7bc-11ef-8150-a85e45542dfb', 'admin', 'admin', '0c8d77bb-a7bc-11ef-8150-a85e45542dfb');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID_Cita`),
  ADD KEY `ID_Paciente` (`ID_Paciente`),
  ADD KEY `ID_Medico` (`ID_Medico`),
  ADD KEY `ID_Consultorio` (`ID_Consultorio`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`ID_Consultorio`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`ID_Especialidad`);

--
-- Indices de la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `ID_Paciente` (`ID_Paciente`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`ID_Medico`),
  ADD KEY `ID_Especialidad` (`ID_Especialidad`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID_Paciente`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `ID_Rol` (`ID_Rol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`ID_Paciente`) REFERENCES `paciente` (`ID_Paciente`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`ID_Medico`) REFERENCES `medico` (`ID_Medico`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`ID_Consultorio`) REFERENCES `consultorio` (`ID_Consultorio`);

--
-- Filtros para la tabla `historial_medico`
--
ALTER TABLE `historial_medico`
  ADD CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`ID_Paciente`) REFERENCES `paciente` (`ID_Paciente`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`ID_Especialidad`) REFERENCES `especialidad` (`ID_Especialidad`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `rol` (`ID_Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
