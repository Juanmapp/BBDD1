-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema la_aprobacion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema la_aprobacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `la_aprobacion` DEFAULT CHARACTER SET utf8 ;
USE `la_aprobacion` ;

-- -----------------------------------------------------
-- Table `la_aprobacion`.`tpo_de_habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`tpo_de_habitaciones` (
  `id_tipo_de_habitaciones` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo_de_habitaciones` VARCHAR(45) NOT NULL,
  `costo` FLOAT NOT NULL,
  PRIMARY KEY (`id_tipo_de_habitaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`estado` (
  `id_estado` TINYINT NOT NULL AUTO_INCREMENT,
  `estado_empleado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`sector` (
  `id_sector` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo_de_sector` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`pais` (
  `id_pais` TINYINT NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`empleados` (
  `legajo` INT NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `documento` INT NOT NULL,
  `fecha_de_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `id_estado` TINYINT NOT NULL,
  `id_sector` TINYINT NOT NULL,
  `id_pais` TINYINT NOT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE INDEX `legajo_UNIQUE` (`legajo` ASC) VISIBLE,
  UNIQUE INDEX `documento_UNIQUE` (`documento` ASC) VISIBLE,
  INDEX `fk_empleados_estado_idx` (`id_estado` ASC) VISIBLE,
  INDEX `fk_empleados_sector1_idx` (`id_sector` ASC) VISIBLE,
  INDEX `fk_empleados_pais1_idx` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `la_aprobacion`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_sector1`
    FOREIGN KEY (`id_sector`)
    REFERENCES `la_aprobacion`.`sector` (`id_sector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_pais1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `la_aprobacion`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`huesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`huesped` (
  `id_huespedes` INT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `pasaporte` INT NOT NULL,
  `fecha_de_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `id_pais` TINYINT NOT NULL,
  PRIMARY KEY (`id_huespedes`),
  UNIQUE INDEX `pasaporte_UNIQUE` (`pasaporte` ASC) VISIBLE,
  INDEX `fk_huespedes_pais1_idx` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_huespedes_pais1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `la_aprobacion`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`formas_de_pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`formas_de_pagos` (
  `id_formas_de_pagos` TINYINT NOT NULL,
  `tipo_de_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_formas_de_pagos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`check_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`check_in` (
  `id_check_in` INT NOT NULL,
  `fecha_de_entrada` DATETIME NOT NULL,
  `fecha_de_salida` DATETIME NOT NULL,
  `importe` FLOAT NOT NULL,
  `id_formas_de_pagos` TINYINT NOT NULL,
  `id_huespedes` INT NOT NULL,
  PRIMARY KEY (`id_check_in`),
  INDEX `fk_check_in_formas_de_pagos1_idx` (`id_formas_de_pagos` ASC) VISIBLE,
  INDEX `fk_check_in_huesped1_idx` (`id_huespedes` ASC) VISIBLE,
  CONSTRAINT `fk_check_in_formas_de_pagos1`
    FOREIGN KEY (`id_formas_de_pagos`)
    REFERENCES `la_aprobacion`.`formas_de_pagos` (`id_formas_de_pagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_check_in_huesped1`
    FOREIGN KEY (`id_huespedes`)
    REFERENCES `la_aprobacion`.`huesped` (`id_huespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`decoracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`decoracion` (
  `id_decoracion` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo_de_decoracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_decoracion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`habitacion` (
  `id_habitacion` INT NOT NULL AUTO_INCREMENT,
  `capacidad_max` TINYINT NOT NULL,
  `servicios_basicos` VARCHAR(100) NOT NULL,
  `id_tipo_de_habitaciones` TINYINT NOT NULL,
  `id_decoracion` TINYINT NOT NULL,
  PRIMARY KEY (`id_habitacion`),
  INDEX `fk_habitacion_tpo_de_habitaciones1_idx` (`id_tipo_de_habitaciones` ASC) VISIBLE,
  INDEX `fk_habitacion_decoracion1_idx` (`id_decoracion` ASC) VISIBLE,
  CONSTRAINT `fk_habitacion_tpo_de_habitaciones1`
    FOREIGN KEY (`id_tipo_de_habitaciones`)
    REFERENCES `la_aprobacion`.`tpo_de_habitaciones` (`id_tipo_de_habitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitacion_decoracion1`
    FOREIGN KEY (`id_decoracion`)
    REFERENCES `la_aprobacion`.`decoracion` (`id_decoracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`reserva` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `tipo_reserva` VARCHAR(45) NOT NULL,
  `fecha_y_hora` DATETIME NOT NULL,
  `cantidad_de_horas` FLOAT NOT NULL,
  `importe` FLOAT NOT NULL,
  `id_formas_de_pagos` TINYINT NOT NULL,
  `id_huespedes` INT NOT NULL,
  PRIMARY KEY (`id_reserva`),
  INDEX `fk_reserva_formas_de_pagos1_idx` (`id_formas_de_pagos` ASC) VISIBLE,
  INDEX `fk_reserva_huesped1_idx` (`id_huespedes` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_formas_de_pagos1`
    FOREIGN KEY (`id_formas_de_pagos`)
    REFERENCES `la_aprobacion`.`formas_de_pagos` (`id_formas_de_pagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_huesped1`
    FOREIGN KEY (`id_huespedes`)
    REFERENCES `la_aprobacion`.`huesped` (`id_huespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`servicios_extras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`servicios_extras` (
  `id_servicios_extras` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo_de_servicios` VARCHAR(45) NOT NULL,
  `adicional_por_hora` FLOAT NOT NULL,
  `id_reserva` INT NOT NULL,
  PRIMARY KEY (`id_servicios_extras`),
  INDEX `fk_servicios_extras_reserva1_idx` (`id_reserva` ASC) VISIBLE,
  CONSTRAINT `fk_servicios_extras_reserva1`
    FOREIGN KEY (`id_reserva`)
    REFERENCES `la_aprobacion`.`reserva` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`huesped_x_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`huesped_x_habitacion` (
  `id_huesped_x_habitacioncol` INT NOT NULL AUTO_INCREMENT,
  `id_huespedes` INT NOT NULL,
  `id_habitacion` INT NOT NULL,
  INDEX `fk_huesped_has_habitacion_habitacion1_idx` (`id_habitacion` ASC) VISIBLE,
  INDEX `fk_huesped_has_habitacion_huesped1_idx` (`id_huespedes` ASC) VISIBLE,
  PRIMARY KEY (`id_huesped_x_habitacioncol`),
  CONSTRAINT `fk_huesped_has_habitacion_huesped1`
    FOREIGN KEY (`id_huespedes`)
    REFERENCES `la_aprobacion`.`huesped` (`id_huespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_huesped_has_habitacion_habitacion1`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `la_aprobacion`.`habitacion` (`id_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`servicios_basicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`servicios_basicos` (
  `id_servicios_basicos` INT NOT NULL AUTO_INCREMENT,
  `tipo_de_servicios` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_servicios_basicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `la_aprobacion`.`servicios_basicos_x_habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_aprobacion`.`servicios_basicos_x_habitacion` (
  `id_servicios_basicos_x_habitacion` INT NOT NULL AUTO_INCREMENT,
  `id_servicios_basicos` INT NOT NULL,
  `id_habitacion` INT NOT NULL,
  INDEX `fk_servicios_basicos_has_habitacion_habitacion1_idx` (`id_habitacion` ASC) VISIBLE,
  INDEX `fk_servicios_basicos_has_habitacion_servicios_basicos1_idx` (`id_servicios_basicos` ASC) VISIBLE,
  PRIMARY KEY (`id_servicios_basicos_x_habitacion`),
  CONSTRAINT `fk_servicios_basicos_has_habitacion_servicios_basicos1`
    FOREIGN KEY (`id_servicios_basicos`)
    REFERENCES `la_aprobacion`.`servicios_basicos` (`id_servicios_basicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_basicos_has_habitacion_habitacion1`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `la_aprobacion`.`habitacion` (`id_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
