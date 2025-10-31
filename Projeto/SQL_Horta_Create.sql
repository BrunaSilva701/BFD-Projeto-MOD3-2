-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema new_schema2
-- -----------------------------------------------------
USE `mydb` ;




-- -----------------------------------------------------
-- Table `mydb`.`Voluntario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Voluntario` (
  `CPF` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Funcao` VARCHAR(20),
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Canteiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Canteiro` (
  `idCanteiro` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Tamanho(m2)` INT NOT NULL,
  PRIMARY KEY (`idCanteiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CultivoPlantio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cultivo_Plantio` (
  `idCultivo` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Voluntario_CPF` INT NOT NULL,
  `Canteiro_idCanteiro` INT NOT NULL,
  `Planta_idPlanta` INT NOT NULL,
  PRIMARY KEY (`idCultivo`),
  FOREIGN KEY (`Voluntario_CPF`) REFERENCES `Voluntario`(`CPF`),
  FOREIGN KEY (`Canteiro_idCanteiro`) REFERENCES `Canteiro`(`idCanteiro`),
  FOREIGN KEY (`Planta_idPlanta`) REFERENCES `Planta`(`idPlanta`)
) ENGINE=InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Planta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Planta` (
  `idPlanta` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` VARCHAR(100) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlanta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Canteiro_has_Planta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Canteiro_has_Planta` (
  `Canteiro_idCanteiro` INT NOT NULL,
  `Planta_idPlanta` INT NOT NULL,
  PRIMARY KEY (`Canteiro_idCanteiro`, `Planta_idPlanta`),
  INDEX `fk_Canteiro_has_Planta_Planta1_idx` (`Planta_idPlanta` ASC) VISIBLE,
  INDEX `fk_Canteiro_has_Planta_Canteiro1_idx` (`Canteiro_idCanteiro` ASC) VISIBLE,
  CONSTRAINT `fk_Canteiro_has_Planta_Canteiro1`
    FOREIGN KEY (`Canteiro_idCanteiro`)
    REFERENCES `mydb`.`Canteiro` (`idCanteiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Canteiro_has_Planta_Planta1`
    FOREIGN KEY (`Planta_idPlanta`)
    REFERENCES `mydb`.`Planta` (`idPlanta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Colheita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Colheita` (
  `idColheita` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME NOT NULL,
  `Quantidade` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Canteiro_idCanteiro` INT NOT NULL,
  PRIMARY KEY (`idColheita`),
  INDEX `fk_Colheita_Canteiro1_idx` (`Canteiro_idCanteiro` ASC) VISIBLE,
  CONSTRAINT `fk_Colheita_Canteiro1`
    FOREIGN KEY (`Canteiro_idCanteiro`)
    REFERENCES `mydb`.`Canteiro` (`idCanteiro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doacao` (
  `idDoacao` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME NOT NULL,
  `Quantidade` VARCHAR(45) NOT NULL,
  `Colheita_idColheita` INT NOT NULL,
  PRIMARY KEY (`idDoacao`),
  INDEX `fk_Doacao_Colheita1_idx` (`Colheita_idColheita` ASC) VISIBLE,
  CONSTRAINT `fk_Doacao_Colheita1`
    FOREIGN KEY (`Colheita_idColheita`)
    REFERENCES `mydb`.`Colheita` (`idColheita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituicao` (
  `CNPJ` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(15) NOT NULL,
  `Instituicao_CNPJ` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Instituicao1_idx` (`Instituicao_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Instituicao1`
    FOREIGN KEY (`Instituicao_CNPJ`)
    REFERENCES `mydb`.`Instituicao` (`CNPJ`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doacao_has_Instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doacao_has_Instituicao` (
  `Doacao_idDoacao` INT NOT NULL,
  `Instituicao_CNPJ` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Doacao_idDoacao`, `Instituicao_CNPJ`),
  INDEX `fk_Doacao_has_Instituicao_Instituicao1_idx` (`Instituicao_CNPJ` ASC) VISIBLE,
  INDEX `fk_Doacao_has_Instituicao_Doacao1_idx` (`Doacao_idDoacao` ASC) VISIBLE,
  CONSTRAINT `fk_Doacao_has_Instituicao_Doacao1`
    FOREIGN KEY (`Doacao_idDoacao`)
    REFERENCES `mydb`.`Doacao` (`idDoacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doacao_has_Instituicao_Instituicao1`
    FOREIGN KEY (`Instituicao_CNPJ`)
    REFERENCES `mydb`.`Instituicao` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `UF` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NOT NULL,
  `Instituicao_CNPJ` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Instituicao_CNPJ`),
  CONSTRAINT `fk_Endereco_copy1_Instituicao1`
    FOREIGN KEY (`Instituicao_CNPJ`)
    REFERENCES `mydb`.`Instituicao` (`CNPJ`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
