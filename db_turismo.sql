/*
Navicat MySQL Data Transfer

Source Server         : secretaria_postgrado
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : db_turismo

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2023-05-02 11:06:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authassignment`
-- ----------------------------
DROP TABLE IF EXISTS `authassignment`;
CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of authassignment
-- ----------------------------
INSERT INTO `authassignment` VALUES ('administrador', '1', '', 'N;');
INSERT INTO `authassignment` VALUES ('administrador', '3', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '10', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '11', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '12', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '13', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '14', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '15', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '16', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '2', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '3', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '6', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '7', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '8', '', 'N;');
INSERT INTO `authassignment` VALUES ('contador', '9', '', 'N;');

-- ----------------------------
-- Table structure for `authitem`
-- ----------------------------
DROP TABLE IF EXISTS `authitem`;
CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of authitem
-- ----------------------------
INSERT INTO `authitem` VALUES ('administrador', '2', '', '', 'N;');
INSERT INTO `authitem` VALUES ('contador', '2', '', '', 'N;');

-- ----------------------------
-- Table structure for `authitemchild`
-- ----------------------------
DROP TABLE IF EXISTS `authitemchild`;
CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of authitemchild
-- ----------------------------

-- ----------------------------
-- Table structure for `cache`
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `id` char(128) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `value` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('1b930d1878503c5bb88f8af4a92e83d8', '0', 0x613A323A7B693A303B613A323A7B693A303B613A333A7B693A303B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A31373A223C636F6E74726F6C6C65723E2F76696577223B733A31303A227265666572656E636573223B613A313A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B7D733A31323A22726F7574655061747465726E223B733A33303A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F76696577242F75223B733A373A227061747465726E223B733A33393A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C69643E5C642B295C2F242F75223B733A383A2274656D706C617465223B733A31373A223C636F6E74726F6C6C65723E2F3C69643E223B733A363A22706172616D73223B613A313A7B733A323A226964223B733A333A225C642B223B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D693A313B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A31303A227265666572656E636573223B613A323A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B733A363A22616374696F6E223B733A383A223C616374696F6E3E223B7D733A31323A22726F7574655061747465726E223B733A34313A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B29242F75223B733A373A227061747465726E223B733A35363A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B295C2F283F503C69643E5C642B295C2F242F75223B733A383A2274656D706C617465223B733A32363A223C636F6E74726F6C6C65723E2F3C616374696F6E3E2F3C69643E223B733A363A22706172616D73223B613A313A7B733A323A226964223B733A333A225C642B223B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D693A323B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A31303A227265666572656E636573223B613A323A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B733A363A22616374696F6E223B733A383A223C616374696F6E3E223B7D733A31323A22726F7574655061747465726E223B733A34313A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B29242F75223B733A373A227061747465726E223B733A34333A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B295C2F242F75223B733A383A2274656D706C617465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A363A22706172616D73223B613A303A7B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D7D693A313B733A33323A223434393832613234336433633331393564353161616333643333613266363336223B7D693A313B4E3B7D);
INSERT INTO `cache` VALUES ('f7684adfa7e22d829945a7b7d8eed6b9', '0', 0x613A323A7B693A303B613A323A7B693A303B613A333A7B693A303B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A31373A223C636F6E74726F6C6C65723E2F76696577223B733A31303A227265666572656E636573223B613A313A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B7D733A31323A22726F7574655061747465726E223B733A33303A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F76696577242F75223B733A373A227061747465726E223B733A33393A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C69643E5C642B295C2F242F75223B733A383A2274656D706C617465223B733A31373A223C636F6E74726F6C6C65723E2F3C69643E223B733A363A22706172616D73223B613A313A7B733A323A226964223B733A333A225C642B223B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D693A313B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A31303A227265666572656E636573223B613A323A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B733A363A22616374696F6E223B733A383A223C616374696F6E3E223B7D733A31323A22726F7574655061747465726E223B733A34313A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B29242F75223B733A373A227061747465726E223B733A35363A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B295C2F283F503C69643E5C642B295C2F242F75223B733A383A2274656D706C617465223B733A32363A223C636F6E74726F6C6C65723E2F3C616374696F6E3E2F3C69643E223B733A363A22706172616D73223B613A313A7B733A323A226964223B733A333A225C642B223B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D693A323B4F3A383A224355726C52756C65223A31363A7B733A393A2275726C537566666978223B4E3B733A31333A226361736553656E736974697665223B4E3B733A31333A2264656661756C74506172616D73223B613A303A7B7D733A31303A226D6174636856616C7565223B4E3B733A343A2276657262223B4E3B733A31313A2270617273696E674F6E6C79223B623A303B733A353A22726F757465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A31303A227265666572656E636573223B613A323A7B733A31303A22636F6E74726F6C6C6572223B733A31323A223C636F6E74726F6C6C65723E223B733A363A22616374696F6E223B733A383A223C616374696F6E3E223B7D733A31323A22726F7574655061747465726E223B733A34313A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B29242F75223B733A373A227061747465726E223B733A34333A222F5E283F503C636F6E74726F6C6C65723E5C772B295C2F283F503C616374696F6E3E5C772B295C2F242F75223B733A383A2274656D706C617465223B733A32313A223C636F6E74726F6C6C65723E2F3C616374696F6E3E223B733A363A22706172616D73223B613A303A7B7D733A363A22617070656E64223B623A303B733A31313A22686173486F7374496E666F223B623A303B733A31343A220043436F6D706F6E656E74005F65223B4E3B733A31343A220043436F6D706F6E656E74005F6D223B4E3B7D7D693A313B733A33323A223434393832613234336433633331393564353161616333643333613266363336223B7D693A313B4E3B7D);

-- ----------------------------
-- Table structure for `cruge_authassignment`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_authassignment`;
CREATE TABLE `cruge_authassignment` (
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  `itemname` varchar(64) NOT NULL,
  PRIMARY KEY (`userid`,`itemname`),
  KEY `fk_cruge_authassignment_cruge_authitem1` (`itemname`),
  KEY `fk_cruge_authassignment_user` (`userid`),
  CONSTRAINT `cruge_authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `cruge_authitem` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cruge_authassignment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_authassignment
-- ----------------------------

-- ----------------------------
-- Table structure for `cruge_authitem`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_authitem`;
CREATE TABLE `cruge_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_authitem
-- ----------------------------
INSERT INTO `cruge_authitem` VALUES ('action_almacen_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_almacen_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_almacen_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_almacen_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_almacen_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aplicaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_areas_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantecargos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspiranteprioridades_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_area', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_datos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_descartados', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_descartes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_download', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_erase', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_fotos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_general', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_procesados', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_reingreso', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_resumen', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_resumenfecha', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_retorno', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_upload', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aspirantes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_aves_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_calcio_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_campos_visible', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_archivos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_download', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_erase', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_upload', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_capacitaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocapacitaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargocertificaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargoocupaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_cargos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categoriasestablecimientos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_categorias_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasafectaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasafectaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasafectaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasafectaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasafectaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasbajas_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasbajas_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasbajas_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasbajas_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasbajas_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasmuertes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasmuertes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasmuertes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasmuertes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_causasmuertes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_centros_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_certificaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clase_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clase_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clase_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clase_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clase_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_clasificador_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_asociacion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_eliminar', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_licitador', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_list', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_componente_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_addcomprobantes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_admin', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_get_facsimil', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_imagen', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_comprobante_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_calendario', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_creditos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_daysnotification', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_establecimiento', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_formato', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_obtenerincidencia', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_systemcurrentdate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_topaspirantesseleccionados', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_config_viewownactivity', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_download', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_upload', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_contratos_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_correos_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_admin', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugefieldvalue_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_crugepersonalsession_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_dependencias_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaplicacion_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaves_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaves_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaves_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaves_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desgloseaves_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosecriterios_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosehuevos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosehuevos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosehuevos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosehuevos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosehuevos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosemuertes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosemuertes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosemuertes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosemuertes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosemuertes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosepienso_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosepienso_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosepienso_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosepienso_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_desglosepienso_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_adddistritos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_admin', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_distrito_value', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_excludeddistritos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_distritos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_analizador', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_analizadorglobal', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_avanzaroperario', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_cumplimentado', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecucion_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_labor', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ejecutor_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresas_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_autocomplete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_estado', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_listarempresas', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_reporteclientes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_empresa_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_energia_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascapacitaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalascertificaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_escalasocupaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_addestablecimientos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_establecimiento_value', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_excludedestablecimientos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_establecimientos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_facturaciontemp_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_facturaciontemp_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_facturaciontemp_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_facturaciontemp_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_facturaciontemp_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_formas_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_huevos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomasrelevancia_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_idiomas_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_download', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_imagenes_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_actualizar', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_importacion', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_importaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_instrumentos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_items_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_get_precio', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramateriales_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_agregar', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_extraer', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_maestramaterialsubclase_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_materialestarea_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_materialestarea_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_materialestarea_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_materialestarea_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_materialestarea_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_estado', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_produccion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_material_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_muertes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_addmunicipios', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_excludedmunicipios', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_municipios_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_agregar_asociacion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_eliminar_asociacion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_obtenercomponentes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objetocomponente_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_chosen_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_objeto_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ocupaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_organizaciones_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_origen_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_origen_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_origen_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_origen_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_origen_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_partes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_partes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_partes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_partes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_partes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pertenencias_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_pienso_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_calendario', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_generar', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_grafico', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_max_value', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_set_planes_boilerplate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_planes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_agregar', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_desglose', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_extraer', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_reporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_produccion_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_listado', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_seleccion', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productosrecibidos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_listado', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_seleccion', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productossolicitados_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_productos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_actualizarimporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_add_objetos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_create_manual', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_get_facsimil', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_image', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_index_manual', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listaracabados', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listarcontenidos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listarformatos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listarmontajes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listarrevestimientos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_listarsoportes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_obtener_precio', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_printficha', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_update_manual', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_producto_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_add_objetos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_add_productos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_seleccion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_prototipo_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_admin', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proveedor_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_aceptaroferta', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_actualizarimporte', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_analizador', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_oferta', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_printoferta', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_proyecto_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_admision', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_comision', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_list', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_reporteplantilla', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_reporteproceso', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_seleccion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_puntajes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_designacion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_rank_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_servicios_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_change', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_contact', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_error', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_producto', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_site_register', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_addsolicitud', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_calendario', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_closesolicitudactiva', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_generar', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_obtenerincidencia', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_set_solicitudes_boilerplate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_solicitud_value', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_solicitudes_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_materiales', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subclase_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_subitems_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_create_prototype', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_ficha_de_costo', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_get_precio', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_movement', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tarea_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_telefonos_create', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_telefonos_delete', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_telefonos_index', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_telefonos_update', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_telefonos_view', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipospienso_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipospienso_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipospienso_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipospienso_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipospienso_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_reporte', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_tipos_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_uebs_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_uebs_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_uebs_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_uebs_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_uebs_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_editprofile', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_fieldsadmincreate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_fieldsadminlist', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbacajaxsetchilditem', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbacauthitemchilditems', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbacauthitemcreate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbacauthitemupdate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbaclistroles', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbaclisttasks', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_rbacusersassignments', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_sessionadmin', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_systemupdate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_usermanagementadmin', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_ui_usermanagementupdate', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_changeprofile', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_create', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_delete', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_index', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_manageroles', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_update', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('action_usuario_view', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('activos', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('add_parte', '1', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('admin_sistema', '1', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('admision', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('comision', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('consultor', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('Contrato', '2', 'contrato', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_almacen', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_aplicaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_areas', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_aspirantecargos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_aspiranteprioridades', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_aspirantes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_aves', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_calcio', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_campos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_capacitaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_cargocapacitaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_cargocertificaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_cargoocupaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_cargos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_categorias', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_categoriasestablecimientos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_causasafectaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_causasbajas', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_causasmuertes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_centros', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_certificaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_clase', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_clasificador', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_componente', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_comprobante', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_config', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_contratos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_correos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_crugefieldvalue', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_crugepersonalsession', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_dependencias', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desgloseaplicacion', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desgloseaves', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desglosecriterios', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desglosehuevos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desglosemuertes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_desglosepienso', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_distritos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_ejecucion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_ejecutor', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_empresa', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_empresas', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_energia', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_escalascapacitaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_escalascertificaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_escalasocupaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_establecimientos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_facturaciontemp', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_formas', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_huevos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_idiomas', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_idiomasrelevancia', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_imagenes', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_importaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_instrumentos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_items', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_maestramateriales', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_maestramaterialsubclase', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_material', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_materialestarea', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_muertes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_municipios', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_objeto', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_objetocomponente', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_ocupaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_organizaciones', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_origen', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_partes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_pertenencias', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_pienso', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_planes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_produccion', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_producto', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_productos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_productosrecibidos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_productossolicitados', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_prototipo', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_proveedor', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_proyecto', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_puntajes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_rank', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_servicios', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_site', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_solicitudes', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_subclase', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_subitems', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_tarea', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_telefonos', '0', '', null, 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_tipos', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_tipospienso', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_uebs', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('controller_usuario', '0', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('directivo_empresa', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('funcionario_unidad', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('invitados', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('Profesor', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('ranking', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('seleccion', '2', '', '', 'N;');
INSERT INTO `cruge_authitem` VALUES ('trabajadores_activos', '1', '', '', 'N;');

-- ----------------------------
-- Table structure for `cruge_authitemchild`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_authitemchild`;
CREATE TABLE `cruge_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `cruge_authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cruge_authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cruge_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_authitemchild
-- ----------------------------
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aplicaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_areas_view');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_create');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_delete');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantecargos_index');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_update');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantecargos_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantecargos_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantecargos_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspiranteprioridades_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspiranteprioridades_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspiranteprioridades_view');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_datos');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantes_datos');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_delete');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_descartes');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_download');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_download');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantes_download');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_erase');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_erase');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_fotos');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_fotos');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_general');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantes_index');
INSERT INTO `cruge_authitemchild` VALUES ('directivo_empresa', 'action_aspirantes_index');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_aspirantes_procesados');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_procesados');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_procesados');
INSERT INTO `cruge_authitemchild` VALUES ('directivo_empresa', 'action_aspirantes_procesados');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_procesados');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_reingreso');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_resumen');
INSERT INTO `cruge_authitemchild` VALUES ('directivo_empresa', 'action_aspirantes_resumen');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_resumenfecha');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_retorno');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_update');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_update');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_upload');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_upload');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('admision', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('directivo_empresa', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('ranking', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_aspirantes_view');
INSERT INTO `cruge_authitemchild` VALUES ('Profesor', 'action_aves_create');
INSERT INTO `cruge_authitemchild` VALUES ('Profesor', 'action_aves_delete');
INSERT INTO `cruge_authitemchild` VALUES ('Profesor', 'action_aves_index');
INSERT INTO `cruge_authitemchild` VALUES ('Profesor', 'action_aves_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_archivos');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_download');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_capacitaciones_download');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_erase');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_capacitaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_upload');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_capacitaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_capacitaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocapacitaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocapacitaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocapacitaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocapacitaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocertificaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocertificaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargocertificaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargocertificaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargoocupaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargoocupaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargoocupaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargos_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_cargos_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_cargos_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_categorias_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_categorias_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_categorias_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_centros_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_update');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_centros_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_centros_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_certificaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_certificaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_certificaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_clasificador_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_clasificador_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_clasificador_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_calendario');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_config_creditos');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_config_creditos');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_config_creditos');
INSERT INTO `cruge_authitemchild` VALUES ('ranking', 'action_config_creditos');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_config_creditos');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_establecimiento');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_config_formato');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_formato');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_obtenerincidencia');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_config_systemcurrentdate');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_systemcurrentdate');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_config_topaspirantesseleccionados');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_topaspirantesseleccionados');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_config_viewownactivity');
INSERT INTO `cruge_authitemchild` VALUES ('Contrato', 'action_contratos_download');
INSERT INTO `cruge_authitemchild` VALUES ('Contrato', 'action_contratos_index');
INSERT INTO `cruge_authitemchild` VALUES ('Contrato', 'action_contratos_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('Contrato', 'action_contratos_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_dependencias_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desgloseaplicacion_view');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desglosecriterios_create');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_desglosecriterios_create');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_desglosecriterios_create');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_create');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desglosecriterios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_desglosecriterios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_desglosecriterios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desglosecriterios_index');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_desglosecriterios_index');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_desglosecriterios_index');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_index');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desglosecriterios_update');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_desglosecriterios_update');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_desglosecriterios_update');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_update');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_desglosecriterios_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_desglosecriterios_view');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_desglosecriterios_view');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_desglosecriterios_view');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_desglosecriterios_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascapacitaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalascertificaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_escalasocupaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_formas_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_formas_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_formas_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_idiomasrelevancia_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomasrelevancia_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_idiomasrelevancia_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_idiomas_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_idiomas_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_idiomas_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_ocupaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ocupaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_ocupaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_organizaciones_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_admision');
INSERT INTO `cruge_authitemchild` VALUES ('admision', 'action_puntajes_admision');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_puntajes_comision');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_puntajes_index');
INSERT INTO `cruge_authitemchild` VALUES ('add_parte', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('admision', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('ranking', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_puntajes_list');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_puntajes_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_puntajes_reporteplantilla');
INSERT INTO `cruge_authitemchild` VALUES ('trabajadores_activos', 'action_puntajes_reporteplantilla');
INSERT INTO `cruge_authitemchild` VALUES ('activos', 'action_puntajes_reporteproceso');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_puntajes_reporteproceso');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_puntajes_seleccion');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_update');
INSERT INTO `cruge_authitemchild` VALUES ('admision', 'action_puntajes_update');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_puntajes_update');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_puntajes_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_puntajes_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_puntajes_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_rank_index');
INSERT INTO `cruge_authitemchild` VALUES ('ranking', 'action_rank_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_rank_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_rank_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_rank_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_index');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_servicios_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_servicios_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_servicios_view');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_servicios_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_site_index');
INSERT INTO `cruge_authitemchild` VALUES ('invitados', 'action_site_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_subitems_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_create');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_delete');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_index');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_reporte');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_update');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_tipos_view');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'action_ui_editprofile');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'action_ui_editprofile');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_ui_editprofile');
INSERT INTO `cruge_authitemchild` VALUES ('ranking', 'action_ui_editprofile');
INSERT INTO `cruge_authitemchild` VALUES ('seleccion', 'action_ui_editprofile');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_ui_usermanagementadmin');
INSERT INTO `cruge_authitemchild` VALUES ('consultor', 'action_ui_usermanagementupdate');
INSERT INTO `cruge_authitemchild` VALUES ('admin_sistema', 'add_parte');
INSERT INTO `cruge_authitemchild` VALUES ('funcionario_unidad', 'add_parte');
INSERT INTO `cruge_authitemchild` VALUES ('directivo_empresa', 'admin_sistema');
INSERT INTO `cruge_authitemchild` VALUES ('comision', 'trabajadores_activos');

-- ----------------------------
-- Table structure for `cruge_field`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_field`;
CREATE TABLE `cruge_field` (
  `idfield` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(20) NOT NULL,
  `longname` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `required` int(11) DEFAULT '0',
  `fieldtype` int(11) DEFAULT '0',
  `fieldsize` int(11) DEFAULT '20',
  `maxlength` int(11) DEFAULT '45',
  `showinreports` int(11) DEFAULT '0',
  `useregexp` varchar(512) DEFAULT NULL,
  `useregexpmsg` varchar(512) DEFAULT NULL,
  `predetvalue` mediumblob,
  PRIMARY KEY (`idfield`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_field
-- ----------------------------
INSERT INTO `cruge_field` VALUES ('1', 'nombre', 'nombre', '0', '1', '0', '100', '45', '0', '', '', '');
INSERT INTO `cruge_field` VALUES ('2', 'cargo', 'cargo', '0', '1', '3', '20', '45', '1', '', '', 0x332C526573706F6E7361626C652065737461626C6563696D69656E746F0A342C526573706F6E7361626C65205545420A352C526573706F6E7361626C6520656D70726573610A362C41646D696E6973747261646F7220656D70726573610A372C41646D696E6973747261646F722073697374656D610A382C41646D696E6973747261646F72206D756E69636970696F);
INSERT INTO `cruge_field` VALUES ('3', 'area', 'area', '0', '1', '3', '100', '45', '0', '', '', 0x302D302D302D302C20456D70726573610D0A312D312D312D312C2045787465726E6F);
INSERT INTO `cruge_field` VALUES ('4', 'formato', 'formato', '0', '0', '3', '20', '45', '0', '', '', 0x312C546578746F0A322C4353560A332C4A534F4E0A342C457863656C);
INSERT INTO `cruge_field` VALUES ('5', 'establecimiento', 'establecimiento', '0', '0', '0', '20', '45', '0', '', '', '');

-- ----------------------------
-- Table structure for `cruge_fieldvalue`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_fieldvalue`;
CREATE TABLE `cruge_fieldvalue` (
  `idfieldvalue` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `idfield` int(11) NOT NULL,
  `value` blob,
  PRIMARY KEY (`idfieldvalue`),
  KEY `fk_cruge_fieldvalue_cruge_user1` (`iduser`),
  KEY `fk_cruge_fieldvalue_cruge_field1` (`idfield`),
  CONSTRAINT `cruge_fieldvalue_ibfk_1` FOREIGN KEY (`idfield`) REFERENCES `cruge_field` (`idfield`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cruge_fieldvalue_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `cruge_user` (`iduser`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cruge_fieldvalue
-- ----------------------------
INSERT INTO `cruge_fieldvalue` VALUES ('3', '1', '1', 0x5265796E696572);
INSERT INTO `cruge_fieldvalue` VALUES ('5', '1', '2', 0x37);
INSERT INTO `cruge_fieldvalue` VALUES ('6', '1', '3', 0x302D302D302D30);
INSERT INTO `cruge_fieldvalue` VALUES ('39', '1', '4', 0x31);
INSERT INTO `cruge_fieldvalue` VALUES ('51', '1', '5', 0x36);

-- ----------------------------
-- Table structure for `cruge_session`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_session`;
CREATE TABLE `cruge_session` (
  `idsession` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `created` bigint(30) DEFAULT NULL,
  `expire` bigint(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `ipaddress` varchar(45) DEFAULT NULL,
  `usagecount` int(11) DEFAULT '0',
  `lastusage` bigint(30) DEFAULT NULL,
  `logoutdate` bigint(30) DEFAULT NULL,
  `ipaddressout` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsession`),
  KEY `crugesession_iduser` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_session
-- ----------------------------
INSERT INTO `cruge_session` VALUES ('39', '1', '1524368382', '1524411582', '0', '::1', '3', '1524409230', '0', '');
INSERT INTO `cruge_session` VALUES ('40', '1', '1524411891', '1524455091', '0', '::1', '2', '1524447245', '0', '');
INSERT INTO `cruge_session` VALUES ('41', '1', '1524455203', '1524498403', '1', '::1', '1', '1524455203', '0', '');
INSERT INTO `cruge_session` VALUES ('42', '1', '1524525474', '1524568674', '1', '::1', '2', '1524542554', '0', '');
INSERT INTO `cruge_session` VALUES ('43', '1', '1524954992', '1524998192', '1', '::1', '1', '1524954992', '0', '');
INSERT INTO `cruge_session` VALUES ('44', '1', '1525008570', '1525051770', '0', '::1', '1', '1525008570', '1525013558', '::1');
INSERT INTO `cruge_session` VALUES ('45', '1', '1525017644', '1525060844', '0', '::1', '1', '1525017644', '1525038849', '::1');
INSERT INTO `cruge_session` VALUES ('46', '1', '1525038859', '1525082059', '0', '::1', '1', '1525038859', '1525039688', '::1');
INSERT INTO `cruge_session` VALUES ('47', '1', '1525043933', '1525087133', '0', '::1', '1', '1525043933', '1525043973', '::1');
INSERT INTO `cruge_session` VALUES ('48', '1', '1525048391', '1525091591', '0', '::1', '1', '1525048391', '1525049142', '::1');
INSERT INTO `cruge_session` VALUES ('49', '1', '1525049191', '1525092391', '1', '::1', '1', '1525049191', '0', '');
INSERT INTO `cruge_session` VALUES ('50', '1', '1525228293', '1525271493', '1', '::1', '1', '1525228293', '0', '');
INSERT INTO `cruge_session` VALUES ('51', '1', '1525311911', '1525355111', '1', '::1', '1', '1525311911', '0', '');
INSERT INTO `cruge_session` VALUES ('52', '1', '1525617772', '1525660972', '0', '::1', '1', '1525617772', '1525619311', '::1');
INSERT INTO `cruge_session` VALUES ('53', '1', '1525619357', '1525662557', '1', '::1', '1', '1525619357', '0', '');
INSERT INTO `cruge_session` VALUES ('54', '1', '1525878972', '1525922172', '1', '::1', '3', '1525913892', '0', '');
INSERT INTO `cruge_session` VALUES ('55', '1', '1525993482', '1526036682', '1', '::1', '1', '1525993482', '0', '');
INSERT INTO `cruge_session` VALUES ('56', '1', '1526049027', '1526092227', '0', '127.0.0.1', '1', '1526049027', '1526052685', '127.0.0.1');
INSERT INTO `cruge_session` VALUES ('57', '1', '1527173343', '1527216543', '1', '127.0.0.1', '1', '1527173343', '0', '');
INSERT INTO `cruge_session` VALUES ('58', '1', '1527773718', '1527816918', '1', '::1', '1', '1527773718', '0', '');
INSERT INTO `cruge_session` VALUES ('59', '1', '1527822177', '1527865377', '1', '::1', '1', '1527822177', '0', '');
INSERT INTO `cruge_session` VALUES ('60', '1', '1528032108', '1528075308', '1', '::1', '2', '1528063530', '0', '');
INSERT INTO `cruge_session` VALUES ('61', '1', '1528892862', '1528936062', '0', '::1', '1', '1528892862', '0', '');
INSERT INTO `cruge_session` VALUES ('62', '1', '1528936129', '1528979329', '1', '::1', '1', '1528936129', '0', '');
INSERT INTO `cruge_session` VALUES ('63', '1', '1529611849', '1529655049', '1', '::1', '1', '1529611849', '0', '');
INSERT INTO `cruge_session` VALUES ('64', '1', '1530017122', '1530060322', '1', '::1', '1', '1530017122', '0', '');
INSERT INTO `cruge_session` VALUES ('65', '1', '1530375569', '1530418769', '1', '::1', '2', '1530397875', '0', '');
INSERT INTO `cruge_session` VALUES ('66', '1', '1530488688', '1530531888', '1', '::1', '2', '1530500583', '0', '');
INSERT INTO `cruge_session` VALUES ('67', '1', '1530539703', '1530582903', '0', '::1', '3', '1530550498', '0', '');
INSERT INTO `cruge_session` VALUES ('68', '1', '1530584073', '1530627273', '1', '::1', '2', '1530585397', '0', '');
INSERT INTO `cruge_session` VALUES ('69', '1', '1530751388', '1530794588', '1', '::1', '1', '1530751388', '0', '');
INSERT INTO `cruge_session` VALUES ('70', '1', '1530930713', '1530973913', '1', '::1', '1', '1530930713', '0', '');
INSERT INTO `cruge_session` VALUES ('71', '1', '1531270246', '1531313446', '0', '::1', '1', '1531270246', '1531271104', '::1');
INSERT INTO `cruge_session` VALUES ('72', '1', '1531271116', '1531314316', '1', '::1', '1', '1531271116', '0', '');
INSERT INTO `cruge_session` VALUES ('73', '1', '1531359212', '1531402412', '1', '::1', '1', '1531359212', '0', '');
INSERT INTO `cruge_session` VALUES ('74', '1', '1531867385', '1531910585', '0', '::1', '2', '1531872237', '1531872662', '::1');
INSERT INTO `cruge_session` VALUES ('75', '3', '1531872671', '1531915871', '0', '::1', '1', '1531872671', '1531872675', '::1');
INSERT INTO `cruge_session` VALUES ('76', '1', '1531872680', '1531915880', '0', '::1', '1', '1531872680', '1531872703', '::1');
INSERT INTO `cruge_session` VALUES ('77', '3', '1531872711', '1531915911', '0', '::1', '1', '1531872711', '1531872725', '::1');
INSERT INTO `cruge_session` VALUES ('78', '1', '1531872729', '1531915929', '0', '::1', '1', '1531872729', '1531872807', '::1');
INSERT INTO `cruge_session` VALUES ('79', '3', '1531872820', '1531916020', '0', '::1', '1', '1531872820', '1531872823', '::1');
INSERT INTO `cruge_session` VALUES ('80', '1', '1531885873', '1531929073', '0', '::1', '1', '1531885873', '1531885910', '::1');
INSERT INTO `cruge_session` VALUES ('81', '1', '1532117366', '1532160566', '1', '::1', '2', '1532144005', '0', '');
INSERT INTO `cruge_session` VALUES ('82', '1', '1532218925', '1532262125', '1', '::1', '1', '1532218925', '0', '');
INSERT INTO `cruge_session` VALUES ('83', '1', '1532271510', '1532314710', '0', '::1', '1', '1532271510', '0', '');
INSERT INTO `cruge_session` VALUES ('84', '1', '1532315370', '1532358570', '1', '::1', '1', '1532315370', '0', '');
INSERT INTO `cruge_session` VALUES ('85', '1', '1532366706', '1532409906', '1', '::1', '1', '1532366706', '0', '');
INSERT INTO `cruge_session` VALUES ('86', '1', '1532694196', '1532737396', '1', '::1', '1', '1532694196', '0', '');
INSERT INTO `cruge_session` VALUES ('87', '1', '1532742836', '1532786036', '1', '::1', '1', '1532742836', '0', '');
INSERT INTO `cruge_session` VALUES ('88', '1', '1533000376', '1533043576', '1', '::1', '1', '1533000376', '0', '');
INSERT INTO `cruge_session` VALUES ('89', '1', '1533094754', '1533137954', '1', '::1', '1', '1533094754', '0', '');
INSERT INTO `cruge_session` VALUES ('90', '1', '1533170084', '1533213284', '1', '::1', '1', '1533170084', '0', '');
INSERT INTO `cruge_session` VALUES ('91', '1', '1533223733', '1533266933', '0', '::1', '2', '1533261438', '0', '');
INSERT INTO `cruge_session` VALUES ('92', '1', '1533267650', '1533310850', '1', '::1', '1', '1533267650', '0', '');
INSERT INTO `cruge_session` VALUES ('93', '1', '1533349018', '1533392218', '0', '::1', '2', '1533379036', '0', '');
INSERT INTO `cruge_session` VALUES ('94', '1', '1533396026', '1533439226', '0', '::1', '2', '1533428846', '1533435790', '::1');
INSERT INTO `cruge_session` VALUES ('95', '1', '1533474569', '1533517769', '0', '::1', '1', '1533474569', '1533475515', '::1');
INSERT INTO `cruge_session` VALUES ('96', '4', '1533475525', '1533518725', '0', '::1', '1', '1533475525', '1533475616', '::1');
INSERT INTO `cruge_session` VALUES ('97', '1', '1533475621', '1533518821', '0', '::1', '1', '1533475621', '1533475901', '::1');
INSERT INTO `cruge_session` VALUES ('98', '4', '1533475907', '1533519107', '0', '::1', '1', '1533475907', '1533475944', '::1');
INSERT INTO `cruge_session` VALUES ('99', '1', '1533475949', '1533519149', '0', '::1', '1', '1533475949', '1533475984', '::1');
INSERT INTO `cruge_session` VALUES ('100', '4', '1533475991', '1533519191', '0', '::1', '1', '1533475991', '1533476049', '::1');
INSERT INTO `cruge_session` VALUES ('101', '1', '1533476054', '1533519254', '0', '::1', '1', '1533476054', '1533476092', '::1');
INSERT INTO `cruge_session` VALUES ('102', '4', '1533476098', '1533519298', '1', '::1', '4', '1533483503', '0', '');
INSERT INTO `cruge_session` VALUES ('103', '1', '1533477879', '1533521079', '0', '::1', '2', '1533480661', '1533482889', '::1');
INSERT INTO `cruge_session` VALUES ('104', '1', '1533483327', '1533526527', '0', '::1', '1', '1533483327', '1533483347', '::1');
INSERT INTO `cruge_session` VALUES ('105', '1', '1533490000', '1533533200', '1', '::1', '1', '1533490000', '0', '');
INSERT INTO `cruge_session` VALUES ('106', '1', '1533561350', '1533604550', '0', '192.172.182.17', '1', '1533561350', '1533561367', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('107', '1', '1533561379', '1533604579', '0', '192.172.182.17', '1', '1533561379', '1533562027', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('108', '4', '1533562044', '1533605244', '0', '192.172.182.17', '1', '1533562044', '1533563804', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('109', '1', '1533563833', '1533607033', '0', '192.172.182.17', '1', '1533563833', '1533564461', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('110', '5', '1533564471', '1533607671', '0', '192.172.182.17', '1', '1533564471', '1533564847', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('111', '1', '1533564858', '1533608058', '0', '192.172.182.17', '1', '1533564858', '1533564969', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('112', '5', '1533564979', '1533608179', '0', '192.172.182.17', '1', '1533564979', '1533565055', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('113', '1', '1533565066', '1533608266', '0', '192.172.182.17', '1', '1533565066', '1533565139', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('114', '5', '1533565147', '1533608347', '0', '192.172.182.17', '1', '1533565147', '1533565309', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('115', '5', '1533565324', '1533608524', '0', '192.172.182.17', '1', '1533565324', '1533565367', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('116', '1', '1533565402', '1533608602', '0', '192.172.182.17', '1', '1533565402', '1533565746', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('117', '5', '1533565732', '1533608932', '0', '192.172.186.28', '1', '1533565732', '1533566206', '192.172.186.28');
INSERT INTO `cruge_session` VALUES ('118', '1', '1533565904', '1533609104', '0', '192.172.182.17', '2', '1533566108', '1533566860', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('119', '5', '1533566325', '1533609525', '1', '192.172.186.28', '1', '1533566325', '0', '');
INSERT INTO `cruge_session` VALUES ('120', '1', '1533567611', '1533610811', '0', '192.172.182.17', '2', '1533568215', '1533568658', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('121', '1', '1533568672', '1533611872', '0', '192.172.182.22', '1', '1533568672', '1533573245', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('122', '4', '1533573257', '1533616457', '0', '192.172.182.22', '1', '1533573257', '1533574415', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('123', '1', '1533574425', '1533617625', '0', '192.172.182.22', '1', '1533574425', '1533576207', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('124', '1', '1533586185', '1533629385', '0', '192.172.182.22', '1', '1533586185', '1533586966', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('125', '5', '1533644839', '1533688039', '0', '192.172.182.17', '2', '1533651041', '1533651937', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('126', '1', '1533649126', '1533692326', '0', '192.172.182.17', '1', '1533649126', '1533650074', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('127', '4', '1533650085', '1533693285', '0', '192.172.182.17', '1', '1533650085', '1533651030', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('128', '5', '1533651997', '1533695197', '0', '192.172.182.17', '1', '1533651997', '1533652574', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('129', '5', '1533743992', '1533787192', '1', '192.172.186.28', '1', '1533743992', '0', '');
INSERT INTO `cruge_session` VALUES ('130', '1', '1533821484', '1533864684', '1', '192.172.182.17', '1', '1533821484', '0', '');
INSERT INTO `cruge_session` VALUES ('131', '1', '1533913832', '1533957032', '0', '192.172.182.17', '3', '1533914214', '1533916033', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('132', '5', '1533920515', '1533963715', '1', '192.172.186.28', '1', '1533920515', '0', '');
INSERT INTO `cruge_session` VALUES ('133', '1', '1533922215', '1533965415', '0', '192.172.182.22', '1', '1533922215', '1533923275', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('134', '5', '1534171301', '1534214501', '1', '192.172.186.28', '1', '1534171301', '0', '');
INSERT INTO `cruge_session` VALUES ('135', '1', '1534172604', '1534215804', '0', '192.172.182.17', '2', '1534173070', '1534173156', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('136', '1', '1534173189', '1534216389', '0', '192.172.182.22', '2', '1534174060', '1534178879', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('137', '1', '1534192409', '1534235609', '0', '192.172.182.22', '1', '1534192409', '1534193439', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('138', '5', '1534249970', '1534293170', '1', '192.172.186.28', '1', '1534249970', '0', '');
INSERT INTO `cruge_session` VALUES ('139', '1', '1534270772', '1534313972', '0', '192.172.182.100', '1', '1534270772', '1534270872', '192.172.182.100');
INSERT INTO `cruge_session` VALUES ('140', '1', '1534343198', '1534386398', '0', '192.172.182.17', '1', '1534343198', '1534344523', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('141', '4', '1534344539', '1534387739', '0', '192.172.182.17', '1', '1534344539', '1534344588', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('142', '1', '1534344599', '1534387799', '0', '192.172.182.17', '1', '1534344599', '1534344666', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('143', '4', '1534344679', '1534387879', '0', '192.172.182.17', '1', '1534344679', '1534344687', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('144', '1', '1534344696', '1534387896', '0', '192.172.182.17', '1', '1534344696', '1534344820', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('145', '4', '1534344830', '1534388030', '0', '192.172.182.17', '1', '1534344830', '1534344969', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('146', '1', '1534344993', '1534388193', '0', '192.172.182.17', '1', '1534344993', '1534345085', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('147', '4', '1534345096', '1534388296', '0', '192.172.182.17', '1', '1534345096', '1534346449', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('148', '1', '1534432128', '1534475328', '0', '192.172.182.100', '2', '1534432169', '1534433410', '192.172.182.100');
INSERT INTO `cruge_session` VALUES ('149', '1', '1534433476', '1534476676', '0', '192.172.183.179', '3', '1534442094', '1534442140', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('150', '4', '1534442150', '1534485350', '0', '192.172.183.179', '1', '1534442150', '1534442517', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('151', '4', '1534442804', '1534486004', '0', '192.172.183.179', '1', '1534442804', '1534443059', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('152', '1', '1534443071', '1534486271', '0', '192.172.183.179', '1', '1534443071', '1534443148', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('153', '1', '1534443228', '1534486428', '0', '192.172.183.179', '1', '1534443228', '1534443286', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('154', '4', '1534443295', '1534486495', '0', '192.172.183.179', '1', '1534443295', '1534443333', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('155', '1', '1534443350', '1534486550', '0', '192.172.183.179', '1', '1534443350', '1534443370', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('156', '1', '1534447691', '1534490891', '0', '192.172.182.17', '1', '1534447691', '1534449526', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('157', '4', '1534449632', '1534492832', '0', '192.172.182.17', '1', '1534449632', '1534450029', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('158', '1', '1534450044', '1534493244', '0', '192.172.182.17', '1', '1534450044', '0', '');
INSERT INTO `cruge_session` VALUES ('159', '4', '1534774997', '1534818197', '0', '192.172.183.179', '1', '1534774997', '1534775005', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('160', '4', '1534775894', '1534819094', '0', '192.172.183.179', '1', '1534775894', '1534777733', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('161', '4', '1534777979', '1534821179', '0', '192.172.183.179', '1', '1534777979', '1534778975', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('162', '4', '1534781248', '1534824448', '1', '192.172.183.179', '5', '1534794751', '0', '');
INSERT INTO `cruge_session` VALUES ('163', '1', '1534781429', '1534824629', '1', '192.172.182.100', '1', '1534781429', '0', '');
INSERT INTO `cruge_session` VALUES ('164', '4', '1534853497', '1534896697', '0', '192.172.182.22', '2', '1534874037', '1534874561', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('165', '1', '1534874572', '1534917772', '0', '192.172.182.22', '1', '1534874572', '1534881229', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('166', '4', '1534881457', '1534924657', '0', '192.172.182.22', '1', '1534881457', '1534882223', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('167', '1', '1534881524', '1534924724', '0', '192.172.182.17', '1', '1534881524', '1534882016', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('168', '4', '1534882842', '1534926042', '1', '192.172.183.179', '1', '1534882842', '0', '');
INSERT INTO `cruge_session` VALUES ('169', '1', '1534884528', '1534927728', '0', '192.172.182.22', '1', '1534884528', '1534886424', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('170', '4', '1534948569', '1534991769', '1', '192.172.183.179', '1', '1534948569', '0', '');
INSERT INTO `cruge_session` VALUES ('171', '1', '1534951053', '1534994253', '0', '192.172.182.22', '2', '1534958267', '1534960412', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('172', '1', '1534971098', '1535014298', '0', '192.172.182.100', '1', '1534971098', '1534971402', '192.172.182.100');
INSERT INTO `cruge_session` VALUES ('173', '4', '1535037209', '1535080409', '1', '192.172.183.179', '2', '1535038995', '0', '');
INSERT INTO `cruge_session` VALUES ('174', '1', '1535119899', '1535163099', '0', '192.172.182.22', '1', '1535119899', '1535120130', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('175', '4', '1535120139', '1535163339', '0', '192.172.182.22', '1', '1535120139', '1535120175', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('176', '1', '1535120183', '1535163383', '0', '192.172.182.22', '1', '1535120183', '1535120284', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('177', '4', '1535120293', '1535163493', '0', '192.172.182.22', '1', '1535120293', '1535120321', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('178', '1', '1535120329', '1535163529', '0', '192.172.182.29', '2', '1535125589', '1535127802', '192.172.182.29');
INSERT INTO `cruge_session` VALUES ('179', '4', '1535288116', '1535331316', '1', '192.172.183.179', '1', '1535288116', '0', '');
INSERT INTO `cruge_session` VALUES ('180', '4', '1535371515', '1535414715', '1', '192.172.183.179', '3', '1535388280', '0', '');
INSERT INTO `cruge_session` VALUES ('181', '1', '1535425261', '1535468461', '0', '192.172.182.1', '1', '1535425261', '1535425305', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('182', '5', '1535458944', '1535502144', '0', '192.172.186.28', '1', '1535458944', '1535478613', '192.172.186.28');
INSERT INTO `cruge_session` VALUES ('183', '4', '1535460321', '1535503521', '0', '192.172.183.179', '1', '1535460321', '1535461823', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('184', '1', '1535461748', '1535504948', '0', '192.172.182.17', '1', '1535461748', '1535461809', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('185', '1', '1535461859', '1535505059', '0', '192.172.183.179', '1', '1535461859', '1535462037', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('186', '4', '1535462051', '1535505251', '0', '192.172.183.179', '1', '1535462051', '1535463548', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('187', '1', '1535462962', '1535506162', '0', '192.172.182.17', '1', '1535462962', '1535463317', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('188', '4', '1535463591', '1535506791', '0', '192.172.183.179', '1', '1535463591', '1535471293', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('189', '1', '1535465523', '1535508723', '0', '192.172.182.17', '1', '1535465523', '1535466239', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('190', '4', '1535471381', '1535514581', '0', '192.172.183.179', '1', '1535471381', '1535471966', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('191', '4', '1535472483', '1535515683', '0', '192.172.182.22', '4', '1535484610', '1535484945', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('192', '1', '1535474500', '1535517700', '0', '192.172.182.20', '2', '1535475663', '1535477307', '192.172.182.20');
INSERT INTO `cruge_session` VALUES ('193', '1', '1535478624', '1535521824', '0', '192.172.186.28', '1', '1535478624', '1535478693', '192.172.186.28');
INSERT INTO `cruge_session` VALUES ('194', '5', '1535478709', '1535521909', '1', '192.172.186.28', '1', '1535478709', '0', '');
INSERT INTO `cruge_session` VALUES ('195', '4', '1535484955', '1535528155', '0', '192.172.183.179', '2', '1535485236', '1535486753', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('196', '4', '1535488026', '1535531226', '0', '192.172.182.22', '1', '1535488026', '1535488047', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('197', '1', '1535488620', '1535531820', '0', '192.172.182.17', '2', '1535489661', '1535490572', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('198', '4', '1535489117', '1535532317', '1', '192.172.183.179', '1', '1535489117', '0', '');
INSERT INTO `cruge_session` VALUES ('199', '4', '1535545297', '1535588497', '0', '192.172.182.22', '4', '1535557075', '1535559671', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('200', '5', '1535545386', '1535588586', '0', '192.172.182.22', '2', '1535563806', '1535563822', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('201', '1', '1535563836', '1535607036', '0', '192.172.182.22', '1', '1535563836', '1535563886', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('202', '4', '1535563894', '1535607094', '0', '192.172.182.22', '1', '1535563894', '1535563903', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('203', '4', '1535564392', '1535607592', '1', '192.172.183.179', '3', '1535576678', '0', '');
INSERT INTO `cruge_session` VALUES ('204', '5', '1535564705', '1535607905', '1', '192.172.186.28', '1', '1535564705', '0', '');
INSERT INTO `cruge_session` VALUES ('205', '1', '1535574334', '1535617534', '0', '192.172.182.23', '1', '1535574334', '1535575393', '192.172.182.23');
INSERT INTO `cruge_session` VALUES ('206', '1', '1535589893', '1535633093', '1', '192.172.182.23', '2', '1535631355', '0', '');
INSERT INTO `cruge_session` VALUES ('207', '4', '1535630589', '1535673789', '0', '192.172.182.22', '2', '1535644774', '1535646924', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('208', '5', '1535634022', '1535677222', '1', '192.172.182.1', '2', '1535653332', '0', '');
INSERT INTO `cruge_session` VALUES ('209', '1', '1535644899', '1535688099', '0', '192.172.182.17', '1', '1535644899', '1535645262', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('210', '4', '1535646934', '1535690134', '0', '192.172.182.22', '1', '1535646934', '1535646999', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('211', '4', '1535649826', '1535693026', '1', '192.172.183.179', '1', '1535649826', '0', '');
INSERT INTO `cruge_session` VALUES ('212', '4', '1535717335', '1535760535', '1', '192.172.183.179', '2', '1535743301', '0', '');
INSERT INTO `cruge_session` VALUES ('213', '5', '1535725353', '1535768553', '1', '192.172.186.28', '2', '1535730274', '0', '');
INSERT INTO `cruge_session` VALUES ('214', '1', '1535730060', '1535773260', '0', '192.172.182.17', '1', '1535730060', '1535731286', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('215', '6', '1535730363', '1535773563', '0', '192.172.182.1', '1', '1535730363', '1535730384', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('216', '6', '1535730402', '1535773602', '0', '192.172.182.1', '1', '1535730402', '1535730595', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('217', '6', '1535730599', '1535773799', '0', '192.172.182.1', '2', '1535730864', '1535730913', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('218', '6', '1535731597', '1535774797', '0', '192.172.182.1', '2', '1535735884', '1535735974', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('219', '1', '1535734913', '1535778113', '0', '192.172.182.17', '1', '1535734913', '0', '');
INSERT INTO `cruge_session` VALUES ('220', '6', '1535751299', '1535794499', '1', '192.172.182.1', '1', '1535751299', '0', '');
INSERT INTO `cruge_session` VALUES ('221', '1', '1535805705', '1535848905', '0', '192.172.182.43', '1', '1535805705', '1535806369', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('222', '4', '1535807202', '1535850402', '1', '192.172.183.179', '5', '1535832201', '0', '');
INSERT INTO `cruge_session` VALUES ('223', '6', '1535816004', '1535859204', '1', '192.172.182.1', '1', '1535816004', '0', '');
INSERT INTO `cruge_session` VALUES ('224', '1', '1535842753', '1535885953', '1', '192.172.182.1', '1', '1535842753', '0', '');
INSERT INTO `cruge_session` VALUES ('225', '6', '1535859249', '1535902449', '1', '192.172.182.1', '1', '1535859249', '0', '');
INSERT INTO `cruge_session` VALUES ('226', '6', '1535926245', '1535969445', '1', '192.172.182.1', '1', '1535926245', '0', '');
INSERT INTO `cruge_session` VALUES ('227', '4', '1535976423', '1536019623', '0', '192.172.182.22', '3', '1535985890', '1535986096', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('228', '5', '1535976664', '1536019864', '1', '192.172.186.28', '1', '1535976664', '0', '');
INSERT INTO `cruge_session` VALUES ('229', '1', '1535979074', '1536022274', '0', '192.172.182.17', '1', '1535979074', '1535979959', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('230', '1', '1535984507', '1536027707', '0', '192.172.182.22', '1', '1535984507', '1535984801', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('231', '1', '1535984875', '1536028075', '0', '192.172.182.17', '3', '1535986162', '1536006069', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('232', '4', '1535986387', '1536029587', '1', '192.172.183.179', '4', '1536010305', '0', '');
INSERT INTO `cruge_session` VALUES ('233', '4', '1536062005', '1536105205', '0', '192.172.182.22', '2', '1536071443', '1536080869', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('234', '5', '1536075280', '1536118480', '1', '192.172.186.28', '1', '1536075280', '0', '');
INSERT INTO `cruge_session` VALUES ('235', '1', '1536079968', '1536123168', '0', '192.172.182.17', '1', '1536079968', '1536080275', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('236', '4', '1536080901', '1536124101', '0', '192.172.183.179', '1', '1536080901', '1536087708', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('237', '6', '1536082570', '1536125770', '1', '192.172.182.1', '2', '1536108132', '0', '');
INSERT INTO `cruge_session` VALUES ('238', '1', '1536087722', '1536130922', '0', '192.172.183.179', '1', '1536087722', '1536088080', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('239', '4', '1536088173', '1536131373', '1', '192.172.183.179', '1', '1536088173', '0', '');
INSERT INTO `cruge_session` VALUES ('240', '4', '1536150419', '1536193619', '0', '192.172.182.22', '2', '1536162248', '1536163665', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('241', '5', '1536151763', '1536194963', '0', '192.172.182.22', '3', '1536167050', '1536181952', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('242', '6', '1536162711', '1536205911', '0', '192.172.182.1', '1', '1536162711', '1536163441', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('243', '1', '1536163678', '1536206878', '0', '192.172.182.22', '1', '1536163678', '1536163749', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('244', '6', '1536163766', '1536206966', '0', '192.172.182.22', '1', '1536163766', '1536163806', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('245', '1', '1536163819', '1536207019', '0', '192.172.182.22', '1', '1536163819', '1536163870', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('246', '6', '1536163879', '1536207079', '0', '192.172.182.22', '1', '1536163879', '1536163908', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('247', '1', '1536163917', '1536207117', '0', '192.172.182.22', '1', '1536163917', '1536163968', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('248', '1', '1536164399', '1536207599', '0', '192.172.182.17', '1', '1536164399', '1536164549', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('249', '4', '1536164559', '1536207759', '0', '192.172.182.17', '1', '1536164559', '1536164739', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('250', '6', '1536164751', '1536207951', '0', '192.172.182.17', '1', '1536164751', '1536164944', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('251', '1', '1536164956', '1536208156', '0', '192.172.182.17', '1', '1536164956', '1536165095', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('252', '6', '1536165107', '1536208307', '0', '192.172.182.17', '1', '1536165107', '1536165143', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('253', '1', '1536165151', '1536208351', '0', '192.172.182.17', '1', '1536165151', '1536165275', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('254', '6', '1536165311', '1536208511', '0', '192.172.182.17', '1', '1536165311', '1536165344', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('255', '1', '1536165357', '1536208557', '0', '192.172.182.17', '1', '1536165357', '1536165416', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('256', '1', '1536165924', '1536209124', '0', '192.172.182.17', '1', '1536165924', '1536166914', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('257', '4', '1536166479', '1536209679', '0', '192.172.183.179', '3', '1536177585', '1536177955', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('258', '6', '1536170520', '1536213720', '0', '192.172.182.1', '2', '1536172336', '1536172535', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('259', '1', '1536172285', '1536215485', '0', '192.172.182.17', '1', '1536172285', '1536173617', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('260', '1', '1536177000', '1536220200', '0', '192.172.182.17', '1', '1536177000', '1536177232', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('261', '4', '1536178095', '1536221295', '0', '192.172.182.22', '2', '1536181960', '1536182778', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('262', '4', '1536185280', '1536228480', '1', '192.172.183.179', '2', '1536186002', '0', '');
INSERT INTO `cruge_session` VALUES ('263', '1', '1536188630', '1536231830', '0', '192.172.182.43', '1', '1536188630', '1536188898', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('264', '4', '1536235973', '1536279173', '0', '192.172.182.22', '2', '1536245513', '1536245626', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('265', '4', '1536245676', '1536288876', '1', '192.172.183.179', '3', '1536255115', '0', '');
INSERT INTO `cruge_session` VALUES ('266', '5', '1536247471', '1536290671', '1', '192.172.186.28', '2', '1536260441', '0', '');
INSERT INTO `cruge_session` VALUES ('267', '1', '1536281408', '1536324608', '0', '181.225.241.164', '1', '1536281408', '1536281608', '181.225.241.164');
INSERT INTO `cruge_session` VALUES ('268', '4', '1536322106', '1536365306', '1', '192.172.183.179', '2', '1536360412', '0', '');
INSERT INTO `cruge_session` VALUES ('269', '5', '1536322508', '1536365708', '1', '192.172.182.1', '2', '1536330975', '0', '');
INSERT INTO `cruge_session` VALUES ('270', '1', '1536331464', '1536374664', '0', '192.172.182.22', '1', '1536331464', '1536331832', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('271', '6', '1536336699', '1536379899', '1', '192.172.182.49', '1', '1536336699', '0', '');
INSERT INTO `cruge_session` VALUES ('272', '1', '1536341068', '1536384268', '0', '192.172.182.22', '1', '1536341068', '1536349503', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('273', '1', '1536349968', '1536393168', '0', '192.172.182.22', '1', '1536349968', '1536350101', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('274', '1', '1536350137', '1536393337', '1', '192.172.182.1', '1', '1536350137', '0', '');
INSERT INTO `cruge_session` VALUES ('275', '5', '1536414220', '1536457420', '1', '192.172.182.49', '2', '1536420488', '0', '');
INSERT INTO `cruge_session` VALUES ('276', '6', '1536419778', '1536462978', '0', '192.172.182.49', '1', '1536419778', '1536420470', '192.172.182.49');
INSERT INTO `cruge_session` VALUES ('277', '4', '1536583550', '1536626750', '1', '192.172.183.179', '2', '1536601342', '0', '');
INSERT INTO `cruge_session` VALUES ('278', '5', '1536593744', '1536636944', '1', '192.172.186.28', '1', '1536593744', '0', '');
INSERT INTO `cruge_session` VALUES ('279', '1', '1536609507', '1536652707', '0', '192.172.182.1', '1', '1536609507', '1536610643', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('280', '4', '1536669441', '1536712641', '0', '192.172.182.22', '2', '1536675677', '1536686560', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('281', '5', '1536676469', '1536719669', '1', '192.172.186.28', '2', '1536679702', '0', '');
INSERT INTO `cruge_session` VALUES ('282', '4', '1536686641', '1536729841', '1', '192.172.183.179', '1', '1536686641', '0', '');
INSERT INTO `cruge_session` VALUES ('283', '6', '1536708487', '1536751687', '1', '192.172.182.1', '1', '1536708487', '0', '');
INSERT INTO `cruge_session` VALUES ('284', '4', '1536756542', '1536799742', '1', '192.172.183.179', '5', '1536787430', '0', '');
INSERT INTO `cruge_session` VALUES ('285', '5', '1536772285', '1536815485', '0', '192.172.186.24', '2', '1536772420', '0', '');
INSERT INTO `cruge_session` VALUES ('286', '5', '1536843217', '1536886417', '1', '192.172.186.28', '1', '1536843217', '0', '');
INSERT INTO `cruge_session` VALUES ('287', '4', '1536844094', '1536887294', '1', '192.172.183.179', '3', '1536862225', '0', '');
INSERT INTO `cruge_session` VALUES ('288', '6', '1536852595', '1536895795', '1', '192.172.182.49', '2', '1536853045', '0', '');
INSERT INTO `cruge_session` VALUES ('289', '4', '1536926574', '1536969774', '1', '192.172.183.179', '3', '1536947478', '0', '');
INSERT INTO `cruge_session` VALUES ('290', '5', '1536931624', '1536974824', '1', '192.172.186.28', '1', '1536931624', '0', '');
INSERT INTO `cruge_session` VALUES ('291', '1', '1536946181', '1536989381', '0', '192.172.182.22', '1', '1536946181', '1536946558', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('292', '1', '1537115828', '1537159028', '0', '192.172.182.43', '1', '1537115828', '1537116204', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('293', '4', '1537187989', '1537231189', '0', '192.172.183.179', '3', '1537188450', '1537197107', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('294', '1', '1537197019', '1537240219', '0', '192.172.182.1', '1', '1537197019', '1537197092', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('295', '1', '1537197121', '1537240321', '0', '192.172.182.22', '1', '1537197121', '1537197340', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('296', '4', '1537197350', '1537240550', '0', '192.172.183.179', '3', '1537208547', '1537216541', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('297', '1', '1537197396', '1537240596', '0', '192.172.182.1', '1', '1537197396', '1537197522', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('298', '5', '1537203814', '1537247014', '1', '192.172.186.28', '1', '1537203814', '0', '');
INSERT INTO `cruge_session` VALUES ('299', '1', '1537214282', '1537257482', '0', '192.172.182.1', '1', '1537214282', '1537214945', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('300', '4', '1537216676', '1537259876', '1', '192.172.183.179', '1', '1537216676', '0', '');
INSERT INTO `cruge_session` VALUES ('301', '6', '1537219370', '1537262570', '1', '192.172.182.1', '1', '1537219370', '0', '');
INSERT INTO `cruge_session` VALUES ('302', '4', '1537272839', '1537316039', '0', '192.172.182.1', '5', '1537281094', '1537281722', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('303', '1', '1537281050', '1537324250', '0', '192.172.182.1', '1', '1537281050', '1537281082', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('304', '4', '1537282678', '1537325878', '0', '192.172.182.1', '3', '1537285429', '1537285454', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('305', '1', '1537282758', '1537325958', '0', '192.172.182.1', '1', '1537282758', '1537285369', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('306', '1', '1537285378', '1537328578', '0', '192.172.182.1', '1', '1537285378', '1537285420', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('307', '1', '1537285465', '1537328665', '0', '192.172.182.1', '1', '1537285465', '1537285520', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('308', '4', '1537285529', '1537328729', '0', '192.172.182.1', '1', '1537285529', '1537285660', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('309', '1', '1537285672', '1537328872', '0', '192.172.182.1', '1', '1537285672', '1537285712', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('310', '4', '1537285707', '1537328907', '0', '192.172.182.1', '2', '1537285729', '1537285762', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('311', '4', '1537285795', '1537328995', '0', '192.172.183.179', '1', '1537285795', '1537287215', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('312', '1', '1537287227', '1537330427', '0', '192.172.183.179', '1', '1537287227', '1537287260', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('313', '4', '1537287281', '1537330481', '0', '192.172.183.179', '1', '1537287281', '1537287314', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('314', '1', '1537287326', '1537330526', '0', '192.172.183.179', '1', '1537287326', '1537287395', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('315', '4', '1537287402', '1537330602', '0', '192.172.182.22', '2', '1537287865', '1537287915', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('316', '4', '1537287984', '1537331184', '0', '192.172.182.22', '2', '1537288636', '1537288810', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('317', '5', '1537289628', '1537332828', '1', '192.172.186.28', '1', '1537289628', '0', '');
INSERT INTO `cruge_session` VALUES ('318', '1', '1537291051', '1537334251', '0', '192.172.182.1', '1', '1537291051', '1537291204', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('319', '4', '1537291297', '1537334497', '0', '192.172.182.1', '1', '1537291297', '1537291535', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('320', '1', '1537291545', '1537334745', '0', '192.172.182.1', '1', '1537291545', '1537292552', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('321', '4', '1537292924', '1537336124', '1', '192.172.183.179', '2', '1537307480', null, null);
INSERT INTO `cruge_session` VALUES ('322', '1', '1537294489', '1537337689', '0', '192.172.182.22', '1', '1537294489', '1537300231', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('323', '1', '1537303451', '1537346651', '0', '192.172.182.17', '1', '1537303451', '1537304503', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('324', '4', '1537359033', '1537402233', '0', '192.172.182.22', '3', '1537365073', '1537369532', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('325', '5', '1537360630', '1537403830', '1', '192.172.186.28', '2', '1537381750', null, null);
INSERT INTO `cruge_session` VALUES ('326', '4', '1537369722', '1537412922', '0', '192.172.182.22', '4', '1537391195', '1537392071', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('327', '1', '1537369919', '1537413119', '0', '192.172.182.22', '1', '1537369919', '1537370568', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('328', '1', '1537392090', '1537435290', '0', '192.172.182.22', '1', '1537392090', '1537392297', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('329', '4', '1537396156', '1537439356', '1', '192.172.183.179', '1', '1537396156', null, null);
INSERT INTO `cruge_session` VALUES ('330', '4', '1537452458', '1537495658', '1', '192.172.183.179', '3', '1537484279', null, null);
INSERT INTO `cruge_session` VALUES ('331', '1', '1537455470', '1537498670', '0', '192.172.182.22', '1', '1537455470', '1537458082', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('332', '1', '1537461845', '1537505045', '0', '192.172.182.22', '1', '1537461845', '1537471008', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('333', '5', '1537464442', '1537507642', '1', '192.172.186.28', '1', '1537464442', null, null);
INSERT INTO `cruge_session` VALUES ('334', '1', '1537474464', '1537517664', '0', '192.172.182.22', '1', '1537474464', '1537474716', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('335', '1', '1537498207', '1537541407', '0', '192.172.182.43', '1', '1537498207', '1537498241', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('336', '1', '1537536198', '1537579398', '0', '192.172.182.17', '1', '1537536198', '1537536623', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('337', '1', '1537539276', '1537582476', '0', '192.172.182.17', '2', '1537543336', '1537543353', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('338', '1', '1537543532', '1537586732', '0', '192.172.182.22', '1', '1537543532', '1537544763', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('339', '1', '1537544849', '1537588049', '0', '192.172.182.22', '1', '1537544849', '1537545163', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('340', '1', '1537545826', '1537589026', '0', '192.172.182.22', '1', '1537545826', '1537547931', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('341', '5', '1537549726', '1537592926', '1', '192.172.186.28', '1', '1537549726', null, null);
INSERT INTO `cruge_session` VALUES ('342', '1', '1537552561', '1537595761', '0', '192.172.182.22', '1', '1537552561', '1537554038', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('343', '4', '1537618201', '1537661401', '1', '192.172.183.179', '1', '1537618201', null, null);
INSERT INTO `cruge_session` VALUES ('344', '1', '1537745419', '1537788619', '1', '192.172.182.1', '1', '1537745419', null, null);
INSERT INTO `cruge_session` VALUES ('345', '5', '1537794684', '1537837884', '1', '192.172.186.28', '1', '1537794684', null, null);
INSERT INTO `cruge_session` VALUES ('346', '1', '1537801623', '1537844823', '0', '192.172.182.22', '1', '1537801623', '1537805963', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('347', '4', '1537805332', '1537848532', '0', '192.172.183.179', '1', '1537805332', '1537805427', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('348', '1', '1537808879', '1537852079', '0', '192.172.182.22', '1', '1537808879', '1537809149', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('349', '4', '1537812375', '1537855575', '1', '192.172.183.179', '2', '1537820780', null, null);
INSERT INTO `cruge_session` VALUES ('350', '1', '1537815425', '1537858625', '0', '192.172.182.22', '1', '1537815425', '1537816898', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('351', '6', '1537842041', '1537885241', '1', '192.172.182.1', '1', '1537842041', null, null);
INSERT INTO `cruge_session` VALUES ('352', '4', '1537878130', '1537921330', '0', '192.172.182.22', '2', '1537886158', '1537888643', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('353', '1', '1537881811', '1537925011', '0', '192.172.182.22', '1', '1537881811', '1537886147', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('354', '1', '1537888655', '1537931855', '0', '192.172.182.22', '1', '1537888655', '1537889597', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('355', '4', '1537888732', '1537931932', '0', '192.172.183.179', '2', '1537889669', '1537893751', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('356', '7', '1537889608', '1537932808', '0', '192.172.182.22', '1', '1537889608', '1537889876', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('357', '1', '1537890280', '1537933480', '0', '192.172.182.22', '1', '1537890280', '1537890337', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('358', '7', '1537890353', '1537933553', '0', '192.172.182.22', '1', '1537890353', '1537890628', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('359', '1', '1537890640', '1537933840', '0', '192.172.182.22', '1', '1537890640', '1537890848', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('360', '7', '1537890858', '1537934058', '0', '192.172.182.22', '1', '1537890858', '1537890943', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('361', '5', '1537892217', '1537935417', '1', '192.172.186.28', '1', '1537892217', null, null);
INSERT INTO `cruge_session` VALUES ('362', '7', '1537893526', '1537936726', '0', '192.172.182.22', '2', '1537894609', '1537894633', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('363', '1', '1537893783', '1537936983', '0', '192.172.183.179', '1', '1537893783', '1537893848', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('364', '4', '1537893858', '1537937058', '1', '192.172.183.179', '4', '1537907592', null, null);
INSERT INTO `cruge_session` VALUES ('365', '1', '1537894642', '1537937842', '0', '192.172.182.22', '1', '1537894642', '1537894753', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('366', '7', '1537894768', '1537937968', '0', '192.172.182.22', '1', '1537894768', '1537894815', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('367', '7', '1537895437', '1537938637', '0', '192.172.186.24', '1', '1537895437', null, null);
INSERT INTO `cruge_session` VALUES ('368', '1', '1537902316', '1537945516', '0', '192.172.182.22', '1', '1537902316', '1537902336', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('369', '1', '1537903418', '1537946618', '0', '192.172.182.22', '1', '1537903418', '1537908480', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('370', '4', '1537963593', '1538006793', '0', '192.172.182.22', '3', '1537982320', '1537982334', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('371', '5', '1537965245', '1538008445', '1', '192.172.186.28', '1', '1537965245', null, null);
INSERT INTO `cruge_session` VALUES ('372', '1', '1537979668', '1538022868', '0', '192.172.182.22', '1', '1537979668', '1537981686', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('373', '1', '1537981705', '1538024905', '0', '192.172.182.22', '1', '1537981705', '1537982309', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('374', '1', '1537982370', '1538025570', '0', '192.172.182.17', '2', '1537983570', '1537983584', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('375', '1', '1537983671', '1538026871', '0', '192.172.182.22', '1', '1537983671', '1537983735', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('376', '7', '1537983748', '1538026948', '0', '192.172.182.22', '1', '1537983748', '1537983791', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('377', '1', '1537983803', '1538027003', '0', '192.172.182.22', '1', '1537983803', '1537984103', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('378', '4', '1537984069', '1538027269', '1', '192.172.183.179', '1', '1537984069', null, null);
INSERT INTO `cruge_session` VALUES ('379', '8', '1537984113', '1538027313', '0', '192.172.182.22', '1', '1537984113', '1537984133', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('380', '1', '1537984165', '1538027365', '0', '192.172.182.22', '1', '1537984165', '1537984893', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('381', '9', '1537984904', '1538028104', '0', '192.172.182.22', '1', '1537984904', '1537984930', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('382', '1', '1537984940', '1538028140', '0', '192.172.182.22', '1', '1537984940', '1537984999', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('383', '9', '1537985010', '1538028210', '0', '192.172.182.22', '1', '1537985010', '1537985159', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('384', '1', '1537985555', '1538028755', '0', '192.172.182.22', '1', '1537985555', '1537987185', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('385', '9', '1537987195', '1538030395', '0', '192.172.182.22', '1', '1537987195', '1537987254', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('386', '1', '1537987264', '1538030464', '0', '192.172.182.22', '1', '1537987264', '1537987452', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('387', '9', '1537987462', '1538030662', '0', '192.172.182.22', '1', '1537987462', '1537987506', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('388', '1', '1537987518', '1538030718', '0', '192.172.182.22', '1', '1537987518', '1537994258', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('389', '8', '1537994484', '1538037684', '0', '192.172.182.22', '1', '1537994484', '1537995421', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('390', '5', '1538056166', '1538099366', '1', '192.172.186.28', '2', '1538060098', null, null);
INSERT INTO `cruge_session` VALUES ('391', '4', '1538056852', '1538100052', '0', '192.172.182.22', '2', '1538061829', '1538061924', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('392', '1', '1538060822', '1538104022', '0', '192.172.182.22', '1', '1538060822', '1538061821', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('393', '1', '1538062457', '1538105657', '0', '192.172.182.22', '2', '1538062690', '1538063069', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('394', '4', '1538062667', '1538105867', '0', '192.172.182.22', '1', '1538062667', '1538062683', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('395', '4', '1538062834', '1538106034', '0', '192.172.182.22', '2', '1538064534', '1538064590', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('396', '1', '1538063082', '1538106282', '0', '192.172.182.22', '1', '1538063082', '1538063156', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('397', '8', '1538063165', '1538106365', '0', '192.172.182.22', '1', '1538063165', '1538063924', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('398', '1', '1538063959', '1538107159', '0', '192.172.182.22', '1', '1538063959', '1538064526', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('399', '4', '1538064607', '1538107807', '1', '192.172.183.179', '4', '1538088355', null, null);
INSERT INTO `cruge_session` VALUES ('400', '4', '1538139256', '1538182456', '1', '192.172.183.179', '3', '1538166695', null, null);
INSERT INTO `cruge_session` VALUES ('401', '5', '1538160930', '1538204130', '1', '192.172.186.28', '1', '1538160930', null, null);
INSERT INTO `cruge_session` VALUES ('402', '5', '1538227410', '1538270610', '1', '192.172.182.1', '1', '1538227410', null, null);
INSERT INTO `cruge_session` VALUES ('403', '4', '1538308999', '1538352199', '1', '192.172.183.179', '1', '1538308999', null, null);
INSERT INTO `cruge_session` VALUES ('404', '1', '1538397180', '1538440380', '0', '192.172.182.22', '1', '1538397180', '1538397499', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('405', '10', '1538397520', '1538440720', '0', '192.172.182.22', '1', '1538397520', '1538397537', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('406', '1', '1538397544', '1538440744', '0', '192.172.182.22', '1', '1538397544', '1538397600', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('407', '10', '1538397607', '1538440807', '0', '192.172.182.22', '1', '1538397607', '1538397615', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('408', '1', '1538397623', '1538440823', '0', '192.172.182.22', '1', '1538397623', '1538397754', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('409', '8', '1538397762', '1538440962', '0', '192.172.182.22', '1', '1538397762', '1538397770', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('410', '10', '1538397778', '1538440978', '0', '192.172.182.22', '1', '1538397778', '1538398200', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('411', '10', '1538398418', '1538441618', '0', '192.172.182.22', '1', '1538398418', '1538398738', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('412', '4', '1538398962', '1538442162', '1', '192.172.183.179', '1', '1538398962', null, null);
INSERT INTO `cruge_session` VALUES ('413', '5', '1538402240', '1538445440', '1', '192.172.186.28', '1', '1538402240', null, null);
INSERT INTO `cruge_session` VALUES ('414', '8', '1538413736', '1538456936', '0', '192.172.182.22', '1', '1538413736', '1538415384', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('415', '1', '1538416124', '1538459324', '0', '192.172.182.22', '1', '1538416124', '1538416232', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('416', '11', '1538416240', '1538459440', '0', '192.172.182.22', '1', '1538416240', '1538416489', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('417', '8', '1538417379', '1538460579', '0', '192.172.183.137', '1', '1538417379', '1538418317', '192.172.183.137');
INSERT INTO `cruge_session` VALUES ('418', '1', '1538424387', '1538467587', '0', '192.172.182.22', '1', '1538424387', '1538425875', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('419', '8', '1538428174', '1538471374', '1', '192.172.183.137', '2', '1538428779', null, null);
INSERT INTO `cruge_session` VALUES ('420', '4', '1538485496', '1538528696', '1', '192.172.183.179', '3', '1538520331', null, null);
INSERT INTO `cruge_session` VALUES ('421', '5', '1538491509', '1538534709', '1', '192.172.186.28', '1', '1538491509', null, null);
INSERT INTO `cruge_session` VALUES ('422', '1', '1538499210', '1538542410', '0', '192.172.182.22', '1', '1538499210', '1538501673', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('423', '1', '1538502552', '1538545752', '0', '192.172.186.24', '2', '1538511072', '1538511731', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('424', '7', '1538503956', '1538547156', '0', '192.172.186.24', '1', '1538503956', '1538511062', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('425', '1', '1538511913', '1538555113', '0', '192.172.182.22', '1', '1538511913', '1538512712', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('426', '1', '1538513744', '1538556944', '0', '192.172.182.22', '1', '1538513744', '1538514809', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('427', '6', '1538529303', '1538572503', '1', '192.172.182.1', '1', '1538529303', null, null);
INSERT INTO `cruge_session` VALUES ('428', '10', '1538567412', '1538610612', '0', '192.172.183.37', '1', '1538567412', '1538567678', '192.172.183.37');
INSERT INTO `cruge_session` VALUES ('429', '7', '1538568144', '1538611344', '0', '192.172.186.24', '1', '1538568144', null, null);
INSERT INTO `cruge_session` VALUES ('430', '5', '1538569695', '1538612895', '1', '192.172.186.28', '1', '1538569695', null, null);
INSERT INTO `cruge_session` VALUES ('431', '4', '1538574412', '1538617612', '0', '192.172.183.179', '2', '1538575447', '1538576395', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('432', '1', '1538576411', '1538619611', '0', '192.172.183.179', '1', '1538576411', '1538576586', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('433', '4', '1538577553', '1538620753', '1', '192.172.183.179', '4', '1538602270', null, null);
INSERT INTO `cruge_session` VALUES ('434', '1', '1538582391', '1538625591', '0', '192.172.182.22', '1', '1538582391', '1538582444', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('435', '11', '1538582452', '1538625652', '0', '192.172.182.22', '1', '1538582452', '1538582723', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('436', '1', '1538582739', '1538625939', '0', '192.172.182.22', '1', '1538582739', '1538582774', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('437', '11', '1538582787', '1538625987', '0', '192.172.182.22', '1', '1538582787', '1538582893', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('438', '1', '1538585026', '1538628226', '0', '192.172.182.22', '1', '1538585026', '1538586619', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('439', '8', '1538585032', '1538628232', '1', '192.172.183.137', '1', '1538585032', null, null);
INSERT INTO `cruge_session` VALUES ('440', '1', '1538589469', '1538632669', '0', '192.172.182.22', '1', '1538589469', '1538589677', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('441', '12', '1538589690', '1538632890', '0', '192.172.182.22', '1', '1538589690', '1538589951', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('442', '4', '1538654854', '1538698054', '0', '192.172.182.22', '4', '1538684370', '1538684404', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('443', '10', '1538655711', '1538698911', '0', '192.172.183.37', '1', '1538655711', '1538655853', '192.172.183.37');
INSERT INTO `cruge_session` VALUES ('444', '7', '1538657250', '1538700450', '0', '192.172.186.24', '1', '1538657250', '1538657313', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('445', '1', '1538657322', '1538700522', '0', '192.172.186.24', '1', '1538657322', '1538657359', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('446', '7', '1538657384', '1538700584', '0', '192.172.186.24', '1', '1538657384', null, null);
INSERT INTO `cruge_session` VALUES ('447', '10', '1538660890', '1538704090', '1', '192.172.183.37', '1', '1538660890', null, null);
INSERT INTO `cruge_session` VALUES ('448', '1', '1538665189', '1538708389', '0', '192.172.182.22', '1', '1538665189', '1538667649', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('449', '4', '1538686671', '1538729871', '1', '192.172.183.179', '2', '1538693257', null, null);
INSERT INTO `cruge_session` VALUES ('450', '4', '1538743978', '1538787178', '1', '192.172.183.179', '3', '1538759666', null, null);
INSERT INTO `cruge_session` VALUES ('451', '8', '1538746226', '1538789426', '1', '192.172.183.137', '1', '1538746226', null, null);
INSERT INTO `cruge_session` VALUES ('452', '1', '1538747070', '1538790270', '0', '192.172.182.22', '2', '1538747209', '1538747687', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('453', '13', '1538747696', '1538790896', '0', '192.172.182.17', '1', '1538747696', '1538750880', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('454', '1', '1538749395', '1538792595', '0', '192.172.182.22', '1', '1538749395', '1538749424', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('455', '1', '1538751907', '1538795107', '0', '192.172.182.22', '1', '1538751907', '1538752024', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('456', '1', '1538752296', '1538795496', '0', '192.172.182.22', '1', '1538752296', '1538752317', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('457', '5', '1538755604', '1538798804', '1', '192.172.186.28', '1', '1538755604', null, null);
INSERT INTO `cruge_session` VALUES ('458', '13', '1538760712', '1538803912', '0', '192.172.182.17', '1', '1538760712', null, null);
INSERT INTO `cruge_session` VALUES ('459', '7', '1538766556', '1538809756', '0', '192.172.186.24', '1', '1538766556', null, null);
INSERT INTO `cruge_session` VALUES ('460', '1', '1538768357', '1538811557', '0', '192.172.182.22', '1', '1538768357', '1538768896', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('461', '4', '1538842595', '1538885795', '1', '192.172.183.179', '1', '1538842595', null, null);
INSERT INTO `cruge_session` VALUES ('462', '4', '1539001705', '1539044905', '1', '192.172.183.179', '2', '1539021425', null, null);
INSERT INTO `cruge_session` VALUES ('463', '1', '1539002669', '1539045869', '0', '192.172.182.22', '1', '1539002669', '1539003990', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('464', '5', '1539004863', '1539048063', '1', '192.172.186.28', '1', '1539004863', null, null);
INSERT INTO `cruge_session` VALUES ('465', '1', '1539005312', '1539048512', '0', '192.172.182.17', '1', '1539005312', '1539005370', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('466', '4', '1539090827', '1539134027', '1', '192.172.183.179', '2', '1539107150', null, null);
INSERT INTO `cruge_session` VALUES ('467', '11', '1539093711', '1539136911', '0', '192.172.183.163', '1', '1539093711', '1539093722', '192.172.183.163');
INSERT INTO `cruge_session` VALUES ('468', '10', '1539096234', '1539139434', '1', '192.172.183.37', '1', '1539096234', null, null);
INSERT INTO `cruge_session` VALUES ('469', '1', '1539099256', '1539142456', '0', '192.172.182.22', '1', '1539099256', '1539101180', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('470', '5', '1539099909', '1539143109', '1', '192.172.186.28', '1', '1539099909', null, null);
INSERT INTO `cruge_session` VALUES ('471', '6', '1539179951', '1539223151', '1', '192.172.182.1', '1', '1539179951', null, null);
INSERT INTO `cruge_session` VALUES ('472', '7', '1539262128', '1539305328', '0', '192.172.186.24', '1', '1539262128', null, null);
INSERT INTO `cruge_session` VALUES ('473', '4', '1539264244', '1539307444', '1', '192.172.183.179', '3', '1539296939', null, null);
INSERT INTO `cruge_session` VALUES ('474', '1', '1539271609', '1539314809', '0', '192.172.182.22', '1', '1539271609', '1539271955', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('475', '15', '1539271968', '1539315168', '0', '192.172.182.22', '1', '1539271968', '1539272944', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('476', '1', '1539272982', '1539316182', '0', '192.172.182.22', '1', '1539272982', '1539279179', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('477', '8', '1539274468', '1539317668', '1', '192.172.183.137', '2', '1539279542', null, null);
INSERT INTO `cruge_session` VALUES ('478', '13', '1539279186', '1539322386', '0', '192.172.182.22', '1', '1539279186', '1539279193', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('479', '1', '1539279220', '1539322420', '0', '192.172.182.17', '1', '1539279220', '1539279469', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('480', '1', '1539279674', '1539322874', '0', '192.172.182.22', '1', '1539279674', '1539279828', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('481', '13', '1539279842', '1539323042', '0', '192.172.182.22', '1', '1539279842', '1539286647', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('482', '1', '1539282898', '1539326098', '0', '192.172.182.22', '2', '1539286654', '1539288757', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('483', '5', '1539283771', '1539326971', '1', '192.172.186.28', '1', '1539283771', null, null);
INSERT INTO `cruge_session` VALUES ('484', '6', '1539286940', '1539330140', '1', '192.172.182.1', '1', '1539286940', null, null);
INSERT INTO `cruge_session` VALUES ('485', '13', '1539288764', '1539331964', '0', '192.172.182.17', '1', '1539288764', '1539290558', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('486', '1', '1539288926', '1539332126', '0', '192.172.182.22', '1', '1539288926', '1539291619', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('487', '4', '1539346054', '1539389254', '0', '192.172.182.22', '3', '1539353582', '1539355373', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('488', '1', '1539346780', '1539389980', '0', '192.172.182.22', '1', '1539346780', '1539347169', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('489', '8', '1539347255', '1539390455', '1', '192.172.183.137', '1', '1539347255', null, null);
INSERT INTO `cruge_session` VALUES ('490', '7', '1539347635', '1539390835', '0', '192.172.186.24', '1', '1539347635', null, null);
INSERT INTO `cruge_session` VALUES ('491', '5', '1539348275', '1539391475', '1', '192.172.186.28', '3', '1539358316', null, null);
INSERT INTO `cruge_session` VALUES ('492', '1', '1539355383', '1539398583', '0', '192.172.182.22', '1', '1539355383', '1539358796', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('493', '4', '1539355540', '1539398740', '1', '192.172.183.179', '3', '1539382798', null, null);
INSERT INTO `cruge_session` VALUES ('494', '15', '1539358760', '1539401960', '1', '192.172.183.179', '1', '1539358760', null, null);
INSERT INTO `cruge_session` VALUES ('495', '1', '1539359611', '1539402811', '1', '192.172.182.1', '4', '1539402429', null, null);
INSERT INTO `cruge_session` VALUES ('496', '6', '1539360942', '1539404142', '0', '192.172.182.1', '1', '1539360942', '1539361164', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('497', '6', '1539367040', '1539410240', '1', '192.172.182.1', '1', '1539367040', null, null);
INSERT INTO `cruge_session` VALUES ('498', '4', '1539610551', '1539653751', '1', '192.172.183.179', '2', '1539641204', null, null);
INSERT INTO `cruge_session` VALUES ('499', '1', '1539613002', '1539656202', '0', '192.172.182.22', '1', '1539613002', '1539613034', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('500', '1', '1539613082', '1539656282', '0', '192.172.182.22', '1', '1539613082', '1539613201', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('501', '1', '1539615097', '1539658297', '0', '192.172.182.22', '1', '1539615097', '1539615293', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('502', '6', '1539616792', '1539659992', '1', '192.172.182.1', '3', '1539658081', null, null);
INSERT INTO `cruge_session` VALUES ('503', '1', '1539616902', '1539660102', '0', '192.172.182.49', '1', '1539616902', '1539617713', '192.172.182.49');
INSERT INTO `cruge_session` VALUES ('504', '1', '1539620452', '1539663652', '0', '192.172.182.22', '1', '1539620452', '1539620545', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('505', '1', '1539625410', '1539668610', '0', '192.172.192.8', '1', '1539625410', '1539625580', '192.172.192.8');
INSERT INTO `cruge_session` VALUES ('506', '1', '1539625855', '1539669055', '0', '192.172.182.17', '1', '1539625855', '1539626063', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('507', '1', '1539626600', '1539669800', '0', '192.172.182.17', '1', '1539626600', '1539626999', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('508', '7', '1539630366', '1539673566', '0', '192.172.186.24', '1', '1539630366', null, null);
INSERT INTO `cruge_session` VALUES ('509', '1', '1539631191', '1539674391', '0', '192.172.182.22', '1', '1539631191', '1539631385', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('510', '4', '1539694894', '1539738094', '1', '192.172.183.179', '4', '1539728675', null, null);
INSERT INTO `cruge_session` VALUES ('511', '1', '1539700827', '1539744027', '0', '192.172.192.8', '1', '1539700827', '1539702043', '192.172.192.8');
INSERT INTO `cruge_session` VALUES ('512', '1', '1539702590', '1539745790', '0', '192.172.182.1', '1', '1539702590', '1539702717', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('513', '5', '1539705688', '1539748888', '1', '192.172.186.28', '2', '1539727509', null, null);
INSERT INTO `cruge_session` VALUES ('514', '1', '1539712717', '1539755917', '0', '192.172.182.1', '1', '1539712717', '1539715551', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('515', '1', '1539718918', '1539762118', '0', '192.172.182.1', '1', '1539718918', '1539719092', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('516', '16', '1539719104', '1539762304', '0', '192.172.187.25', '2', '1539719697', '1539720036', '192.172.187.25');
INSERT INTO `cruge_session` VALUES ('517', '1', '1539724367', '1539767567', '0', '192.172.182.1', '1', '1539724367', '1539725590', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('518', '16', '1539780359', '1539823559', '0', '192.172.187.25', '1', '1539780359', '1539781399', '192.172.187.25');
INSERT INTO `cruge_session` VALUES ('519', '4', '1539783063', '1539826263', '1', '192.172.183.179', '2', '1539790246', null, null);
INSERT INTO `cruge_session` VALUES ('520', '1', '1539784921', '1539828121', '0', '192.172.182.22', '1', '1539784921', '1539785374', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('521', '1', '1539785613', '1539828813', '0', '192.172.182.22', '1', '1539785613', '1539786418', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('522', '1', '1539787102', '1539830302', '0', '192.172.182.22', '1', '1539787102', '1539793858', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('523', '1', '1539799766', '1539842966', '0', '192.172.182.17', '2', '1539810294', null, null);
INSERT INTO `cruge_session` VALUES ('524', '5', '1539801126', '1539844326', '1', '192.172.186.28', '1', '1539801126', null, null);
INSERT INTO `cruge_session` VALUES ('525', '8', '1539801476', '1539844676', '1', '192.172.183.137', '1', '1539801476', null, null);
INSERT INTO `cruge_session` VALUES ('526', '16', '1539866490', '1539909690', '1', '192.172.187.25', '1', '1539866490', null, null);
INSERT INTO `cruge_session` VALUES ('527', '1', '1539875359', '1539918559', '0', '192.172.182.22', '3', '1539877737', '1539878384', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('528', '4', '1539875887', '1539919087', '1', '192.172.183.179', '4', '1539899451', null, null);
INSERT INTO `cruge_session` VALUES ('529', '1', '1539878458', '1539921658', '0', '192.172.182.22', '1', '1539878458', '1539878498', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('530', '1', '1539883348', '1539926548', '0', '181.225.241.164', '2', '1539904457', '1539906649', '181.225.241.164');
INSERT INTO `cruge_session` VALUES ('531', '5', '1539883854', '1539927054', '1', '192.172.182.1', '1', '1539883854', null, null);
INSERT INTO `cruge_session` VALUES ('532', '6', '1539889165', '1539932365', '1', '192.172.182.1', '1', '1539889165', null, null);
INSERT INTO `cruge_session` VALUES ('533', '7', '1539954281', '1539997481', '0', '192.172.186.24', '1', '1539954281', null, null);
INSERT INTO `cruge_session` VALUES ('534', '1', '1539955375', '1539998575', '0', '192.172.182.22', '1', '1539955375', '1539955715', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('535', '8', '1539955724', '1539998924', '0', '192.172.182.22', '1', '1539955724', '1539955768', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('536', '8', '1539959068', '1540002268', '1', '192.172.183.137', '2', '1539973845', null, null);
INSERT INTO `cruge_session` VALUES ('537', '4', '1539960614', '1540003814', '1', '192.172.183.179', '3', '1539973988', null, null);
INSERT INTO `cruge_session` VALUES ('538', '5', '1539972934', '1540016134', '1', '192.172.186.28', '1', '1539972934', null, null);
INSERT INTO `cruge_session` VALUES ('539', '4', '1540038858', '1540082058', '1', '192.172.183.179', '1', '1540038858', null, null);
INSERT INTO `cruge_session` VALUES ('540', '5', '1540210400', '1540253600', '1', '192.172.186.28', '1', '1540210400', null, null);
INSERT INTO `cruge_session` VALUES ('541', '4', '1540210873', '1540254073', '1', '192.172.183.179', '2', '1540220008', null, null);
INSERT INTO `cruge_session` VALUES ('542', '16', '1540237479', '1540280679', '1', '192.172.187.25', '2', '1540241746', null, null);
INSERT INTO `cruge_session` VALUES ('543', '5', '1540296321', '1540339521', '1', '192.172.186.28', '1', '1540296321', null, null);
INSERT INTO `cruge_session` VALUES ('544', '1', '1540297090', '1540340290', '0', '192.172.182.22', '1', '1540297090', '1540297121', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('545', '6', '1540297131', '1540340331', '0', '192.172.182.22', '1', '1540297131', '1540297136', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('546', '16', '1540297145', '1540340345', '1', '192.172.187.25', '2', '1540304665', null, null);
INSERT INTO `cruge_session` VALUES ('547', '4', '1540300897', '1540344097', '1', '192.172.183.179', '2', '1540305475', null, null);
INSERT INTO `cruge_session` VALUES ('548', '6', '1540301065', '1540344265', '0', '192.172.182.1', '3', '1540329613', '1540329659', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('549', '1', '1540303022', '1540346222', '0', '192.172.182.17', '1', '1540303022', '1540303036', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('550', '7', '1540321236', '1540364436', '0', '192.172.186.24', '1', '1540321236', null, null);
INSERT INTO `cruge_session` VALUES ('551', '1', '1540327446', '1540370646', '0', '192.172.182.17', '1', '1540327446', '1540328842', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('552', '6', '1540329691', '1540372891', '0', '192.172.182.1', '1', '1540329691', '1540329700', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('553', '6', '1540329870', '1540373070', '0', '192.172.182.1', '2', '1540347123', null, null);
INSERT INTO `cruge_session` VALUES ('554', '10', '1540380902', '1540424102', '1', '192.172.183.37', '3', '1540387472', null, null);
INSERT INTO `cruge_session` VALUES ('555', '5', '1540382937', '1540426137', '1', '192.172.186.28', '1', '1540382937', null, null);
INSERT INTO `cruge_session` VALUES ('556', '1', '1540382989', '1540426189', '0', '192.172.182.17', '1', '1540382989', '1540383210', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('557', '4', '1540385736', '1540428936', '0', '192.172.183.179', '1', '1540385736', '1540395763', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('558', '8', '1540394130', '1540437330', '1', '192.172.183.137', '1', '1540394130', null, null);
INSERT INTO `cruge_session` VALUES ('559', '6', '1540395357', '1540438557', '0', '181.225.241.164', '3', '1540409364', '1540409498', '181.225.241.164');
INSERT INTO `cruge_session` VALUES ('560', '4', '1540398340', '1540441540', '1', '192.172.183.179', '3', '1540419095', null, null);
INSERT INTO `cruge_session` VALUES ('561', '7', '1540399039', '1540442239', '0', '192.172.186.24', '1', '1540399039', null, null);
INSERT INTO `cruge_session` VALUES ('562', '1', '1540403583', '1540446783', '0', '192.172.182.22', '1', '1540403583', '1540403876', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('563', '17', '1540403885', '1540447085', '0', '192.172.182.22', '1', '1540403885', '1540404288', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('564', '1', '1540406175', '1540449375', '0', '192.172.182.22', '1', '1540406175', '1540406408', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('565', '18', '1540406463', '1540449663', '0', '192.172.182.22', '1', '1540406463', '1540406904', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('566', '12', '1540410771', '1540453971', '0', '192.172.182.22', '1', '1540410771', '1540411731', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('567', '1', '1540411740', '1540454940', '0', '192.172.182.22', '1', '1540411740', '1540411794', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('568', '1', '1540411931', '1540455131', '0', '192.172.182.22', '1', '1540411931', '1540412029', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('569', '19', '1540412037', '1540455237', '0', '192.172.182.22', '1', '1540412037', '1540412089', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('570', '6', '1540412234', '1540455434', '1', '192.172.182.103', '1', '1540412234', null, null);
INSERT INTO `cruge_session` VALUES ('571', '1', '1540415005', '1540458205', '0', '192.172.182.22', '1', '1540415005', '1540415028', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('572', '1', '1540526616', '1540569816', '0', '192.172.182.43', '1', '1540526616', '1540526670', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('573', '4', '1540556565', '1540599765', '1', '192.172.183.179', '1', '1540556565', null, null);
INSERT INTO `cruge_session` VALUES ('574', '5', '1540556800', '1540600000', '1', '192.172.186.28', '1', '1540556800', null, null);
INSERT INTO `cruge_session` VALUES ('575', '1', '1540557077', '1540600277', '0', '192.172.182.22', '1', '1540557077', '1540559000', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('576', '1', '1540563263', '1540606463', '0', '192.172.182.22', '1', '1540563263', '1540564488', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('577', '1', '1540565829', '1540609029', '0', '192.172.182.17', '1', '1540565829', '1540565895', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('578', '1', '1540566157', '1540609357', '0', '192.172.182.22', '3', '1540583658', '1540583927', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('579', '7', '1540576696', '1540619896', '0', '192.172.186.24', '1', '1540576696', '1540586084', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('580', '11', '1540582106', '1540625306', '0', '192.172.186.24', '2', '1540586124', '1540587908', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('581', '1', '1540586744', '1540629944', '0', '192.172.182.43', '2', '1540601370', '1540601916', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('582', '10', '1540587923', '1540631123', '0', '192.172.186.24', '1', '1540587923', '1540588538', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('583', '4', '1540646553', '1540689753', '1', '192.172.183.179', '1', '1540646553', null, null);
INSERT INTO `cruge_session` VALUES ('584', '1', '1540679721', '1540722921', '0', '192.172.182.1', '2', '1540679908', '1540680516', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('585', '4', '1540728280', '1540771480', '1', '192.172.183.179', '1', '1540728280', null, null);
INSERT INTO `cruge_session` VALUES ('586', '1', '1540761974', '1540805174', '1', '192.172.182.43', '1', '1540761974', null, null);
INSERT INTO `cruge_session` VALUES ('587', '4', '1540814781', '1540857981', '0', '192.172.183.179', '1', '1540814781', '1540844058', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('588', '4', '1540844968', '1540888168', '1', '192.172.183.179', '1', '1540844968', null, null);
INSERT INTO `cruge_session` VALUES ('589', '1', '1540850872', '1540894072', '0', '192.172.182.43', '1', '1540850872', '1540850947', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('590', '17', '1540903688', '1540946888', '1', '192.172.187.21', '1', '1540903688', null, null);
INSERT INTO `cruge_session` VALUES ('591', '4', '1540904465', '1540947665', '1', '192.172.183.179', '2', '1540906329', null, null);
INSERT INTO `cruge_session` VALUES ('592', '5', '1540912468', '1540955668', '1', '192.172.186.28', '1', '1540912468', null, null);
INSERT INTO `cruge_session` VALUES ('593', '1', '1540921255', '1540964455', '1', '192.172.182.22', '1', '1540921255', null, null);
INSERT INTO `cruge_session` VALUES ('594', '5', '1540988071', '1541031271', '1', '192.172.186.28', '1', '1540988071', null, null);
INSERT INTO `cruge_session` VALUES ('595', '4', '1540991731', '1541034931', '1', '192.172.183.179', '1', '1540991731', null, null);
INSERT INTO `cruge_session` VALUES ('596', '1', '1540998316', '1541041516', '0', '192.172.182.22', '2', '1541000561', null, null);
INSERT INTO `cruge_session` VALUES ('597', '11', '1541004055', '1541047255', '0', '192.172.186.24', '1', '1541004055', '1541004171', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('598', '4', '1541077450', '1541120650', '1', '192.172.183.179', '3', '1541110932', null, null);
INSERT INTO `cruge_session` VALUES ('599', '7', '1541085022', '1541128222', '0', '192.172.186.24', '1', '1541085022', '1541087318', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('600', '11', '1541087349', '1541130549', '0', '192.172.186.24', '1', '1541087349', '1541088209', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('601', '7', '1541088230', '1541131430', '0', '192.172.186.24', '1', '1541088230', '1541088349', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('602', '1', '1541097877', '1541141077', '0', '192.172.182.22', '1', '1541097877', '1541099320', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('603', '1', '1541104022', '1541147222', '1', '192.172.182.22', '2', '1541107401', null, null);
INSERT INTO `cruge_session` VALUES ('604', '1', '1541161489', '1541204689', '0', '192.172.182.100', '2', '1541171344', '1541175632', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('605', '4', '1541171331', '1541214531', '1', '192.172.183.179', '2', '1541182100', null, null);
INSERT INTO `cruge_session` VALUES ('606', '16', '1541175620', '1541218820', '0', '192.172.187.25', '1', '1541175620', '1541175786', '192.172.187.25');
INSERT INTO `cruge_session` VALUES ('607', '1', '1541177606', '1541220806', '0', '192.172.192.14', '2', '1541182972', '1541182988', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('608', '8', '1541179116', '1541222316', '1', '192.172.183.137', '1', '1541179116', null, null);
INSERT INTO `cruge_session` VALUES ('609', '5', '1541180244', '1541223444', '1', '192.172.186.28', '1', '1541180244', null, null);
INSERT INTO `cruge_session` VALUES ('610', '6', '1541182545', '1541225745', '0', '192.172.192.14', '2', '1541182996', '1541183005', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('611', '1', '1541183012', '1541226212', '0', '192.172.192.14', '1', '1541183012', '1541183044', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('612', '6', '1541183050', '1541226250', '0', '192.172.192.14', '1', '1541183050', '1541183437', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('613', '1', '1541183445', '1541226645', '0', '192.172.192.14', '1', '1541183445', '1541183493', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('614', '9', '1541183505', '1541226705', '0', '192.172.192.14', '1', '1541183505', '1541183805', '192.172.192.14');
INSERT INTO `cruge_session` VALUES ('615', '6', '1541183811', '1541227011', '1', '192.172.192.14', '1', '1541183811', null, null);
INSERT INTO `cruge_session` VALUES ('616', '7', '1541188697', '1541231897', '0', '192.172.186.24', '1', '1541188697', null, null);
INSERT INTO `cruge_session` VALUES ('617', '4', '1541256240', '1541299440', '1', '192.172.183.179', '1', '1541256240', null, null);
INSERT INTO `cruge_session` VALUES ('618', '5', '1541424854', '1541468054', '1', '192.172.186.28', '1', '1541424854', null, null);
INSERT INTO `cruge_session` VALUES ('619', '4', '1541426381', '1541469581', '0', '192.172.182.22', '4', '1541452190', '1541452246', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('620', '1', '1541438099', '1541481299', '0', '192.172.182.22', '2', '1541438404', '1541440727', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('621', '1', '1541447075', '1541490275', '0', '192.172.182.17', '1', '1541447075', '1541447890', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('622', '4', '1541456020', '1541499220', '1', '192.172.183.179', '1', '1541456020', null, null);
INSERT INTO `cruge_session` VALUES ('623', '4', '1541510323', '1541553523', '1', '192.172.183.179', '4', '1541545075', null, null);
INSERT INTO `cruge_session` VALUES ('624', '1', '1541515485', '1541558685', '0', '192.172.182.22', '1', '1541515485', '1541518853', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('625', '7', '1541518565', '1541561765', '0', '192.172.182.22', '2', '1541518860', '1541519020', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('626', '1', '1541519027', '1541562227', '0', '192.172.182.22', '1', '1541519027', '1541519252', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('627', '7', '1541519088', '1541562288', '0', '192.172.186.24', '1', '1541519088', '1541520158', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('628', '20', '1541519450', '1541562650', '0', '192.172.182.22', '1', '1541519450', '1541519904', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('629', '20', '1541525330', '1541568530', '1', '192.172.183.141', '2', '1541527873', null, null);
INSERT INTO `cruge_session` VALUES ('630', '5', '1541526476', '1541569676', '1', '192.172.186.28', '1', '1541526476', null, null);
INSERT INTO `cruge_session` VALUES ('631', '7', '1541528272', '1541571472', '0', '192.172.186.24', '1', '1541528272', null, null);
INSERT INTO `cruge_session` VALUES ('632', '6', '1541541930', '1541585130', '1', '192.172.182.103', '1', '1541541930', null, null);
INSERT INTO `cruge_session` VALUES ('633', '5', '1541596658', '1541639858', '1', '192.172.182.1', '2', '1541603601', null, null);
INSERT INTO `cruge_session` VALUES ('634', '4', '1541599590', '1541642790', '1', '192.172.183.179', '2', '1541628330', null, null);
INSERT INTO `cruge_session` VALUES ('635', '1', '1541602471', '1541645671', '1', '192.172.182.22', '1', '1541602471', null, null);
INSERT INTO `cruge_session` VALUES ('636', '6', '1541609567', '1541652767', '1', '192.172.182.1', '2', '1541630809', null, null);
INSERT INTO `cruge_session` VALUES ('637', '4', '1541683245', '1541726445', '1', '192.172.183.179', '5', '1541718943', null, null);
INSERT INTO `cruge_session` VALUES ('638', '5', '1541692151', '1541735351', '1', '192.172.186.28', '2', '1541713250', null, null);
INSERT INTO `cruge_session` VALUES ('639', '7', '1541715547', '1541758747', '0', '192.172.186.24', '1', '1541715547', null, null);
INSERT INTO `cruge_session` VALUES ('640', '4', '1541769924', '1541813124', '1', '192.172.183.179', '4', '1541791192', null, null);
INSERT INTO `cruge_session` VALUES ('641', '1', '1541780389', '1541823589', '1', '192.172.182.22', '1', '1541780389', null, null);
INSERT INTO `cruge_session` VALUES ('642', '5', '1541784323', '1541827523', '1', '192.172.186.28', '1', '1541784323', null, null);
INSERT INTO `cruge_session` VALUES ('643', '6', '1541788981', '1541832181', '1', '192.172.182.1', '1', '1541788981', null, null);
INSERT INTO `cruge_session` VALUES ('644', '4', '1542033415', '1542076615', '1', '192.172.183.179', '2', '1542040562', null, null);
INSERT INTO `cruge_session` VALUES ('645', '6', '1542039312', '1542082512', '1', '192.172.182.1', '1', '1542039312', null, null);
INSERT INTO `cruge_session` VALUES ('646', '20', '1542044098', '1542087298', '1', '192.172.183.141', '1', '1542044098', null, null);
INSERT INTO `cruge_session` VALUES ('647', '5', '1542045974', '1542089174', '1', '192.172.186.28', '1', '1542045974', null, null);
INSERT INTO `cruge_session` VALUES ('648', '4', '1542114600', '1542157800', '1', '192.172.183.179', '2', '1542119557', null, null);
INSERT INTO `cruge_session` VALUES ('649', '20', '1542115740', '1542158940', '1', '192.172.183.141', '1', '1542115740', null, null);
INSERT INTO `cruge_session` VALUES ('650', '6', '1542115812', '1542159012', '1', '192.172.182.1', '2', '1542150887', null, null);
INSERT INTO `cruge_session` VALUES ('651', '1', '1542128076', '1542171276', '0', '192.172.182.22', '1', '1542128076', '1542128969', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('652', '5', '1542129935', '1542173135', '1', '192.172.186.28', '1', '1542129935', null, null);
INSERT INTO `cruge_session` VALUES ('653', '1', '1542139517', '1542182717', '0', '192.172.182.17', '1', '1542139517', null, null);
INSERT INTO `cruge_session` VALUES ('654', '4', '1542208875', '1542252075', '1', '192.172.183.179', '2', '1542221710', null, null);
INSERT INTO `cruge_session` VALUES ('655', '5', '1542213261', '1542256461', '1', '192.172.186.28', '1', '1542213261', null, null);
INSERT INTO `cruge_session` VALUES ('656', '4', '1542295261', '1542338461', '1', '192.172.183.179', '5', '1542317435', null, null);
INSERT INTO `cruge_session` VALUES ('657', '7', '1542300256', '1542343456', '0', '192.172.186.24', '1', '1542300256', '1542307773', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('658', '1', '1542301893', '1542345093', '0', '192.172.182.17', '1', '1542301893', '1542305234', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('659', '5', '1542302809', '1542346009', '1', '192.172.186.28', '1', '1542302809', null, null);
INSERT INTO `cruge_session` VALUES ('660', '7', '1542307848', '1542351048', '0', '192.172.186.24', '2', '1542307952', '1542314086', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('661', '1', '1542308854', '1542352054', '0', '192.172.182.17', '1', '1542308854', '1542308875', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('662', '1', '1542309055', '1542352255', '0', '192.172.182.22', '1', '1542309055', '1542309151', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('663', '4', '1542376781', '1542419981', '1', '192.172.183.179', '3', '1542406761', null, null);
INSERT INTO `cruge_session` VALUES ('664', '1', '1542377973', '1542421173', '0', '192.172.182.22', '1', '1542377973', '1542378794', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('665', '8', '1542383043', '1542426243', '1', '192.172.183.137', '1', '1542383043', null, null);
INSERT INTO `cruge_session` VALUES ('666', '7', '1542395439', '1542438639', '0', '192.172.186.24', '1', '1542395439', null, null);
INSERT INTO `cruge_session` VALUES ('667', '1', '1542398135', '1542441335', '1', '192.172.182.22', '1', '1542398135', null, null);
INSERT INTO `cruge_session` VALUES ('668', '4', '1542461901', '1542505101', '1', '192.172.183.179', '1', '1542461901', null, null);
INSERT INTO `cruge_session` VALUES ('669', '6', '1542493447', '1542536647', '1', '192.172.182.1', '1', '1542493447', null, null);
INSERT INTO `cruge_session` VALUES ('670', '6', '1542578879', '1542622079', '1', '192.172.182.1', '1', '1542578879', null, null);
INSERT INTO `cruge_session` VALUES ('671', '4', '1542636012', '1542679212', '1', '192.172.183.179', '5', '1542659162', null, null);
INSERT INTO `cruge_session` VALUES ('672', '7', '1542636095', '1542679295', '0', '192.172.186.24', '1', '1542636095', null, null);
INSERT INTO `cruge_session` VALUES ('673', '1', '1542637669', '1542680869', '0', '192.172.182.22', '1', '1542637669', '1542637837', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('674', '21', '1542637925', '1542681125', '0', '192.172.182.22', '1', '1542637925', '1542638045', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('675', '5', '1542638631', '1542681831', '1', '192.172.186.28', '1', '1542638631', null, null);
INSERT INTO `cruge_session` VALUES ('676', '6', '1542644109', '1542687309', '1', '192.172.182.1', '1', '1542644109', null, null);
INSERT INTO `cruge_session` VALUES ('677', '1', '1542644583', '1542687783', '0', '192.172.182.22', '1', '1542644583', '1542646801', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('678', '1', '1542650667', '1542693867', '0', '192.172.182.103', '2', '1542657495', '1542661853', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('679', '8', '1542654696', '1542697896', '0', '192.172.183.137', '1', '1542654696', '1542655427', '192.172.183.137');
INSERT INTO `cruge_session` VALUES ('680', '1', '1542665036', '1542708236', '0', '192.172.182.22', '1', '1542665036', '1542666490', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('681', '4', '1542724693', '1542767893', '1', '192.172.183.179', '3', '1542740617', null, null);
INSERT INTO `cruge_session` VALUES ('682', '1', '1542737099', '1542780299', '0', '192.172.182.22', '1', '1542737099', '1542737163', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('683', '5', '1542737250', '1542780450', '1', '192.172.186.28', '1', '1542737250', null, null);
INSERT INTO `cruge_session` VALUES ('684', '1', '1542740438', '1542783638', '0', '192.172.182.22', '1', '1542740438', '1542740578', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('685', '7', '1542740603', '1542783803', '0', '192.172.182.22', '1', '1542740603', '1542740716', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('686', '4', '1542807021', '1542850221', '1', '192.172.183.179', '3', '1542839435', null, null);
INSERT INTO `cruge_session` VALUES ('687', '5', '1542813092', '1542856292', '1', '192.172.186.28', '1', '1542813092', null, null);
INSERT INTO `cruge_session` VALUES ('688', '7', '1542890021', '1542933221', '0', '192.172.186.24', '1', '1542890021', null, null);
INSERT INTO `cruge_session` VALUES ('689', '4', '1542894297', '1542937497', '1', '192.172.183.179', '3', '1542895638', null, null);
INSERT INTO `cruge_session` VALUES ('690', '1', '1542901594', '1542944794', '0', '192.172.182.22', '1', '1542901594', '1542918457', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('691', '5', '1542904059', '1542947259', '1', '192.172.186.28', '1', '1542904059', null, null);
INSERT INTO `cruge_session` VALUES ('692', '6', '1542909673', '1542952873', '1', '192.172.182.1', '1', '1542909673', null, null);
INSERT INTO `cruge_session` VALUES ('693', '4', '1542982293', '1543025493', '1', '192.172.183.179', '4', '1543012913', null, null);
INSERT INTO `cruge_session` VALUES ('694', '6', '1543008461', '1543051661', '1', '192.172.182.1', '2', '1543023652', null, null);
INSERT INTO `cruge_session` VALUES ('695', '4', '1543152109', '1543195309', '1', '192.172.183.179', '1', '1543152109', null, null);
INSERT INTO `cruge_session` VALUES ('696', '7', '1543239275', '1543282475', '0', '192.172.186.24', '1', '1543239275', '1543246564', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('697', '1', '1543240054', '1543283254', '0', '192.172.182.22', '1', '1543240054', '1543240220', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('698', '22', '1543240228', '1543283428', '0', '192.172.182.22', '1', '1543240228', '1543240358', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('699', '22', '1543240405', '1543283605', '0', '192.172.182.22', '1', '1543240405', '1543241071', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('700', '4', '1543241257', '1543284457', '1', '192.172.183.179', '1', '1543241257', null, null);
INSERT INTO `cruge_session` VALUES ('701', '11', '1543244011', '1543287211', '0', '192.172.182.22', '1', '1543244011', '1543244941', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('702', '1', '1543244950', '1543288150', '0', '192.172.182.22', '1', '1543244950', '1543245061', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('703', '1', '1543245096', '1543288296', '0', '192.172.182.22', '1', '1543245096', '1543245196', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('704', '23', '1543245259', '1543288459', '0', '192.172.182.22', '1', '1543245259', '1543245300', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('705', '23', '1543245326', '1543288526', '0', '192.172.182.22', '1', '1543245326', '1543245684', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('706', '8', '1543245543', '1543288743', '1', '192.172.183.137', '1', '1543245543', null, null);
INSERT INTO `cruge_session` VALUES ('707', '23', '1543246589', '1543289789', '0', '192.172.186.24', '1', '1543246589', '1543249573', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('708', '5', '1543249433', '1543292633', '1', '192.172.186.28', '1', '1543249433', null, null);
INSERT INTO `cruge_session` VALUES ('709', '7', '1543249721', '1543292921', '0', '192.172.186.24', '1', '1543249721', '1543252913', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('710', '1', '1543249899', '1543293099', '0', '192.172.182.22', '1', '1543249899', '1543249984', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('711', '1', '1543251062', '1543294262', '0', '192.172.182.22', '1', '1543251062', '1543255663', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('712', '20', '1543251169', '1543294369', '1', '192.172.183.141', '2', '1543271839', null, null);
INSERT INTO `cruge_session` VALUES ('713', '1', '1543256002', '1543299202', '0', '192.172.182.22', '1', '1543256002', '1543256021', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('714', '4', '1543324633', '1543367833', '1', '192.172.183.179', '2', '1543347285', null, null);
INSERT INTO `cruge_session` VALUES ('715', '5', '1543335080', '1543378280', '1', '192.172.186.28', '1', '1543335080', null, null);
INSERT INTO `cruge_session` VALUES ('716', '7', '1543344833', '1543388033', '0', '192.172.186.24', '1', '1543344833', '1543345078', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('717', '11', '1543345122', '1543388322', '0', '192.172.186.24', '1', '1543345122', '1543346374', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('718', '6', '1543356787', '1543399987', '1', '192.172.182.1', '1', '1543356787', null, null);
INSERT INTO `cruge_session` VALUES ('719', '4', '1543413547', '1543456747', '1', '192.172.183.179', '2', '1543419581', null, null);
INSERT INTO `cruge_session` VALUES ('720', '5', '1543418325', '1543461525', '1', '192.172.186.28', '1', '1543418325', null, null);
INSERT INTO `cruge_session` VALUES ('721', '8', '1543421192', '1543464392', '1', '192.172.183.137', '2', '1543434152', null, null);
INSERT INTO `cruge_session` VALUES ('722', '1', '1543438768', '1543481968', '1', '192.172.182.1', '2', '1543438769', null, null);
INSERT INTO `cruge_session` VALUES ('723', '6', '1543452367', '1543495567', '1', '192.172.182.1', '2', '1543452368', null, null);
INSERT INTO `cruge_session` VALUES ('724', '4', '1543502199', '1543545399', '1', '192.172.183.179', '1', '1543502199', null, null);
INSERT INTO `cruge_session` VALUES ('725', '5', '1543513794', '1543556994', '1', '192.172.186.28', '1', '1543513794', null, null);
INSERT INTO `cruge_session` VALUES ('726', '1', '1543583619', '1543626819', '0', '192.172.182.22', '1', '1543583619', '1543585681', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('727', '25', '1543586447', '1543629647', '1', '192.172.192.8', '1', '1543586447', null, null);
INSERT INTO `cruge_session` VALUES ('728', '7', '1543591356', '1543634556', '0', '192.172.186.24', '1', '1543591356', null, null);
INSERT INTO `cruge_session` VALUES ('729', '4', '1543592263', '1543635463', '0', '192.172.182.22', '4', '1543592984', '1543593291', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('730', '6', '1543592403', '1543635603', '1', '192.172.182.1', '1', '1543592403', null, null);
INSERT INTO `cruge_session` VALUES ('731', '1', '1543592951', '1543636151', '0', '192.172.182.22', '1', '1543592951', '1543592973', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('732', '1', '1543593433', '1543636633', '0', '192.172.182.22', '1', '1543593433', '1543593462', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('733', '5', '1543600010', '1543643210', '1', '192.172.186.28', '1', '1543600010', null, null);
INSERT INTO `cruge_session` VALUES ('734', '1', '1543605057', '1543648257', '0', '192.172.182.22', '1', '1543605057', '1543606531', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('735', '26', '1543606082', '1543649282', '0', '192.172.187.55', '1', '1543606082', '1543606353', '192.172.187.55');
INSERT INTO `cruge_session` VALUES ('736', '26', '1543606462', '1543649662', '1', '192.172.187.55', '1', '1543606462', null, null);
INSERT INTO `cruge_session` VALUES ('737', '4', '1543846567', '1543889767', '1', '192.172.183.179', '2', '1543864406', null, null);
INSERT INTO `cruge_session` VALUES ('738', '7', '1543863476', '1543906676', '0', '192.172.186.24', '1', '1543863476', '1543867317', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('739', '4', '1543930892', '1543974092', '1', '192.172.183.179', '2', '1543932457', null, null);
INSERT INTO `cruge_session` VALUES ('740', '6', '1543931771', '1543974971', '1', '192.172.182.1', '1', '1543931771', null, null);
INSERT INTO `cruge_session` VALUES ('741', '7', '1543934368', '1543977568', '0', '192.172.186.24', '1', '1543934368', '1543936893', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('742', '1', '1543934903', '1543978103', '0', '192.172.182.22', '1', '1543934903', '1543935494', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('743', '1', '1543935642', '1543978842', '0', '192.172.182.22', '1', '1543935642', '1543935770', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('744', '1', '1543935989', '1543979189', '0', '192.172.182.22', '1', '1543935989', '1543936447', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('745', '1', '1543937783', '1543980983', '0', '192.172.182.22', '1', '1543937783', '1543937922', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('746', '1', '1543944911', '1543988111', '0', '192.172.182.22', '1', '1543944911', '1543945021', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('747', '9', '1543945408', '1543988608', '0', '192.172.182.22', '1', '1543945408', '1543945413', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('748', '18', '1543945456', '1543988656', '0', '192.172.186.24', '1', '1543945456', '1543945480', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('749', '9', '1543945513', '1543988713', '0', '192.172.186.24', '1', '1543945513', '1543945606', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('750', '1', '1543945618', '1543988818', '0', '192.172.186.24', '1', '1543945618', '1543945660', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('751', '9', '1543945669', '1543988869', '0', '192.172.186.24', '1', '1543945669', '1543946951', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('752', '5', '1543946825', '1543990025', '1', '192.172.186.28', '1', '1543946825', null, null);
INSERT INTO `cruge_session` VALUES ('753', '18', '1543947002', '1543990202', '0', '192.172.186.24', '1', '1543947002', '1543947387', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('754', '9', '1543947400', '1543990600', '0', '192.172.186.24', '1', '1543947400', '1543948659', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('755', '1', '1543948670', '1543991870', '0', '192.172.186.24', '1', '1543948670', '1543948796', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('756', '9', '1543948809', '1543992009', '0', '192.172.186.24', '1', '1543948809', '1543949250', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('757', '18', '1543949280', '1543992480', '0', '192.172.186.24', '1', '1543949280', '1543949509', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('758', '11', '1543949595', '1543992795', '0', '192.172.186.24', '1', '1543949595', '1543949866', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('759', '9', '1543949920', '1543993120', '0', '192.172.182.22', '2', '1543951107', '1543951151', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('760', '1', '1543950238', '1543993438', '0', '192.172.182.22', '1', '1543950238', '1543951098', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('761', '1', '1543951160', '1543994360', '0', '192.172.182.22', '1', '1543951160', '1543951226', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('762', '9', '1543951239', '1543994439', '0', '192.172.182.22', '1', '1543951239', '1543951253', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('763', '9', '1543951255', '1543994455', '0', '192.172.186.24', '1', '1543951255', '1543953032', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('764', '1', '1543951284', '1543994484', '0', '192.172.186.24', '2', '1543953048', '1543953086', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('765', '9', '1543953096', '1543996296', '0', '192.172.182.22', '2', '1543953667', '1543962927', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('766', '7', '1544019278', '1544062478', '0', '192.172.186.24', '1', '1544019278', '1544019305', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('767', '9', '1544019322', '1544062522', '0', '192.172.186.24', '1', '1544019322', '1544019469', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('768', '4', '1544019336', '1544062536', '1', '192.172.183.179', '4', '1544041216', null, null);
INSERT INTO `cruge_session` VALUES ('769', '1', '1544033709', '1544076909', '0', '192.172.182.22', '1', '1544033709', '1544035420', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('770', '5', '1544034700', '1544077900', '1', '192.172.186.28', '1', '1544034700', null, null);
INSERT INTO `cruge_session` VALUES ('771', '9', '1544036310', '1544079510', '0', '192.172.186.24', '1', '1544036310', '1544037004', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('772', '4', '1544114460', '1544157660', '1', '192.172.183.179', '3', '1544132502', null, null);
INSERT INTO `cruge_session` VALUES ('773', '9', '1544130356', '1544173556', '0', '192.172.182.22', '1', '1544130356', '1544130398', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('774', '9', '1544130616', '1544173816', '0', '192.172.182.22', '1', '1544130616', '1544130775', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('775', '9', '1544133689', '1544176889', '0', '192.172.182.22', '1', '1544133689', '1544133826', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('776', '1', '1544133837', '1544177037', '0', '192.172.182.22', '1', '1544133837', '1544134182', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('777', '9', '1544134158', '1544177358', '0', '192.172.186.24', '1', '1544134158', '1544134218', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('778', '6', '1544143880', '1544187080', '1', '192.172.182.1', '1', '1544143880', null, null);
INSERT INTO `cruge_session` VALUES ('779', '9', '1544188271', '1544231471', '0', '192.172.182.22', '2', '1544202738', '1544202796', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('780', '1', '1544188870', '1544232070', '0', '192.172.182.22', '1', '1544188870', '1544189115', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('781', '1', '1544202808', '1544246008', '0', '192.172.182.22', '1', '1544202808', '1544206255', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('782', '5', '1544204554', '1544247754', '1', '192.172.186.28', '1', '1544204554', null, null);
INSERT INTO `cruge_session` VALUES ('783', '1', '1544207763', '1544250963', '0', '192.172.182.22', '1', '1544207763', '1544209271', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('784', '1', '1544209333', '1544252533', '0', '192.172.182.22', '1', '1544209333', '1544209843', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('785', '6', '1544209738', '1544252938', '0', '192.172.192.14', '1', '1544209738', null, null);
INSERT INTO `cruge_session` VALUES ('786', '1', '1544210140', '1544253340', '0', '192.172.192.12', '1', '1544210140', '1544213196', '192.172.192.12');
INSERT INTO `cruge_session` VALUES ('787', '9', '1544213209', '1544256409', '0', '192.172.192.12', '1', '1544213209', '1544213488', '192.172.192.12');
INSERT INTO `cruge_session` VALUES ('788', '1', '1544213511', '1544256711', '0', '192.172.182.22', '2', '1544220403', '1544221535', '192.172.192.12');
INSERT INTO `cruge_session` VALUES ('789', '1', '1544221686', '1544264886', '0', '192.172.182.22', '1', '1544221686', '1544221728', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('790', '6', '1544286185', '1544329385', '1', '192.172.192.14', '1', '1544286185', null, null);
INSERT INTO `cruge_session` VALUES ('791', '4', '1544449933', '1544493133', '1', '192.172.183.179', '3', '1544464847', null, null);
INSERT INTO `cruge_session` VALUES ('792', '5', '1544457960', '1544501160', '0', '192.172.186.28', '2', '1544466102', null, null);
INSERT INTO `cruge_session` VALUES ('793', '4', '1544534349', '1544577549', '1', '192.172.183.179', '3', '1544554826', null, null);
INSERT INTO `cruge_session` VALUES ('794', '5', '1544539836', '1544583036', '1', '192.172.186.28', '2', '1544542409', null, null);
INSERT INTO `cruge_session` VALUES ('795', '1', '1544559584', '1544602784', '0', '192.172.182.17', '1', '1544559584', '1544560122', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('796', '5', '1544629276', '1544672476', '1', '192.172.186.28', '1', '1544629276', null, null);
INSERT INTO `cruge_session` VALUES ('797', '7', '1544629395', '1544672595', '0', '192.172.186.24', '1', '1544629395', null, null);
INSERT INTO `cruge_session` VALUES ('798', '4', '1544634718', '1544677918', '1', '192.172.183.179', '3', '1544654231', null, null);
INSERT INTO `cruge_session` VALUES ('799', '1', '1544711696', '1544754896', '0', '192.172.182.22', '1', '1544711696', '1544711783', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('800', '5', '1544712737', '1544755937', '1', '192.172.186.28', '1', '1544712737', null, null);
INSERT INTO `cruge_session` VALUES ('801', '1', '1544730714', '1544773914', '1', '192.172.182.100', '1', '1544730714', null, null);
INSERT INTO `cruge_session` VALUES ('802', '5', '1544813671', '1544856871', '1', '192.172.186.28', '1', '1544813671', null, null);
INSERT INTO `cruge_session` VALUES ('803', '4', '1545054958', '1545098158', '1', '192.172.183.179', '2', '1545085788', null, null);
INSERT INTO `cruge_session` VALUES ('804', '1', '1545056780', '1545099980', '0', '192.172.182.22', '1', '1545056780', '1545058791', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('805', '4', '1545140600', '1545183800', '1', '192.172.183.179', '3', '1545164574', null, null);
INSERT INTO `cruge_session` VALUES ('806', '4', '1545225173', '1545268373', '1', '192.172.183.179', '2', '1545229525', null, null);
INSERT INTO `cruge_session` VALUES ('807', '1', '1545243870', '1545287070', '0', '192.172.182.17', '1', '1545243870', '1545246058', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('808', '5', '1545245281', '1545288481', '1', '192.172.186.25', '1', '1545245281', null, null);
INSERT INTO `cruge_session` VALUES ('809', '4', '1545324623', '1545367823', '1', '192.172.183.179', '1', '1545324623', null, null);
INSERT INTO `cruge_session` VALUES ('810', '1', '1545334591', '1545377791', '0', '192.172.182.22', '1', '1545334591', '1545334957', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('811', '6', '1545338115', '1545381315', '1', '192.172.182.103', '1', '1545338115', null, null);
INSERT INTO `cruge_session` VALUES ('812', '1', '1545342787', '1545385987', '0', '192.172.182.22', '1', '1545342787', '1545342897', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('813', '27', '1545343716', '1545386916', '1', '192.172.183.24', '1', '1545343716', null, null);
INSERT INTO `cruge_session` VALUES ('814', '5', '1545403620', '1545446820', '1', '192.172.186.25', '1', '1545403620', null, null);
INSERT INTO `cruge_session` VALUES ('815', '4', '1545515596', '1545558796', '1', '192.172.183.179', '1', '1545515596', null, null);
INSERT INTO `cruge_session` VALUES ('816', '4', '1545570121', '1545613321', '1', '192.172.183.179', '1', '1545570121', null, null);
INSERT INTO `cruge_session` VALUES ('817', '4', '1545663622', '1545706822', '1', '192.172.183.179', '2', '1545685293', null, null);
INSERT INTO `cruge_session` VALUES ('818', '6', '1545699332', '1545742532', '1', '192.172.182.1', '1', '1545699332', null, null);
INSERT INTO `cruge_session` VALUES ('819', '20', '1545836645', '1545879845', '1', '192.172.183.141', '1', '1545836645', null, null);
INSERT INTO `cruge_session` VALUES ('820', '4', '1545839039', '1545882239', '1', '192.172.183.179', '1', '1545839039', null, null);
INSERT INTO `cruge_session` VALUES ('821', '4', '1545924645', '1545967845', '1', '192.172.183.179', '1', '1545924645', null, null);
INSERT INTO `cruge_session` VALUES ('822', '4', '1546004690', '1546047890', '1', '192.172.183.179', '2', '1546033011', null, null);
INSERT INTO `cruge_session` VALUES ('823', '6', '1546006555', '1546049755', '1', '192.172.182.1', '1', '1546006555', null, null);
INSERT INTO `cruge_session` VALUES ('824', '1', '1546008103', '1546051303', '0', '192.172.182.1', '1', '1546008103', '1546008186', '192.172.182.1');
INSERT INTO `cruge_session` VALUES ('825', '4', '1546113064', '1546156264', '1', '192.172.183.179', '1', '1546113064', null, null);
INSERT INTO `cruge_session` VALUES ('826', '4', '1546437996', '1546481196', '1', '192.172.183.179', '4', '1546454107', null, null);
INSERT INTO `cruge_session` VALUES ('827', '1', '1546450665', '1546493865', '0', '192.172.182.43', '1', '1546450665', '1546450970', '192.172.182.43');
INSERT INTO `cruge_session` VALUES ('828', '4', '1546533651', '1546576851', '0', '192.172.183.179', '1', '1546533651', '1546533852', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('829', '1', '1546533875', '1546577075', '0', '192.172.183.179', '1', '1546533875', '1546533947', '192.172.183.179');
INSERT INTO `cruge_session` VALUES ('830', '1', '1546547424', '1546590624', '0', '192.172.182.17', '1', '1546547424', '1546547853', '192.172.182.17');
INSERT INTO `cruge_session` VALUES ('831', '4', '1546607283', '1546650483', '1', '192.172.183.179', '2', '1546641065', null, null);
INSERT INTO `cruge_session` VALUES ('832', '5', '1546617095', '1546660295', '1', '192.172.186.25', '1', '1546617095', null, null);
INSERT INTO `cruge_session` VALUES ('833', '4', '1546869866', '1546913066', '1', '192.172.183.179', '2', '1546887504', null, null);
INSERT INTO `cruge_session` VALUES ('834', '5', '1546874839', '1546918039', '1', '192.172.186.25', '1', '1546874839', null, null);
INSERT INTO `cruge_session` VALUES ('835', '4', '1546956632', '1546999832', '1', '192.172.183.179', '2', '1546989837', null, null);
INSERT INTO `cruge_session` VALUES ('836', '5', '1546971007', '1547014207', '1', '192.172.186.25', '1', '1546971007', null, null);
INSERT INTO `cruge_session` VALUES ('837', '5', '1547041388', '1547084588', '1', '192.172.186.25', '1', '1547041388', null, null);
INSERT INTO `cruge_session` VALUES ('838', '6', '1547042833', '1547086033', '1', '192.172.182.103', '2', '1547046958', null, null);
INSERT INTO `cruge_session` VALUES ('839', '4', '1547126912', '1547170112', '1', '192.172.183.179', '3', '1547146437', null, null);
INSERT INTO `cruge_session` VALUES ('840', '20', '1547128694', '1547171894', '1', '192.172.183.141', '1', '1547128694', null, null);
INSERT INTO `cruge_session` VALUES ('841', '5', '1547146892', '1547190092', '1', '192.172.186.25', '1', '1547146892', null, null);
INSERT INTO `cruge_session` VALUES ('842', '4', '1547211888', '1547255088', '1', '192.172.183.179', '3', '1547244030', null, null);
INSERT INTO `cruge_session` VALUES ('843', '5', '1547217962', '1547261162', '1', '192.172.186.25', '1', '1547217962', null, null);
INSERT INTO `cruge_session` VALUES ('844', '6', '1547301923', '1547345123', '1', '192.172.182.1', '1', '1547301923', null, null);
INSERT INTO `cruge_session` VALUES ('845', '4', '1547386716', '1547429916', '1', '192.172.183.179', '1', '1547386716', null, null);
INSERT INTO `cruge_session` VALUES ('846', '4', '1547475835', '1547519035', '1', '192.172.183.179', '2', '1547501909', null, null);
INSERT INTO `cruge_session` VALUES ('847', '6', '1547490450', '1547533650', '1', '192.172.182.1', '1', '1547490450', null, null);
INSERT INTO `cruge_session` VALUES ('848', '7', '1547490497', '1547533697', '0', '192.172.186.24', '1', '1547490497', null, null);
INSERT INTO `cruge_session` VALUES ('849', '4', '1547559480', '1547602680', '1', '192.172.183.179', '2', '1547560932', null, null);
INSERT INTO `cruge_session` VALUES ('850', '5', '1547573367', '1547616567', '1', '192.172.186.25', '1', '1547573367', null, null);
INSERT INTO `cruge_session` VALUES ('851', '7', '1547585138', '1547628338', '0', '192.172.186.24', '1', '1547585138', null, null);
INSERT INTO `cruge_session` VALUES ('852', '1', '1547586349', '1547629549', '0', '192.172.182.22', '1', '1547586349', '1547587143', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('853', '4', '1547645614', '1547688814', '1', '192.172.183.179', '1', '1547645614', null, null);
INSERT INTO `cruge_session` VALUES ('854', '1', '1547647308', '1547690508', '0', '192.172.186.24', '1', '1547647308', '1547647405', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('855', '7', '1547647463', '1547690663', '0', '192.172.182.22', '2', '1547648391', '1547648404', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('856', '1', '1547647740', '1547690940', '0', '192.172.182.22', '1', '1547647740', '1547648370', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('857', '5', '1547648276', '1547691476', '1', '192.172.186.25', '1', '1547648276', null, null);
INSERT INTO `cruge_session` VALUES ('858', '1', '1547648414', '1547691614', '0', '192.172.182.22', '1', '1547648414', '1547648758', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('859', '7', '1547648772', '1547691972', '0', '192.172.182.22', '1', '1547648772', '1547648788', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('860', '1', '1547648796', '1547691996', '0', '192.172.182.22', '1', '1547648796', '1547648823', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('861', '7', '1547648837', '1547692037', '0', '192.172.182.22', '1', '1547648837', '1547648889', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('862', '1', '1547648900', '1547692100', '0', '192.172.182.22', '1', '1547648900', '1547649009', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('863', '7', '1547649020', '1547692220', '0', '192.172.182.22', '1', '1547649020', '1547649047', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('864', '1', '1547649063', '1547692263', '0', '192.172.182.22', '1', '1547649063', '1547649309', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('865', '7', '1547649565', '1547692765', '0', '192.172.186.24', '1', '1547649565', '1547650744', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('866', '11', '1547650762', '1547693962', '0', '192.172.186.24', '1', '1547650762', '1547652303', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('867', '18', '1547652501', '1547695701', '0', '192.172.186.24', '1', '1547652501', '1547653822', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('868', '10', '1547653998', '1547697198', '0', '192.172.186.24', '1', '1547653998', '1547658077', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('869', '7', '1547658090', '1547701290', '0', '192.172.186.24', '1', '1547658090', '1547660751', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('870', '10', '1547660764', '1547703964', '0', '192.172.186.24', '1', '1547660764', '1547661362', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('871', '18', '1547661383', '1547704583', '0', '192.172.186.24', '1', '1547661383', '1547666713', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('872', '12', '1547668081', '1547711281', '0', '192.172.186.24', '1', '1547668081', '1547668558', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('873', '4', '1547734145', '1547777345', '1', '192.172.183.179', '1', '1547734145', null, null);
INSERT INTO `cruge_session` VALUES ('874', '5', '1547748705', '1547791905', '1', '192.172.186.25', '1', '1547748705', null, null);
INSERT INTO `cruge_session` VALUES ('875', '5', '1547823399', '1547866599', '1', '192.172.186.25', '1', '1547823399', null, null);
INSERT INTO `cruge_session` VALUES ('876', '4', '1547824925', '1547868125', '1', '192.172.183.179', '3', '1547827024', null, null);
INSERT INTO `cruge_session` VALUES ('877', '4', '1547908573', '1547951773', '1', '192.172.183.179', '1', '1547908573', null, null);
INSERT INTO `cruge_session` VALUES ('878', '4', '1547989910', '1548033110', '1', '192.172.183.179', '1', '1547989910', null, null);
INSERT INTO `cruge_session` VALUES ('879', '5', '1548077597', '1548120797', '1', '192.172.186.25', '1', '1548077597', null, null);
INSERT INTO `cruge_session` VALUES ('880', '1', '1548078035', '1548121235', '0', '192.172.192.12', '2', '1548083223', '1548084337', '192.172.192.12');
INSERT INTO `cruge_session` VALUES ('881', '4', '1548079465', '1548122665', '1', '192.172.183.179', '2', '1548099372', null, null);
INSERT INTO `cruge_session` VALUES ('882', '1', '1548169504', '1548212704', '0', '192.172.187.21', '1', '1548169504', '1548169566', '192.172.187.21');
INSERT INTO `cruge_session` VALUES ('883', '27', '1548169579', '1548212779', '0', '192.172.182.22', '2', '1548170134', '1548170322', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('884', '1', '1548169721', '1548212921', '0', '192.172.182.22', '1', '1548169721', '1548170124', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('885', '1', '1548170734', '1548213934', '0', '192.172.182.22', '1', '1548170734', '1548170763', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('886', '27', '1548170773', '1548213973', '0', '192.172.182.22', '1', '1548170773', '1548170776', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('887', '4', '1548171074', '1548214274', '1', '192.172.183.179', '5', '1548199959', null, null);
INSERT INTO `cruge_session` VALUES ('888', '1', '1548172113', '1548215313', '0', '192.172.182.22', '1', '1548172113', '1548184285', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('889', '9', '1548172181', '1548215381', '0', '192.172.186.24', '1', '1548172181', '1548186275', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('890', '5', '1548176663', '1548219863', '1', '192.172.186.25', '2', '1548186998', null, null);
INSERT INTO `cruge_session` VALUES ('891', '20', '1548180715', '1548223915', '1', '192.172.183.141', '1', '1548180715', null, null);
INSERT INTO `cruge_session` VALUES ('892', '23', '1548186292', '1548229492', '0', '192.172.186.24', '1', '1548186292', '1548186540', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('893', '23', '1548186881', '1548230081', '0', '192.172.182.22', '1', '1548186881', '1548186976', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('894', '1', '1548186987', '1548230187', '0', '192.172.182.22', '1', '1548186987', '1548187219', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('895', '1', '1548187245', '1548230445', '0', '192.172.182.22', '1', '1548187245', '1548187296', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('896', '23', '1548187304', '1548230504', '0', '192.172.182.22', '1', '1548187304', '1548187308', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('897', '1', '1548187315', '1548230515', '0', '192.172.182.22', '1', '1548187315', '1548187479', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('898', '23', '1548187487', '1548230687', '0', '192.172.182.22', '1', '1548187487', '1548187599', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('899', '1', '1548187609', '1548230809', '0', '192.172.182.22', '1', '1548187609', '1548187713', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('900', '23', '1548187686', '1548230886', '0', '192.172.186.24', '1', '1548187686', '1548187962', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('901', '9', '1548187976', '1548231176', '0', '192.172.186.24', '1', '1548187976', '1548195073', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('902', '4', '1548258272', '1548301472', '1', '192.172.183.179', '3', '1548268243', null, null);
INSERT INTO `cruge_session` VALUES ('903', '5', '1548269411', '1548312611', '1', '192.172.186.25', '1', '1548269411', null, null);
INSERT INTO `cruge_session` VALUES ('904', '8', '1548271611', '1548314811', '1', '192.172.183.137', '1', '1548271611', null, null);
INSERT INTO `cruge_session` VALUES ('905', '4', '1548336718', '1548379918', '1', '192.172.183.179', '1', '1548336718', null, null);
INSERT INTO `cruge_session` VALUES ('906', '1', '1548337454', '1548380654', '0', '192.172.182.22', '1', '1548337454', '1548338033', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('907', '28', '1548338138', '1548381338', '0', '192.172.182.22', '1', '1548338138', '1548338186', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('908', '1', '1548338195', '1548381395', '0', '192.172.182.22', '1', '1548338195', '1548338258', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('909', '28', '1548338266', '1548381466', '0', '192.172.182.22', '1', '1548338266', '1548338624', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('910', '9', '1548338883', '1548382083', '0', '192.172.186.24', '1', '1548338883', '1548339375', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('911', '9', '1548342562', '1548385762', '0', '192.172.186.24', '1', '1548342562', '1548342755', '192.172.186.24');
INSERT INTO `cruge_session` VALUES ('912', '1', '1548346479', '1548389679', '0', '192.172.182.22', '1', '1548346479', '1548364286', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('913', '6', '1548362865', '1548406065', '1', '192.172.192.14', '1', '1548362865', null, null);
INSERT INTO `cruge_session` VALUES ('914', '1', '1548364603', '1548407803', '0', '192.172.182.22', '1', '1548364603', '1548368155', '192.172.182.22');
INSERT INTO `cruge_session` VALUES ('915', '1', '1548512489', '1548555689', '0', '::1', '4', '1548553859', null, null);
INSERT INTO `cruge_session` VALUES ('916', '1', '1548555922', '1548599122', '1', '::1', '2', '1548556309', null, null);
INSERT INTO `cruge_session` VALUES ('917', '1', '1550546106', '1550589306', '1', '::1', '1', '1550546106', null, null);
INSERT INTO `cruge_session` VALUES ('918', '1', '1551637979', '1551681179', '1', '::1', '2', '1551638059', null, null);
INSERT INTO `cruge_session` VALUES ('919', '1', '1555198787', '1555241987', '1', '::1', '1', '1555198787', null, null);
INSERT INTO `cruge_session` VALUES ('920', '1', '1563457298', '1563500498', '1', '::1', '2', '1563484397', null, null);
INSERT INTO `cruge_session` VALUES ('921', '1', '1617035887', '1617079087', '1', '::1', '1', '1617035887', null, null);
INSERT INTO `cruge_session` VALUES ('922', '1', '1617111441', '1617154641', '1', '::1', '3', '1617147610', null, null);
INSERT INTO `cruge_session` VALUES ('923', '1', '1617488517', '1617531717', '1', '::1', '2', '1617503562', null, null);
INSERT INTO `cruge_session` VALUES ('924', '1', '1622335094', '1622378294', '0', '::1', '1', '1622335094', '1622335241', '::1');
INSERT INTO `cruge_session` VALUES ('925', '1', '1622335247', '1622378447', '0', '::1', '1', '1622335247', '1622335250', '::1');
INSERT INTO `cruge_session` VALUES ('926', '1', '1622342339', '1622385539', '0', '::1', '3', '1622385503', null, null);
INSERT INTO `cruge_session` VALUES ('927', '1', '1622385562', '1622428762', '0', '::1', '3', '1622389763', '1622416421', '::1');
INSERT INTO `cruge_session` VALUES ('928', '1', '1622416986', '1622460186', '1', '::1', '3', '1622439541', null, null);
INSERT INTO `cruge_session` VALUES ('929', '1', '1622463381', '1622506581', '0', '::1', '1', '1622463381', '1622476963', '::1');
INSERT INTO `cruge_session` VALUES ('930', '1', '1622477756', '1622520956', '0', '::1', '1', '1622477756', '1622477766', '::1');
INSERT INTO `cruge_session` VALUES ('931', '1', '1622477771', '1622520971', '1', '::1', '2', '1622481351', null, null);
INSERT INTO `cruge_session` VALUES ('932', '1', '1624918997', '1624962197', '1', '::1', '1', '1624918997', null, null);
INSERT INTO `cruge_session` VALUES ('933', '1', '1625179739', '1625222939', '1', '::1', '1', '1625179739', null, null);
INSERT INTO `cruge_session` VALUES ('934', '1', '1628703529', '1628746729', '1', '::1', '1', '1628703529', null, null);
INSERT INTO `cruge_session` VALUES ('935', '1', '1629142027', '1629185227', '1', '::1', '1', '1629142027', null, null);
INSERT INTO `cruge_session` VALUES ('936', '1', '1655766058', '1655809258', '1', '::1', '1', '1655766058', null, null);
INSERT INTO `cruge_session` VALUES ('937', '1', '1660842530', '1660885730', '1', '::1', '1', '1660842530', null, null);
INSERT INTO `cruge_session` VALUES ('938', '1', '1673967336', '1674010536', '1', '::1', '1', '1673967336', null, null);
INSERT INTO `cruge_session` VALUES ('939', '1', '1679251990', '1679295190', '1', '::1', '1', '1679251990', null, null);
INSERT INTO `cruge_session` VALUES ('940', '1', '1682861772', '1682904972', '1', '::1', '1', '1682861772', null, null);
INSERT INTO `cruge_session` VALUES ('941', '1', '1682986886', '1683030086', '0', '::1', '1', '1682986886', '1682987965', '::1');
INSERT INTO `cruge_session` VALUES ('942', '1', '1682989051', '1683032251', '0', '::1', '1', '1682989051', '1682989165', '::1');
INSERT INTO `cruge_session` VALUES ('943', '1', '1682989324', '1683032524', '0', '::1', '1', '1682989324', '1682991825', '::1');
INSERT INTO `cruge_session` VALUES ('944', '1', '1682994648', '1683037848', '0', '::1', '1', '1682994648', '1682994686', '::1');
INSERT INTO `cruge_session` VALUES ('945', '1', '1683031406', '1683074606', '0', '::1', '1', '1683031406', '1683031471', '::1');
INSERT INTO `cruge_session` VALUES ('946', '1', '1683031514', '1683074714', '0', '::1', '1', '1683031514', '1683031532', '::1');
INSERT INTO `cruge_session` VALUES ('947', '1', '1683031917', '1683075117', '0', '::1', '1', '1683031917', '1683031923', '::1');
INSERT INTO `cruge_session` VALUES ('948', '1', '1683032123', '1683075323', '0', '::1', '1', '1683032123', '1683039876', '::1');
INSERT INTO `cruge_session` VALUES ('949', '1', '1683039899', '1683083099', '1', '::1', '1', '1683039899', null, null);

-- ----------------------------
-- Table structure for `cruge_system`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_system`;
CREATE TABLE `cruge_system` (
  `idsystem` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `largename` varchar(45) DEFAULT NULL,
  `sessionmaxdurationmins` int(11) DEFAULT '30',
  `sessionmaxsameipconnections` int(11) DEFAULT '10',
  `sessionreusesessions` int(11) DEFAULT '1' COMMENT '1yes 0no',
  `sessionmaxsessionsperday` int(11) DEFAULT '-1',
  `sessionmaxsessionsperuser` int(11) DEFAULT '-1',
  `systemnonewsessions` int(11) DEFAULT '0' COMMENT '1yes 0no',
  `systemdown` int(11) DEFAULT '0',
  `registerusingcaptcha` int(11) DEFAULT '0',
  `registerusingterms` int(11) DEFAULT '0',
  `terms` blob,
  `registerusingactivation` int(11) DEFAULT '1',
  `defaultroleforregistration` varchar(64) DEFAULT NULL,
  `registerusingtermslabel` varchar(100) DEFAULT NULL,
  `registrationonlogin` int(11) DEFAULT '1',
  `current_system_year` int(11) DEFAULT NULL,
  `current_system_month` int(11) DEFAULT NULL,
  `current_system_day` int(11) DEFAULT NULL,
  `current_system_date` varchar(25) DEFAULT NULL,
  `top_aspirantes_seleccionados` int(11) DEFAULT NULL,
  `limite_alerta_contratos` int(11) DEFAULT '20',
  `reiteracion_alerta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idsystem`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_system
-- ----------------------------
INSERT INTO `cruge_system` VALUES ('1', 'default', '', '720', '10', '1', '-1', '-1', '0', '0', '0', '1', 0x546F646F73206C6F73206465726563686F732072657365727661646F73, '0', 'invitados', 'Acepto los términos y condiciones de registro', '0', '2018', '2', '1', '2019-01-15', '500', '20', '15');

-- ----------------------------
-- Table structure for `cruge_user`
-- ----------------------------
DROP TABLE IF EXISTS `cruge_user`;
CREATE TABLE `cruge_user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `regdate` bigint(30) DEFAULT NULL,
  `actdate` bigint(30) DEFAULT NULL,
  `logondate` bigint(30) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'Hashed password',
  `authkey` varchar(100) DEFAULT NULL COMMENT 'llave de autentificacion',
  `state` int(11) DEFAULT '0',
  `totalsessioncounter` int(11) DEFAULT '0',
  `currentsessioncounter` int(11) DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cruge_user
-- ----------------------------
INSERT INTO `cruge_user` VALUES ('1', '0', '0', '1683039899', 'root', 'reynier@turismo.cmw.cu', '9f2e1c23fbdef1aa1fbe155c1c90ab6c', '', '1', '0', '0');

-- ----------------------------
-- Table structure for `tablas`
-- ----------------------------
DROP TABLE IF EXISTS `tablas`;
CREATE TABLE `tablas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(255) NOT NULL,
  `accion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tablas
-- ----------------------------
INSERT INTO `tablas` VALUES ('1', 'cruge_system', 'restaura');
INSERT INTO `tablas` VALUES ('2', 'tbl_categorias_establecimientos', 'restaura');
INSERT INTO `tablas` VALUES ('3', 'tbl_municipios', 'restaura');
INSERT INTO `tablas` VALUES ('4', 'tbl_establecimientos', 'restaura');
INSERT INTO `tablas` VALUES ('5', 'tbl_partes', 'restaura');
INSERT INTO `tablas` VALUES ('6', 'tbl_energia', 'restaura');
INSERT INTO `tablas` VALUES ('7', 'tbl_config', 'restaura');
INSERT INTO `tablas` VALUES ('8', 'tbl_causas_afectaciones', 'restaura');
INSERT INTO `tablas` VALUES ('9', 'tbl_causas_bajas', 'restaura');
INSERT INTO `tablas` VALUES ('10', 'tbl_causas_muertes', 'restaura');
INSERT INTO `tablas` VALUES ('11', 'tbl_tipos_pienso', 'restaura');
INSERT INTO `tablas` VALUES ('12', 'tbl_plan_aves', 'restaura');
INSERT INTO `tablas` VALUES ('13', 'tbl_plan_general', 'restaura');
INSERT INTO `tablas` VALUES ('14', 'tbl_plan_huevos', 'restaura');
INSERT INTO `tablas` VALUES ('15', 'tbl_pienso', 'restaura');
INSERT INTO `tablas` VALUES ('16', 'tbl_huevos', 'restaura');
INSERT INTO `tablas` VALUES ('17', 'tbl_aves', 'restaura');
INSERT INTO `tablas` VALUES ('18', 'tbl_calcio', 'restaura');
INSERT INTO `tablas` VALUES ('19', 'tbl_desglose_aves', 'restaura');
INSERT INTO `tablas` VALUES ('20', 'tbl_desglose_huevos', 'restaura');
INSERT INTO `tablas` VALUES ('21', 'tbl_desglose_muertes', 'restaura');
INSERT INTO `tablas` VALUES ('22', 'tbl_desglose_pienso', 'restaura');

-- ----------------------------
-- Table structure for `tbl_alertas`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alertas`;
CREATE TABLE `tbl_alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificacion` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `notificacion_campo_id` int(11) NOT NULL,
  `activa` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `notificacion_campo_id` (`notificacion_campo_id`),
  CONSTRAINT `tbl_alertas_ibfk_1` FOREIGN KEY (`notificacion_campo_id`) REFERENCES `tbl_notificaciones_campos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_alertas
-- ----------------------------
INSERT INTO `tbl_alertas` VALUES ('2', '227', '1', '1', '0');
INSERT INTO `tbl_alertas` VALUES ('3', '228', '1', '1', '-1');

-- ----------------------------
-- Table structure for `tbl_aplicaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_aplicaciones`;
CREATE TABLE `tbl_aplicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrumento_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `coordinador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `area_id` (`area_id`),
  KEY `id` (`id`),
  KEY `instrumento_id` (`instrumento_id`),
  CONSTRAINT `tbl_aplicaciones_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `tbl_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_aplicaciones_ibfk_2` FOREIGN KEY (`instrumento_id`) REFERENCES `tbl_instrumentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_aplicaciones
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_archivos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archivos`;
CREATE TABLE `tbl_archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) NOT NULL,
  `capacitacion_id` int(11) NOT NULL,
  `foto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `capacitacion_id` (`capacitacion_id`),
  CONSTRAINT `tbl_archivos_ibfk_1` FOREIGN KEY (`capacitacion_id`) REFERENCES `tbl_capacitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1654 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_archivos
-- ----------------------------
INSERT INTO `tbl_archivos` VALUES ('10', 'Cocina Nivel I.jpg', '11', '0');
INSERT INTO `tbl_archivos` VALUES ('11', 'TM COMRCIO.jpg', '12', '0');
INSERT INTO `tbl_archivos` VALUES ('12', 'Universitario INF.jpg', '13', '0');
INSERT INTO `tbl_archivos` VALUES ('13', 'Escaneo0005.jpg', '14', '0');
INSERT INTO `tbl_archivos` VALUES ('14', 'Diplomado.jpg', '15', '0');
INSERT INTO `tbl_archivos` VALUES ('15', 'Curso Postgrado.jpg', '16', '0');
INSERT INTO `tbl_archivos` VALUES ('16', 'TM 12 GRADO.jpg', '17', '0');
INSERT INTO `tbl_archivos` VALUES ('17', 'INGLES 2-NIVEL.jpg', '18', '0');
INSERT INTO `tbl_archivos` VALUES ('18', 'administrador de gastronomia RES 223-97.jpg', '19', '0');
INSERT INTO `tbl_archivos` VALUES ('19', 'universitario.jpg', '20', '0');
INSERT INTO `tbl_archivos` VALUES ('20', 'certificado gestion de ventas.jpg', '21', '0');
INSERT INTO `tbl_archivos` VALUES ('21', 'contabilidad para directivos.jpg', '22', '0');
INSERT INTO `tbl_archivos` VALUES ('22', 'curso de cuadro mision medica.jpg', '23', '0');
INSERT INTO `tbl_archivos` VALUES ('23', 'curso admin de la salud mision medica.jpg', '24', '0');
INSERT INTO `tbl_archivos` VALUES ('24', 'TM.jpg', '25', '0');
INSERT INTO `tbl_archivos` VALUES ('25', 'Almacen.jpg', '26', '0');
INSERT INTO `tbl_archivos` VALUES ('34', 'CURSO CERAMICA Y VIDRIO.jpg', '35', '0');
INSERT INTO `tbl_archivos` VALUES ('35', 'CURSO COMUNICACION SOCIAL.jpg', '36', '0');
INSERT INTO `tbl_archivos` VALUES ('36', 'CURSO TOPOGRAFIA APLICADA A LA ARQUELOGIA.jpg', '37', '0');
INSERT INTO `tbl_archivos` VALUES ('37', 'DIP ANTROPOLOGIA.jpg', '38', '0');
INSERT INTO `tbl_archivos` VALUES ('38', 'LIC HISTORIA.jpg', '39', '0');
INSERT INTO `tbl_archivos` VALUES ('39', 'OPERADOR MICRO PC.jpg', '40', '0');
INSERT INTO `tbl_archivos` VALUES ('40', 'PG INTROD A LA ARQUELOGIA.jpg', '41', '0');
INSERT INTO `tbl_archivos` VALUES ('41', 'PG PALEONTOLOGIA.jpg', '42', '0');
INSERT INTO `tbl_archivos` VALUES ('42', 'PG RESISENCIA LUCHA Y EMANCIPACION.jpg', '43', '0');
INSERT INTO `tbl_archivos` VALUES ('43', 'TECNICAS PATRIMONIO CULTUAL SUBACT.jpg', '44', '0');
INSERT INTO `tbl_archivos` VALUES ('44', 'ADMINIST INT.jpg', '45', '0');
INSERT INTO `tbl_archivos` VALUES ('45', 'ALOJAMIENTO HOTELERO.jpg', '46', '0');
INSERT INTO `tbl_archivos` VALUES ('46', 'AYUDANTE ELAB.jpg', '47', '0');
INSERT INTO `tbl_archivos` VALUES ('47', 'CAJERO DPDTE CIMEX.jpg', '48', '0');
INSERT INTO `tbl_archivos` VALUES ('48', 'COCINERO.jpg', '49', '0');
INSERT INTO `tbl_archivos` VALUES ('49', 'DPDTE GAST.jpg', '50', '0');
INSERT INTO `tbl_archivos` VALUES ('50', 'INTEGRAL.jpg', '51', '0');
INSERT INTO `tbl_archivos` VALUES ('51', 'VETERINARIA UNI.jpg', '52', '0');
INSERT INTO `tbl_archivos` VALUES ('56', 'GESTION DE ALMACEN MAYORISTA.jpg', '57', '0');
INSERT INTO `tbl_archivos` VALUES ('57', 'LOGISTICA DE ALMACEN.jpg', '58', '0');
INSERT INTO `tbl_archivos` VALUES ('58', 'TM CONSTRUCCION CIVIL.jpg', '59', '0');
INSERT INTO `tbl_archivos` VALUES ('59', 'TM EXPLOTACION DEL TRANSPORTE.jpg', '60', '0');
INSERT INTO `tbl_archivos` VALUES ('60', 'AGUARDIENTES, LICORES U CERVEZAS.jpg', '61', '0');
INSERT INTO `tbl_archivos` VALUES ('61', 'TECNOLOGIA DE BAR.jpg', '62', '0');
INSERT INTO `tbl_archivos` VALUES ('62', 'DEPENDIENTE SERV GASTR.jpg', '63', '0');
INSERT INTO `tbl_archivos` VALUES ('64', 'LICENCIA CONDUCCION.png', '65', '0');
INSERT INTO `tbl_archivos` VALUES ('65', 'BACHILLER INFORMATICA.jpg', '66', '0');
INSERT INTO `tbl_archivos` VALUES ('66', '12 GRADO FAC.jpg', '67', '0');
INSERT INTO `tbl_archivos` VALUES ('67', 'CAJERO DPDTE CIMEX.jpg', '68', '0');
INSERT INTO `tbl_archivos` VALUES ('68', 'DEPENDIENTE COMERCIAL CIMEX.jpg', '69', '0');
INSERT INTO `tbl_archivos` VALUES ('69', 'LENGUA INGLESA.jpg', '70', '0');
INSERT INTO `tbl_archivos` VALUES ('70', 'ACT SOBRE TIPOS Y MODALIDADES DE SERVICIOS.jpg', '71', '0');
INSERT INTO `tbl_archivos` VALUES ('71', 'ACTUALIZACION PARA DEPENDIENTE GASTRONOMICO.jpg', '72', '0');
INSERT INTO `tbl_archivos` VALUES ('72', 'ATENCION VIP PARA DG.jpg', '73', '0');
INSERT INTO `tbl_archivos` VALUES ('73', 'BACHILLER.jpg', '74', '0');
INSERT INTO `tbl_archivos` VALUES ('74', 'CERT RELACIONES PUBLICAS.jpg', '75', '0');
INSERT INTO `tbl_archivos` VALUES ('75', 'HAB DG.jpg', '76', '0');
INSERT INTO `tbl_archivos` VALUES ('76', 'I NIVEL DE COCINA.jpg', '77', '0');
INSERT INTO `tbl_archivos` VALUES ('77', 'INGLES 1 NIVEL.jpg', '78', '0');
INSERT INTO `tbl_archivos` VALUES ('78', 'PROTOCOLO Y ETIQUETA PARA DG.jpg', '79', '0');
INSERT INTO `tbl_archivos` VALUES ('79', 'CAMARERA.jpg', '80', '0');
INSERT INTO `tbl_archivos` VALUES ('80', 'DEPENDIENTE INT GAST.jpg', '81', '0');
INSERT INTO `tbl_archivos` VALUES ('81', '12 FAC OB CAMP.jpg', '82', '0');
INSERT INTO `tbl_archivos` VALUES ('82', 'BACHILLER.jpg', '83', '0');
INSERT INTO `tbl_archivos` VALUES ('83', 'BASICO DE INGLES.jpg', '84', '0');
INSERT INTO `tbl_archivos` VALUES ('84', 'DEPENDIENTE B GASTRONOMIA.jpg', '85', '0');
INSERT INTO `tbl_archivos` VALUES ('85', 'TECNICAS DE SALON.jpg', '86', '0');
INSERT INTO `tbl_archivos` VALUES ('86', 'LIC CONTABILIDAD.jpg', '87', '0');
INSERT INTO `tbl_archivos` VALUES ('87', 'CAJERO COMERCIAL.jpg', '88', '0');
INSERT INTO `tbl_archivos` VALUES ('88', 'TM AGRONOMIA.jpg', '89', '0');
INSERT INTO `tbl_archivos` VALUES ('89', 'LOGISTICA DE ALMACENES TRD.jpg', '90', '0');
INSERT INTO `tbl_archivos` VALUES ('90', 'IMAGEN Y MERCHAND.jpg', '91', '0');
INSERT INTO `tbl_archivos` VALUES ('91', 'BACHILLER.jpg', '92', '0');
INSERT INTO `tbl_archivos` VALUES ('92', 'CAJERO CIMEX.jpg', '93', '0');
INSERT INTO `tbl_archivos` VALUES ('93', 'CAJERO COMERCIAL.jpg', '94', '0');
INSERT INTO `tbl_archivos` VALUES ('94', 'TM MICRO PC.jpg', '95', '0');
INSERT INTO `tbl_archivos` VALUES ('95', 'HAB ENCARGADO ALMACEN.jpg', '96', '0');
INSERT INTO `tbl_archivos` VALUES ('96', 'CULINARIA I NIVEL C.jpg', '97', '0');
INSERT INTO `tbl_archivos` VALUES ('97', 'CULINARIA II NIVEL C.jpg', '98', '0');
INSERT INTO `tbl_archivos` VALUES ('98', 'CERT NOTAS III NIVEL COCINA.jpg', '99', '0');
INSERT INTO `tbl_archivos` VALUES ('99', 'CHEF DE COCINA INTERNAC.jpg', '100', '0');
INSERT INTO `tbl_archivos` VALUES ('100', 'CULINARIA LUNCH.jpg', '101', '0');
INSERT INTO `tbl_archivos` VALUES ('101', 'CULINARIA SALSAS.jpg', '102', '0');
INSERT INTO `tbl_archivos` VALUES ('102', 'CULINARIA DECORACION.jpg', '103', '0');
INSERT INTO `tbl_archivos` VALUES ('103', 'ALMACEN.jpg', '104', '0');
INSERT INTO `tbl_archivos` VALUES ('104', 'TM SERVICIOS GASTRONOMICOS.jpg', '105', '0');
INSERT INTO `tbl_archivos` VALUES ('105', 'COCINERO INT.jpg', '106', '0');
INSERT INTO `tbl_archivos` VALUES ('110', '3 NIVEL INGLES.jpg', '111', '0');
INSERT INTO `tbl_archivos` VALUES ('111', 'HAB RRHH.jpg', '112', '0');
INSERT INTO `tbl_archivos` VALUES ('112', 'ING MECANICA.jpg', '113', '0');
INSERT INTO `tbl_archivos` VALUES ('113', 'TM ECONOMIA.jpg', '114', '0');
INSERT INTO `tbl_archivos` VALUES ('114', 'VENDEDOR TRD.jpg', '115', '0');
INSERT INTO `tbl_archivos` VALUES ('115', 'BACHILLER HUMAN.jpg', '116', '0');
INSERT INTO `tbl_archivos` VALUES ('116', 'TRABAJADORES SOCIALES.jpg', '117', '0');
INSERT INTO `tbl_archivos` VALUES ('117', 'COCINA I.jpg', '118', '0');
INSERT INTO `tbl_archivos` VALUES ('118', 'TM INF.jpg', '119', '0');
INSERT INTO `tbl_archivos` VALUES ('119', 'BACHILLER.jpg', '120', '0');
INSERT INTO `tbl_archivos` VALUES ('120', 'DEPENDIENTE ALMACEN.jpg', '121', '0');
INSERT INTO `tbl_archivos` VALUES ('121', 'TM MECANICA DE VEHICULOS AUTOMOTORES.jpg', '122', '0');
INSERT INTO `tbl_archivos` VALUES ('122', 'DEPENDIENTE CAJERO.jpg', '123', '0');
INSERT INTO `tbl_archivos` VALUES ('123', 'LIC CONTABILIDAD.jpg', '124', '0');
INSERT INTO `tbl_archivos` VALUES ('124', 'TM ECONOMIA.jpg', '125', '0');
INSERT INTO `tbl_archivos` VALUES ('125', 'TM CONSTRUCCION CIVIL.jpg', '126', '0');
INSERT INTO `tbl_archivos` VALUES ('126', 'DEPENDIENTE GAST.jpg', '127', '0');
INSERT INTO `tbl_archivos` VALUES ('127', 'CANTINERO B.jpg', '128', '0');
INSERT INTO `tbl_archivos` VALUES ('128', 'DPDTE ALMACEN.jpg', '129', '0');
INSERT INTO `tbl_archivos` VALUES ('129', 'SB.jpg', '130', '0');
INSERT INTO `tbl_archivos` VALUES ('130', 'SERVICIO GASTRONOMICO.jpg', '131', '0');
INSERT INTO `tbl_archivos` VALUES ('131', 'BACHILLER.jpg', '132', '0');
INSERT INTO `tbl_archivos` VALUES ('132', 'INGLES I.jpg', '133', '0');
INSERT INTO `tbl_archivos` VALUES ('133', 'ITALIANA2.jpg', '134', '0');
INSERT INTO `tbl_archivos` VALUES ('134', 'INFORMATICA BASICA.jpg', '135', '0');
INSERT INTO `tbl_archivos` VALUES ('135', 'DEPENDIENTE ARTEX.jpg', '136', '0');
INSERT INTO `tbl_archivos` VALUES ('136', 'ESTUDIOS SOCIOCULTURALE SLIC.jpg', '137', '0');
INSERT INTO `tbl_archivos` VALUES ('137', 'INFORMATICA.jpg', '138', '0');
INSERT INTO `tbl_archivos` VALUES ('138', 'LIC COMUNICACION SOCIAL.jpg', '139', '0');
INSERT INTO `tbl_archivos` VALUES ('139', 'LIC TURISMO.jpg', '140', '0');
INSERT INTO `tbl_archivos` VALUES ('140', 'BACHILLER.jpg', '141', '0');
INSERT INTO `tbl_archivos` VALUES ('141', 'HABILITACION ADMIN.jpg', '142', '0');
INSERT INTO `tbl_archivos` VALUES ('142', 'LIC CULTURA FISICA.jpg', '143', '0');
INSERT INTO `tbl_archivos` VALUES ('143', 'COCINA I.jpg', '144', '0');
INSERT INTO `tbl_archivos` VALUES ('145', 'SERV GAST.jpg', '145', '0');
INSERT INTO `tbl_archivos` VALUES ('146', 'BACHILLER.jpg', '146', '0');
INSERT INTO `tbl_archivos` VALUES ('147', 'CANTINERO B.jpg', '147', '0');
INSERT INTO `tbl_archivos` VALUES ('148', 'bachiller.jpg', '148', '0');
INSERT INTO `tbl_archivos` VALUES ('149', 'COCINA I.jpg', '149', '0');
INSERT INTO `tbl_archivos` VALUES ('150', 'COCINA II.jpg', '150', '0');
INSERT INTO `tbl_archivos` VALUES ('151', 'LUNCH.jpg', '151', '0');
INSERT INTO `tbl_archivos` VALUES ('152', 'BACHILLER T.jpg', '152', '0');
INSERT INTO `tbl_archivos` VALUES ('153', 'INGLES I.jpg', '153', '0');
INSERT INTO `tbl_archivos` VALUES ('155', 'BASICO INF.jpg', '155', '0');
INSERT INTO `tbl_archivos` VALUES ('156', 'COCINA I.jpg', '156', '0');
INSERT INTO `tbl_archivos` VALUES ('157', 'CURSO GENERAL DE INGLES.jpg', '157', '0');
INSERT INTO `tbl_archivos` VALUES ('158', 'FAC OC.jpg', '158', '0');
INSERT INTO `tbl_archivos` VALUES ('159', 'LIC ESTUDIOS SOCIOCULTURALES.jpg', '159', '0');
INSERT INTO `tbl_archivos` VALUES ('160', 'INTEGRAL BASICO DE GESTION EMPRESARIAL.jpg', '160', '0');
INSERT INTO `tbl_archivos` VALUES ('161', 'SERVICIOS GASTRONOMICOS.jpg', '161', '0');
INSERT INTO `tbl_archivos` VALUES ('167', 'TM CONTADOR.jpg', '167', '0');
INSERT INTO `tbl_archivos` VALUES ('168', 'TM SERV GAST.jpg', '168', '0');
INSERT INTO `tbl_archivos` VALUES ('169', 'DPDTE CAJERO COMERCIAL CUBALSE.jpg', '169', '0');
INSERT INTO `tbl_archivos` VALUES ('170', 'DPDTE INT GAST.jpg', '170', '0');
INSERT INTO `tbl_archivos` VALUES ('171', 'TM EDIFICACIONES.jpg', '171', '0');
INSERT INTO `tbl_archivos` VALUES ('172', 'ENCARGADO ALMACEN.jpg', '172', '0');
INSERT INTO `tbl_archivos` VALUES ('173', 'HAB ADMIN GAST.jpg', '173', '0');
INSERT INTO `tbl_archivos` VALUES ('174', 'TM MTTO ELECTRICO.jpg', '174', '0');
INSERT INTO `tbl_archivos` VALUES ('175', 'TM SERV GAST.jpg', '175', '0');
INSERT INTO `tbl_archivos` VALUES ('176', 'COCINA I.jpg', '176', '0');
INSERT INTO `tbl_archivos` VALUES ('177', 'ITALIANAO.jpg', '177', '0');
INSERT INTO `tbl_archivos` VALUES ('178', 'INGLES III.jpg', '178', '0');
INSERT INTO `tbl_archivos` VALUES ('179', 'CANTINERO.jpg', '179', '0');
INSERT INTO `tbl_archivos` VALUES ('180', 'LUNCH.jpg', '180', '0');
INSERT INTO `tbl_archivos` VALUES ('181', 'FAC OB CAMP.jpg', '181', '0');
INSERT INTO `tbl_archivos` VALUES ('182', 'COCINA I.jpg', '182', '0');
INSERT INTO `tbl_archivos` VALUES ('183', 'TEC SALON.jpg', '183', '0');
INSERT INTO `tbl_archivos` VALUES ('184', 'FAC OC.jpg', '184', '0');
INSERT INTO `tbl_archivos` VALUES ('185', 'INGLES COCINA.jpg', '185', '0');
INSERT INTO `tbl_archivos` VALUES ('186', 'ACT SERV GAST.jpg', '186', '0');
INSERT INTO `tbl_archivos` VALUES ('187', 'COCINA II.jpg', '187', '0');
INSERT INTO `tbl_archivos` VALUES ('188', 'ENCARGADAO ALM.jpg', '188', '0');
INSERT INTO `tbl_archivos` VALUES ('189', 'CONTABILIDAD.jpg', '189', '0');
INSERT INTO `tbl_archivos` VALUES ('190', 'SERVICIO GASTRONOMICO.jpg', '190', '0');
INSERT INTO `tbl_archivos` VALUES ('191', 'II NIVEL ING.jpg', '191', '0');
INSERT INTO `tbl_archivos` VALUES ('192', 'HAB CAJERO VENDEDOR TRD.jpg', '192', '0');
INSERT INTO `tbl_archivos` VALUES ('193', 'DPDTE INT ESTAB COMERCIALES.jpg', '193', '0');
INSERT INTO `tbl_archivos` VALUES ('194', 'HAB ADMIN COMERCIO.jpg', '194', '0');
INSERT INTO `tbl_archivos` VALUES ('195', 'TM CONTADOR.jpg', '195', '0');
INSERT INTO `tbl_archivos` VALUES ('196', 'LOGISTICA DE ALM.jpg', '196', '0');
INSERT INTO `tbl_archivos` VALUES ('198', 'BACHILLER BIBIOT.jpg', '198', '0');
INSERT INTO `tbl_archivos` VALUES ('200', 'DPDTE EST COMERCIALES.jpg', '197', '0');
INSERT INTO `tbl_archivos` VALUES ('201', 'CAJERO VENDEDOR.png', '199', '0');
INSERT INTO `tbl_archivos` VALUES ('202', 'DPDTE INT B GAST.jpg', '200', '0');
INSERT INTO `tbl_archivos` VALUES ('203', 'ADMIN COMERCIO.jpg', '201', '0');
INSERT INTO `tbl_archivos` VALUES ('210', 'Escaneo.jpg', '208', '0');
INSERT INTO `tbl_archivos` VALUES ('216', 'TM SERV GAST.jpg', '214', '0');
INSERT INTO `tbl_archivos` VALUES ('265', 'LIC SOCIOLOGIA.jpg', '263', '0');
INSERT INTO `tbl_archivos` VALUES ('279', 'ENCARGADO ALM.jpg', '276', '0');
INSERT INTO `tbl_archivos` VALUES ('280', 'LIC ALIMENTOS.jpg', '277', '0');
INSERT INTO `tbl_archivos` VALUES ('281', 'COCINA PARA CAMPISMO POPULAR.jpg', '278', '0');
INSERT INTO `tbl_archivos` VALUES ('282', 'LUNCH.jpg', '279', '0');
INSERT INTO `tbl_archivos` VALUES ('283', 'INGLES COCINA.jpg', '280', '0');
INSERT INTO `tbl_archivos` VALUES ('288', 'FOC.jpg', '285', '0');
INSERT INTO `tbl_archivos` VALUES ('289', 'TM ECONOMIA.jpg', '286', '0');
INSERT INTO `tbl_archivos` VALUES ('295', 'TM CONTABILIDAD.jpg', '292', '0');
INSERT INTO `tbl_archivos` VALUES ('313', 'DEPENDIENTE CAJERO.jpg', '310', '0');
INSERT INTO `tbl_archivos` VALUES ('314', 'ENCARGADO ALMACEN.jpg', '311', '0');
INSERT INTO `tbl_archivos` VALUES ('315', 'DEPENDIENTE GAST.jpg', '312', '0');
INSERT INTO `tbl_archivos` VALUES ('319', 'COCINA II.jpg', '317', '0');
INSERT INTO `tbl_archivos` VALUES ('320', 'INGLES PARA ELABORADORES.jpg', '318', '0');
INSERT INTO `tbl_archivos` VALUES ('321', 'MAESTRO INTEGRAL.jpg', '319', '0');
INSERT INTO `tbl_archivos` VALUES ('322', 'CERT 12GRADO.jpg', '320', '0');
INSERT INTO `tbl_archivos` VALUES ('332', 'CERT RECEPCION HOTELERA.jpg', '330', '0');
INSERT INTO `tbl_archivos` VALUES ('333', 'ENERGIA Y DESARROLLO SOST.jpg', '331', '0');
INSERT INTO `tbl_archivos` VALUES ('334', 'MARKETING TURISTICO.jpg', '332', '0');
INSERT INTO `tbl_archivos` VALUES ('335', 'ADMINIST INTEGRALES.jpg', '333', '0');
INSERT INTO `tbl_archivos` VALUES ('336', 'DEPENDIENTE INT GAST.jpg', '334', '0');
INSERT INTO `tbl_archivos` VALUES ('337', 'RECEPCION HOT.jpg', '335', '0');
INSERT INTO `tbl_archivos` VALUES ('338', 'LIC EDUCACION INFORMATICA.jpg', '336', '0');
INSERT INTO `tbl_archivos` VALUES ('339', 'AHORRO ENERGETICO.jpg', '337', '0');
INSERT INTO `tbl_archivos` VALUES ('354', 'TM COMERCIO.jpg', '351', '0');
INSERT INTO `tbl_archivos` VALUES ('356', 'COCINA I.jpg', '352', '0');
INSERT INTO `tbl_archivos` VALUES ('357', 'COCINA II.jpg', '353', '0');
INSERT INTO `tbl_archivos` VALUES ('361', 'SB.jpg', '357', '0');
INSERT INTO `tbl_archivos` VALUES ('367', 'LIC EDUCACION INF.jpg', '363', '0');
INSERT INTO `tbl_archivos` VALUES ('368', 'LI CCONTAB Y FINZ.jpg', '364', '0');
INSERT INTO `tbl_archivos` VALUES ('369', 'DEPENDIENTE CAJERO COMERCIAL.jpg', '365', '0');
INSERT INTO `tbl_archivos` VALUES ('370', 'LIC CONTABILIDAD Y FINZ.jpg', '366', '0');
INSERT INTO `tbl_archivos` VALUES ('371', 'CURSO OPERACIONES DE INV.jpg', '367', '0');
INSERT INTO `tbl_archivos` VALUES ('385', 'HAB ADMIN INT.jpg', '382', '0');
INSERT INTO `tbl_archivos` VALUES ('386', 'LIC CULTURA FISICA.jpg', '383', '0');
INSERT INTO `tbl_archivos` VALUES ('401', 'TM SERV GAST.jpg', '398', '0');
INSERT INTO `tbl_archivos` VALUES ('402', 'DEPEND GAST.jpg', '399', '0');
INSERT INTO `tbl_archivos` VALUES ('403', 'INGLES SERV GAST.jpg', '400', '0');
INSERT INTO `tbl_archivos` VALUES ('454', 'MARKETIN TURISTICO.jpg', '450', '0');
INSERT INTO `tbl_archivos` VALUES ('455', 'ING INFORM.jpg', '451', '0');
INSERT INTO `tbl_archivos` VALUES ('456', 'PERFECCIONAMIENTO PARA GERENTES TRD.jpg', '452', '0');
INSERT INTO `tbl_archivos` VALUES ('490', 'CONTABILIDAD.jpg', '485', '0');
INSERT INTO `tbl_archivos` VALUES ('491', 'TECNICAS DE SALON.jpg', '486', '0');
INSERT INTO `tbl_archivos` VALUES ('702', '12 GRADO.jpg', '697', '0');
INSERT INTO `tbl_archivos` VALUES ('705', 'SERV GAST TM.jpg', '700', '0');
INSERT INTO `tbl_archivos` VALUES ('754', 'CAJERO DEPENDIENTE.jpg', '749', '0');
INSERT INTO `tbl_archivos` VALUES ('755', 'BACHILLER.jpg', '750', '0');
INSERT INTO `tbl_archivos` VALUES ('771', 'ING QUIMICA.jpg', '766', '0');
INSERT INTO `tbl_archivos` VALUES ('772', 'ESP TEC PROD LACTEOS.jpg', '767', '0');
INSERT INTO `tbl_archivos` VALUES ('773', 'MASTER EN NEW TEC PARA LA EDUC.jpg', '768', '0');
INSERT INTO `tbl_archivos` VALUES ('811', 'BACHILLER.jpg', '805', '0');
INSERT INTO `tbl_archivos` VALUES ('812', 'HAB DEPENDIENTE INTEGRAL GAST.jpg', '806', '0');
INSERT INTO `tbl_archivos` VALUES ('1050', 'DEP INT EST COM.jpg', '1043', '0');
INSERT INTO `tbl_archivos` VALUES ('1210', 'TM MECANICA DE TALLER.jpg', '1204', '0');
INSERT INTO `tbl_archivos` VALUES ('1211', 'HAB ALMACENERO.jpg', '1205', '0');
INSERT INTO `tbl_archivos` VALUES ('1212', 'TM INSTRUMENTACION Y CONTRO Y OC.jpg', '1206', '0');
INSERT INTO `tbl_archivos` VALUES ('1213', 'JEFE Y DEP ALM.jpg', '1207', '0');
INSERT INTO `tbl_archivos` VALUES ('1256', 'LIC CONT Y FINZ.jpg', '1250', '0');
INSERT INTO `tbl_archivos` VALUES ('1269', 'LIC CONT Y FINANZAS.jpg', '1263', '0');
INSERT INTO `tbl_archivos` VALUES ('1270', 'DIPLOMADO SGCH.jpg', '1264', '0');
INSERT INTO `tbl_archivos` VALUES ('1271', 'BASICO SST.jpg', '1265', '0');
INSERT INTO `tbl_archivos` VALUES ('1272', 'FORMACION AUDITORES INTERNOS DE LA CALIDAD.jpg', '1266', '0');
INSERT INTO `tbl_archivos` VALUES ('1273', 'ANALISIS INTERPRETACION ESTADOS FINANCIEROS.jpg', '1267', '0');
INSERT INTO `tbl_archivos` VALUES ('1274', 'TECNICAS DE DIRECCION.jpg', '1268', '0');
INSERT INTO `tbl_archivos` VALUES ('1302', 'SERV GAST.jpg', '1296', '0');
INSERT INTO `tbl_archivos` VALUES ('1303', 'INGLES III.jpg', '1297', '0');
INSERT INTO `tbl_archivos` VALUES ('1304', 'TM METROLOGIA.jpg', '1298', '0');
INSERT INTO `tbl_archivos` VALUES ('1305', 'CAJERO VENDEDOR.jpg', '1299', '0');
INSERT INTO `tbl_archivos` VALUES ('1306', 'BACHILLER.jpg', '1300', '0');
INSERT INTO `tbl_archivos` VALUES ('1307', 'DEP EST COM.jpg', '1301', '0');
INSERT INTO `tbl_archivos` VALUES ('1578', 'DISEÑO MECANICO.jpg', '1574', '0');
INSERT INTO `tbl_archivos` VALUES ('1579', 'HAB ADMIN COMERCIO.jpg', '1575', '0');
INSERT INTO `tbl_archivos` VALUES ('1580', 'HAB DEP EST COM.jpg', '1576', '0');
INSERT INTO `tbl_archivos` VALUES ('1586', 'ENCARGADO ALMACEN.jpg', '1582', '0');
INSERT INTO `tbl_archivos` VALUES ('1651', 'DEP GAST.jpg', '1648', '0');
INSERT INTO `tbl_archivos` VALUES ('1652', 'DEP COM.jpg', '1649', '0');
INSERT INTO `tbl_archivos` VALUES ('1653', 'GERENCIA.jpg', '1650', '0');

-- ----------------------------
-- Table structure for `tbl_areas`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_areas`;
CREATE TABLE `tbl_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dependencia_id` int(11) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `dependencia_id` (`dependencia_id`),
  KEY `id` (`id`),
  KEY `servicio_id` (`servicio_id`),
  CONSTRAINT `tbl_areas_ibfk_1` FOREIGN KEY (`dependencia_id`) REFERENCES `tbl_dependencias` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_areas_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `tbl_servicios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_areas
-- ----------------------------
INSERT INTO `tbl_areas` VALUES ('1', '33', '1');
INSERT INTO `tbl_areas` VALUES ('2', '33', '2');
INSERT INTO `tbl_areas` VALUES ('3', '34', '1');
INSERT INTO `tbl_areas` VALUES ('4', '34', '2');
INSERT INTO `tbl_areas` VALUES ('5', '1', '1');
INSERT INTO `tbl_areas` VALUES ('6', '2', '1');
INSERT INTO `tbl_areas` VALUES ('7', '3', '1');
INSERT INTO `tbl_areas` VALUES ('8', '4', '1');
INSERT INTO `tbl_areas` VALUES ('9', '7', '1');
INSERT INTO `tbl_areas` VALUES ('10', '8', '1');
INSERT INTO `tbl_areas` VALUES ('11', '9', '1');
INSERT INTO `tbl_areas` VALUES ('12', '10', '1');
INSERT INTO `tbl_areas` VALUES ('13', '11', '1');
INSERT INTO `tbl_areas` VALUES ('14', '12', '1');
INSERT INTO `tbl_areas` VALUES ('15', '13', '1');
INSERT INTO `tbl_areas` VALUES ('16', '14', '1');
INSERT INTO `tbl_areas` VALUES ('17', '15', '1');
INSERT INTO `tbl_areas` VALUES ('18', '16', '1');
INSERT INTO `tbl_areas` VALUES ('19', '17', '1');
INSERT INTO `tbl_areas` VALUES ('20', '18', '1');
INSERT INTO `tbl_areas` VALUES ('21', '21', '1');
INSERT INTO `tbl_areas` VALUES ('22', '22', '1');
INSERT INTO `tbl_areas` VALUES ('23', '23', '1');
INSERT INTO `tbl_areas` VALUES ('24', '24', '1');
INSERT INTO `tbl_areas` VALUES ('25', '25', '1');
INSERT INTO `tbl_areas` VALUES ('26', '26', '1');
INSERT INTO `tbl_areas` VALUES ('27', '33', '1');
INSERT INTO `tbl_areas` VALUES ('28', '34', '1');

-- ----------------------------
-- Table structure for `tbl_aspirantes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_aspirantes`;
CREATE TABLE `tbl_aspirantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ci` varchar(255) NOT NULL,
  `nombre_apellidos` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `nivel_escolar` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `egresado_especialidad` varchar(255) NOT NULL,
  `categoria_academica` varchar(255) NOT NULL,
  `grado_cientifico` varchar(255) NOT NULL,
  `fecha_solicitud` varchar(255) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `sancion_laboral` varchar(255) NOT NULL,
  `familiares_ecsm` varchar(255) DEFAULT NULL,
  `color_piel` varchar(255) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `integracion` varchar(255) DEFAULT NULL,
  `procesado` varchar(255) DEFAULT 'NO',
  `en_solicitud_activa` varchar(255) DEFAULT 'SI',
  `documentos_requeridos` int(11) DEFAULT '4',
  `importe` double(11,2) DEFAULT '0.00',
  `estado` varchar(255) DEFAULT NULL,
  `cargo_en_curso` varchar(255) DEFAULT NULL,
  `fecha_aprobacion` varchar(255) DEFAULT NULL,
  `area_en_curso` varchar(255) DEFAULT NULL,
  `propuesto` varchar(255) DEFAULT 'NO',
  PRIMARY KEY (`id`),
  KEY `fuente_id` (`fuente_id`),
  CONSTRAINT `tbl_aspirantes_ibfk_1` FOREIGN KEY (`fuente_id`) REFERENCES `tbl_fuentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_aspirantes
-- ----------------------------
INSERT INTO `tbl_aspirantes` VALUES ('17', '60020708424', 'Orlando José Roura Caveda', 'LUGAREÑO No 815 % SAN JOSE Y PROLONGACION DE FRANCISQUITO', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-28', '1', '', '', 'Mestizo', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('18', '60080708424', 'ZORGEN FREED RAMÍREZ HERNÁNDEZ', 'calle prolongaciónde A No4 e/A y Circunvalación reparto la yaba', 'Masculino', 'Universitario', '', 'Licenciado en Turismo', 'Sin categorizar', 'No determinado', '2018-08-28', '6', '', '', 'Blanco', 'test@test.com', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('19', '61041404480', 'ELIZABETH RODRÍGUEZ GARCIA', 'calle Principal No 40 e/ 1ra y 2da Rpto Cerdeira', 'Masculino', 'Universitario', '', 'ingeniero en Ciencias Informaticas', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('20', '63110705129', 'BARBARA TANIA BEÍTEZ ZAMORA', 'AVD DEL REY No224 E/ PERUCHO FIGUREDO Y 25 DE JULIO FLORA', 'Masculino', 'Técnico Medio', '', 'Politecnico de la Salusd', 'Sin categorizar', 'No determinado', '2018-08-28', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('21', '64092214097', 'OMARA AVILA PRIETO', 'EMILIANO AGUERO VARONA No 620 % 3ra Y 4ta PARALELA RPTO BENEFICIENCIA', 'Femenino', 'Universitario', '', 'Lic. Derecho', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Blanco', 'test@test.com', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('22', '64101410902', 'NANDER CUBELO RIVERA', 'CALLE no22 No10A e/A y B La Guernica', 'Masculino', 'Técnico Medio', '', 'Comercio', 'Sin categorizar', 'No determinado', '2018-08-28', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('23', '64113009597', 'PEDRO PABLO RAMÓN FERNÁNDE', 'SAN JOSE No 557 % INDUSTRIA Y SAN RAMON', 'Masculino', 'Técnico Medio', '', 'Operador De MIcro Computadora', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('24', '65090917054', 'DAMIAN EDUARDO VICTORIA SANCHEZ', 'EDF 38 BLOQUE 6 APTO 1 RPTO JULIO A MELLA', 'Femenino', 'Universitario', '', 'Lic,Contabilidad', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('25', '66092310118', 'Radey Lopez Borron', 'AVE PASEO E % CALLE 1ra y CALLE B, EDIF 26 APTO 55 RPTO JULIO A MELLA', 'Masculino', 'Universitario', '', 'Licenciado en Educación Primaria', 'Sin categorizar', 'No determinado', '2018-08-28', '1', '', '', 'Mestizo', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('26', '66092830037', 'DAVID BARRERA GOMEZ', 'General Gomes No360 e/niña y San miguel', 'Femenino', 'Técnico Medio', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-28', '1', '', '', 'Blanco', 'test@test.com', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('27', '67013118766', 'AURORA FIGUEREDO TAMAYO', 'camino GuanavaquillaNo232 Reparto Santa yana', 'Masculino', 'Técnico Medio', '', 'Mecanica de Taller', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('28', '67082009162', 'MADELIN CABRERA VALDIVIESO', 'CALLE MARTI No432 % RISA Y CARMEN', 'Femenino', 'Universitario', '', 'Lic,Contabilidad', 'Sin categorizar', 'No determinado', '2018-08-28', '4', '', '', 'Negro', 'test@test.com', null, 'Divorciado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('29', '68050404408', 'ELAIN JOSE ALFARO VARONA', 'CALLE 3ra % B Y C RPTO EL PORVENIR', 'Masculino', 'Universitario', '', 'Lic,Economia', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', 'test@test.com', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('30', '68081716139', 'ARIANNE VALDÉS HERNÁNDEZ', 'CALLE  1ra No 34 e/ 6Ta y 4Ta rpto Vista hermosa ', 'Femenino', 'Universitario', '', 'ingeniero en Ciencias Informaticas', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', 'test@test.com', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('31', '69031207846', 'YANISLEY ARGELIA HERNÁNDEZ SUÁREZ', 'calle6Ta e/avenida 1ra paralelay calleB Edif 12 planta 1 aptof10,Rept Julio A mella ', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('32', '70070608581', 'YAMILET VALDES RUIZ', 'pasaje B No5A e/ 9y 10 Rpto Simoni', 'Masculino', 'Técnico Medio', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Negro', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('33', '71010807328', 'YISEL BACALLAO GONZALEZ', 'Calle 2da No103 e/B y C Reparto Agramonte', 'Femenino', 'Preuniversitario', '', 'Cajera Dependiente, Encargada de almacen', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('34', '71051307612', 'MABEL MARÍA TORRES GÓMEZ', 'Calle 2da No35a e/B y Calle Agramonte, Reparto Versalles', 'Femenino', 'Preuniversitario', '', 'TTe, Servicios Gastronomicos', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Mestizo', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('35', '71051627787', 'ELIENNY DÍAZ TORRES', 'CALLE 14 No 111 % C Y D  RPTO LA GUERNICA', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('36', '71071528369', 'JOSÉ LUIS ESTRADA ALFONSO', 'Prolongacion de Gonzalo de Quesada No 561Alto %2 y 3 Florat', 'Femenino', 'Universitario', '', 'Lic. Economia', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Negro', 'test@test.com', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('37', '71092128899', 'YURITZA ALBA GOMEZ', 'CARETERA CENTRAL ESTE N0468 E/OJO DE AGUA Y MONTE AGUDO LA CARIDAD', 'Femenino', 'Universitario', '', 'Lic,Contabilidad', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Negro', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('38', '71112615655', 'YARISLEIDY UTRIA SANCHEZ', '2Da edf No2 APTo 9 VAN HORNE Y AGRAMONTE RPTO JAYAMA ', 'Femenino', 'Preuniversitario', '', 'Tecnico en Informatica', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('39', '72033103938', 'JUAN DE LA ROSA SÁNCHEZ', 'calle 2da No 35a E/B y Agramonte Versalles', 'Femenino', 'Universitario', '', 'Lic, en Historia', 'Instructor', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('40', '72112807861', 'FERNANDO JAVIER DIAZ LUGO', 'calle Martí No259A e/san antonio y lugareño', 'Masculino', 'Universitario', '', 'Ingeniero Informatica', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Negro', 'test@test.com', null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('41', '73010117187', 'YAIMA CASTRO MARTINEZ', 'Ave Finlay km 5m No 9 Rpto Paco Borrero', 'Femenino', 'Universitario', '', 'Lic,Contabilidad y Finanzas', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('42', '73011306284', 'YOSELIN SOTO MEDINA', 'CalleSan Antonio No52 %calle martí y Hermanos Agüero', 'Femenino', 'Universitario', '', 'Lic. Comunicación Social', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Blanco', 'test@test.com', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('43', '73080714048', 'AMPARO MARICELA RIVERO URRA', 'CALLE MARIA DEL ROSARIO EDIF28 APTO13 RPTO TORRE BLANCA', 'Masculino', 'Técnico Medio', '', 'Técnico en contrución civil y tramporte', 'Sin categorizar', 'No determinado', '2018-08-29', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('44', '74052132944', 'JENNY PATRICIA MUJICA OLARIO', 'CALLE C % 15 Y 16 BLOQUE 4 APTO 18 PREVISORA', 'Femenino', 'Universitario', '', 'Lic,Contabilidad', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', '', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('45', '74071009124', 'ADIAN CHAVEZ OJEDA', 'Calle Central No76A E/San Esteban y Calixto Garcia Rpto La Norma', 'Femenino', 'Técnico Medio', '', 'CAJERO', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('46', '75031016205', 'YOELVIS FUNDORA FALCÓN', '1ra Paralela Edificio 51 Apto5 e/ 1ra y 2da Julio A mella', 'Masculino', 'Preuniversitario', '', 'Ingles General', 'Sin categorizar', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', '', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('47', '75072110521', 'roberto salas padron', 'CALLE B No432 % LINEA Y LA MASCOTA', 'Femenino', 'Universitario', '', 'Tecnico en Informatica', 'Instructor', 'No determinado', '2018-08-29', '4', '', '', 'Blanco', '', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('48', '75072210525', 'Adrian de la Caridad Cachinero Comas', 'CALLE JESUS MARÍA No126 APTO 4 e/SAN MATÍN Y SAN JOSÉ', 'Masculino', 'Preuniversitario', '', 'Tecnico en construccion civil', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', 'test@test.com', null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('49', '75110611017', 'ANGEL LUIS VIÑA ESQUIVEL', 'Carretera Central km 23 Caserio el Guayabo', 'Femenino', 'Universitario', '', 'Lic,Contabilidad y Finansas', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('50', '76061410640', 'JULIO TORRES GARCÍA', 'GUATEMALA No 5 e/ PERU Y OJO DE AGUA RPTO RETIRO', 'Femenino', 'Preuniversitario', '', 'INSTRUCTOR DE ARTE', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Mestizo', 'test@test.com', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('51', '76121110497', 'OSBEL ALPIZAR PÉREZ', '5Ta paralela No263 e/Fernando de zayas yGonzalo de Quesada Rpto Florat', 'Femenino', 'Universitario', '', 'Lic,Contabilidad y Finansas', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', 'test@test.com', null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('52', '77032316127', 'ALBERTO RAMOS NUÑEZ', 'AVE A No 65 % 2da y 3ra RPTO JAYAMA', 'Femenino', 'Técnico Medio', '', 'Comercio', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Mestizo', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('53', '77041617441', 'KAREN MARÍA ROJAS MESTRIL', 'LUGAREÑO 703 %SAN MARTIN Y BAYARDO AGRAMONTE', 'Masculino', 'Universitario', '', 'ingeniero electrico', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('54', '77062716022', 'YANELIS TABLA RADO', 'ARIETA No 233 %CUBA Y DOLORES BETANCOURT REPARTO LA CARIDAD', 'Femenino', 'Preuniversitario', '', 'CAJERO', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('55', '77111415909', 'LISBEL BAEZ SANCHEZ', 'CALLE B No86 % CUPEY Y CALLE 6 RPTO SIMONI', 'Masculino', 'Técnico Medio', '', 'Cajero Dependiente, Encargada de almacen', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Mestizo', '', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('56', '77120517433', 'RICARDO ALVAREZ GUERRA', 'CALLE 7 AL FINAL BIPLANTA MININT APTO7 RPTO SAN FRANCISCO', 'Femenino', 'Técnico Medio', '', 'Tecnico en construccion civil', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', 'test@test.com', null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('57', '77120616839', 'NORA DE LA CARIDAD REYES PEREZ', 'San Joé No605 e/ Santa LLana y Lugareño', 'Masculino', 'Técnico Medio', '', 'GASTRONOMIA', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('58', '78011720881', 'Yaniset Fuentes Sutton', 'calle G No 47a e/6 y Martí Rpto Sánchez Soto', 'Masculino', 'Universitario', '', 'LICENCIADO EN CULTURA FISICA Y DEPORTE', 'Sin categorizar', 'No determinado', '2018-08-30', '1', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('59', '78062520852', 'LIANET RIVERO GONZÁLEZ', 'EMILIANO AGUERO VARONA No 560 % 3ra PARALELA Y GARCIA ROCO RPTO BENEFICIENCIA', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('60', '78122620867', 'ROBERTO GERRA ALVAREZ', 'PROLONGACIÓN DE UNION 2Da No14 E/ARROLLO Y FINAL RPTO NUEVO SALOME', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('61', '79021821442', 'DAYNELIS ESPINOSA RODRIGUEZ', 'Calle 2 da No78 e/C y Finan Rpto Iman', 'Femenino', 'Universitario', '', 'LICENCIADA EN ECONOMIA', 'Instructor', 'No determinado', '2018-08-30', '4', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('62', '79051415158', 'ALBERTO BADIA HIDALGO', 'Orca No 416 e/ San Ramon y 1Ra 3 piso', 'Masculino', 'Preuniversitario', '', 'Técnico medio en Agronomia', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('63', '79102524414', 'JOAQUIN EUGENIO FERNANDEZ ESCUDERO', 'EDF 26 PLANTA PISO No9  APTO 6 PLAZA DE LA REVOLUCIÓN', 'Femenino', 'Preuniversitario', '', 'Técnico medio en nivel de Economia', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', '', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('64', '80100915268', 'YAMILET BERDUGO ARTOLA', 'CALLE B No 99% CUPEY Y 6 SIMONI', 'Masculino', 'Preuniversitario', '', 'Cocinero', 'Instructor', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, 'RINCON DE LA MUSICA', 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('65', '80120716341', 'YOSDANKIS AYALA PÉREZ', 'CMNO ARENERA No 52 RPTO SARATOGA', 'Femenino', 'Preuniversitario', '', 'Técnico en Contavilida', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('66', '81020722853', 'KENIA ALFONSO GUILLET ', 'Calle Montera No 106 % Rosario y Pobre', 'Masculino', 'Preuniversitario', '', 'Dependiente Gastronomico', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', 'test@test.com', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('67', '81052515305', 'CAMILO SÁNCHEZ LÓPEZ', 'Calle C No7A e/1Ra y 2Da Reparto Versalles', 'Masculino', 'Preuniversitario', '', 'Técnico en Contavilida', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('68', '81111028780', 'MCIHEL GUZMAN REYES', '1ra No 15b e/2da y Olazabal Rpto Salome', 'Femenino', 'Preuniversitario', '', 'Tecnico en Informatica', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('69', '82102400403', 'ROIDER BROOKS MANSFARROL', 'callejon marquezado No118A e/acosta y pinares  Rpto marquezado', 'Femenino', 'Preuniversitario', '', 'Tecnco medio, Servicios Gastronomicos', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Negro', 'test@test.com', null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('70', '82102820386', 'CLEYDIS GALLARDO QUINTANA', 'Camino Juruquey No 150 % A y B Altura de la Vigia', 'Masculino', 'Preuniversitario', '', 'Tecnco medio, Sootecnia', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', ' ', null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('71', '82110622629', 'EDDY ALGIMIRO CARBONELL RIVERO', 'CALLE PRINCIPAL No 64-A % SEGUNDA Y VARONIA RPTO SERDEIRA', 'Masculino', 'Preuniversitario', '', 'Mecanico Auto Motris', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('72', '83012516199', 'PEDRO PABLO MIRANDA RAMOS', 'MARIA DEL ROSARIO No56 % CALLE CUBA Y LA AVE DE LA LIBERTAD RPTO LA CARIDAD', 'Femenino', 'Universitario', '', 'ingeniero Mecanica', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('73', '83040515787', 'MARNELY ROJA FORN', 'calle C edificio 12 planta No 4 apto H2 julio Antonio Mella', 'Femenino', 'Preuniversitario', '', 'Técnico en Contabilida', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('74', '83080815834', 'ENRIQUE PLACERES SILVA', 'BIPLANTA 4 APTO 2 RPTO JULIO ANTONIO MELLA', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('75', '83100615904', 'ERNESTO ADÁN LÓPEZ', 'Calle 6 No176 A e/D y E Rpto Guernica', 'Masculino', 'Universitario', '', 'Lic. Derecho', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('76', '83110918011', 'YANELA SÁNCHEZ TORRES', 'Calle B No163 e/22 y 24 Rpto Guernica', 'Masculino', 'Universitario', '', 'ingeniero Electrico', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('77', '83112515908', 'ISTEL SAÍNZ SERÓN', 'Alfredo Adan No 250 /Benavides y Bella Vista', 'Masculino', 'Universitario', '', 'Ingeniero Quimico', 'Instructor', 'Master', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('78', '84042018015', 'IDAYSI MONTANO RAMIREZ', 'Calle A No30 e/ linia y quiñones Reparto Saratoga', 'Masculino', 'Técnico Medio', '', 'Tecnico en Informatica', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('79', '84072717055', 'ISBEL CASTELLANOS RODRIGEZ', 'Rio No56 e/ Gonzolo de quezada y Avda del Rey Rpto Flora', 'Masculino', 'Preuniversitario', '', 'administrador integral Gastronomia y comercio', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('80', '84082217308', 'JORGE RICARDO MUÑIZ', '20 DE MAYO No 321-A % 1ra Y VAZQUEZ', 'Masculino', 'Preuniversitario', '', 'Comercio', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Negro', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('81', '84112717313', 'RAFAEL ANTONIO ESPINOSA PEÑA', 'Javier Arangi No156Altos%5 y Aserradero La Zambrana', 'Masculino', 'Universitario', '', 'Lic,Cultura fisica y deporte', 'Instructor', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('82', '84120118507', 'DANIEL EDUARDO HERNANDEZ LLANES', 'San Miguelito No9 e/madan curi y palma Rto Vista Vella', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('83', '85031318037', 'ORTELIO PIMENTEL RAMIREZ', 'CALLE FINLAY No 175 e/4Ta Y AVD DELREY RPTO EDEN', 'Femenino', 'Preuniversitario', '', 'Técnico en Contabilida', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('84', '85042318058', 'DIASNEL HERNÁNDEZ MORALES', 'ALFREDO ADAN No398A E/CAPDEVILA Y AVD DE LOS MARTIRES', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('85', '85072418414', 'LISANDRA LAVIN CID', 'Acción Civica No163 e/ San josé y Bayardo Agramonte Rpto America Latina', 'Masculino', 'Universitario', '', 'LICENCIDO PSICOLOGIA.  ESPECIALISTA EN ADMINISTRACIÓN', 'Instructor', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('86', '85080518016', 'RAFAEL ANTONIO SANTANA ALEJO', 'CALZADA A VIAL 1 EDIFICIO 13 DE MARZO APTO 6 RPTO LENIN ', 'Masculino', 'Universitario', '', 'Lic. Derecho', 'Instructor', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('87', '85080620504', 'YUSLEYDIS NUÑES LA O', 'CALLE HONDA 351 % MARTI Y 20 de MAYO', 'Femenino', 'Técnico Medio', '', 'CONTABILIDAD', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('88', '85082817301', 'LESLIE MARILE GALAN SALFRAN', 'ave A Biplanta 40 apto 1 prolongación de jayamá', 'Masculino', 'Técnico Medio', '', 'Comercio', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('89', '85101118034', 'ZENAIDA BATISTA SANCHEZ', 'CAM ACUEDUCTO No 261F RPTO VILLA MARIANA', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('90', '85120318148', 'DAYANA NIEVES BENÍTEZ', 'CALLE ROSARIO No111 %TRIANA Y TIO PERICO', 'Masculino', 'Universitario', '', 'LIC. ESTUDIOS SOCIOS CULTURALES', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('91', '85121418030', 'Benjamin Morell Morell', 'camino juruquey al final detras de servisa', 'Femenino', 'Obrero calificado', '', 'Obrero calificado', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('92', '86010218027', 'REIDY BOZA CARTER', 'padre Valencia No 351% Ave Simoni y Puente Tinima', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('93', '86031118410', 'MAITE RODÁN ESQUIVEL', 'General Gómez No 3a  e/ republica y Avellaneda', 'Masculino', 'Técnico Medio', '', 'MANTENIMIENTO ELECTRICO', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('94', '86032518095', 'REINALDO LÁZARO ROYO GONZÁLEZ', 'calle tte Cañon 111 %calle Andres Sanchez Y calle Tomas Betancourt Reparto Vigia.', 'Masculino', 'Técnico Medio', '', 'Tecnico en Electronica', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('95', '86040500218', 'ISSAC DUNN HERNANDEZ ', 'FINLAY e/ REPÚBLICA Y LÓPEZ RECIO', 'Masculino', 'Universitario', '', 'Lic. Informatica', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('96', '86082018100', 'LEYANIS RUÍZ ESTRADA', 'LUGAREÑO No 716 e/STA RITA YHEREDIA', 'Femenino', 'Técnico Medio', '', 'DISEÑO MECANICO', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('97', '86082618146', 'MARAY OLANO RAMIREZ', 'ROSARIO No111 %TRIANA Y TIO PERICO ', 'Femenino', 'Universitario', '', 'Lic,Cultura fisica y deporte', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('98', '86110118040', 'JOHAMNA RODRIGUEZ PERÉZ', '5Ta PARALELA No213 E/ G DE QUEZADA Y JULIO SAN SANGUILY FLORAT', 'Femenino', 'Obrero calificado', '', 'Obrero calificado', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('99', '87010821861', 'LILIANNES TORRES ESPINOSA', 'CALLE SIMON REYES No8 % 1ra Y 2da PARALELA LA VIGIA', 'Femenino', 'Técnico Medio', '', 'Comercio', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('100', '87011523482', 'YENDRI MARRERO AGUILERA', 'CALLE 8 No 204B %E Y PINEDA LA GUERNICA', 'Masculino', 'Técnico Medio', '', 'Explotacion de Transporte', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('101', '87021822105', 'Emir Mutajar Salej Hernández', 'Calle Risa No22A e/ cielo y martí', 'Masculino', 'Técnico Medio', '', 'EDIFICACIONES', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('102', '87082823520', 'DIOGUIS LEIVA SANCHEZ', 'CALLE TIO PERICO No 122 APTO 12 % ROSARIO Y POBRE', 'Femenino', 'Técnico Medio', '', 'BIBLIOTECOLOGIA Y TECNICA DOCUMENTARIA', 'Sin categorizar', 'No determinado', '2018-08-31', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('103', '87092423631', 'ANGEL ABEL PEREZ MEDINA', 'CALLE SAN RAMON No183 % HOSPITAL Y HONDA', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-08-31', '4', '', '', 'Blanco', null, null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('104', '87102125626', 'Anet Mesa Fernández', 'Ccalle C No 62A  e/ 2da y 3ra Rpto Candido Gonzalez', 'Masculino', 'Preuniversitario', '', 'Tecnico en Informatica', 'Sin categorizar', 'No determinado', '2018-09-01', '1', '', '', 'Blanco', null, null, 'Divorciado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('105', '87110123141', 'ROBERTO CARLOS GARCIA GARCIA', 'ANGEL CASTELLO No154 E/ SEDANO Y DAMA', 'Femenino', 'Preuniversitario', '', 'Cajera Dependiente', 'Sin categorizar', 'No determinado', '2018-09-01', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('106', '88010645620', 'SUSANA CORDOVI CARRANDI', 'San jose No623 e/lugareño y Benbeta', 'Femenino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Negro', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('107', '88022322505', 'JUAN LUIS CASALIS NOVOA', 'MARTÍ AL FINAL EDF No 3 APTO 12 SANCHE SOTO', 'Masculino', 'Preuniversitario', '', 'GASTRONOMIA YCOMERCIO', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Negro', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('108', '88051423532', 'PATRICIA AZAHARES PAVÓN', 'Carmen No 105 e/Orca y Medio', 'Masculino', 'Preuniversitario', '', 'Cocinero', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('109', '88051445322', 'CLAUDIA YANIRA OLANO REYES', 'CALLE UNION e/REEVES Y CARRETERA CENTRAL EDFICIO TRAMPORTE AGROPECUARIO APTO No 8 RPTO DIAMANTE', 'Femenino', 'Preuniversitario', '', 'Tecnco medio, Servicios Gastronomicos', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('110', '88061522273', 'IGNACIO ALONSO AVILA', 'CALZADA A UNIDAD 8 APTO 12 RPTO LENIN', 'Femenino', 'Universitario', '', 'Lic,Contabilidad y Finansas', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('111', '88092830037', 'GEORKIS SÁNCHEZ HERRERA', 'CALLE 3ra No 24 % CALLE C Y CALLE B RPTO CARIDAD DE MENDEZ', 'Femenino', 'Preuniversitario', '', 'GASTRONOMIA YCOMERCIO', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('112', '88121722313', 'LISANDRA ESCALANTE PEREZ', 'CAMINO LA MATANZA No 149 e/BAGO Y ROSARIO BUENOS AIRES', 'Masculino', 'Universitario', '', 'LIC. Sosiologia', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('113', '89010134270', 'ALDOSLEY NAVARRO MORALES', 'Dama No 248 % Medio y Horca', 'Femenino', 'Universitario', '', 'Universitaria', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('114', '89021934308', 'MASQUIEL RODRIGUEZ TAMAYO', 'HOSPITAL No301 e/HORCA Y SAN RAMÓN', 'Femenino', 'Preuniversitario', '', 'GASTRONOMIA', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('115', '89031533552', 'YENIREISY FIGUEREDO SUAREZ', 'tte cañón No 330      /Artola y Migel Angel nuñez La Vigia.', 'Masculino', 'Preuniversitario', '', 'Bachiller', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('116', '89042234577', 'RICARDO CARRALERO PANTOJA', 'CALLE C NO. 151 ENTRE 7 Y 8 BUENOS AIRES', 'Masculino', 'Universitario', '', 'LIC. ESTUDIOS SOCIOS CULTURALES', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Mestizo', null, null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('117', '89050235278', 'YANEISY MARTINEZREYES', 'Calle Osgood 150 %milla y jaguey Reparto Marquesado', 'Masculino', 'Universitario', '', 'Lic, ciencias alimentarias', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Divorciado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('118', '89060634238', 'IGMAR BARBA SUAREZ', 'CALLE GENERAL ROLOFF No88 e/CALLE ENRQUE MIRANDA Y CALIXTO GARCIA ', 'Femenino', 'Preuniversitario', '', 'GASTRONOMIA YCOMERCIO', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Blanco', '', null, 'Casado(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('119', '89071234203', 'JENNY  LEYVA ALVAREZ', 'INDEPENDENCIA No 66B-2% PADRE OLALLO Y SAN RAFAEL', 'Masculino', 'Preuniversitario', '', 'Técnico medio en tecnologia de los alimentos', 'Sin categorizar', 'No determinado', '2018-09-03', '4', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'NO', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('120', '89081334225', 'Alina Maria Hernandez Riveron', 'Calle Principal Edificio 16 apto 22 Rpto Sanchez Soto', 'Masculino', 'Preuniversitario', '', 'Tecnico en construccion civil', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', '', null, 'Soltero(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');
INSERT INTO `tbl_aspirantes` VALUES ('121', '89092035698', 'YOAN CARBAJAL PARALEDA ', 'BEMBETA No507A % SAN RAMON Y MARTI', 'Masculino', 'Preuniversitario', '', 'Tecnco medio, metalurgica', 'Sin categorizar', 'No determinado', '2018-09-03', '1', '', '', 'Blanco', null, null, 'Casado(a)', null, 'SI', 'SI', '4', '6.00', null, null, null, null, 'NO');

-- ----------------------------
-- Table structure for `tbl_aspirante_cargos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_aspirante_cargos`;
CREATE TABLE `tbl_aspirante_cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `tbl_aspirante_cargos_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_aspirante_cargos_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2326 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_aspirante_cargos
-- ----------------------------
INSERT INTO `tbl_aspirante_cargos` VALUES ('28', '19', '23');
INSERT INTO `tbl_aspirante_cargos` VALUES ('29', '21', '40');
INSERT INTO `tbl_aspirante_cargos` VALUES ('30', '20', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('31', '22', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('32', '23', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('33', '22', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('34', '24', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('35', '25', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('36', '26', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('37', '17', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('38', '17', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('39', '18', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('40', '18', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('42', '27', '19');
INSERT INTO `tbl_aspirante_cargos` VALUES ('43', '27', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('44', '28', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('45', '28', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('46', '28', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('47', '30', '23');
INSERT INTO `tbl_aspirante_cargos` VALUES ('48', '31', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('49', '32', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('50', '33', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('51', '34', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('52', '35', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('53', '36', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('54', '37', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('55', '38', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('56', '39', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('57', '40', '23');
INSERT INTO `tbl_aspirante_cargos` VALUES ('58', '41', '41');
INSERT INTO `tbl_aspirante_cargos` VALUES ('59', '42', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('60', '43', '19');
INSERT INTO `tbl_aspirante_cargos` VALUES ('61', '44', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('62', '45', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('64', '47', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('65', '48', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('66', '49', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('67', '50', '26');
INSERT INTO `tbl_aspirante_cargos` VALUES ('68', '51', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('69', '52', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('70', '53', '30');
INSERT INTO `tbl_aspirante_cargos` VALUES ('71', '54', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('72', '55', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('73', '56', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('74', '57', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('75', '58', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('76', '59', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('77', '60', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('78', '61', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('79', '62', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('80', '63', '35');
INSERT INTO `tbl_aspirante_cargos` VALUES ('81', '64', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('82', '65', '14');
INSERT INTO `tbl_aspirante_cargos` VALUES ('83', '66', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('84', '67', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('85', '68', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('86', '69', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('87', '70', '32');
INSERT INTO `tbl_aspirante_cargos` VALUES ('88', '71', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('89', '72', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('90', '73', '35');
INSERT INTO `tbl_aspirante_cargos` VALUES ('91', '74', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('92', '75', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('93', '70', '34');
INSERT INTO `tbl_aspirante_cargos` VALUES ('94', '70', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('95', '76', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('96', '78', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('97', '79', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('98', '80', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('99', '81', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('100', '82', '11');
INSERT INTO `tbl_aspirante_cargos` VALUES ('101', '83', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('102', '84', '11');
INSERT INTO `tbl_aspirante_cargos` VALUES ('103', '85', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('104', '86', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('105', '87', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('106', '88', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('107', '89', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('108', '90', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('109', '91', '31');
INSERT INTO `tbl_aspirante_cargos` VALUES ('110', '92', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('111', '93', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('112', '94', '30');
INSERT INTO `tbl_aspirante_cargos` VALUES ('113', '95', '21');
INSERT INTO `tbl_aspirante_cargos` VALUES ('114', '96', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('115', '97', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('116', '98', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('117', '99', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('118', '100', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('119', '101', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('120', '102', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('121', '103', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('122', '104', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('123', '105', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('124', '106', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('125', '107', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('126', '108', '5');
INSERT INTO `tbl_aspirante_cargos` VALUES ('127', '109', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('128', '110', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('129', '111', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('130', '112', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('131', '113', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('132', '114', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('133', '115', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('134', '116', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('135', '117', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('136', '118', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('137', '119', '27');
INSERT INTO `tbl_aspirante_cargos` VALUES ('138', '120', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('139', '121', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('184', '39', '2');
INSERT INTO `tbl_aspirante_cargos` VALUES ('185', '39', '3');
INSERT INTO `tbl_aspirante_cargos` VALUES ('186', '39', '31');
INSERT INTO `tbl_aspirante_cargos` VALUES ('188', '113', '4');
INSERT INTO `tbl_aspirante_cargos` VALUES ('189', '113', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('190', '113', '7');
INSERT INTO `tbl_aspirante_cargos` VALUES ('191', '113', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('197', '43', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('198', '43', '30');
INSERT INTO `tbl_aspirante_cargos` VALUES ('199', '114', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('200', '114', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('205', '38', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('210', '62', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('211', '62', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('213', '29', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('214', '29', '27');
INSERT INTO `tbl_aspirante_cargos` VALUES ('215', '29', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('216', '57', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('217', '57', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('218', '71', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('219', '24', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('220', '24', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('221', '120', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('222', '120', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('229', '79', '11');
INSERT INTO `tbl_aspirante_cargos` VALUES ('230', '81', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('249', '46', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('250', '90', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('270', '83', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('284', '80', '8');
INSERT INTO `tbl_aspirante_cargos` VALUES ('285', '80', '27');
INSERT INTO `tbl_aspirante_cargos` VALUES ('286', '80', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('288', '108', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('289', '108', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('290', '31', '12');
INSERT INTO `tbl_aspirante_cargos` VALUES ('291', '31', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('315', '92', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('319', '102', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('404', '117', '27');
INSERT INTO `tbl_aspirante_cargos` VALUES ('406', '63', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('439', '121', '39');
INSERT INTO `tbl_aspirante_cargos` VALUES ('440', '121', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('452', '89', '4');
INSERT INTO `tbl_aspirante_cargos` VALUES ('463', '95', '16');
INSERT INTO `tbl_aspirante_cargos` VALUES ('464', '95', '1');
INSERT INTO `tbl_aspirante_cargos` VALUES ('465', '95', '23');
INSERT INTO `tbl_aspirante_cargos` VALUES ('466', '95', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('498', '88', '4');
INSERT INTO `tbl_aspirante_cargos` VALUES ('572', '47', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('573', '47', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('574', '36', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('575', '44', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('647', '30', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('988', '81', '32');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1075', '77', '23');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1076', '77', '36');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1502', '111', '6');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1503', '111', '47');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1731', '32', '19');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1846', '79', '32');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1849', '49', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1855', '41', '24');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1856', '41', '38');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1857', '41', '13');
INSERT INTO `tbl_aspirante_cargos` VALUES ('1896', '105', '47');
INSERT INTO `tbl_aspirante_cargos` VALUES ('2307', '96', '42');
INSERT INTO `tbl_aspirante_cargos` VALUES ('2324', '79', '18');
INSERT INTO `tbl_aspirante_cargos` VALUES ('2325', '79', '39');

-- ----------------------------
-- Table structure for `tbl_aspirante_prioridades`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_aspirante_prioridades`;
CREATE TABLE `tbl_aspirante_prioridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `prioridad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `prioridad_id` (`prioridad_id`),
  CONSTRAINT `tbl_aspirante_prioridades_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_aspirante_prioridades_ibfk_2` FOREIGN KEY (`prioridad_id`) REFERENCES `tbl_prioridades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_aspirante_prioridades
-- ----------------------------
INSERT INTO `tbl_aspirante_prioridades` VALUES ('7', '22', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('8', '103', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('9', '85', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('11', '39', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('12', '113', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('15', '43', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('16', '114', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('17', '84', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('18', '38', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('19', '99', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('20', '60', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('21', '111', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('22', '66', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('23', '66', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('24', '37', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('25', '62', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('26', '17', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('27', '17', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('28', '29', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('29', '57', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('32', '72', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('33', '115', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('34', '115', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('35', '78', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('36', '71', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('37', '24', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('38', '120', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('39', '120', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('40', '56', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('41', '116', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('42', '42', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('43', '42', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('44', '18', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('45', '79', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('46', '81', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('47', '20', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('48', '20', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('49', '64', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('50', '64', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('52', '46', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('53', '90', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('58', '83', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('59', '101', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('60', '80', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('61', '108', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('62', '108', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('63', '31', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('64', '31', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('65', '92', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('66', '92', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('67', '67', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('68', '102', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('69', '102', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('75', '34', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('76', '34', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('101', '112', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('105', '93', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('106', '117', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('107', '117', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('113', '63', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('115', '26', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('125', '121', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('126', '121', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('129', '89', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('136', '95', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('137', '95', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('146', '88', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('148', '91', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('149', '91', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('153', '47', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('154', '36', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('155', '44', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('164', '97', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('165', '97', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('171', '109', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('194', '30', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('215', '87', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('216', '87', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('295', '50', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('296', '50', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('300', '107', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('323', '74', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('324', '74', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('328', '77', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('345', '106', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('346', '106', '1');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('486', '27', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('487', '32', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('509', '49', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('514', '41', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('527', '45', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('528', '105', '6');
INSERT INTO `tbl_aspirante_prioridades` VALUES ('652', '96', '6');

-- ----------------------------
-- Table structure for `tbl_capacitaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_capacitaciones`;
CREATE TABLE `tbl_capacitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `forma_id` int(11) NOT NULL,
  `ano` varchar(255) NOT NULL,
  `centro_id` int(11) NOT NULL,
  `escala_capacitacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `escala_capacitacion_id` (`escala_capacitacion_id`),
  KEY `forma_id` (`forma_id`),
  KEY `centro_id` (`centro_id`),
  CONSTRAINT `tbl_capacitaciones_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_capacitaciones_ibfk_2` FOREIGN KEY (`escala_capacitacion_id`) REFERENCES `tbl_escalas_capacitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_capacitaciones_ibfk_3` FOREIGN KEY (`forma_id`) REFERENCES `tbl_formas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_capacitaciones_ibfk_4` FOREIGN KEY (`centro_id`) REFERENCES `tbl_centros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1651 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_capacitaciones
-- ----------------------------
INSERT INTO `tbl_capacitaciones` VALUES ('11', '22', 'Nivel de Cocna I', 'Cocina', '14', '2014', '4', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('12', '22', 'Técnico Medio', 'Comercio', '13', '2003', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('13', '19', 'Ingeniero en Ciencias Informàticas', 'Ciencias Informáticas', '13', '2013', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('14', '21', 'Licenciada en Derecho', 'Derecho', '13', '2013', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('15', '21', 'Certificado de Evaluacion de Diplomado', 'Preparacion para el ejercicico de jurista', '14', '2014', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('16', '21', 'Certificado de Curso de Postgrado', 'Las inversiones extranjeras eficientes. La perspectiva cubana', '14', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('17', '103', 'Nivel Medio Superior', 'Facutad Obrero Campesina', '13', '2007', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('18', '103', 'Inglés', '2do Nivel de Inglés', '14', '1997', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('19', '85', 'adminsitrador de gastronomia RES 223/97', 'adminstrador de gastronomia', '14', '1998', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('20', '85', 'Licenciado', 'Psicología', '13', '2011', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('21', '85', 'Certificado en Gestion de Ventas', 'Gestion de Ventas', '14', '2004', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('22', '85', 'Contabilidad para directivos', 'contabilidad', '14', '2005', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('23', '85', 'curso de cuadros', 'curso de cuadros', '14', '2015', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('24', '85', 'adminstrador de la salud', 'administrador de la salud', '14', '2012', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('25', '70', 'Tecnico Medio', 'Zootecnia', '13', '1985', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('26', '70', 'Certificado', 'Dependiente de Almacen', '14', '1988', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('35', '39', 'CURSO OHCC CERAMICA Y VIDRIO', 'CERAMICA Y VIDRIO', '5', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('36', '39', 'COMUNICACION SOCIAL OHCC', 'COMUNICACION SOCIAL', '5', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('37', '39', 'TOPOGRAFIA APLICADA A LA ARQUEOLOGIA OHCC', 'TOPOGRAFIA APLICADA A LA ARQUEOLOGIA', '5', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('38', '39', 'ANTROPOLOGIA', 'ANTROPOLOGIA', '4', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('39', '39', 'LICENCIATURA HISTORIA', 'HISTORIA', '13', '2006', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('40', '39', 'OPERADOR MICROCOMPUTADORAS', 'OPERADOR MICROCOMPUTADORAS', '14', '2018', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('41', '39', 'INTRODUCCION A LA ARQUEOLOGIA', 'INTRODUCCION A LA ARQUEOLOGIA', '13', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('42', '39', 'PALEONTOLOGIA', 'PALEONTOLOGIA', '13', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('43', '39', 'RESISTENCIA, LUCHA Y EMANCIPACION', 'RESISTENCIA, LUCHA Y EMANCIPACION', '13', '2017', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('44', '39', 'TECNICAS PARA EL REGISTRO DEL PATRIMONIO CULTURAL SUBACUATICO', 'TECNICAS PARA EL REGISTRO DEL PATRIMONIO CULTURAL SUBACUATICO', '13', '2015', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('45', '113', 'ADMINISTRACION INTEGRAL', 'ADMINISTRACION INTEGRAL', '12', '2017', '3', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('46', '113', 'ALOJAMIENTO HOTELERO', 'ALOJAMIENTO HOTELERO', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('47', '113', 'AYUDANTE GENERAL DE ELABORACION', 'AYUDANTE GENERAL DE ELABORACION', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('48', '113', 'CAJERO DEPENDIENTE CIMEX', 'CAJERO DEPENDIENTE', '14', '2000', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('49', '113', 'COCINERO INTEGRAL B', 'Cocina', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('50', '113', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('51', '113', 'INGLES PARA DEPENDIENTE COMERCIAL', 'INGLES', '14', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('52', '113', 'DOCTORA EN MEDICINA VETERINARIA', 'DOCTORA EN MEDICINA VETERINARIA', '13', '1996', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('57', '43', 'GESTION DE ALMACEN MAYORISTA', 'GESTION DE ALMACEN MAYORISTA', '14', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('58', '43', 'LOGISTICA DE ALMACEN', 'LOGISTICA DE ALMACEN', '14', '2008', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('59', '43', 'TECNICO MEDIO  CONSTRUCCION CIVIL', 'ONSTRUCCION CIVIL', '13', '1991', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('60', '43', 'TECNICO MEDIO EXPLOTACION DEL TRANSPORTE', 'EXPLOTACION DEL TRANSPORTE', '13', '2011', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('61', '114', 'CURSO AGUARDIENTES, LICORES Y CERVEZAS', ' AGUARDIENTES, LICORES Y CERVEZAS', '14', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('62', '114', 'CURSO TECNOLOGIA DE BAR', 'CANTINA', '14', '2014', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('63', '114', 'DEPENDIENTE SERVICIOS GASTRONOMICOS', 'DEPENDIENTE GASTRONOMIA', '13', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('65', '84', 'LICENCIA CONDUCCION', 'LICENCIA CONDUCCION', '14', '1986', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('66', '38', 'BACHILLER TECNICO ESPECIALIDAD DE INFORMATICA', 'INFORMATICA', '13', '2009', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('67', '99', 'FACULAD PARA ADULTOS 12 GRADO', 'FACULTAD PARA ADULTOS', '14', '2003', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('68', '99', 'CAJERO DEPENDIENTE CIMEX', 'CAJERO DEPENDIENTE', '14', '2013', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('69', '99', 'DEPENDIENTE COMERCIAL CIMEX', 'DEPENDIENTE COMERCIAL', '14', '2002', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('70', '99', 'LENGUA INGLESA PARA ADULTOS', 'LENGUA INGLESA', '14', '2001', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('71', '60', 'ACTUALIZACION SOBRE TIPOS Y MODALIDADES DE SERVICIO', 'GASTRONOMIA SERVICIOS', '14', '2018', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('72', '60', 'ACTUALIZACION PARA DEPENDIENTES GASTRONOMICOS', 'GASTRONOMIA', '14', '2018', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('73', '60', 'ACTUALIZACION VIP PARA DEPENDIENTE GASTRONOMICO', 'GASTRONOMIA SERVICIOS', '14', '2018', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('74', '60', 'BACHILER', 'BACHILLER', '13', '2017', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('75', '60', 'RELACIONES PUBLICAS', 'RELACIONES PUBLICAS', '14', '2017', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('76', '60', 'DEPENDIENTE INTEGRAL DE GASTRONOMIA', 'GASTRONOMIA SERVICIOS', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('77', '60', 'I NIVEL DE COCINA', 'COCINA', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('78', '60', 'CERTIFICACION 1 NIVEL DE INGLES', 'INGLES', '14', '2017', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('79', '60', 'PROTOCOLO Y ETIQUETA PARA DEPENDINETES GASTRONOMICOS', 'GASTRONOMIA', '14', '2018', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('80', '111', 'CAMARERA B', 'CAMARERA', '6', '1994', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('81', '111', 'CURSO HABILITACION DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2011', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('82', '111', '12 GRADO FACULTAD OBRERO CAMPESINA', '12 GRADO', '14', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('83', '66', 'BACHILLER', 'BACHILLER', '13', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('84', '66', 'CURSO BASICO DE INGLES', 'IDIOMA INGLES', '14', '2016', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('85', '66', 'CURSO HABILITACION DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2016', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('86', '66', 'TECNICAS DE SALON', 'GASTRONOMIA', '14', '2015', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('87', '37', 'LICENCIADA CONTABILIDAD', 'CONTABILIDAD', '13', '2013', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('88', '37', 'CAJERO DEPENDIENTE COMERCIAL CUBALSE', 'CAJERO DEPENDIENTE COMERCIAL', '14', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('89', '62', 'TECNICO MEDIO AGRONOMIA', 'AGRONOMIA', '13', '2007', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('90', '62', 'LOGISTICA DE ALMACEN TRD', 'LOGISTICA DE ALMACEN', '14', '2013', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('91', '62', 'CURSO SUPERACION IMAGEN Y MERCHANDISING', 'IMAGEN Y MERCHANDISING', '14', '2015', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('92', '17', 'BACHILLER', 'BACHILLER', '13', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('93', '17', 'CURSO CAJERO CIMEX', 'CAJERO', '14', '2011', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('94', '17', 'CAJERO DEPENDIENTE ESTABLECIMIENTO COMERCIAL', 'CAJERO DEPENDIENTE COMERCIAL', '12', '2009', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('95', '29', 'TECNICO MEDIO MICRO COMPUTADORAS', 'MICRO COMPUTADORAS', '13', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('96', '29', 'HABILITACION ENCARGADO DE ALMACEN', 'ENCARGADO DE ALMACEN', '12', '2012', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('97', '29', 'I NIEVL DE COCINA', 'COCINA', '14', '2014', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('98', '29', 'II NIVEL DE COCINA', 'COCINA', '14', '2014', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('99', '29', 'III NIVEL DE COCINA', 'COCINA', '14', '2015', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('100', '29', 'CHEF DE COCINA INTERNACIONAL', 'COCINA', '14', '2016', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('101', '29', 'LUNCH', 'LUNCH', '14', '2014', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('102', '29', 'SALSAS', 'COCINA', '14', '2014', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('103', '29', 'DECORACION DE PLATOS', 'COCINA', '14', '2018', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('104', '57', 'ALMACEN', 'ALMACEN', '14', '1999', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('105', '57', 'TECNICO MEDIO SERVICIOS GASTRONOMICOS', 'SERVICIOS GASTRONOMICOS', '13', '2002', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('106', '57', 'COCINERO INTEGRAL B', 'COCINA', '12', '2004', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('111', '72', 'III NIVEL DE INGLES', 'IDIOMA INGLES', '14', '2000', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('112', '72', 'HABILITACION RRHH', 'RRHH', '12', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('113', '72', 'INGENIERA MECANICA', 'INGENIERA MECANICA', '13', '2002', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('114', '72', 'TECNICO MEDIO ECONOMIA', 'ECONOMIA', '13', '1995', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('115', '72', 'CURSO VENDEDOR', 'VENDEDOR CMERCIO', '14', '2000', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('116', '115', 'BACHILLER HUMANIDADES', 'BACHILLER', '13', '2007', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('117', '115', 'CERTIFICADO TRABAJADORA SOCIAL', 'TRABAJADORA SOCIAL', '14', '2007', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('118', '115', 'COCINA NIVEL I', 'COCINA', '12', '2011', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('119', '78', 'BACHILLER TECNICO ESPECIALIDAD DE INFORMATICA', 'INFORMATICA', '13', '2010', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('120', '71', 'BACHILLER', 'BACHILLER', '13', '2005', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('121', '71', 'HABILITACION DEPENDIENTE DE ALMACEN', 'DEPENDIENTE DE ALMACEN', '12', '2006', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('122', '71', 'OBRERO CALIFICADO MECANICA DE VEHICULOS AUTOMOTORES', 'MECANICA DE VEHICULOS AUTOMOTORES', '13', '1997', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('123', '71', 'CAJERO DEPENDIENTE', 'CAJERO DEPENDIENTE', '14', '2005', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('124', '24', 'LICECIADA EN CONTABILIDAD', 'CONTABILIDAD', '13', '1999', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('125', '24', 'TECNICO MEDIO EN ECONOMIA', 'ECONOMIA', '13', '1992', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('126', '120', 'TECNICO MEDIO CONSTRUCCION CIVIL', 'CONSTRUCCION CIVIL', '13', '2007', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('127', '120', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('128', '120', 'CANTIENRO B', 'CANTINERO', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('129', '120', 'DEPENDIENTE ALMACEN TRD', 'DEPENDIENTE DE ALMACEN', '12', '2006', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('130', '98', 'SECUNDARIA BASICA', 'SECUNDARIA BASICA', '13', '2012', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('131', '98', 'SERVICIO GASTRONOMICO', 'SERVICIO GASTRONOMICO', '14', '2013', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('132', '56', 'BACHILLER', 'BACHILLER', '13', '1988', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('133', '56', 'INGLES', 'IDIOMA INGLES', '14', '1998', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('134', '56', 'ITALIANO 2DO NIVEL', 'IDIOMA ITALIANO', '14', '2001', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('135', '56', 'INFORMATICA BASICA', 'INFORMATICA BASICA', '14', '2007', '1', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('136', '56', 'CAJERA DEPENDIENTE ARTEX', 'DEPENDIENTE ARTEX', '14', '2000', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('137', '116', 'LICENCIADO EN ESTUDIOS SCIOCULTURALES', 'ESTUDIOS SOCIOCULTURALES', '13', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('138', '116', 'OPERADOR DE MICROCOMPUTADORAS PARA WIDOWS', 'OPERADOR DE MICROCOMPUTADORAS', '14', '2016', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('139', '42', 'LICENCIADO EN COMUNICACION SOCIAL', 'COMUNICACION SOCIAL', '13', '2008', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('140', '18', 'LICENCIADO EN TURISMO', 'LICENCIADO EN TURISMO', '13', '2013', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('141', '79', 'BACHILLER', 'BACHILLER', '13', '2002', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('142', '79', 'HABILITACION DE ADMINISTRACION INTEGRAL', 'ADMINISTRACION INTEGRAL', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('143', '81', 'LICENCIADO CULTURA FISICA', 'CULTURA FISCA', '13', '2013', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('144', '81', 'COCINA NIVEL I', 'COCINA', '14', '2013', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('145', '81', 'SERVICIO GASTRONOMICO', 'GASTRONOMIA', '14', '2013', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('146', '20', 'BACHILLER', 'BACHILLER', '13', '2012', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('147', '20', 'CANINERO INTEGRAL B', 'CANTINERO', '12', '2014', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('148', '114', 'BACHILLER', 'BACHILLER', '13', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('149', '64', 'NCOCINA NIVEL I', 'COCINA', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('150', '64', 'II NIVEL DE COCINA', 'COCINA', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('151', '64', 'LUNCH', 'LUNCH', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('152', '64', 'BACHILLER TECNICO INSTRUMENTACION Y CONTROL', 'BACHILLER', '13', '2011', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('153', '64', 'INGLES I', 'IDIOMA INGLES', '14', '2015', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('155', '46', 'CURSO BASICO DE INFORMATICA', 'INFORMATICA', '14', '2010', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('156', '46', 'COCINA NIVEL I', 'COCINA', '14', '2016', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('157', '46', 'CURSO GENERAL DE INGLES', 'IDIOMA INGLES', '14', '2002', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('158', '46', 'FACULTAD OBREO CAMPESINA', 'EDUCACION PARA ADULTOS', '13', '2009', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('159', '90', 'LICENCIADO EN ESTUDIOS SCIOCULTURALES', 'ESTUDIOS SOCIOCULTURALES', '13', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('160', '90', 'INTEGRAL BASICO DE EGSTION EMPRESARIAL', 'GESTION EMPRESARIAL', '14', '2010', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('161', '90', 'SERVICIO GASTRONOMICO', 'SERVICIO GASTRONOMICO', '14', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('167', '83', 'TECNICO MEDIO CONTADOR', 'CONTADOR', '13', '2004', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('168', '83', 'TECNICO NIVEL MEDIO SERVICIOS GASTRONOMICOS', 'GASTRONOMIA', '13', '1994', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('169', '83', 'DEPENDIENTE CAJERO COMERCIAL', 'CAJERO COMERCIAL', '14', '2002', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('170', '83', 'DEPENDIENTE INTEGRAL', 'DEPENDIENTE INTEGRAL', '14', '2000', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('171', '101', 'TECNICO MEDIO EDIFICACIONES', 'TECNICO MEDIO EDIFICACIONES', '13', '1979', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('172', '101', 'CERTIFICADO ALMACEN MAYORISTA', 'ALMACEN MAYORISTA', '14', '1997', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('173', '101', 'HABILITACION ADMINISTRADORES GASTRONOMICOS', 'GASTRONO ADMINISTRADORES', '12', '2012', '3', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('174', '80', 'TECNICO MEDIO EN MANTENIMIENTO ELECTRICO', 'MANTENIMIENTO ELECTRICO', '13', '1993', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('175', '80', 'TECNICO MEDIO SERVICIOS GASTRONOMICOS', 'GASTRONOMIA', '13', '2008', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('176', '80', 'COCINA NIVEL I', 'COCINA', '14', '2008', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('177', '80', 'IDIOMA ITALIANO', 'IDIOMA ITALIANO', '14', '2007', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('178', '80', 'III NIVEL DE INGLES', 'IDIOMA INGLES', '14', '2006', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('179', '80', 'CANTINERO INETGRAL', 'CANTINERO', '14', '2004', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('180', '80', 'LUNCH', 'LUNCH', '14', '2003', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('181', '108', 'FACULTAD OBREO CAMPESINA', 'FACULTAD OBREO CAMPESINA', '13', '2016', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('182', '108', 'COCINA NIVEL I', 'COCINA', '14', '2013', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('183', '108', 'TECNICAS DE SALON', 'TECNICAS DE SALON', '14', '2015', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('184', '31', 'FACULTAD OBREO CAMPESINA', 'FACULTAD OBREO CAMPESINA', '13', '1996', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('185', '31', 'INGLES PARA COCINA', 'IDIOMA INGLES', '14', '2013', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('186', '31', 'ACTUALIZACION SERVICIOS GASTRONOMICOS', 'GASTRONOMIA', '14', '2003', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('187', '31', 'II NIVEL DE COCINA', 'COCINA', '14', '2005', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('188', '31', 'ENCARGADO DE ALMACEN', 'ENCARGADO DE ALMACEN', '14', '2008', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('189', '92', 'TECNICO MEDIO CONTABILIDAD', 'CONTABILIDAD', '13', '2014', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('190', '92', 'SERVICIO GASTRONOMICO', 'GASTRONOMIA SERVICIOS', '14', '2013', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('191', '92', 'INGLES II NIVEL', 'IDIOMA INGLES', '14', '2015', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('192', '67', 'CEJERO VENDEDOR TRD', 'CAJERO DEPENDIENTE', '14', '2016', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('193', '67', 'DEPENDIENTE INTEGRAL ESTABLECIMIENTO COMERCIAL', 'DEPENDIENTE INTEGRAL ESTABLECIMIENTO COMERCIAL', '14', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('194', '67', 'HABILITACION ADMINISTRADOR DE COMERCIO', 'ADMINISTRADOR DE COMERCIO', '14', '2018', '3', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('195', '67', 'TECNICO MEDIO CONTABILIDAD', 'CONTABILIDAD', '13', '2005', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('196', '67', 'TECNICAS LOGISTICAS DE ALMACEN EN INSTALACIONES DE SERVICIOS', 'LOGISTICA DE ALMACEN', '14', '2018', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('197', '102', 'CURSO HABILITACION DEPENDIENTE INTEGRAL ESTABLECIMIENTOS COMERCIALES', 'CAJERO DEPENDIENTE COMERCIAL', '14', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('198', '102', 'BACHILLER EN BIBLIOTECOLOGIA Y TECNICAS DOCUMENTALES', 'BACHILLER', '13', '2008', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('199', '102', 'CAJERO DEPENDIENTE TRD', 'CAJERO DEPENDIENTE', '14', '2016', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('200', '102', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '14', '2012', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('201', '102', 'HABILITACION ADMINISTRADOR DE COMERCIO', 'ADMINISTRADOR DE COMERCIO', '14', '2018', '3', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('208', '84', 'BACHILLER', 'BACHILLER', '13', '2000', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('214', '34', 'TECNICO MEDIO SERVICIOS GASTRONOMICOS', 'GASTRONOMIA', '13', '2016', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('263', '112', 'LICENCIADO SOCIOLOGIA', 'LICENCIADO SOCIOLOGIA', '13', '2013', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('276', '93', 'ENCARGADO DE ALMACEN', 'ENCARGADO DE ALMACEN', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('277', '117', 'LICENCIADO EN CIENCIAS ALIMENTARIAS', 'CIENCIAS ALIMENTARIAS', '13', '2012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('278', '117', 'COCINA PARA CAMPISMO POPULAR', 'COCINA', '12', '2013', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('279', '117', 'LUNCH', 'LUNCH', '14', '2012', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('280', '117', 'INGLES PARA COCINERO', 'IDIOMA INGLES', '14', '2013', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('285', '63', 'FACULTAD OBREO CAMPESINA', 'FACULTAD OBREO CAMPESINA', '13', '2003', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('286', '63', 'TECNICO NIVEL MEDIO CONTABILIDAD', 'CONTABILIDAD', '13', '1998', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('292', '26', 'TECNICO MEDIO CONTABILIDAD', 'CONTABILIDAD', '13', '2003', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('310', '121', 'DEPENDIENTE CAJERO', 'DEPENDIENTE CAJERO', '14', '2003', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('311', '121', 'ENCARGADO DE ALMACEN', 'ENCARGADO DE ALMACEN', '14', '2004', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('312', '121', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '14', '2016', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('317', '89', 'II NIVEL DE COCINA', 'COCINA', '14', '2015', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('318', '89', 'INGLES PARA ELABORADOR DE ALIMENTOS', 'IDIOMA INGLES', '14', '2013', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('319', '89', 'CERTIFICO MAESTRO INTEGRAL EMPRESA CUBANA DEL PAN', 'MAESTRO INTEGRAL', '14', '2002', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('320', '89', 'BACHILLER', 'BACHILLER', '14', '1989', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('330', '95', 'CERTIFICADO ESPECIALIDAD RECEPCION HOTELERA', 'RECEPCION HOTELERA', '14', '2014', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('331', '95', 'CURSO ENERGIA Y DESARROLLO SOSTENIBLE', 'ENERGIA Y DESARROLLO SOSTENIBLE', '14', '2006', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('332', '95', 'MARKETING TURISTICO', 'MARKETING', '14', '2017', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('333', '95', 'CURSO ADMINISTRADORES INTEGRALES', 'ADMINISTRADORES INTEGRALES', '12', '2013', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('334', '95', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2012', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('335', '95', 'RECEPCION HOTELERA', 'RECEPCION HOTELERA', '13', '2014', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('336', '95', 'LICENCIADO EN EDUCACION INFORMATICA', 'EDUCACION INFORATICA', '13', '2015', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('337', '95', 'AHORRO ENERGETICO EN ORGANISMOS', 'AHORRO ENERGETICO EN ORGANISMOS', '14', '2007', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('351', '88', 'TECNICO MEDIO COMERCIO', 'TECNICO MEDIO COMERCIO', '14', '2012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('352', '88', 'COCINA NIVEL I', 'COCINA', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('353', '88', 'II NIVEL DE COCINA', 'COCINA', '14', '2017', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('357', '91', 'SECUNDARIA BASICA', 'SECUNDARIA BASICA', '13', '2008', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('363', '47', 'LICENCIADA EN EDUCACION ESPECIALIDAD INFORMATICA', 'LICENCIADO EDUCACION', '13', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('364', '36', 'LICENCIADA EN CONTABILIDAD Y FINANZAS', 'CONTABILIDAD', '13', '2012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('365', '44', 'DEPENDIENTE CAJERO COMERCIAL', 'DEPENDIENTE CAJERO COMERCIAL', '14', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('366', '44', 'LICENCIADA EN CONTABILIDAD Y FINANZAS', 'CONTABILIDAD', '13', '20012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('367', '44', 'OPERACIONES DE INVENTARIOS (CUBALSE)', 'OPERACIONES DE INVENTARIOS', '5', '2010', '5', '8');
INSERT INTO `tbl_capacitaciones` VALUES ('382', '97', 'HABILITACION ADMINISTRADOR INTEGRAL', 'ADMINISTRACION INTEGRAL', '12', '2017', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('383', '97', 'LICENCIADO CULTURA FISICA', 'CULTURA FISCA', '13', '2015', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('398', '109', 'TECNICO MEDIO SERVICIOS GASTRONOMICOS', 'SERVICIO GASTRONOMICO', '13', '2007', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('399', '109', 'HABILITACION DEPENDIENTE GASTRONOMICO', 'DEPENDIENTE GASTRONOMIA', '14', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('400', '109', 'INGLES ESPECIALIZADO SERVICIOS GASTRONOMICOS', 'IDIOMA INGLES', '14', '2015', '1', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('450', '30', 'MARKETING TURISTICO', 'MARKETING', '5', '2017', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('451', '30', 'INGENIERO INFORMATICO', 'INFORMATICA', '13', '2016', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('452', '47', 'PERFECCIONAMIETO PARA GERENTES TRD', 'PERFECCIONAMIETO PARA GERENTES TRD', '14', '2018', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('485', '87', 'TECNICO MEDIO CONTABILIDAD', 'CONTABILIDAD', '13', '2014', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('486', '87', 'TECNICAS DE SALON', 'TECNICAS DE SALON', '14', '2015', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('697', '50', '12 GRADO', '12 GRADO', '13', '2011', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('700', '107', 'TECNICO MEDIO SERVICIOS GASTRONOMICOS', 'GASTRONOMIA SERVICIOS', '13', '2015', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('749', '74', 'CAJERO DEPENDIENTE TRD', 'CAJERO DEPENDIENTE', '14', '2016', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('750', '74', 'BACHILLER', 'BACHILLER', '13', '2014', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('766', '77', 'INGENIERO QUIMICO', 'INGENIERO QUIMICO', '13', '1996', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('767', '77', 'ESPECIALISTA EN TECNOLOGIA DE LOS PRODUCTOS LACTEOS', 'ESPECIALISTA EN TECNOLOGIA DE LOS PRODUCTOS LACTEOS', '13', '1999', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('768', '77', 'MASTER EN NUEVAS TECNOLOGIAS PARA LA EDUCACIÓN', 'MASTER EN NUEVAS TECNOLOGIAS PARA LA EDUCACIÓN', '2', '2007', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('805', '106', 'BACHILLER', 'BACHILLER', '13', '2003', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('806', '106', 'DEPENDIENTE INTEGRAL GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2011', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1043', '111', 'DEPENDIENTE INTEGRAL ESTABLECIMIENTOS COMERCIALES', 'DEPENDIENTE INTEGRAL ESTABLECIMIENTOS COMERCIALES', '14', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1204', '27', 'TECNICO MEDIO MECANICA DE TALLER', 'TECNICO MEDIO MECANICA DE TALLER', '13', '2005', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1205', '27', 'ALMACENERO TRD', 'ALMACENERO', '12', '2018', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1206', '32', 'TECNICO MEDIO EN ISTRUMENTACION Y CONTROL Y OBRERO CALIFICADO', 'TECNICO MEDIO EN ISTRUMENTACION Y CONTROL Y OBRERO CALIFICADO', '13', '1988', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1207', '32', 'JEFES Y DEPENDIENTES DE ALMACEN TRD', 'JEFES Y DEPENDIENTES DE ALMACEN', '12', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1250', '49', 'LICENCIADA CONTABILIDAD Y FINANZAS', 'LICENCIADA CONTABILIDAD Y FINANZAS', '13', '1991', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1263', '41', 'LICENCIADA EN CONTABILIDAD Y FINANZAS', 'LICENCIADA CONTABILIDAD Y FINANZAS', '13', '2015', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1264', '41', 'SISTEMA DE GESTION DE CAPITAL HUMANO', 'SISTEMA DE GESTION DE CAPITAL HUMANO', '4', '2017', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1265', '41', 'BASICO DE SST', 'BASICO DE SST', '5', '2018', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1266', '41', 'FORMACION AUDITORES INTERNOS', 'FORMACION AUDITORES INTERNOS', '14', '2012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1267', '41', 'ANALISIS E INTERPRETACION DE ESATDOS FINANCIEROS', 'ANALISIS E INTERPRETACION DE ESATDOS FINANCIEROS', '14', '2012', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1268', '41', 'TECNICAS DE DIRECCION', 'TECNICAS DE DIRECCION', '14', '2016', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1296', '45', 'SERVICIO GASTRONOMICO', 'SERVICIO GASTRONOMICO', '14', '1999', '4', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1297', '45', 'IDIOMA INGLES III', 'IDIOMA INGLES', '14', '2000', '5', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1298', '45', 'TECNICO NIVEL MEDIO METROLOGIA', 'TECNICO NIVEL MEDIO METROLOGIA', '13', '1999', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1299', '105', 'CAJERO VENDEDOR TRD', 'CAJERO VENDEDOR TRD', '12', '2012', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1300', '105', 'BACHILLER', 'BACHILLER', '13', '2007', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1301', '105', 'HABILITACION PARA DEPENDIENTE INTEGRAL DE ESTABLECIMIENTOS COMERCIALES', 'HABILITACION PARA DEPENDIENTE INTEGRAL DE ESTABLECIMIENTOS COMERCIALES', '14', '2011', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1574', '96', 'DISEÑO MECANICO', 'DISEÑO MECANICO', '13', '1990', '5', '7');
INSERT INTO `tbl_capacitaciones` VALUES ('1575', '96', 'HABILITACION ADMINISTRACION DE COMERCIO', 'HABILITACION ADMINISTRACION DE COMERCIO', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1576', '96', 'HABILITACION PARA DEPENDIENTE INTEGRAL ESTABLECIMIENTO COMERCIAL', 'HABILITACION PARA DEPENDIENTE INTEGRAL ESTABLECIMIENTO COMERCIAL', '14', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1582', '79', 'ENCARGADO ALMACEN', 'ENCARGADO ALMACEN', '14', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1648', '97', 'DEPENDIENTE INTEGRAL B GASTRONOMIA', 'DEPENDIENTE GASTRONOMIA', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1649', '97', 'DEPENDIENTE INTEGRAL ESTABLECIMIENTO COMERCIAL', 'DEPENDIENTE COMERCIAL', '12', '2018', '3', '6');
INSERT INTO `tbl_capacitaciones` VALUES ('1650', '97', 'PROMOCION DE GERENCIA COMERCIAL Y GASTRONOMICA', 'PROMOCION DE GERENCIA COMERCIAL Y GASTRONOMICA', '14', '2018', '3', '6');

-- ----------------------------
-- Table structure for `tbl_cargos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cargos`;
CREATE TABLE `tbl_cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_cargos
-- ----------------------------
INSERT INTO `tbl_cargos` VALUES ('1', 'Administrador');
INSERT INTO `tbl_cargos` VALUES ('2', 'Auxiliar General de Servicios');
INSERT INTO `tbl_cargos` VALUES ('3', 'Auxiliar Tecnico');
INSERT INTO `tbl_cargos` VALUES ('4', 'Ayudante de Elaboracion');
INSERT INTO `tbl_cargos` VALUES ('5', 'Ayudante General de Elaboración');
INSERT INTO `tbl_cargos` VALUES ('6', 'Cajero Integral');
INSERT INTO `tbl_cargos` VALUES ('7', 'Camarera de Habitacion');
INSERT INTO `tbl_cargos` VALUES ('8', 'Cantinero B');
INSERT INTO `tbl_cargos` VALUES ('9', 'Capitán B');
INSERT INTO `tbl_cargos` VALUES ('10', 'Conductor de Bicitaxis');
INSERT INTO `tbl_cargos` VALUES ('11', 'Chofer D');
INSERT INTO `tbl_cargos` VALUES ('12', 'Cocinero Integral B');
INSERT INTO `tbl_cargos` VALUES ('13', 'Contador B');
INSERT INTO `tbl_cargos` VALUES ('14', 'Contador B Esp. Princpal');
INSERT INTO `tbl_cargos` VALUES ('15', 'Contador D');
INSERT INTO `tbl_cargos` VALUES ('16', 'Dependiente Integral B de Gastronomia ');
INSERT INTO `tbl_cargos` VALUES ('17', 'Director');
INSERT INTO `tbl_cargos` VALUES ('18', 'Encargado almacen');
INSERT INTO `tbl_cargos` VALUES ('19', 'Encargado de Almacén');
INSERT INTO `tbl_cargos` VALUES ('20', 'Esp en Servicios Gastronómicos');
INSERT INTO `tbl_cargos` VALUES ('21', 'Esp. en Servicio de Alojamiento');
INSERT INTO `tbl_cargos` VALUES ('22', 'Esp. Integral en Servicios Gastronómicos');
INSERT INTO `tbl_cargos` VALUES ('23', 'Especialista B en Ciencias Informáticas');
INSERT INTO `tbl_cargos` VALUES ('24', 'Especialista B en Gestion Comercial');
INSERT INTO `tbl_cargos` VALUES ('25', 'Jefe de Servicio');
INSERT INTO `tbl_cargos` VALUES ('26', 'Limpiador de Areas en centros turisticos');
INSERT INTO `tbl_cargos` VALUES ('27', 'Lunchero B');
INSERT INTO `tbl_cargos` VALUES ('28', 'Operador Grabador Musicalizador');
INSERT INTO `tbl_cargos` VALUES ('29', 'Operario A de Elaboracion de productos Industria Alimenticia');
INSERT INTO `tbl_cargos` VALUES ('30', 'Operario general de mantenimiento');
INSERT INTO `tbl_cargos` VALUES ('31', 'Pantrista');
INSERT INTO `tbl_cargos` VALUES ('32', 'Portero Integral');
INSERT INTO `tbl_cargos` VALUES ('33', 'Recepcionista Hotelera');
INSERT INTO `tbl_cargos` VALUES ('34', 'Sereno');
INSERT INTO `tbl_cargos` VALUES ('35', 'Técnico en Gestion Económica');
INSERT INTO `tbl_cargos` VALUES ('36', 'Técnico en Ciencias Informática');
INSERT INTO `tbl_cargos` VALUES ('38', 'Esp. B Gestion Económica');
INSERT INTO `tbl_cargos` VALUES ('39', 'Almacenero');
INSERT INTO `tbl_cargos` VALUES ('40', 'Asesor Jurídico');
INSERT INTO `tbl_cargos` VALUES ('41', 'Especialista B RRHH');
INSERT INTO `tbl_cargos` VALUES ('42', 'DEPENDIENTE ESTABLECIMIENTO COMERCIAL');
INSERT INTO `tbl_cargos` VALUES ('43', 'ESPECIALISTA CALIDAD');
INSERT INTO `tbl_cargos` VALUES ('44', 'TECNICO ATM');
INSERT INTO `tbl_cargos` VALUES ('45', 'Tecnico Gestion Documental');
INSERT INTO `tbl_cargos` VALUES ('46', 'Recepcionista');
INSERT INTO `tbl_cargos` VALUES ('47', 'DEPENDIENTE ESTABLECIMIENTO COMERCIAL');
INSERT INTO `tbl_cargos` VALUES ('48', 'GESTOR A EN COMUNICACION Y MARKETING');
INSERT INTO `tbl_cargos` VALUES ('49', 'ESPECIALISTA  SEGURIDAD Y PROTECCION');
INSERT INTO `tbl_cargos` VALUES ('50', 'ESPECIALISTA DISEÑO');
INSERT INTO `tbl_cargos` VALUES ('51', 'INVERSIONISTA');
INSERT INTO `tbl_cargos` VALUES ('52', 'SECRETARIA');
INSERT INTO `tbl_cargos` VALUES ('53', 'TECNICO METROLOGIA');

-- ----------------------------
-- Table structure for `tbl_cargo_capacitaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cargo_capacitaciones`;
CREATE TABLE `tbl_cargo_capacitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_capacitacion_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `requerido` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cargo_id` (`cargo_id`),
  KEY `escala_capacitacion_id` (`escala_capacitacion_id`) USING BTREE,
  CONSTRAINT `tbl_cargo_capacitaciones_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_cargo_capacitaciones_ibfk_2` FOREIGN KEY (`escala_capacitacion_id`) REFERENCES `tbl_escalas_capacitaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_cargo_capacitaciones
-- ----------------------------
INSERT INTO `tbl_cargo_capacitaciones` VALUES ('3', '6', '6', '0.5', '0');

-- ----------------------------
-- Table structure for `tbl_cargo_certificacion`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cargo_certificacion`;
CREATE TABLE `tbl_cargo_certificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_certificacion_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `requerido` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cargo_id` (`cargo_id`),
  KEY `escala_certificacion_id` (`escala_certificacion_id`) USING BTREE,
  CONSTRAINT `tbl_cargo_certificacion_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_cargo_certificacion_ibfk_3` FOREIGN KEY (`escala_certificacion_id`) REFERENCES `tbl_escalas_certificaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_cargo_certificacion
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_cargo_ocupacion`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cargo_ocupacion`;
CREATE TABLE `tbl_cargo_ocupacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_ocupacion_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `requerido` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `escala_ocupacion_id` (`escala_ocupacion_id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `tbl_cargo_ocupacion_ibfk_1` FOREIGN KEY (`escala_ocupacion_id`) REFERENCES `tbl_escalas_ocupaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_cargo_ocupacion_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_cargo_ocupacion
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_catalogo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_catalogo`;
CREATE TABLE `tbl_catalogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pieza` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `materiales` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_catalogo
-- ----------------------------
INSERT INTO `tbl_catalogo` VALUES ('1', 'asasd', 'ASDFSDaf', 'asdfasdf');

-- ----------------------------
-- Table structure for `tbl_categorias`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categorias`;
CREATE TABLE `tbl_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_categorias
-- ----------------------------
INSERT INTO `tbl_categorias` VALUES ('1', 'Definitoria');
INSERT INTO `tbl_categorias` VALUES ('2', 'Ordinaria');

-- ----------------------------
-- Table structure for `tbl_categorias_establecimientos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categorias_establecimientos`;
CREATE TABLE `tbl_categorias_establecimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL COMMENT 'Categoría de establecimiento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_categorias_establecimientos
-- ----------------------------
INSERT INTO `tbl_categorias_establecimientos` VALUES ('1', 'Reproductora');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('2', 'Incubadora');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('3', 'Comercializadora');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('4', 'Aseguramiento');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('5', 'Agropecuaria');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('6', 'Reemplazo');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('7', 'Inicio');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('8', 'Otras');
INSERT INTO `tbl_categorias_establecimientos` VALUES ('9', 'Ponedoras');

-- ----------------------------
-- Table structure for `tbl_centros`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_centros`;
CREATE TABLE `tbl_centros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centro` varchar(255) NOT NULL,
  `autorizado` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_centros
-- ----------------------------
INSERT INTO `tbl_centros` VALUES ('1', 'Formatur', 'SI');
INSERT INTO `tbl_centros` VALUES ('3', 'Escuela Provincial de Comercio', 'SI');
INSERT INTO `tbl_centros` VALUES ('4', 'Federación de Asociaciones Culinarias', 'SI');
INSERT INTO `tbl_centros` VALUES ('5', 'Otros', 'NO');

-- ----------------------------
-- Table structure for `tbl_certificaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_certificaciones`;
CREATE TABLE `tbl_certificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `certificacion` varchar(255) NOT NULL,
  `emitido_por` varchar(255) NOT NULL,
  `ano` varchar(255) NOT NULL,
  `escala_certificacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `escala_certificacion_id` (`escala_certificacion_id`),
  CONSTRAINT `tbl_certificaciones_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_certificaciones_ibfk_2` FOREIGN KEY (`escala_certificacion_id`) REFERENCES `tbl_escalas_certificaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_certificaciones
-- ----------------------------
INSERT INTO `tbl_certificaciones` VALUES ('1', '21', 'Pedagógica Basica', 'Universidad de Holguin', '2013', '2');
INSERT INTO `tbl_certificaciones` VALUES ('2', '21', 'Curso Superación Politico Ideologica', 'Escuela del PCC Holguin', '2013', '1');
INSERT INTO `tbl_certificaciones` VALUES ('3', '21', 'Evento Provincial de Asesoría Juridica', 'Junta Provincial de Holguin de la union de juristas y las direcciones provinciales de justicia y bufetes colectivos', '2013', '2');
INSERT INTO `tbl_certificaciones` VALUES ('4', '85', 'Notas Licenciado en Psicologia', 'Unicersidad de Camaguey', '2011', '1');
INSERT INTO `tbl_certificaciones` VALUES ('5', '85', 'Resolucion 569/11 (Titulo de Oro en Lic Psicologia)', 'Universidad de camaguey', '2011', '1');
INSERT INTO `tbl_certificaciones` VALUES ('6', '85', 'Graduado mas destacado (Lic ^Psicologia)', 'Universidad de Camaguey', '2011', '1');
INSERT INTO `tbl_certificaciones` VALUES ('7', '85', 'Resumen expediente laboral', 'Policlinico Julio A Mella', '2018', '1');
INSERT INTO `tbl_certificaciones` VALUES ('8', '85', 'Mision Internacionalista Cumplida', 'Mision Medica Cubana en Venezuela', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('9', '85', 'Evaluacion de colaboradores (Excelente)', 'Mision Medica Cubana en Venezuela', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('10', '85', 'Reconocimento a adminisytradores (Caracas Venezuela)', 'Alcaladia de caracas', '2015', '1');
INSERT INTO `tbl_certificaciones` VALUES ('11', '85', 'Diploma CSPI colaboradores internacionales', 'Comite Municipal PCC Camaguey', '2013', '1');
INSERT INTO `tbl_certificaciones` VALUES ('12', '85', 'Certificado Dirigente Destacado', 'Empresa Municipal de Gastronomai y Recreacion de Camaguey', '2002', '1');
INSERT INTO `tbl_certificaciones` VALUES ('14', '114', 'CERTIFICADO PARTICIPACION ACADEMIA AVANA CLUB', 'HAVANA CLUB', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('15', '29', 'INOCUIDAD ALIMENTARIA', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('16', '29', 'GARDE MANGER', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('17', '29', 'NUTRICION Y DIETETICA', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('18', '29', 'ECONOMIA EN LA COCINA', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('19', '29', 'MARKETING DE LOS SERVICIOS', 'CULINARIA', '2015', '1');
INSERT INTO `tbl_certificaciones` VALUES ('20', '29', 'CALIDAD DE LOS SERVICIOS ALIMENTOS Y BEBIDAS', 'CULINARIA', '2015', '1');
INSERT INTO `tbl_certificaciones` VALUES ('21', '29', 'CULTURA Y NACIONALIDAD CUBANA', 'CULINARIA', '2015', '1');
INSERT INTO `tbl_certificaciones` VALUES ('22', '29', 'TEORIA Y TECNICAS DE DIRECCION', 'CULINARIA', '2015', '1');
INSERT INTO `tbl_certificaciones` VALUES ('24', '29', 'COCINA INTERNACIONAL', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('25', '29', 'EVALUACION SENSORIAL', 'CULINARIA', '2016', '1');
INSERT INTO `tbl_certificaciones` VALUES ('26', '90', 'NC ISO 9001 SGC', 'CIMEX', '2015', '2');
INSERT INTO `tbl_certificaciones` VALUES ('27', '90', 'CONTROL INTERNO PARA CUADROS Y DIRIGENTES', 'CIMEX', '2005', '1');
INSERT INTO `tbl_certificaciones` VALUES ('28', '101', 'CURRICULUM VITAE', 'CURRICULUM VITAE', '1996-ACT', '2');
INSERT INTO `tbl_certificaciones` VALUES ('29', '80', 'DIPLOMA 1ER LUGAR DE COCINA TECNICAS GASTRONOMICAS', 'EMPRESA MUNICIPLA DE GASTRONOMIA', '2009', '1');
INSERT INTO `tbl_certificaciones` VALUES ('30', '80', 'MEJOR TRABAJADOR MES NOBIEMBRE 2007', 'RESTAURANTE PARRILLADA', '2007', '2');
INSERT INTO `tbl_certificaciones` VALUES ('31', '80', 'DIPLOMA RELEVANTE EN COCINA (PLATO POLLO BORRACHO)', 'EMPRESA MUNICIPLA DE GASTRONOMIA', '2009', '1');
INSERT INTO `tbl_certificaciones` VALUES ('32', '80', 'DIPLOMA 3ER LUGAR DE COCINA ', 'UEB RESTAURANTES Y CENTROS DE RECREACION', '2000', '2');

-- ----------------------------
-- Table structure for `tbl_clasificador`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clasificador`;
CREATE TABLE `tbl_clasificador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) NOT NULL,
  `clasificacion` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_clasificador
-- ----------------------------
INSERT INTO `tbl_clasificador` VALUES ('1', 'Doctor', 'Grado científico', '0.3');
INSERT INTO `tbl_clasificador` VALUES ('2', 'Master', 'Grado científico', '0.2');
INSERT INTO `tbl_clasificador` VALUES ('3', 'Especialista', 'Grado científico', '0.2');
INSERT INTO `tbl_clasificador` VALUES ('4', 'Instructor', 'Categoría académica', '0.1');
INSERT INTO `tbl_clasificador` VALUES ('5', 'Asistente', 'Categoría académica', '0.2');
INSERT INTO `tbl_clasificador` VALUES ('6', 'P. Auxiliar', 'Categoría académica', '0.3');
INSERT INTO `tbl_clasificador` VALUES ('7', 'P. Titular', 'Categoría académica', '0.4');
INSERT INTO `tbl_clasificador` VALUES ('8', 'Obrero calificado', 'Nivel escolar', '0.1');
INSERT INTO `tbl_clasificador` VALUES ('9', 'Técnico Medio', 'Nivel escolar', '0.2');
INSERT INTO `tbl_clasificador` VALUES ('10', 'Preuniversitario', 'Nivel escolar', '0.3');
INSERT INTO `tbl_clasificador` VALUES ('11', 'Universitario', 'Nivel escolar', '0.4');

-- ----------------------------
-- Table structure for `tbl_config`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_config`;
CREATE TABLE `tbl_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CurrentYear` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_config
-- ----------------------------
INSERT INTO `tbl_config` VALUES ('1', '2017');

-- ----------------------------
-- Table structure for `tbl_correos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_correos`;
CREATE TABLE `tbl_correos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion_mail` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_correos
-- ----------------------------
INSERT INTO `tbl_correos` VALUES ('2', 'hvfabelo@tcsm.co.cu', 'Helen Viñas Fabelo', 'Responsable de Seguridad Informática', 'Dirección de Informática', '1');

-- ----------------------------
-- Table structure for `tbl_dependencias`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dependencias`;
CREATE TABLE `tbl_dependencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dependencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_dependencias
-- ----------------------------
INSERT INTO `tbl_dependencias` VALUES ('1', 'EMPRESA');
INSERT INTO `tbl_dependencias` VALUES ('2', 'CINCO ESQUINAS');
INSERT INTO `tbl_dependencias` VALUES ('3', 'ANDARIEGOS');
INSERT INTO `tbl_dependencias` VALUES ('4', 'BAR CASABLANCA');
INSERT INTO `tbl_dependencias` VALUES ('7', 'CAFÉ CIUDAD');
INSERT INTO `tbl_dependencias` VALUES ('8', 'CASA DEL CHOCOLATE LA OPERA');
INSERT INTO `tbl_dependencias` VALUES ('9', 'FOTO PRINCIPE');
INSERT INTO `tbl_dependencias` VALUES ('10', 'HOTEL AMERICA');
INSERT INTO `tbl_dependencias` VALUES ('11', 'ISABELA');
INSERT INTO `tbl_dependencias` VALUES ('12', 'LA ESTACION');
INSERT INTO `tbl_dependencias` VALUES ('13', 'LA ESTRELLA');
INSERT INTO `tbl_dependencias` VALUES ('14', 'LAS CARPAS');
INSERT INTO `tbl_dependencias` VALUES ('15', 'LEYENDA');
INSERT INTO `tbl_dependencias` VALUES ('16', 'LOS PUNTOS');
INSERT INTO `tbl_dependencias` VALUES ('17', 'MERCADO ORIENTE');
INSERT INTO `tbl_dependencias` VALUES ('18', 'OVEJITO');
INSERT INTO `tbl_dependencias` VALUES ('21', 'RINCON DE LA MUSICA');
INSERT INTO `tbl_dependencias` VALUES ('22', 'BODEGON');
INSERT INTO `tbl_dependencias` VALUES ('23', 'TIENDA ROSARIO');
INSERT INTO `tbl_dependencias` VALUES ('24', 'UEB DE LOGISTICA');
INSERT INTO `tbl_dependencias` VALUES ('25', 'UEB DE MTTO Y REPARACION');
INSERT INTO `tbl_dependencias` VALUES ('26', 'UEB DE SERVICIO');
INSERT INTO `tbl_dependencias` VALUES ('33', 'Paseo Tecnológico');
INSERT INTO `tbl_dependencias` VALUES ('34', 'La Bigornia');

-- ----------------------------
-- Table structure for `tbl_desglose_aplicacion`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_desglose_aplicacion`;
CREATE TABLE `tbl_desglose_aplicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aplicacion_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `respuesta` varchar(50) DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aplicacion_id` (`aplicacion_id`),
  KEY `id` (`id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `tbl_desglose_aplicacion_ibfk_1` FOREIGN KEY (`aplicacion_id`) REFERENCES `tbl_aplicaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_desglose_aplicacion
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_desglose_criterios`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_desglose_criterios`;
CREATE TABLE `tbl_desglose_criterios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puntaje_id` int(11) NOT NULL,
  `criterio` longtext NOT NULL,
  `autor` varchar(255) NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `puntaje_id` (`puntaje_id`),
  CONSTRAINT `tbl_desglose_criterios_ibfk_1` FOREIGN KEY (`puntaje_id`) REFERENCES `tbl_puntajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_desglose_criterios
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_escalas_capacitaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_escalas_capacitaciones`;
CREATE TABLE `tbl_escalas_capacitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_capacitacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_escalas_capacitaciones
-- ----------------------------
INSERT INTO `tbl_escalas_capacitaciones` VALUES ('6', 'A1');
INSERT INTO `tbl_escalas_capacitaciones` VALUES ('7', 'A2');
INSERT INTO `tbl_escalas_capacitaciones` VALUES ('8', 'A3');

-- ----------------------------
-- Table structure for `tbl_escalas_certificaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_escalas_certificaciones`;
CREATE TABLE `tbl_escalas_certificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_certificacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_escalas_certificaciones
-- ----------------------------
INSERT INTO `tbl_escalas_certificaciones` VALUES ('1', 'C1');
INSERT INTO `tbl_escalas_certificaciones` VALUES ('2', 'C2');
INSERT INTO `tbl_escalas_certificaciones` VALUES ('3', 'C3');

-- ----------------------------
-- Table structure for `tbl_escalas_ocupaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_escalas_ocupaciones`;
CREATE TABLE `tbl_escalas_ocupaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escala_ocupacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_escalas_ocupaciones
-- ----------------------------
INSERT INTO `tbl_escalas_ocupaciones` VALUES ('1', 'O1');
INSERT INTO `tbl_escalas_ocupaciones` VALUES ('2', 'O2');
INSERT INTO `tbl_escalas_ocupaciones` VALUES ('4', 'O3');

-- ----------------------------
-- Table structure for `tbl_especies`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_especies`;
CREATE TABLE `tbl_especies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especie` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_especies
-- ----------------------------
INSERT INTO `tbl_especies` VALUES ('1', 'Campero');
INSERT INTO `tbl_especies` VALUES ('2', 'Leghorn');
INSERT INTO `tbl_especies` VALUES ('3', 'Turquino');

-- ----------------------------
-- Table structure for `tbl_establecimientos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_establecimientos`;
CREATE TABLE `tbl_establecimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `establecimiento` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio_id` int(11) NOT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `nombre_corto` varchar(255) DEFAULT NULL,
  `inicio_calcio` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `municipio_id` (`municipio_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `tbl_establecimientos_ibfk_1` FOREIGN KEY (`municipio_id`) REFERENCES `tbl_municipios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_establecimientos_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tbl_categorias_establecimientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_establecimientos
-- ----------------------------
INSERT INTO `tbl_establecimientos` VALUES ('1', 'UEB-Comercializadora', 'Carretera Circunvalación Norte. (Centro Acopio Huevos, Matadero de Aves)', '8', '3', 'Comercializadora', '0');
INSERT INTO `tbl_establecimientos` VALUES ('2', 'UEB de  Aseguramiento', 'Carretera de Santa Cruz del Sur km 2½. (Talleres y Base de transporte y la Brigada de Habilitación Sanitaria). ', '8', '4', 'Aseguramiento', '0');
INSERT INTO `tbl_establecimientos` VALUES ('3', 'Brigada de mantenimiento y construcción', 'Carretera Santa Cruz del Sur, Reparto La Yaba. ( Pertenece a la UEB de Aseguramiento)', '8', '8', 'Mantenimiento', '0');
INSERT INTO `tbl_establecimientos` VALUES ('4', 'Planta de Incubación # 503', 'Omar Gutiérrez: Camino de la Matanza Km. 5. ', '8', '8', 'Incubación # 503', '0');
INSERT INTO `tbl_establecimientos` VALUES ('5', 'Unidad # 14. Fabricio Ojeda. Inicio', 'Callejón del Ganado, Rpto La Mosca.', '8', '5', 'UEB 14', '20');
INSERT INTO `tbl_establecimientos` VALUES ('6', 'Unidad # 16. América Latina. Ponedoras', 'Carretera de Nuevitas, Km 15. ', '8', '9', 'UEB 16', '25454');
INSERT INTO `tbl_establecimientos` VALUES ('7', 'Unidad # 18. Fe del Valle Ponedora.', 'Camino Vista del Príncipe. Rpto. La Yaba. ', '8', '9', 'UEB 18', '0');
INSERT INTO `tbl_establecimientos` VALUES ('8', 'Unida # 19 Chile Libre. Ponedora.', 'Camino de la Matanza Km. 2½. ', '8', '9', 'UEB 19', '0');
INSERT INTO `tbl_establecimientos` VALUES ('9', 'Unidad #  23. El Uvero. Agropecuaria.', 'Camino de las Clavellinas a 3 Km ', '8', '5', 'UEB 23', '0');
INSERT INTO `tbl_establecimientos` VALUES ('10', 'Unidad # 24.Jose Hidalgo. Agropecuaria.', 'Poblado Las Clavellinas.', '8', '5', 'UEB 24', '0');
INSERT INTO `tbl_establecimientos` VALUES ('11', 'Unidad #. 31. Angola Libre. Reproductor Ligero.', 'Camino de la Matanza Km. 4.  ', '8', '1', 'UEB 31', '0');
INSERT INTO `tbl_establecimientos` VALUES ('12', 'Unidad # 33 Antonio Maceo. Inicio de remplazo de ponedoras.', 'Camino de Lezca Km. 8 1/2. ', '8', '7', 'UEB 33', '0');
INSERT INTO `tbl_establecimientos` VALUES ('13', 'Unidad # 36.  Etiopia Libre. Reproductor Ligero.', 'Camino de Lezca Km 8 ½. ', '8', '1', 'UEB 36', '0');
INSERT INTO `tbl_establecimientos` VALUES ('14', 'Unidad # 39. Victoria de Girón. Inicio de Reemplazo de Ponedoras.', 'Camino de Acueducto Km 8 ½', '8', '7', 'UEB 39', '0');
INSERT INTO `tbl_establecimientos` VALUES ('15', 'Unidad Planta de Incubación # 502.Jesus Menéndez.', 'Carretera Central Km 539', '9', '9', 'Incubación # 502', '0');
INSERT INTO `tbl_establecimientos` VALUES ('16', 'Unida # 29. Caonao.', 'Carretera Central Km. 539', '9', '5', 'UEB 29', '0');
INSERT INTO `tbl_establecimientos` VALUES ('17', 'Unidad # 26. José Antonio Echevarría. Ponedoras.', 'Carretera de Nuevitas en el Km 17. ', '4', '9', 'UEB 26', '0');
INSERT INTO `tbl_establecimientos` VALUES ('18', 'Unidad # 27. Mario Arostegui  Recio. Agropecuaria.', 'Carretera de Nuevitas el Km. 26. ', '4', '5', 'UEB 27', '0');
INSERT INTO `tbl_establecimientos` VALUES ('19', 'Unidad # 22. Rafael Guerras Vives. Ponedoras.', 'Camino entre Ríos de Ciego Valero. ', '4', '9', 'UEB 22', '0');
INSERT INTO `tbl_establecimientos` VALUES ('20', 'Unidades # 25. Antonio Suarez. Ponedora.', 'Camino entre Ríos de Ciego Valero.', '4', '9', 'UEB 25', '0');
INSERT INTO `tbl_establecimientos` VALUES ('21', 'Sub-Centro de Acopio de huevos de Minas.', 'Camino entre Ríos de Ciego Valero. ', '4', '3', 'Acopio Minas', '0');
INSERT INTO `tbl_establecimientos` VALUES ('22', 'Unidad # 28. Leopoldito Martínez. Reemplazo de ponedoras.', 'Carretera de Senado. Poblado de Cayo del Medio.', '4', '6', 'UEB 28', '0');
INSERT INTO `tbl_establecimientos` VALUES ('24', 'Matadero de aves', 'Carretera Circunvalación Norte. (Centro Acopio Huevos, Matadero de Aves)', '3', '3', 'Matadero', '0');
INSERT INTO `tbl_establecimientos` VALUES ('25', 'Mercado agropecuaio', 'Rpto. Julio A. Mella', '3', '3', 'Mercado', '0');
INSERT INTO `tbl_establecimientos` VALUES ('27', 'UEB-37', '', '8', '5', 'UEB-37', '0');

-- ----------------------------
-- Table structure for `tbl_formas`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_formas`;
CREATE TABLE `tbl_formas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forma` varchar(50) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_formas
-- ----------------------------
INSERT INTO `tbl_formas` VALUES ('1', 'Doctorado', '0.1');
INSERT INTO `tbl_formas` VALUES ('2', 'Maestría', '0.07');
INSERT INTO `tbl_formas` VALUES ('3', 'Especialidad', '0.07');
INSERT INTO `tbl_formas` VALUES ('4', 'Diplomado', '0.05');
INSERT INTO `tbl_formas` VALUES ('5', 'Curso', '0.03');
INSERT INTO `tbl_formas` VALUES ('6', 'Entrenamiento', '0.01');
INSERT INTO `tbl_formas` VALUES ('7', 'Taller', '0.01');
INSERT INTO `tbl_formas` VALUES ('8', 'Seminario', '0.01');
INSERT INTO `tbl_formas` VALUES ('9', 'Conferencia especializada', '0.01');
INSERT INTO `tbl_formas` VALUES ('10', 'Debate Científico', '0.01');
INSERT INTO `tbl_formas` VALUES ('11', 'Autopreparación', '0.01');
INSERT INTO `tbl_formas` VALUES ('12', 'Habilitación', '0.02');
INSERT INTO `tbl_formas` VALUES ('13', 'Título', '0.03');
INSERT INTO `tbl_formas` VALUES ('14', 'Certificado', '0.02');
INSERT INTO `tbl_formas` VALUES ('15', 'RESOLUCION', '0.02');

-- ----------------------------
-- Table structure for `tbl_fotos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fotos`;
CREATE TABLE `tbl_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) NOT NULL,
  `aspirante_id` int(11) NOT NULL,
  `foto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  CONSTRAINT `tbl_fotos_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_fotos
-- ----------------------------
INSERT INTO `tbl_fotos` VALUES ('29', '60020708424.jpg', '17', '0');
INSERT INTO `tbl_fotos` VALUES ('30', '60080708424.jpg', '18', '0');
INSERT INTO `tbl_fotos` VALUES ('31', '61041404480.jpg', '19', '0');
INSERT INTO `tbl_fotos` VALUES ('32', '63110705129.jpg', '20', '0');
INSERT INTO `tbl_fotos` VALUES ('33', '64092214097.jpg', '21', '0');
INSERT INTO `tbl_fotos` VALUES ('34', '64101410902.jpg', '22', '0');
INSERT INTO `tbl_fotos` VALUES ('35', '64113009597.jpg', '23', '0');
INSERT INTO `tbl_fotos` VALUES ('36', '65090917054.jpg', '24', '0');
INSERT INTO `tbl_fotos` VALUES ('37', '66092310118.jpg', '25', '0');
INSERT INTO `tbl_fotos` VALUES ('38', '66092830037.jpg', '26', '0');
INSERT INTO `tbl_fotos` VALUES ('39', '67013118766.jpg', '27', '0');
INSERT INTO `tbl_fotos` VALUES ('41', '67082009162.jpg', '28', '0');
INSERT INTO `tbl_fotos` VALUES ('43', '68050404408.jpg', '30', '0');
INSERT INTO `tbl_fotos` VALUES ('44', '68081716139.jpg', '31', '0');
INSERT INTO `tbl_fotos` VALUES ('45', '69031207846.jpg', '32', '0');
INSERT INTO `tbl_fotos` VALUES ('46', '70070608581.jpg', '33', '0');
INSERT INTO `tbl_fotos` VALUES ('47', '71010807328.jpg', '34', '0');
INSERT INTO `tbl_fotos` VALUES ('48', '71051307612.jpg', '35', '0');
INSERT INTO `tbl_fotos` VALUES ('49', '71051627787.jpg', '36', '0');
INSERT INTO `tbl_fotos` VALUES ('50', '71071528369.jpg', '37', '0');
INSERT INTO `tbl_fotos` VALUES ('51', '71092128899.jpg', '38', '0');
INSERT INTO `tbl_fotos` VALUES ('52', '71112615655.jpg', '39', '0');
INSERT INTO `tbl_fotos` VALUES ('53', '72033103938.jpg', '40', '0');
INSERT INTO `tbl_fotos` VALUES ('54', '72112807861.jpg', '41', '0');
INSERT INTO `tbl_fotos` VALUES ('55', '73010117187.jpg', '42', '0');
INSERT INTO `tbl_fotos` VALUES ('56', '73011306284.jpg', '43', '0');
INSERT INTO `tbl_fotos` VALUES ('57', '73080714048.jpg', '44', '0');
INSERT INTO `tbl_fotos` VALUES ('58', '74052132944.jpg', '45', '0');
INSERT INTO `tbl_fotos` VALUES ('59', '74071009124.jpg', '46', '0');
INSERT INTO `tbl_fotos` VALUES ('60', '75031016205.jpg', '47', '0');
INSERT INTO `tbl_fotos` VALUES ('62', '75072110521.jpg', '48', '0');
INSERT INTO `tbl_fotos` VALUES ('63', '75072210525.jpg', '49', '0');
INSERT INTO `tbl_fotos` VALUES ('64', '75110611017.jpg', '50', '0');
INSERT INTO `tbl_fotos` VALUES ('65', '76061410640.jpg', '51', '0');
INSERT INTO `tbl_fotos` VALUES ('66', '76121110497.jpg', '52', '0');
INSERT INTO `tbl_fotos` VALUES ('67', '77032316127.jpg', '53', '0');
INSERT INTO `tbl_fotos` VALUES ('68', '77041617441.jpg', '54', '0');
INSERT INTO `tbl_fotos` VALUES ('69', '77062716022.jpg', '55', '0');
INSERT INTO `tbl_fotos` VALUES ('70', '77111415909.jpg', '56', '0');
INSERT INTO `tbl_fotos` VALUES ('71', '77120517433.jpg', '57', '0');
INSERT INTO `tbl_fotos` VALUES ('72', '77120616839.jpg', '58', '0');
INSERT INTO `tbl_fotos` VALUES ('73', '78011720881.jpg', '59', '0');
INSERT INTO `tbl_fotos` VALUES ('74', '78062520852.jpg', '60', '0');
INSERT INTO `tbl_fotos` VALUES ('75', '78122620867.jpg', '61', '0');
INSERT INTO `tbl_fotos` VALUES ('76', '79021821442.jpg', '62', '0');
INSERT INTO `tbl_fotos` VALUES ('77', '79051415158.jpg', '63', '0');
INSERT INTO `tbl_fotos` VALUES ('78', '79102524414.jpg', '64', '0');
INSERT INTO `tbl_fotos` VALUES ('79', '80100915268.jpg', '65', '0');
INSERT INTO `tbl_fotos` VALUES ('80', '80120716341.jpg', '66', '0');
INSERT INTO `tbl_fotos` VALUES ('81', '81020722853.jpg', '67', '0');
INSERT INTO `tbl_fotos` VALUES ('82', '81052515305.jpg', '68', '0');
INSERT INTO `tbl_fotos` VALUES ('83', '81111028780.jpg', '69', '0');
INSERT INTO `tbl_fotos` VALUES ('84', '82102400403.jpg', '70', '0');
INSERT INTO `tbl_fotos` VALUES ('85', '82102820386.jpg', '71', '0');
INSERT INTO `tbl_fotos` VALUES ('86', '82110622629.jpg', '72', '0');
INSERT INTO `tbl_fotos` VALUES ('87', '83012516199.jpg', '73', '0');
INSERT INTO `tbl_fotos` VALUES ('88', '83040515787.jpg', '74', '0');
INSERT INTO `tbl_fotos` VALUES ('89', '83080815834.jpg', '75', '0');
INSERT INTO `tbl_fotos` VALUES ('90', '83100615904.jpg', '76', '0');
INSERT INTO `tbl_fotos` VALUES ('91', '83110918011.jpg', '77', '0');
INSERT INTO `tbl_fotos` VALUES ('92', '83112515908.jpg', '78', '0');
INSERT INTO `tbl_fotos` VALUES ('93', '84042018015.jpg', '79', '0');
INSERT INTO `tbl_fotos` VALUES ('94', '84072717055.jpg', '80', '0');
INSERT INTO `tbl_fotos` VALUES ('95', '84082217308.jpg', '81', '0');
INSERT INTO `tbl_fotos` VALUES ('96', '84112717313.jpg', '82', '0');
INSERT INTO `tbl_fotos` VALUES ('97', '84120118507.jpg', '83', '0');
INSERT INTO `tbl_fotos` VALUES ('100', '85031318037.jpg', '85', '0');
INSERT INTO `tbl_fotos` VALUES ('101', '85042318058.jpg', '86', '0');
INSERT INTO `tbl_fotos` VALUES ('102', '85072418414.jpg', '87', '0');
INSERT INTO `tbl_fotos` VALUES ('103', '85080518016.jpg', '88', '0');
INSERT INTO `tbl_fotos` VALUES ('104', '85080620504.jpg', '89', '0');
INSERT INTO `tbl_fotos` VALUES ('105', '85082817301.jpg', '90', '0');
INSERT INTO `tbl_fotos` VALUES ('106', '85101118034.jpg', '91', '0');
INSERT INTO `tbl_fotos` VALUES ('107', '85120318148.jpg', '92', '0');
INSERT INTO `tbl_fotos` VALUES ('108', '85121418030.jpg', '93', '0');
INSERT INTO `tbl_fotos` VALUES ('109', '86010218027.jpg', '94', '0');
INSERT INTO `tbl_fotos` VALUES ('110', '86031118410.jpg', '95', '0');
INSERT INTO `tbl_fotos` VALUES ('111', '86032518095.jpg', '96', '0');
INSERT INTO `tbl_fotos` VALUES ('112', '86040500218.jpg', '97', '0');
INSERT INTO `tbl_fotos` VALUES ('113', '86082018100.jpg', '98', '0');
INSERT INTO `tbl_fotos` VALUES ('114', '86082618146.jpg', '99', '0');
INSERT INTO `tbl_fotos` VALUES ('115', '86110118040.jpg', '100', '0');
INSERT INTO `tbl_fotos` VALUES ('116', '87010821861.jpg', '101', '0');
INSERT INTO `tbl_fotos` VALUES ('117', '87011523482.jpg', '102', '0');
INSERT INTO `tbl_fotos` VALUES ('126', '87021822105.jpg', '103', '0');
INSERT INTO `tbl_fotos` VALUES ('127', '87082823520.jpg', '104', '0');
INSERT INTO `tbl_fotos` VALUES ('128', '87092423631.jpg', '105', '0');
INSERT INTO `tbl_fotos` VALUES ('130', '87102125626.jpg', '106', '0');
INSERT INTO `tbl_fotos` VALUES ('131', '87110123141.jpg', '107', '0');
INSERT INTO `tbl_fotos` VALUES ('133', '88010645620.jpg', '108', '0');
INSERT INTO `tbl_fotos` VALUES ('134', '88022322505.jpg', '29', '0');
INSERT INTO `tbl_fotos` VALUES ('136', '88051423532.jpg', '109', '0');
INSERT INTO `tbl_fotos` VALUES ('138', '88051445322.jpg', '110', '0');
INSERT INTO `tbl_fotos` VALUES ('139', '88061522273.jpg', '111', '0');
INSERT INTO `tbl_fotos` VALUES ('140', '88092830037.jpg', '112', '0');
INSERT INTO `tbl_fotos` VALUES ('141', '88121722313.jpg', '113', '0');
INSERT INTO `tbl_fotos` VALUES ('143', '89010134270.jpg', '114', '0');
INSERT INTO `tbl_fotos` VALUES ('144', '89021934308.jpg', '115', '0');
INSERT INTO `tbl_fotos` VALUES ('145', '89031533552.jpg', '116', '0');
INSERT INTO `tbl_fotos` VALUES ('162', '89042234577.jpg', '117', '0');
INSERT INTO `tbl_fotos` VALUES ('163', '89050235278.jpg', '118', '0');
INSERT INTO `tbl_fotos` VALUES ('164', '89060634238.jpg', '119', '0');
INSERT INTO `tbl_fotos` VALUES ('170', '89071234203.jpg', '121', '0');
INSERT INTO `tbl_fotos` VALUES ('171', '89081334225.jpg', '120', '0');
INSERT INTO `tbl_fotos` VALUES ('229', '89092035698.jpg', '84', '0');

-- ----------------------------
-- Table structure for `tbl_fuentes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fuentes`;
CREATE TABLE `tbl_fuentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuente` varchar(255) NOT NULL,
  `categoria_fuente` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_fuentes
-- ----------------------------
INSERT INTO `tbl_fuentes` VALUES ('1', 'Disponibles', 'Interna');
INSERT INTO `tbl_fuentes` VALUES ('2', 'Interruptos', 'Interna');
INSERT INTO `tbl_fuentes` VALUES ('3', 'Incapacitados pendientes de ubicación', 'Interna');
INSERT INTO `tbl_fuentes` VALUES ('4', 'Otras entidades.', 'Externa');
INSERT INTO `tbl_fuentes` VALUES ('5', 'Reserva laboral de las Direcciones de Trabajo.', 'Externa');
INSERT INTO `tbl_fuentes` VALUES ('6', 'Personas sin vínculo laboral, incorporadas al registro de candidatos.', 'Externa');

-- ----------------------------
-- Table structure for `tbl_idiomas`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_idiomas`;
CREATE TABLE `tbl_idiomas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idioma_id` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `aspirante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `idioma_id` (`idioma_id`),
  CONSTRAINT `tbl_idiomas_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_idiomas_ibfk_2` FOREIGN KEY (`idioma_id`) REFERENCES `tbl_idiomas_relevancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_idiomas
-- ----------------------------
INSERT INTO `tbl_idiomas` VALUES ('1', '2', '2', '103');
INSERT INTO `tbl_idiomas` VALUES ('2', '4', '2', '85');
INSERT INTO `tbl_idiomas` VALUES ('4', '2', '3', '39');
INSERT INTO `tbl_idiomas` VALUES ('5', '2', '2', '113');
INSERT INTO `tbl_idiomas` VALUES ('8', '2', '1', '99');
INSERT INTO `tbl_idiomas` VALUES ('9', '2', '1', '60');
INSERT INTO `tbl_idiomas` VALUES ('10', '2', '1', '66');
INSERT INTO `tbl_idiomas` VALUES ('11', '2', '3', '72');
INSERT INTO `tbl_idiomas` VALUES ('12', '2', '1', '56');
INSERT INTO `tbl_idiomas` VALUES ('13', '2', '1', '64');
INSERT INTO `tbl_idiomas` VALUES ('14', '2', '1', '46');
INSERT INTO `tbl_idiomas` VALUES ('15', '2', '3', '80');
INSERT INTO `tbl_idiomas` VALUES ('16', '2', '1', '31');
INSERT INTO `tbl_idiomas` VALUES ('23', '2', '1', '117');
INSERT INTO `tbl_idiomas` VALUES ('25', '2', '1', '89');
INSERT INTO `tbl_idiomas` VALUES ('26', '2', '1', '95');
INSERT INTO `tbl_idiomas` VALUES ('30', '2', '1', '109');
INSERT INTO `tbl_idiomas` VALUES ('84', '2', '3', '45');

-- ----------------------------
-- Table structure for `tbl_idiomas_relevancia`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_idiomas_relevancia`;
CREATE TABLE `tbl_idiomas_relevancia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_idiomas_relevancia
-- ----------------------------
INSERT INTO `tbl_idiomas_relevancia` VALUES ('2', 'Inglés', '0.5');
INSERT INTO `tbl_idiomas_relevancia` VALUES ('3', 'Francés', '0.3');
INSERT INTO `tbl_idiomas_relevancia` VALUES ('4', 'Ruso', '0.1');
INSERT INTO `tbl_idiomas_relevancia` VALUES ('5', 'ITALIANO', '0.2');

-- ----------------------------
-- Table structure for `tbl_instrumentos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_instrumentos`;
CREATE TABLE `tbl_instrumentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrumento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_instrumentos
-- ----------------------------
INSERT INTO `tbl_instrumentos` VALUES ('1', 'AAAAA');
INSERT INTO `tbl_instrumentos` VALUES ('2', 'SSSSS');

-- ----------------------------
-- Table structure for `tbl_items`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_items`;
CREATE TABLE `tbl_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrumento_id` int(11) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `id` (`id`),
  KEY `instrumento_id` (`instrumento_id`),
  KEY `tipo_id` (`tipo_id`),
  CONSTRAINT `tbl_items_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `tbl_categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_items_ibfk_2` FOREIGN KEY (`instrumento_id`) REFERENCES `tbl_instrumentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_items_ibfk_3` FOREIGN KEY (`tipo_id`) REFERENCES `tbl_tipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_items
-- ----------------------------
INSERT INTO `tbl_items` VALUES ('1', '1', 'BBB', '1', '1');
INSERT INTO `tbl_items` VALUES ('2', '2', 'FFFFFF', '1', '1');
INSERT INTO `tbl_items` VALUES ('3', '1', 'CCCC', '1', '1');

-- ----------------------------
-- Table structure for `tbl_municipios`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_municipios`;
CREATE TABLE `tbl_municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_municipios
-- ----------------------------
INSERT INTO `tbl_municipios` VALUES ('1', 'Carlos M. de Céspedes');
INSERT INTO `tbl_municipios` VALUES ('2', 'Esmeralda');
INSERT INTO `tbl_municipios` VALUES ('3', 'Sierra de Cubitas');
INSERT INTO `tbl_municipios` VALUES ('4', 'Minas');
INSERT INTO `tbl_municipios` VALUES ('5', 'Nuevitas');
INSERT INTO `tbl_municipios` VALUES ('6', 'Guáimaro');
INSERT INTO `tbl_municipios` VALUES ('7', 'Sibanicú');
INSERT INTO `tbl_municipios` VALUES ('8', 'Camagüey');
INSERT INTO `tbl_municipios` VALUES ('9', 'Florida');
INSERT INTO `tbl_municipios` VALUES ('10', 'Vertientes');
INSERT INTO `tbl_municipios` VALUES ('11', 'Jimaguayú');
INSERT INTO `tbl_municipios` VALUES ('12', 'Najasa');
INSERT INTO `tbl_municipios` VALUES ('13', 'Santa Cruz del Sur');

-- ----------------------------
-- Table structure for `tbl_notificaciones_campos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notificaciones_campos`;
CREATE TABLE `tbl_notificaciones_campos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) NOT NULL,
  `campo` varchar(255) NOT NULL,
  `identificativo` varchar(255) NOT NULL,
  `icono` varchar(255) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_notificaciones_campos
-- ----------------------------
INSERT INTO `tbl_notificaciones_campos` VALUES ('1', 'Contratos', 'fecha_vencimiento', 'id', 'users', 'Contratos en vencimiento');

-- ----------------------------
-- Table structure for `tbl_ocupaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ocupaciones`;
CREATE TABLE `tbl_ocupaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `centro_laboral` varchar(255) NOT NULL,
  `ano` varchar(255) NOT NULL,
  `mejor_evaluacion` varchar(255) NOT NULL,
  `escala_ocupacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `escala_ocupacion_id` (`escala_ocupacion_id`),
  CONSTRAINT `tbl_ocupaciones_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ocupaciones_ibfk_2` FOREIGN KEY (`escala_ocupacion_id`) REFERENCES `tbl_escalas_ocupaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_ocupaciones
-- ----------------------------
INSERT INTO `tbl_ocupaciones` VALUES ('5', '22', 'Jefe de Turno', 'SERVI CUPET Libertad', '2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('6', '22', 'Gestor de Ventas', 'Tienda Mónaco', '2016', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('7', '19', 'Informático', 'Centro Provincial de Higiene y Epidemiología', '2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('8', '19', 'Especialista Informático', 'DESOFT', '2014-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('9', '19', 'Administrador de Red', 'MCV Servicios (Mercedes Bens Sucursal Camagüey)', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('10', '21', 'Consultor', 'Consultoria Jurídica', '2013-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('11', '21', 'Asesor Jurídico', 'Contraluria Provincial', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('12', '70', 'Jefe de Almacen', 'Fabrica de calzado \"Jose Oquendo\"', '1959-2003', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('13', '70', 'Auxiliar Manual', 'Fabrica de zapatos \"Jose Oquendo\"', '2003-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('14', '103', 'Dependiente', 'Corporación CARACOL', '1996-1997', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('15', '103', 'Cajera Dependiente', 'CIMEX SA', '1997-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('16', '103', 'Auxiliar', 'Hogar Materno', '1984-1994', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('17', '85', 'Adminstrador', 'Cafeteria El Cordon', '1999', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('18', '85', 'Adminstrador', 'Cafeteria El Dulzor', '2005', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('19', '85', 'Adminstrador', 'Restaurante El Corderito', '2006', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('20', '85', 'Mando Tactico', 'Division de tanques Managua', '1984', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('21', '85', 'Adminstrador', 'Policlinico Julia A Mella', '2013', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('22', '85', 'Adminstrador', 'CDI El Ban (Venezuela) durante 3 años', '2015-2017', 'Excelente', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('24', '39', 'ESP. A EN ARQUITECTURA E HISTORIA', 'OHCC', '206-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('25', '113', 'DEPENDIENTE COMERCIAL', 'EPTC SANTA MARIA', '2005-2011', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('26', '113', 'DEPENDIENTE CAJERO INTEGRAL', 'CIMEX', '2012', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('33', '43', 'TECNICO DE TRANSPORTE  PISTERO', 'SERVICENTRO JAYAMA CIMEX', '2008-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('34', '114', 'DEPENDIENTE', 'RESTAURANTE SANTA TERESA', '2015-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('35', '38', 'CONTADOR INFORMATICO', 'TRD CARIBE', '2009', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('36', '38', 'CONTADOR', 'CIMEX SA', '2014', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('37', '38', 'CONTADOR', 'COMPLEJO ENCANTO', '2013-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('38', '99', 'DEPENDIENTE', 'EL RINCON', '2003-2005', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('39', '99', 'CAJERA DEPENDINETE', 'CUPET CIMEX', '2013-2017', 'Mal', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('40', '60', 'DEPENDIENTE GASTRONOMICO', 'CENTRO DE EVENTOS', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('41', '111', 'DEPENDIENTE', 'JARDINES DE LA TINIMA', '2012-2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('42', '111', 'DEPENDIENTE', 'RESTAURANTE EL CORDERITO', '2014-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('43', '66', 'DEPENDIENTE GASTRONOMICO', 'PALADARES PARTICULARES', '2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('44', '66', 'DEPENDIENTE GASTRONOMICO', 'PALADAR LA GUAJIRA', '2015-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('45', '37', 'CAJERO DEPENDIENTE', 'COMPLEJO CALLE CUBA, KISOCO MARTI', '2007-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('46', '37', 'ESPECIALISTA C GESTION ECONOMICA', 'CCE QUINCALLERA', '2017-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('49', '62', 'CAJERO Y ALMACENERO', 'CC CALLE CUBA', '2012-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('50', '62', 'CAJERO ', 'CC QUINCALLERA', '2015-ACT', 'Regular', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('51', '17', 'CAJERA DEPENDIENTE', 'CARACOL', '2014-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('52', '17', 'CAJERA DEPENDIENTE', 'CIMEX SA', '2011-2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('53', '29', 'LUNCHERO', 'RESTAURANTE EL CARMEN', '2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('54', '29', 'ALMACENERO', 'RESTAURANTE EL CARMEN', '2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('55', '29', 'FUNCIONARIO', 'DMAC', '2009-2010', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('56', '29', 'FUNCIONARIO', 'DPAC', '2010-2011', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('57', '57', 'COCINERO', 'LA ISABELLA', '2008', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('58', '57', 'ADMINSITRADOR/ALMACENERO', 'RESTAURANTE NOCTURONO', '2000-2003', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('62', '72', 'VENDEDOR', 'TRD CARIBE', '2000-2003', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('63', '72', 'CAJERO VENDEDOR', 'TRD CARIBE', '2003-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('64', '115', 'COCINERO', 'JARDINES DE LA TINIMA', '2011', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('65', '115', 'TRABAJADOR SOCIAL', 'AMANCIO, LAS TUNAS', '2008-2010', 'Bien', '4');
INSERT INTO `tbl_ocupaciones` VALUES ('66', '78', 'TECNICO LABORATORIO', 'UC IGNACIO AGRAMONTE', '2010-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('67', '71', 'CAJERO DEPENDIENTE', 'CIMEX SA', '2006', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('68', '71', 'ENSAMBLADOR', 'FUNDICION BOMBA DE AGUA', '1996-2002', 'Bien', '4');
INSERT INTO `tbl_ocupaciones` VALUES ('69', '71', 'CAJERO DEPENDIENTE', 'CUBALSE', '2008-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('70', '24', 'COMPRADOR ECONOMICO', 'EMPRESA DE RESTAURANTES Y CENTROS DE RECREACION', '1998', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('71', '24', 'TECNICO COMPRADOR ECONOMICO', 'EMPRESA DE RESTAURANTES Y CENTROS DE RECREACION', '1999', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('72', '120', 'OPERADOR MAP', 'CUPET PLANTA GLP', '2011', 'Bien', '4');
INSERT INTO `tbl_ocupaciones` VALUES ('73', '120', 'DEPENDIENTE GASTRONOMICO', 'EL CHORRITO', '2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('74', '120', 'DEPENDIENTE ALMACEN', 'TRD PLAZA MERCADO', '2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('75', '98', 'DEPENDINTE', 'CENTRO RECREATIVO ARROYON', '2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('76', '98', 'DEPENDIENTE', 'RESTAURANT 1514', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('77', '56', 'CAJERO DEPENDIENTE', 'artex', '1990-act', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('78', '116', 'JEFE DE PISO', 'SERVICENTRO VIA BLANCA', '2017', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('79', '116', 'ESP. EVENTOS DE CULTURA', 'DIRECCION PROVINCIAL DE CULTURA', '2008', 'Bien', '4');
INSERT INTO `tbl_ocupaciones` VALUES ('80', '42', 'DEPENDIENTE GASTRONOMICO', 'RESTAURANTE EL PATIO', '2017-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('81', '42', 'DEPENDIENTE', 'RESTAUTRANTE CASA AUSTRIA', '2017-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('82', '42', 'FUNCIONARIA', 'DIRECCION PROVINCILA DE TRABAJADORES SOCIALES', '2003-212', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('83', '18', 'JEFE DE NAVE', 'ITH CAMAGUEY', '2001', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('84', '18', 'ENCARGADO DE ALMACEN, JEFE DE BRIGADA, DEPENDIENTE, ELABORADOR DE ALIMENTOS', 'SUCURSAL PALMARES', '2001-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('85', '79', 'CHOFER Y JEFE DE CARRO', 'SEPSA', '2004-ACT', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('86', '81', 'PROFESOR PREPARACION FISICA', 'EMCC', '2013-2017', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('87', '81', 'JEFE DE TURNO', 'CIMEX SERVI CENTRO VICTORIA', '2018-ACT', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('88', '64', 'COCINERO', 'FACRC CAMAGUEY', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('89', '46', 'CAJERO DEPENDIENTE', 'SERVI LIBERTAD', '2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('90', '46', 'JEFE DE TURNO', 'SERVI LIBERTAD', '2016-2017', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('91', '46', 'CAJERO DEPENDIENTE', 'SERVI LIBERTAD', '2017', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('92', '90', 'ADMINSITRADOR', 'CORPORACION CIMEX (SANTA LUCI, ORIENTAL, ENCANTO)', '200-2012', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('93', '90', 'ADMINSITRADOR Y JEFE BRIGADA', 'PALMARES (LA CUBA, EL CAMBIO, EL PARE)', '2012-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('94', '90', 'ALMACENERO ADMISNTRADOR', 'EMPRESA GASTRONOMIA CAMAGUEY (COOPLEIA, UEB CANDIDO GONZALEZ)', '2015-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('95', '83', 'ESPECIALISTA GASTRONOMIA', 'EMMC GASTRONOMIA', '1994-2003', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('96', '83', 'CAJERA DEPENDIENTE', 'PUNTO DE VENTA CUBALSE', '2003-2009', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('97', '83', 'CAJERO DEPENDIENTE', 'TRD CALLE CUBA', '2010-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('98', '101', 'SUBDIRECTOR ASISTENTE', 'CAMPISMO LAS CLAVELLINAS', '20012', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('99', '101', 'ENCARGADO DE ALMACEN', 'COMERCIO Y GASTRONOMIA', '2013-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('100', '101', 'DEPENDIENTE ALMACEN', 'CUBALSE', '1995-2009', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('101', '101', 'JEFE SERVICIO INTERNO', 'EMPRESA PECUARIA', '2009-2010', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('102', '80', 'TECNICO EN MTTO', 'HOTEL AMERICA', '1989-2000', 'Bien', '4');
INSERT INTO `tbl_ocupaciones` VALUES ('103', '80', 'JEFE DE COCINA', 'RTESTAURANTE PARRILLADA', '2006-2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('104', '80', 'INSTALADOR E', 'ASAMBLE PROVINCIAL PCC', '1995-1998', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('105', '31', 'ELABORADOR DE ALIMENTOS', 'LA CUBA', '2013-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('106', '92', 'CONTADORA', 'RESTAURANTE 1514', '2015-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('107', '67', 'ALMACENERO', 'TRD LA QUINCALLERA', '20152018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('108', '67', 'ECONOMICO', 'UNIDAD AGRICOLA 35 ANIVERSARIO', '2018-ACT', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('109', '102', 'DEPENDIENTE INTEGRAL', 'EL TINAJON POLICENTRO', '2013-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('110', '102', 'CAJERO DEPENDIENTE', 'TRD NUEVO SIGLO', '2016-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('117', '34', 'DEPENDIENTE', 'VILLA AZUCARERA', '2017-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('118', '34', 'DEPENDIENTE', 'EL CORDERITO', '2018-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('156', '112', 'CONTROL DE LA CALIDAD', 'PLANTA MECANICA', '1984-1995', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('157', '112', 'COMERCIAL ', 'CASA CASILDO', '2004-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('164', '93', 'ALMACENERO', 'DISTRITO CANDIDO GONZALEZ', '2016-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('165', '117', 'LUNCH, JEFE TURNO, COCINERO', 'HOTEL CAMAGUEY', '2012', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('166', '117', 'LUNCHERO', 'HOTEL ISLA DE CUBA', '2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('171', '63', 'CAJERA PRINCIPAL', 'BASE MUNICIPAL DE TRANSPORTE', '2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('175', '26', 'CONTADOR D', 'BASE SIUM MINSAP', '2005-2006', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('176', '26', 'DEPENDIENTE COMERCIAL Y CAJERO DEPENDIENTE', 'CIMEX', '2006-2013', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('185', '121', 'LUNCHERO, DEPENDIENTE', 'LA RUINA', '2008-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('188', '89', 'JEFE DE TURNO, COCINERO, LUNCHERO', 'DINOS PIZZA-DIMAR, HOTEL CAMAGUEY, CUBANITAS', '2014-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('189', '89', 'MAESTRO PANADERA', 'PANADERIA CALLE CUBA Y REPUBLICA', '2000-2014', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('190', '89', 'JEFE DE SERVICIO', 'VIILA AZUCARERA', '2016-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('197', '95', 'TEC. TRABAJADOR SOCIAL', 'ORGANO DEL TRABAJO', '2004-2014', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('198', '95', 'ESPECIALISA PROYECTO', 'SEPSA', '2015-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('209', '88', 'COCINERO ', 'FEDERACION DE ASOCIACIONES CULINARIAS CAMAGUEY', '2016-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('216', '47', 'DEPENDIENTE GASTRONOMICO', 'EL CHORRITO', '2012-2014', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('217', '47', 'PROFESORA COMPUTACION', 'RAFAEL M. MENDIVE', '2000-2009', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('218', '36', 'CONTADORA', 'CUBALSE', '2006-2009', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('219', '36', 'ESPECIALISTA GESTON ECONOMICA', 'TRD LA QUINCALLERA', '2009-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('220', '44', 'TECNICO GESTION ECONOMICA', 'TRD LA QUINCALLERA', '2009-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('221', '44', 'TECNICO GESTION ECONOMICA', 'CUBALSE', '2001-2009', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('231', '97', 'PROFESOR EDUCACION FISICA', 'SB IGNACIO AGRAMONTE', '2016', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('232', '97', 'ADMINSITRADOR', 'EMPRESA UNIVERSAL', '2016-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('244', '109', 'DEPENDIENTE GASTRONOMICO', 'HOTEL CAMAGUEY', '2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('245', '109', 'DEPENDIENTE GASTRONOMICO', 'RESTAURANTE EL RINCON', '2008-2012', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('246', '109', 'DEPENDIENTE GASTRONOMICO', 'RESTAURANTE 1800', '2013-2017', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('281', '30', 'INFORMATICA', 'DIRECCION PROVINCIAL DE SALUD', '2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('310', '87', 'DEPENDIENTE DE SALON ', 'RANCHO LUNA', '20014-2016', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('419', '107', 'CANTINERO - DEPENDIENTE', 'MINI RESTAURANTE CASINO', '2016-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('420', '107', 'DEPENDINETE DE AREA', 'TIENDA CIMEX', '2017-2018', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('421', '107', 'PORTERO GUARDABOLSO', 'TIENDA EL POTRO CIMEX', '2018-ACT', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('457', '74', 'CAJERO DEPENDIENTE', 'SERVI VIA BLANCA', '2016-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('468', '77', 'ESPECIALISTA B CIENCIAS INFORMATICAS', 'MATERIALES DE LA CONSTRUCCION', '2007-2017', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('469', '77', 'SUBDIRECTOR COMERCIAL', 'ALIMATIC', '2002-2007', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('676', '27', 'ASP', 'CENTRO ALEMAN', '2007-2012', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('677', '27', 'ENCARGADO ALMACEN', 'CENTRO ALEMAN', '2012-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('678', '32', 'ALMACENERO', 'CENTRO ALEMAN', '2005-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('679', '32', 'MECAICO', 'PLANTA MECANICA', '1994-2001', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('714', '49', 'ESPECIALISTA GESTION ECONOMICA', 'COMPAÑIA HOTELES CUBANACAN', '1990-1995', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('715', '49', 'COMPAÑIA TIENDAS UNIVERSO', 'CONTADOR', '1996-2000', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('716', '49', 'ESPECIALISTA GESTION ECONOMICA', 'EMPRESA PRODUCTOS INDUSTRIALES', '2009-2015', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('726', '41', 'DOCENTE PCC-UJC', 'EMI IGNACIO AGRAMONTE', '1989-1996', 'Bien', '2');
INSERT INTO `tbl_ocupaciones` VALUES ('727', '41', 'ASISTENTE DE DIRECCION-ESPECIALISTA SST-CAPACITADORA', 'SEPSA', '1996-ACT', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('744', '45', 'CAJERA DEPENDIENTE - JEFE DE BRIGADA - COMERCIAL - GERENTE', 'TIENDA EL GLOBO - CASILDO - FRIOVENT', '2001-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('745', '105', 'CAJERO DEPENDIENTE', 'CENTRO ALEMAN TRD - PUNTO DE VENTA SERVI CUPET CIMEX', '2011-2018', 'Bien', '1');
INSERT INTO `tbl_ocupaciones` VALUES ('887', '96', 'JEFE DE PRODUCCION-JEFA DE FABRICA', 'EMPRESA CUBANA PAN', '2004-2018', 'Bien', '1');

-- ----------------------------
-- Table structure for `tbl_organizaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_organizaciones`;
CREATE TABLE `tbl_organizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizacion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_organizaciones
-- ----------------------------
INSERT INTO `tbl_organizaciones` VALUES ('1', 'UJC');
INSERT INTO `tbl_organizaciones` VALUES ('2', 'CDR');
INSERT INTO `tbl_organizaciones` VALUES ('3', 'FMC');
INSERT INTO `tbl_organizaciones` VALUES ('4', 'CTC');
INSERT INTO `tbl_organizaciones` VALUES ('5', 'DC');
INSERT INTO `tbl_organizaciones` VALUES ('6', 'UM');
INSERT INTO `tbl_organizaciones` VALUES ('7', 'MTT');
INSERT INTO `tbl_organizaciones` VALUES ('8', 'BPD');
INSERT INTO `tbl_organizaciones` VALUES ('9', 'ACRC');
INSERT INTO `tbl_organizaciones` VALUES ('10', 'PCC');

-- ----------------------------
-- Table structure for `tbl_pertenencias`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pertenencias`;
CREATE TABLE `tbl_pertenencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pertenencia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_pertenencias
-- ----------------------------
INSERT INTO `tbl_pertenencias` VALUES ('1', 'Dirección Informática');
INSERT INTO `tbl_pertenencias` VALUES ('2', 'Dirección Comercial');
INSERT INTO `tbl_pertenencias` VALUES ('3', 'Dirección Sistema de Gestión');

-- ----------------------------
-- Table structure for `tbl_preselecciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_preselecciones`;
CREATE TABLE `tbl_preselecciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_id` int(11) DEFAULT NULL,
  `fecha` varchar(15) DEFAULT NULL,
  `activo` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `tbl_preselecciones_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_preselecciones
-- ----------------------------
INSERT INTO `tbl_preselecciones` VALUES ('1', '1', '2019-01-26', 'NO');
INSERT INTO `tbl_preselecciones` VALUES ('2', '1', '2019-01-26', 'NO');
INSERT INTO `tbl_preselecciones` VALUES ('3', '1', '2021-08-11', 'SI');

-- ----------------------------
-- Table structure for `tbl_prioridades`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_prioridades`;
CREATE TABLE `tbl_prioridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prioridad` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_prioridades
-- ----------------------------
INSERT INTO `tbl_prioridades` VALUES ('1', 'Jóvenes y mujeres sin vínculo laboral.', '0.06');
INSERT INTO `tbl_prioridades` VALUES ('2', 'Personas con discapacidades.', '0.05');
INSERT INTO `tbl_prioridades` VALUES ('3', 'Licenciados del Servicio Militar Activo. ', '0.04');
INSERT INTO `tbl_prioridades` VALUES ('4', 'Egresados de establecimientos penitenciarios', '0.03');
INSERT INTO `tbl_prioridades` VALUES ('5', 'Personas con sanciones penales subsidiarias de la privación de libertad y otras sin internamiento.', '0.02');
INSERT INTO `tbl_prioridades` VALUES ('6', 'Egresados de los diferentes tipos de enseñanzas del Sistema Nacional de Educación.', '0.01');

-- ----------------------------
-- Table structure for `tbl_puntajes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_puntajes`;
CREATE TABLE `tbl_puntajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `preseleccion_id` int(11) NOT NULL,
  `puntaje` double NOT NULL DEFAULT '0',
  `memo_preseleccion` longtext,
  `memo_seleccion` longtext,
  `status` varchar(255) DEFAULT 'SIN SELECCIONAR',
  `memo_admision` longtext,
  `firma_preseleccion` varchar(255) DEFAULT NULL,
  `firma_seleccion` varchar(255) DEFAULT NULL,
  `firma_admision` varchar(255) DEFAULT NULL,
  `fecha_preseleccion` varchar(255) DEFAULT NULL,
  `fecha_seleccion` varchar(255) DEFAULT NULL,
  `fecha_admision` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `preseleccion_id` (`preseleccion_id`),
  CONSTRAINT `tbl_puntajes_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_puntajes_ibfk_2` FOREIGN KEY (`preseleccion_id`) REFERENCES `tbl_preselecciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_puntajes
-- ----------------------------
INSERT INTO `tbl_puntajes` VALUES ('3', '95', '3', '1.326', null, null, 'APROBADO', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tbl_rank`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_rank`;
CREATE TABLE `tbl_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aspirante_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aspirante_id` (`aspirante_id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `tbl_rank_ibfk_1` FOREIGN KEY (`aspirante_id`) REFERENCES `tbl_aspirantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_rank_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `tbl_cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5416 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_rank
-- ----------------------------
INSERT INTO `tbl_rank` VALUES ('573', '17', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('574', '17', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('575', '17', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('576', '17', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('577', '17', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('578', '17', '6', '1.231');
INSERT INTO `tbl_rank` VALUES ('579', '17', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('580', '17', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('581', '17', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('582', '17', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('583', '17', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('584', '17', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('585', '17', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('586', '17', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('587', '17', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('588', '17', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('589', '17', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('590', '17', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('591', '17', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('592', '17', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('593', '17', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('594', '17', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('595', '17', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('596', '17', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('597', '17', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('598', '17', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('599', '17', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('600', '17', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('601', '17', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('602', '17', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('603', '17', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('604', '17', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('605', '17', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('606', '17', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('607', '17', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('608', '17', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('609', '17', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('610', '18', '1', '0.622');
INSERT INTO `tbl_rank` VALUES ('611', '18', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('612', '18', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('613', '18', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('614', '18', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('615', '18', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('616', '18', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('617', '18', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('618', '18', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('619', '18', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('620', '18', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('621', '18', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('622', '18', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('623', '18', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('624', '18', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('625', '18', '16', '0.624');
INSERT INTO `tbl_rank` VALUES ('626', '18', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('627', '18', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('628', '18', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('629', '18', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('630', '18', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('631', '18', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('632', '18', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('633', '18', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('634', '18', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('635', '18', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('636', '18', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('637', '18', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('638', '18', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('639', '18', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('640', '18', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('641', '18', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('642', '18', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('643', '18', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('644', '18', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('645', '18', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('646', '18', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('647', '19', '1', '0.815');
INSERT INTO `tbl_rank` VALUES ('648', '19', '2', '0.815');
INSERT INTO `tbl_rank` VALUES ('649', '19', '3', '0.815');
INSERT INTO `tbl_rank` VALUES ('650', '19', '4', '0.815');
INSERT INTO `tbl_rank` VALUES ('651', '19', '5', '0.815');
INSERT INTO `tbl_rank` VALUES ('652', '19', '6', '1.315');
INSERT INTO `tbl_rank` VALUES ('653', '19', '7', '0.815');
INSERT INTO `tbl_rank` VALUES ('654', '19', '8', '0.815');
INSERT INTO `tbl_rank` VALUES ('655', '19', '9', '0.815');
INSERT INTO `tbl_rank` VALUES ('656', '19', '10', '0.815');
INSERT INTO `tbl_rank` VALUES ('657', '19', '11', '0.815');
INSERT INTO `tbl_rank` VALUES ('658', '19', '12', '0.815');
INSERT INTO `tbl_rank` VALUES ('659', '19', '13', '0.815');
INSERT INTO `tbl_rank` VALUES ('660', '19', '14', '0.815');
INSERT INTO `tbl_rank` VALUES ('661', '19', '15', '0.815');
INSERT INTO `tbl_rank` VALUES ('662', '19', '16', '0.815');
INSERT INTO `tbl_rank` VALUES ('663', '19', '17', '0.815');
INSERT INTO `tbl_rank` VALUES ('664', '19', '18', '0.815');
INSERT INTO `tbl_rank` VALUES ('665', '19', '19', '0.815');
INSERT INTO `tbl_rank` VALUES ('666', '19', '20', '0.815');
INSERT INTO `tbl_rank` VALUES ('667', '19', '21', '0.815');
INSERT INTO `tbl_rank` VALUES ('668', '19', '22', '0.815');
INSERT INTO `tbl_rank` VALUES ('669', '19', '23', '0.815');
INSERT INTO `tbl_rank` VALUES ('670', '19', '24', '0.815');
INSERT INTO `tbl_rank` VALUES ('671', '19', '25', '0.815');
INSERT INTO `tbl_rank` VALUES ('672', '19', '26', '0.815');
INSERT INTO `tbl_rank` VALUES ('673', '19', '27', '0.815');
INSERT INTO `tbl_rank` VALUES ('674', '19', '28', '0.815');
INSERT INTO `tbl_rank` VALUES ('675', '19', '29', '0.815');
INSERT INTO `tbl_rank` VALUES ('676', '19', '30', '0.815');
INSERT INTO `tbl_rank` VALUES ('677', '19', '31', '0.815');
INSERT INTO `tbl_rank` VALUES ('678', '19', '32', '0.815');
INSERT INTO `tbl_rank` VALUES ('679', '19', '33', '0.815');
INSERT INTO `tbl_rank` VALUES ('680', '19', '34', '0.815');
INSERT INTO `tbl_rank` VALUES ('681', '19', '35', '0.815');
INSERT INTO `tbl_rank` VALUES ('682', '19', '36', '0.815');
INSERT INTO `tbl_rank` VALUES ('683', '19', '38', '0.815');
INSERT INTO `tbl_rank` VALUES ('684', '20', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('685', '20', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('686', '20', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('687', '20', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('688', '20', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('689', '20', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('690', '20', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('691', '20', '8', '0.633');
INSERT INTO `tbl_rank` VALUES ('692', '20', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('693', '20', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('694', '20', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('695', '20', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('696', '20', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('697', '20', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('698', '20', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('699', '20', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('700', '20', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('701', '20', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('702', '20', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('703', '20', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('704', '20', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('705', '20', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('706', '20', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('707', '20', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('708', '20', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('709', '20', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('710', '20', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('711', '20', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('712', '20', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('713', '20', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('714', '20', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('715', '20', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('716', '20', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('717', '20', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('718', '20', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('719', '20', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('720', '20', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('721', '21', '1', '0.811');
INSERT INTO `tbl_rank` VALUES ('722', '21', '2', '0.811');
INSERT INTO `tbl_rank` VALUES ('723', '21', '3', '0.811');
INSERT INTO `tbl_rank` VALUES ('724', '21', '4', '0.811');
INSERT INTO `tbl_rank` VALUES ('725', '21', '5', '0.811');
INSERT INTO `tbl_rank` VALUES ('726', '21', '6', '0.811');
INSERT INTO `tbl_rank` VALUES ('727', '21', '7', '0.811');
INSERT INTO `tbl_rank` VALUES ('728', '21', '8', '0.811');
INSERT INTO `tbl_rank` VALUES ('729', '21', '9', '0.811');
INSERT INTO `tbl_rank` VALUES ('730', '21', '10', '0.811');
INSERT INTO `tbl_rank` VALUES ('731', '21', '11', '0.811');
INSERT INTO `tbl_rank` VALUES ('732', '21', '12', '0.811');
INSERT INTO `tbl_rank` VALUES ('733', '21', '13', '0.811');
INSERT INTO `tbl_rank` VALUES ('734', '21', '14', '0.811');
INSERT INTO `tbl_rank` VALUES ('735', '21', '15', '0.811');
INSERT INTO `tbl_rank` VALUES ('736', '21', '16', '0.811');
INSERT INTO `tbl_rank` VALUES ('737', '21', '17', '0.811');
INSERT INTO `tbl_rank` VALUES ('738', '21', '18', '0.811');
INSERT INTO `tbl_rank` VALUES ('739', '21', '19', '0.811');
INSERT INTO `tbl_rank` VALUES ('740', '21', '20', '0.811');
INSERT INTO `tbl_rank` VALUES ('741', '21', '21', '0.811');
INSERT INTO `tbl_rank` VALUES ('742', '21', '22', '0.811');
INSERT INTO `tbl_rank` VALUES ('743', '21', '23', '0.811');
INSERT INTO `tbl_rank` VALUES ('744', '21', '24', '0.811');
INSERT INTO `tbl_rank` VALUES ('745', '21', '25', '0.811');
INSERT INTO `tbl_rank` VALUES ('746', '21', '26', '0.811');
INSERT INTO `tbl_rank` VALUES ('747', '21', '27', '0.811');
INSERT INTO `tbl_rank` VALUES ('748', '21', '28', '0.811');
INSERT INTO `tbl_rank` VALUES ('749', '21', '29', '0.811');
INSERT INTO `tbl_rank` VALUES ('750', '21', '30', '0.811');
INSERT INTO `tbl_rank` VALUES ('751', '21', '31', '0.811');
INSERT INTO `tbl_rank` VALUES ('752', '21', '32', '0.811');
INSERT INTO `tbl_rank` VALUES ('753', '21', '33', '0.811');
INSERT INTO `tbl_rank` VALUES ('754', '21', '34', '0.811');
INSERT INTO `tbl_rank` VALUES ('755', '21', '35', '0.811');
INSERT INTO `tbl_rank` VALUES ('756', '21', '36', '0.811');
INSERT INTO `tbl_rank` VALUES ('757', '21', '38', '0.811');
INSERT INTO `tbl_rank` VALUES ('758', '22', '1', '0.675');
INSERT INTO `tbl_rank` VALUES ('759', '22', '2', '0.675');
INSERT INTO `tbl_rank` VALUES ('760', '22', '3', '0.675');
INSERT INTO `tbl_rank` VALUES ('761', '22', '4', '0.675');
INSERT INTO `tbl_rank` VALUES ('762', '22', '5', '0.675');
INSERT INTO `tbl_rank` VALUES ('763', '22', '6', '1.175');
INSERT INTO `tbl_rank` VALUES ('764', '22', '7', '0.675');
INSERT INTO `tbl_rank` VALUES ('765', '22', '8', '0.675');
INSERT INTO `tbl_rank` VALUES ('766', '22', '9', '0.675');
INSERT INTO `tbl_rank` VALUES ('767', '22', '10', '0.675');
INSERT INTO `tbl_rank` VALUES ('768', '22', '11', '0.675');
INSERT INTO `tbl_rank` VALUES ('769', '22', '12', '0.675');
INSERT INTO `tbl_rank` VALUES ('770', '22', '13', '0.675');
INSERT INTO `tbl_rank` VALUES ('771', '22', '14', '0.675');
INSERT INTO `tbl_rank` VALUES ('772', '22', '15', '0.675');
INSERT INTO `tbl_rank` VALUES ('773', '22', '16', '0.675');
INSERT INTO `tbl_rank` VALUES ('774', '22', '17', '0.675');
INSERT INTO `tbl_rank` VALUES ('775', '22', '18', '0.675');
INSERT INTO `tbl_rank` VALUES ('776', '22', '19', '0.675');
INSERT INTO `tbl_rank` VALUES ('777', '22', '20', '0.675');
INSERT INTO `tbl_rank` VALUES ('778', '22', '21', '0.675');
INSERT INTO `tbl_rank` VALUES ('779', '22', '22', '0.675');
INSERT INTO `tbl_rank` VALUES ('780', '22', '23', '0.675');
INSERT INTO `tbl_rank` VALUES ('781', '22', '24', '0.675');
INSERT INTO `tbl_rank` VALUES ('782', '22', '25', '0.675');
INSERT INTO `tbl_rank` VALUES ('783', '22', '26', '0.675');
INSERT INTO `tbl_rank` VALUES ('784', '22', '27', '0.675');
INSERT INTO `tbl_rank` VALUES ('785', '22', '28', '0.675');
INSERT INTO `tbl_rank` VALUES ('786', '22', '29', '0.675');
INSERT INTO `tbl_rank` VALUES ('787', '22', '30', '0.675');
INSERT INTO `tbl_rank` VALUES ('788', '22', '31', '0.675');
INSERT INTO `tbl_rank` VALUES ('789', '22', '32', '0.675');
INSERT INTO `tbl_rank` VALUES ('790', '22', '33', '0.675');
INSERT INTO `tbl_rank` VALUES ('791', '22', '34', '0.675');
INSERT INTO `tbl_rank` VALUES ('792', '22', '35', '0.675');
INSERT INTO `tbl_rank` VALUES ('793', '22', '36', '0.675');
INSERT INTO `tbl_rank` VALUES ('794', '22', '38', '0.675');
INSERT INTO `tbl_rank` VALUES ('795', '23', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('796', '23', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('797', '23', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('798', '23', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('799', '23', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('800', '23', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('801', '23', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('802', '23', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('803', '23', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('804', '23', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('805', '23', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('806', '23', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('807', '23', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('808', '23', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('809', '23', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('810', '23', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('811', '23', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('812', '23', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('813', '23', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('814', '23', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('815', '23', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('816', '23', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('817', '23', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('818', '23', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('819', '23', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('820', '23', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('821', '23', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('822', '23', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('823', '23', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('824', '23', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('825', '23', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('826', '23', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('827', '23', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('828', '23', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('829', '23', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('830', '23', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('831', '23', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('832', '24', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('833', '24', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('834', '24', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('835', '24', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('836', '24', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('837', '24', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('838', '24', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('839', '24', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('840', '24', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('841', '24', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('842', '24', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('843', '24', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('844', '24', '13', '0.703');
INSERT INTO `tbl_rank` VALUES ('845', '24', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('846', '24', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('847', '24', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('848', '24', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('849', '24', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('850', '24', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('851', '24', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('852', '24', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('853', '24', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('854', '24', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('855', '24', '24', '0.704');
INSERT INTO `tbl_rank` VALUES ('856', '24', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('857', '24', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('858', '24', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('859', '24', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('860', '24', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('861', '24', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('862', '24', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('863', '24', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('864', '24', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('865', '24', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('866', '24', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('867', '24', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('868', '24', '38', '0.703');
INSERT INTO `tbl_rank` VALUES ('869', '25', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('870', '25', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('871', '25', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('872', '25', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('873', '25', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('874', '25', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('875', '25', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('876', '25', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('877', '25', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('878', '25', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('879', '25', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('880', '25', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('881', '25', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('882', '25', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('883', '25', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('884', '25', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('885', '25', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('886', '25', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('887', '25', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('888', '25', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('889', '25', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('890', '25', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('891', '25', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('892', '25', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('893', '25', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('894', '25', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('895', '25', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('896', '25', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('897', '25', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('898', '25', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('899', '25', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('900', '25', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('901', '25', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('902', '25', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('903', '25', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('904', '25', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('905', '25', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('906', '26', '1', '0.43');
INSERT INTO `tbl_rank` VALUES ('907', '26', '2', '0.43');
INSERT INTO `tbl_rank` VALUES ('908', '26', '3', '0.43');
INSERT INTO `tbl_rank` VALUES ('909', '26', '4', '0.43');
INSERT INTO `tbl_rank` VALUES ('910', '26', '5', '0.43');
INSERT INTO `tbl_rank` VALUES ('911', '26', '6', '0.425');
INSERT INTO `tbl_rank` VALUES ('912', '26', '7', '0.43');
INSERT INTO `tbl_rank` VALUES ('913', '26', '8', '0.43');
INSERT INTO `tbl_rank` VALUES ('914', '26', '9', '0.43');
INSERT INTO `tbl_rank` VALUES ('915', '26', '10', '0.43');
INSERT INTO `tbl_rank` VALUES ('916', '26', '11', '0.43');
INSERT INTO `tbl_rank` VALUES ('917', '26', '12', '0.43');
INSERT INTO `tbl_rank` VALUES ('918', '26', '13', '0.43');
INSERT INTO `tbl_rank` VALUES ('919', '26', '14', '0.43');
INSERT INTO `tbl_rank` VALUES ('920', '26', '15', '0.43');
INSERT INTO `tbl_rank` VALUES ('921', '26', '16', '0.43');
INSERT INTO `tbl_rank` VALUES ('922', '26', '17', '0.43');
INSERT INTO `tbl_rank` VALUES ('923', '26', '18', '0.43');
INSERT INTO `tbl_rank` VALUES ('924', '26', '19', '0.43');
INSERT INTO `tbl_rank` VALUES ('925', '26', '20', '0.43');
INSERT INTO `tbl_rank` VALUES ('926', '26', '21', '0.43');
INSERT INTO `tbl_rank` VALUES ('927', '26', '22', '0.43');
INSERT INTO `tbl_rank` VALUES ('928', '26', '23', '0.43');
INSERT INTO `tbl_rank` VALUES ('929', '26', '24', '0.43');
INSERT INTO `tbl_rank` VALUES ('930', '26', '25', '0.43');
INSERT INTO `tbl_rank` VALUES ('931', '26', '26', '0.43');
INSERT INTO `tbl_rank` VALUES ('932', '26', '27', '0.43');
INSERT INTO `tbl_rank` VALUES ('933', '26', '28', '0.43');
INSERT INTO `tbl_rank` VALUES ('934', '26', '29', '0.43');
INSERT INTO `tbl_rank` VALUES ('935', '26', '30', '0.43');
INSERT INTO `tbl_rank` VALUES ('936', '26', '31', '0.43');
INSERT INTO `tbl_rank` VALUES ('937', '26', '32', '0.43');
INSERT INTO `tbl_rank` VALUES ('938', '26', '33', '0.43');
INSERT INTO `tbl_rank` VALUES ('939', '26', '34', '0.43');
INSERT INTO `tbl_rank` VALUES ('940', '26', '35', '0.43');
INSERT INTO `tbl_rank` VALUES ('941', '26', '36', '0.43');
INSERT INTO `tbl_rank` VALUES ('942', '26', '38', '0.43');
INSERT INTO `tbl_rank` VALUES ('943', '17', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('944', '18', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('945', '19', '39', '0.815');
INSERT INTO `tbl_rank` VALUES ('946', '20', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('947', '21', '39', '0.811');
INSERT INTO `tbl_rank` VALUES ('948', '22', '39', '0.675');
INSERT INTO `tbl_rank` VALUES ('949', '23', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('950', '24', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('951', '25', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('952', '26', '39', '0.43');
INSERT INTO `tbl_rank` VALUES ('953', '27', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('954', '27', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('955', '27', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('956', '27', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('957', '27', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('958', '27', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('959', '27', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('960', '27', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('961', '27', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('962', '27', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('963', '27', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('964', '27', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('965', '27', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('966', '27', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('967', '27', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('968', '27', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('969', '27', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('970', '27', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('971', '27', '19', '0.629');
INSERT INTO `tbl_rank` VALUES ('972', '27', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('973', '27', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('974', '27', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('975', '27', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('976', '27', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('977', '27', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('978', '27', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('979', '27', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('980', '27', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('981', '27', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('982', '27', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('983', '27', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('984', '27', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('985', '27', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('986', '27', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('987', '27', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('988', '27', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('989', '27', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('990', '27', '39', '0.629');
INSERT INTO `tbl_rank` VALUES ('991', '28', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('992', '28', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('993', '28', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('994', '28', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('995', '28', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('996', '28', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('997', '28', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('998', '28', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('999', '28', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('1000', '28', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('1001', '28', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('1002', '28', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('1003', '28', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('1004', '28', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('1005', '28', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('1006', '28', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('1007', '28', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('1008', '28', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('1009', '28', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('1010', '28', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('1011', '28', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('1012', '28', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('1013', '28', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('1014', '28', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('1015', '28', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('1016', '28', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('1017', '28', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('1018', '28', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('1019', '28', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('1020', '28', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('1021', '28', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('1022', '28', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('1023', '28', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('1024', '28', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('1025', '28', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('1026', '28', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('1027', '28', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('1028', '28', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('1029', '17', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('1030', '18', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1031', '19', '40', '0.815');
INSERT INTO `tbl_rank` VALUES ('1032', '20', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('1033', '21', '40', '0.811');
INSERT INTO `tbl_rank` VALUES ('1034', '22', '40', '0.675');
INSERT INTO `tbl_rank` VALUES ('1035', '23', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1036', '24', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('1037', '25', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('1038', '26', '40', '0.43');
INSERT INTO `tbl_rank` VALUES ('1039', '27', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1040', '28', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1041', '29', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('1042', '29', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1043', '29', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1044', '29', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1045', '29', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1046', '29', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('1047', '29', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1048', '29', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1049', '29', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1050', '29', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1051', '29', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1052', '29', '12', '0.828');
INSERT INTO `tbl_rank` VALUES ('1053', '29', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1054', '29', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1055', '29', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1056', '29', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1057', '29', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1058', '29', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1059', '29', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1060', '29', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1061', '29', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1062', '29', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1063', '29', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1064', '29', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('1065', '29', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1066', '29', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1067', '29', '27', '0.828');
INSERT INTO `tbl_rank` VALUES ('1068', '29', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1069', '29', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1070', '29', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1071', '29', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1072', '29', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1073', '29', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1074', '29', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1075', '29', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1076', '29', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1077', '29', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1078', '29', '39', '0.826');
INSERT INTO `tbl_rank` VALUES ('1079', '29', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1080', '30', '1', '0.92');
INSERT INTO `tbl_rank` VALUES ('1081', '30', '2', '0.92');
INSERT INTO `tbl_rank` VALUES ('1082', '30', '3', '0.92');
INSERT INTO `tbl_rank` VALUES ('1083', '30', '4', '0.92');
INSERT INTO `tbl_rank` VALUES ('1084', '30', '5', '0.92');
INSERT INTO `tbl_rank` VALUES ('1085', '30', '6', '0.92');
INSERT INTO `tbl_rank` VALUES ('1086', '30', '7', '0.92');
INSERT INTO `tbl_rank` VALUES ('1087', '30', '8', '0.92');
INSERT INTO `tbl_rank` VALUES ('1088', '30', '9', '0.92');
INSERT INTO `tbl_rank` VALUES ('1089', '30', '10', '0.92');
INSERT INTO `tbl_rank` VALUES ('1090', '30', '11', '0.92');
INSERT INTO `tbl_rank` VALUES ('1091', '30', '12', '0.92');
INSERT INTO `tbl_rank` VALUES ('1092', '30', '13', '0.92');
INSERT INTO `tbl_rank` VALUES ('1093', '30', '14', '0.92');
INSERT INTO `tbl_rank` VALUES ('1094', '30', '15', '0.92');
INSERT INTO `tbl_rank` VALUES ('1095', '30', '16', '0.92');
INSERT INTO `tbl_rank` VALUES ('1096', '30', '17', '0.92');
INSERT INTO `tbl_rank` VALUES ('1097', '30', '18', '0.92');
INSERT INTO `tbl_rank` VALUES ('1098', '30', '19', '0.92');
INSERT INTO `tbl_rank` VALUES ('1099', '30', '20', '0.92');
INSERT INTO `tbl_rank` VALUES ('1100', '30', '21', '0.92');
INSERT INTO `tbl_rank` VALUES ('1101', '30', '22', '0.92');
INSERT INTO `tbl_rank` VALUES ('1102', '30', '23', '0.928');
INSERT INTO `tbl_rank` VALUES ('1103', '30', '24', '0.92');
INSERT INTO `tbl_rank` VALUES ('1104', '30', '25', '0.92');
INSERT INTO `tbl_rank` VALUES ('1105', '30', '26', '0.92');
INSERT INTO `tbl_rank` VALUES ('1106', '30', '27', '0.92');
INSERT INTO `tbl_rank` VALUES ('1107', '30', '28', '0.92');
INSERT INTO `tbl_rank` VALUES ('1108', '30', '29', '0.92');
INSERT INTO `tbl_rank` VALUES ('1109', '30', '30', '0.92');
INSERT INTO `tbl_rank` VALUES ('1110', '30', '31', '0.92');
INSERT INTO `tbl_rank` VALUES ('1111', '30', '32', '0.92');
INSERT INTO `tbl_rank` VALUES ('1112', '30', '33', '0.92');
INSERT INTO `tbl_rank` VALUES ('1113', '30', '34', '0.92');
INSERT INTO `tbl_rank` VALUES ('1114', '30', '35', '0.92');
INSERT INTO `tbl_rank` VALUES ('1115', '30', '36', '0.928');
INSERT INTO `tbl_rank` VALUES ('1116', '30', '38', '0.92');
INSERT INTO `tbl_rank` VALUES ('1117', '30', '39', '0.92');
INSERT INTO `tbl_rank` VALUES ('1118', '30', '40', '0.92');
INSERT INTO `tbl_rank` VALUES ('1119', '31', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('1120', '31', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('1121', '31', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('1122', '31', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('1123', '31', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('1124', '31', '6', '0.63');
INSERT INTO `tbl_rank` VALUES ('1125', '31', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('1126', '31', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('1127', '31', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('1128', '31', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('1129', '31', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('1130', '31', '12', '1.13');
INSERT INTO `tbl_rank` VALUES ('1131', '31', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('1132', '31', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('1133', '31', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('1134', '31', '16', '1.129');
INSERT INTO `tbl_rank` VALUES ('1135', '31', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('1136', '31', '18', '1.129');
INSERT INTO `tbl_rank` VALUES ('1137', '31', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('1138', '31', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('1139', '31', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('1140', '31', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('1141', '31', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('1142', '31', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('1143', '31', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('1144', '31', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('1145', '31', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('1146', '31', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('1147', '31', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('1148', '31', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('1149', '31', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('1150', '31', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('1151', '31', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('1152', '31', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('1153', '31', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('1154', '31', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('1155', '31', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('1156', '31', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('1157', '31', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('1158', '32', '1', '0.42');
INSERT INTO `tbl_rank` VALUES ('1159', '32', '2', '0.42');
INSERT INTO `tbl_rank` VALUES ('1160', '32', '3', '0.42');
INSERT INTO `tbl_rank` VALUES ('1161', '32', '4', '0.42');
INSERT INTO `tbl_rank` VALUES ('1162', '32', '5', '0.42');
INSERT INTO `tbl_rank` VALUES ('1163', '32', '6', '0.42');
INSERT INTO `tbl_rank` VALUES ('1164', '32', '7', '0.42');
INSERT INTO `tbl_rank` VALUES ('1165', '32', '8', '0.42');
INSERT INTO `tbl_rank` VALUES ('1166', '32', '9', '0.42');
INSERT INTO `tbl_rank` VALUES ('1167', '32', '10', '0.42');
INSERT INTO `tbl_rank` VALUES ('1168', '32', '11', '0.42');
INSERT INTO `tbl_rank` VALUES ('1169', '32', '12', '0.42');
INSERT INTO `tbl_rank` VALUES ('1170', '32', '13', '0.42');
INSERT INTO `tbl_rank` VALUES ('1171', '32', '14', '0.42');
INSERT INTO `tbl_rank` VALUES ('1172', '32', '15', '0.42');
INSERT INTO `tbl_rank` VALUES ('1173', '32', '16', '0.42');
INSERT INTO `tbl_rank` VALUES ('1174', '32', '17', '0.42');
INSERT INTO `tbl_rank` VALUES ('1175', '32', '18', '0.42');
INSERT INTO `tbl_rank` VALUES ('1176', '32', '19', '0.418');
INSERT INTO `tbl_rank` VALUES ('1177', '32', '20', '0.42');
INSERT INTO `tbl_rank` VALUES ('1178', '32', '21', '0.42');
INSERT INTO `tbl_rank` VALUES ('1179', '32', '22', '0.42');
INSERT INTO `tbl_rank` VALUES ('1180', '32', '23', '0.42');
INSERT INTO `tbl_rank` VALUES ('1181', '32', '24', '0.42');
INSERT INTO `tbl_rank` VALUES ('1182', '32', '25', '0.42');
INSERT INTO `tbl_rank` VALUES ('1183', '32', '26', '0.42');
INSERT INTO `tbl_rank` VALUES ('1184', '32', '27', '0.42');
INSERT INTO `tbl_rank` VALUES ('1185', '32', '28', '0.42');
INSERT INTO `tbl_rank` VALUES ('1186', '32', '29', '0.42');
INSERT INTO `tbl_rank` VALUES ('1187', '32', '30', '0.42');
INSERT INTO `tbl_rank` VALUES ('1188', '32', '31', '0.42');
INSERT INTO `tbl_rank` VALUES ('1189', '32', '32', '0.42');
INSERT INTO `tbl_rank` VALUES ('1190', '32', '33', '0.42');
INSERT INTO `tbl_rank` VALUES ('1191', '32', '34', '0.42');
INSERT INTO `tbl_rank` VALUES ('1192', '32', '35', '0.42');
INSERT INTO `tbl_rank` VALUES ('1193', '32', '36', '0.42');
INSERT INTO `tbl_rank` VALUES ('1194', '32', '38', '0.42');
INSERT INTO `tbl_rank` VALUES ('1195', '32', '39', '0.418');
INSERT INTO `tbl_rank` VALUES ('1196', '32', '40', '0.42');
INSERT INTO `tbl_rank` VALUES ('1197', '33', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('1198', '33', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1199', '33', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1200', '33', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1201', '33', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1202', '33', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('1203', '33', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1204', '33', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1205', '33', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1206', '33', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1207', '33', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1208', '33', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('1209', '33', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1210', '33', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1211', '33', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1212', '33', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1213', '33', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1214', '33', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1215', '33', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1216', '33', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1217', '33', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1218', '33', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1219', '33', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1220', '33', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('1221', '33', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1222', '33', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1223', '33', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('1224', '33', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1225', '33', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1226', '33', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1227', '33', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1228', '33', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1229', '33', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1230', '33', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1231', '33', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1232', '33', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1233', '33', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1234', '33', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('1235', '33', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1236', '34', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('1237', '34', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('1238', '34', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('1239', '34', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('1240', '34', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('1241', '34', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('1242', '34', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('1243', '34', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('1244', '34', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('1245', '34', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('1246', '34', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('1247', '34', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('1248', '34', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('1249', '34', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('1250', '34', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('1251', '34', '16', '0.837');
INSERT INTO `tbl_rank` VALUES ('1252', '34', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('1253', '34', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('1254', '34', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('1255', '34', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('1256', '34', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('1257', '34', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('1258', '34', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('1259', '34', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('1260', '34', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('1261', '34', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('1262', '34', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('1263', '34', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('1264', '34', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('1265', '34', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('1266', '34', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('1267', '34', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('1268', '34', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('1269', '34', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('1270', '34', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('1271', '34', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('1272', '34', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('1273', '34', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('1274', '34', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('1275', '35', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('1276', '35', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('1277', '35', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('1278', '35', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('1279', '35', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('1280', '35', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('1281', '35', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('1282', '35', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('1283', '35', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('1284', '35', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('1285', '35', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('1286', '35', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('1287', '35', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('1288', '35', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('1289', '35', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('1290', '35', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('1291', '35', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('1292', '35', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('1293', '35', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('1294', '35', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('1295', '35', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('1296', '35', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('1297', '35', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('1298', '35', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('1299', '35', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('1300', '35', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('1301', '35', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('1302', '35', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('1303', '35', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('1304', '35', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('1305', '35', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('1306', '35', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('1307', '35', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('1308', '35', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('1309', '35', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('1310', '35', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('1311', '35', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('1312', '35', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('1313', '35', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('1314', '36', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('1315', '36', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('1316', '36', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('1317', '36', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('1318', '36', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('1319', '36', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('1320', '36', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('1321', '36', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('1322', '36', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('1323', '36', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('1324', '36', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('1325', '36', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('1326', '36', '13', '0.623');
INSERT INTO `tbl_rank` VALUES ('1327', '36', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('1328', '36', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('1329', '36', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('1330', '36', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('1331', '36', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('1332', '36', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('1333', '36', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('1334', '36', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('1335', '36', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('1336', '36', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('1337', '36', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('1338', '36', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('1339', '36', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('1340', '36', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('1341', '36', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('1342', '36', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('1343', '36', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('1344', '36', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('1345', '36', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('1346', '36', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('1347', '36', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('1348', '36', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('1349', '36', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('1350', '36', '38', '0.623');
INSERT INTO `tbl_rank` VALUES ('1351', '36', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('1352', '36', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1353', '37', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('1354', '37', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1355', '37', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1356', '37', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1357', '37', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1358', '37', '6', '0.819');
INSERT INTO `tbl_rank` VALUES ('1359', '37', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1360', '37', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1361', '37', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1362', '37', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1363', '37', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1364', '37', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('1365', '37', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1366', '37', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1367', '37', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1368', '37', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1369', '37', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1370', '37', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1371', '37', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1372', '37', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1373', '37', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1374', '37', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1375', '37', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1376', '37', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('1377', '37', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1378', '37', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1379', '37', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('1380', '37', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1381', '37', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1382', '37', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1383', '37', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1384', '37', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1385', '37', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1386', '37', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1387', '37', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1388', '37', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1389', '37', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1390', '37', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('1391', '37', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1392', '38', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('1393', '38', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('1394', '38', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('1395', '38', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('1396', '38', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('1397', '38', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('1398', '38', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('1399', '38', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('1400', '38', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('1401', '38', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('1402', '38', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('1403', '38', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('1404', '38', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('1405', '38', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('1406', '38', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('1407', '38', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('1408', '38', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('1409', '38', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('1410', '38', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('1411', '38', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('1412', '38', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('1413', '38', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('1414', '38', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('1415', '38', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('1416', '38', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('1417', '38', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('1418', '38', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('1419', '38', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('1420', '38', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('1421', '38', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('1422', '38', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('1423', '38', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('1424', '38', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('1425', '38', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('1426', '38', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('1427', '38', '36', '0.731');
INSERT INTO `tbl_rank` VALUES ('1428', '38', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('1429', '38', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('1430', '38', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('1431', '39', '1', '0.92');
INSERT INTO `tbl_rank` VALUES ('1432', '39', '2', '2.324');
INSERT INTO `tbl_rank` VALUES ('1433', '39', '3', '2.427');
INSERT INTO `tbl_rank` VALUES ('1434', '39', '4', '0.92');
INSERT INTO `tbl_rank` VALUES ('1435', '39', '5', '0.92');
INSERT INTO `tbl_rank` VALUES ('1436', '39', '6', '0.92');
INSERT INTO `tbl_rank` VALUES ('1437', '39', '7', '0.92');
INSERT INTO `tbl_rank` VALUES ('1438', '39', '8', '0.92');
INSERT INTO `tbl_rank` VALUES ('1439', '39', '9', '0.92');
INSERT INTO `tbl_rank` VALUES ('1440', '39', '10', '0.92');
INSERT INTO `tbl_rank` VALUES ('1441', '39', '11', '0.92');
INSERT INTO `tbl_rank` VALUES ('1442', '39', '12', '0.92');
INSERT INTO `tbl_rank` VALUES ('1443', '39', '13', '0.92');
INSERT INTO `tbl_rank` VALUES ('1444', '39', '14', '0.92');
INSERT INTO `tbl_rank` VALUES ('1445', '39', '15', '0.92');
INSERT INTO `tbl_rank` VALUES ('1446', '39', '16', '0.92');
INSERT INTO `tbl_rank` VALUES ('1447', '39', '17', '0.92');
INSERT INTO `tbl_rank` VALUES ('1448', '39', '18', '0.92');
INSERT INTO `tbl_rank` VALUES ('1449', '39', '19', '0.92');
INSERT INTO `tbl_rank` VALUES ('1450', '39', '20', '0.92');
INSERT INTO `tbl_rank` VALUES ('1451', '39', '21', '0.92');
INSERT INTO `tbl_rank` VALUES ('1452', '39', '22', '0.92');
INSERT INTO `tbl_rank` VALUES ('1453', '39', '23', '0.92');
INSERT INTO `tbl_rank` VALUES ('1454', '39', '24', '0.92');
INSERT INTO `tbl_rank` VALUES ('1455', '39', '25', '0.92');
INSERT INTO `tbl_rank` VALUES ('1456', '39', '26', '0.92');
INSERT INTO `tbl_rank` VALUES ('1457', '39', '27', '0.92');
INSERT INTO `tbl_rank` VALUES ('1458', '39', '28', '0.92');
INSERT INTO `tbl_rank` VALUES ('1459', '39', '29', '0.92');
INSERT INTO `tbl_rank` VALUES ('1460', '39', '30', '0.92');
INSERT INTO `tbl_rank` VALUES ('1461', '39', '31', '2.427');
INSERT INTO `tbl_rank` VALUES ('1462', '39', '32', '0.92');
INSERT INTO `tbl_rank` VALUES ('1463', '39', '33', '0.92');
INSERT INTO `tbl_rank` VALUES ('1464', '39', '34', '0.92');
INSERT INTO `tbl_rank` VALUES ('1465', '39', '35', '0.92');
INSERT INTO `tbl_rank` VALUES ('1466', '39', '36', '2.427');
INSERT INTO `tbl_rank` VALUES ('1467', '39', '38', '0.92');
INSERT INTO `tbl_rank` VALUES ('1468', '39', '39', '0.92');
INSERT INTO `tbl_rank` VALUES ('1469', '39', '40', '0.92');
INSERT INTO `tbl_rank` VALUES ('1470', '40', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('1471', '40', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1472', '40', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1473', '40', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1474', '40', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1475', '40', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('1476', '40', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1477', '40', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1478', '40', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1479', '40', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1480', '40', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1481', '40', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('1482', '40', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1483', '40', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1484', '40', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1485', '40', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1486', '40', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1487', '40', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1488', '40', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1489', '40', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1490', '40', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1491', '40', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1492', '40', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1493', '40', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('1494', '40', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1495', '40', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1496', '40', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('1497', '40', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1498', '40', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1499', '40', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1500', '40', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1501', '40', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1502', '40', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1503', '40', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1504', '40', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1505', '40', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1506', '40', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1507', '40', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('1508', '40', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1509', '41', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('1510', '41', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('1511', '41', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('1512', '41', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('1513', '41', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('1514', '41', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('1515', '41', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('1516', '41', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('1517', '41', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('1518', '41', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('1519', '41', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('1520', '41', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('1521', '41', '13', '0.627');
INSERT INTO `tbl_rank` VALUES ('1522', '41', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('1523', '41', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('1524', '41', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('1525', '41', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('1526', '41', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('1527', '41', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('1528', '41', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('1529', '41', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('1530', '41', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('1531', '41', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('1532', '41', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('1533', '41', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('1534', '41', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('1535', '41', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('1536', '41', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('1537', '41', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('1538', '41', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('1539', '41', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('1540', '41', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('1541', '41', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('1542', '41', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('1543', '41', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('1544', '41', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('1545', '41', '38', '0.627');
INSERT INTO `tbl_rank` VALUES ('1546', '41', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('1547', '41', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1548', '42', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('1549', '42', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('1550', '42', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('1551', '42', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('1552', '42', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('1553', '42', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('1554', '42', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('1555', '42', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('1556', '42', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('1557', '42', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('1558', '42', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('1559', '42', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('1560', '42', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('1561', '42', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('1562', '42', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('1563', '42', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('1564', '42', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('1565', '42', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('1566', '42', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('1567', '42', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('1568', '42', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('1569', '42', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('1570', '42', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('1571', '42', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('1572', '42', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('1573', '42', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('1574', '42', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('1575', '42', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('1576', '42', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('1577', '42', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('1578', '42', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('1579', '42', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('1580', '42', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('1581', '42', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('1582', '42', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('1583', '42', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('1584', '42', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('1585', '42', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('1586', '42', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('1587', '43', '1', '0.43');
INSERT INTO `tbl_rank` VALUES ('1588', '43', '2', '0.43');
INSERT INTO `tbl_rank` VALUES ('1589', '43', '3', '0.43');
INSERT INTO `tbl_rank` VALUES ('1590', '43', '4', '0.43');
INSERT INTO `tbl_rank` VALUES ('1591', '43', '5', '0.43');
INSERT INTO `tbl_rank` VALUES ('1592', '43', '6', '0.43');
INSERT INTO `tbl_rank` VALUES ('1593', '43', '7', '0.43');
INSERT INTO `tbl_rank` VALUES ('1594', '43', '8', '0.43');
INSERT INTO `tbl_rank` VALUES ('1595', '43', '9', '0.43');
INSERT INTO `tbl_rank` VALUES ('1596', '43', '10', '0.43');
INSERT INTO `tbl_rank` VALUES ('1597', '43', '11', '0.43');
INSERT INTO `tbl_rank` VALUES ('1598', '43', '12', '0.43');
INSERT INTO `tbl_rank` VALUES ('1599', '43', '13', '0.43');
INSERT INTO `tbl_rank` VALUES ('1600', '43', '14', '0.43');
INSERT INTO `tbl_rank` VALUES ('1601', '43', '15', '0.43');
INSERT INTO `tbl_rank` VALUES ('1602', '43', '16', '0.43');
INSERT INTO `tbl_rank` VALUES ('1603', '43', '17', '0.43');
INSERT INTO `tbl_rank` VALUES ('1604', '43', '18', '0.43');
INSERT INTO `tbl_rank` VALUES ('1605', '43', '19', '0.432');
INSERT INTO `tbl_rank` VALUES ('1606', '43', '20', '0.43');
INSERT INTO `tbl_rank` VALUES ('1607', '43', '21', '0.43');
INSERT INTO `tbl_rank` VALUES ('1608', '43', '22', '0.43');
INSERT INTO `tbl_rank` VALUES ('1609', '43', '23', '0.43');
INSERT INTO `tbl_rank` VALUES ('1610', '43', '24', '0.43');
INSERT INTO `tbl_rank` VALUES ('1611', '43', '25', '0.43');
INSERT INTO `tbl_rank` VALUES ('1612', '43', '26', '0.43');
INSERT INTO `tbl_rank` VALUES ('1613', '43', '27', '0.43');
INSERT INTO `tbl_rank` VALUES ('1614', '43', '28', '0.43');
INSERT INTO `tbl_rank` VALUES ('1615', '43', '29', '0.43');
INSERT INTO `tbl_rank` VALUES ('1616', '43', '30', '0.433');
INSERT INTO `tbl_rank` VALUES ('1617', '43', '31', '0.43');
INSERT INTO `tbl_rank` VALUES ('1618', '43', '32', '0.43');
INSERT INTO `tbl_rank` VALUES ('1619', '43', '33', '0.43');
INSERT INTO `tbl_rank` VALUES ('1620', '43', '34', '0.43');
INSERT INTO `tbl_rank` VALUES ('1621', '43', '35', '0.43');
INSERT INTO `tbl_rank` VALUES ('1622', '43', '36', '0.43');
INSERT INTO `tbl_rank` VALUES ('1623', '43', '38', '0.43');
INSERT INTO `tbl_rank` VALUES ('1624', '43', '39', '0.432');
INSERT INTO `tbl_rank` VALUES ('1625', '43', '40', '0.43');
INSERT INTO `tbl_rank` VALUES ('1626', '44', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('1627', '44', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('1628', '44', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('1629', '44', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('1630', '44', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('1631', '44', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('1632', '44', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('1633', '44', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('1634', '44', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('1635', '44', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('1636', '44', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('1637', '44', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('1638', '44', '13', '0.621');
INSERT INTO `tbl_rank` VALUES ('1639', '44', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('1640', '44', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('1641', '44', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('1642', '44', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('1643', '44', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('1644', '44', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('1645', '44', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('1646', '44', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('1647', '44', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('1648', '44', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('1649', '44', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('1650', '44', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('1651', '44', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('1652', '44', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('1653', '44', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('1654', '44', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('1655', '44', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('1656', '44', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('1657', '44', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('1658', '44', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('1659', '44', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('1660', '44', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('1661', '44', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('1662', '44', '38', '0.621');
INSERT INTO `tbl_rank` VALUES ('1663', '44', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('1664', '44', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('1665', '45', '1', '0.52');
INSERT INTO `tbl_rank` VALUES ('1666', '45', '2', '0.52');
INSERT INTO `tbl_rank` VALUES ('1667', '45', '3', '0.52');
INSERT INTO `tbl_rank` VALUES ('1668', '45', '4', '0.52');
INSERT INTO `tbl_rank` VALUES ('1669', '45', '5', '0.52');
INSERT INTO `tbl_rank` VALUES ('1670', '45', '6', '0.52');
INSERT INTO `tbl_rank` VALUES ('1671', '45', '7', '0.52');
INSERT INTO `tbl_rank` VALUES ('1672', '45', '8', '0.52');
INSERT INTO `tbl_rank` VALUES ('1673', '45', '9', '0.52');
INSERT INTO `tbl_rank` VALUES ('1674', '45', '10', '0.52');
INSERT INTO `tbl_rank` VALUES ('1675', '45', '11', '0.52');
INSERT INTO `tbl_rank` VALUES ('1676', '45', '12', '0.52');
INSERT INTO `tbl_rank` VALUES ('1677', '45', '13', '0.52');
INSERT INTO `tbl_rank` VALUES ('1678', '45', '14', '0.52');
INSERT INTO `tbl_rank` VALUES ('1679', '45', '15', '0.52');
INSERT INTO `tbl_rank` VALUES ('1680', '45', '16', '2.01');
INSERT INTO `tbl_rank` VALUES ('1681', '45', '17', '0.52');
INSERT INTO `tbl_rank` VALUES ('1682', '45', '18', '0.52');
INSERT INTO `tbl_rank` VALUES ('1683', '45', '19', '0.52');
INSERT INTO `tbl_rank` VALUES ('1684', '45', '20', '0.52');
INSERT INTO `tbl_rank` VALUES ('1685', '45', '21', '0.52');
INSERT INTO `tbl_rank` VALUES ('1686', '45', '22', '0.52');
INSERT INTO `tbl_rank` VALUES ('1687', '45', '23', '0.52');
INSERT INTO `tbl_rank` VALUES ('1688', '45', '24', '0.52');
INSERT INTO `tbl_rank` VALUES ('1689', '45', '25', '0.52');
INSERT INTO `tbl_rank` VALUES ('1690', '45', '26', '0.52');
INSERT INTO `tbl_rank` VALUES ('1691', '45', '27', '0.52');
INSERT INTO `tbl_rank` VALUES ('1692', '45', '28', '0.52');
INSERT INTO `tbl_rank` VALUES ('1693', '45', '29', '0.52');
INSERT INTO `tbl_rank` VALUES ('1694', '45', '30', '0.52');
INSERT INTO `tbl_rank` VALUES ('1695', '45', '31', '0.52');
INSERT INTO `tbl_rank` VALUES ('1696', '45', '32', '0.52');
INSERT INTO `tbl_rank` VALUES ('1697', '45', '33', '0.52');
INSERT INTO `tbl_rank` VALUES ('1698', '45', '34', '0.52');
INSERT INTO `tbl_rank` VALUES ('1699', '45', '35', '0.52');
INSERT INTO `tbl_rank` VALUES ('1700', '45', '36', '0.52');
INSERT INTO `tbl_rank` VALUES ('1701', '45', '38', '0.52');
INSERT INTO `tbl_rank` VALUES ('1702', '45', '39', '0.52');
INSERT INTO `tbl_rank` VALUES ('1703', '45', '40', '0.52');
INSERT INTO `tbl_rank` VALUES ('1704', '46', '1', '0.52');
INSERT INTO `tbl_rank` VALUES ('1705', '46', '2', '0.52');
INSERT INTO `tbl_rank` VALUES ('1706', '46', '3', '0.52');
INSERT INTO `tbl_rank` VALUES ('1707', '46', '4', '0.52');
INSERT INTO `tbl_rank` VALUES ('1708', '46', '5', '0.52');
INSERT INTO `tbl_rank` VALUES ('1709', '46', '6', '0.52');
INSERT INTO `tbl_rank` VALUES ('1710', '46', '7', '0.52');
INSERT INTO `tbl_rank` VALUES ('1711', '46', '8', '0.52');
INSERT INTO `tbl_rank` VALUES ('1712', '46', '9', '0.52');
INSERT INTO `tbl_rank` VALUES ('1713', '46', '10', '0.52');
INSERT INTO `tbl_rank` VALUES ('1714', '46', '11', '0.52');
INSERT INTO `tbl_rank` VALUES ('1715', '46', '12', '1.021');
INSERT INTO `tbl_rank` VALUES ('1716', '46', '13', '0.52');
INSERT INTO `tbl_rank` VALUES ('1717', '46', '14', '0.52');
INSERT INTO `tbl_rank` VALUES ('1718', '46', '15', '0.52');
INSERT INTO `tbl_rank` VALUES ('1719', '46', '16', '0.52');
INSERT INTO `tbl_rank` VALUES ('1720', '46', '17', '0.52');
INSERT INTO `tbl_rank` VALUES ('1721', '46', '18', '0.52');
INSERT INTO `tbl_rank` VALUES ('1722', '46', '19', '0.52');
INSERT INTO `tbl_rank` VALUES ('1723', '46', '20', '0.52');
INSERT INTO `tbl_rank` VALUES ('1724', '46', '21', '0.52');
INSERT INTO `tbl_rank` VALUES ('1725', '46', '22', '0.52');
INSERT INTO `tbl_rank` VALUES ('1726', '46', '23', '0.52');
INSERT INTO `tbl_rank` VALUES ('1727', '46', '24', '0.52');
INSERT INTO `tbl_rank` VALUES ('1728', '46', '25', '0.52');
INSERT INTO `tbl_rank` VALUES ('1729', '46', '26', '0.52');
INSERT INTO `tbl_rank` VALUES ('1730', '46', '27', '0.52');
INSERT INTO `tbl_rank` VALUES ('1731', '46', '28', '0.52');
INSERT INTO `tbl_rank` VALUES ('1732', '46', '29', '0.52');
INSERT INTO `tbl_rank` VALUES ('1733', '46', '30', '0.52');
INSERT INTO `tbl_rank` VALUES ('1734', '46', '31', '0.52');
INSERT INTO `tbl_rank` VALUES ('1735', '46', '32', '0.52');
INSERT INTO `tbl_rank` VALUES ('1736', '46', '33', '0.52');
INSERT INTO `tbl_rank` VALUES ('1737', '46', '34', '0.52');
INSERT INTO `tbl_rank` VALUES ('1738', '46', '35', '0.52');
INSERT INTO `tbl_rank` VALUES ('1739', '46', '36', '0.52');
INSERT INTO `tbl_rank` VALUES ('1740', '46', '38', '0.52');
INSERT INTO `tbl_rank` VALUES ('1741', '46', '39', '0.52');
INSERT INTO `tbl_rank` VALUES ('1742', '46', '40', '0.52');
INSERT INTO `tbl_rank` VALUES ('1743', '47', '1', '0.827');
INSERT INTO `tbl_rank` VALUES ('1744', '47', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1745', '47', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1746', '47', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1747', '47', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1748', '47', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('1749', '47', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1750', '47', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1751', '47', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1752', '47', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1753', '47', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1754', '47', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('1755', '47', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1756', '47', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1757', '47', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1758', '47', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1759', '47', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1760', '47', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1761', '47', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1762', '47', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1763', '47', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1764', '47', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1765', '47', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1766', '47', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('1767', '47', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1768', '47', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1769', '47', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('1770', '47', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1771', '47', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1772', '47', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1773', '47', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1774', '47', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1775', '47', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1776', '47', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1777', '47', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1778', '47', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1779', '47', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1780', '47', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('1781', '47', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1782', '48', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('1783', '48', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('1784', '48', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('1785', '48', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('1786', '48', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('1787', '48', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('1788', '48', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('1789', '48', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('1790', '48', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('1791', '48', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('1792', '48', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('1793', '48', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('1794', '48', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('1795', '48', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('1796', '48', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('1797', '48', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('1798', '48', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('1799', '48', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('1800', '48', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('1801', '48', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('1802', '48', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('1803', '48', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('1804', '48', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('1805', '48', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('1806', '48', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('1807', '48', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('1808', '48', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('1809', '48', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('1810', '48', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('1811', '48', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('1812', '48', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('1813', '48', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('1814', '48', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('1815', '48', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('1816', '48', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('1817', '48', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('1818', '48', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('1819', '48', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('1820', '48', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('1821', '49', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('1822', '49', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('1823', '49', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('1824', '49', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('1825', '49', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('1826', '49', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('1827', '49', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('1828', '49', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('1829', '49', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('1830', '49', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('1831', '49', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('1832', '49', '12', '0.53');
INSERT INTO `tbl_rank` VALUES ('1833', '49', '13', '0.512');
INSERT INTO `tbl_rank` VALUES ('1834', '49', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('1835', '49', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('1836', '49', '16', '0.53');
INSERT INTO `tbl_rank` VALUES ('1837', '49', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('1838', '49', '18', '0.53');
INSERT INTO `tbl_rank` VALUES ('1839', '49', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('1840', '49', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('1841', '49', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('1842', '49', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('1843', '49', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('1844', '49', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('1845', '49', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('1846', '49', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('1847', '49', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('1848', '49', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('1849', '49', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('1850', '49', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('1851', '49', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('1852', '49', '32', '0.53');
INSERT INTO `tbl_rank` VALUES ('1853', '49', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('1854', '49', '34', '0.53');
INSERT INTO `tbl_rank` VALUES ('1855', '49', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('1856', '49', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('1857', '49', '38', '0.512');
INSERT INTO `tbl_rank` VALUES ('1858', '49', '39', '0.53');
INSERT INTO `tbl_rank` VALUES ('1859', '49', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('1860', '50', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('1861', '50', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('1862', '50', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('1863', '50', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('1864', '50', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('1865', '50', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('1866', '50', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('1867', '50', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('1868', '50', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('1869', '50', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('1870', '50', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('1871', '50', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('1872', '50', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('1873', '50', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('1874', '50', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('1875', '50', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('1876', '50', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('1877', '50', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('1878', '50', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('1879', '50', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('1880', '50', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('1881', '50', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('1882', '50', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('1883', '50', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('1884', '50', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('1885', '50', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('1886', '50', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('1887', '50', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('1888', '50', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('1889', '50', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('1890', '50', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('1891', '50', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('1892', '50', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('1893', '50', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('1894', '50', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('1895', '50', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('1896', '50', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('1897', '50', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('1898', '50', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('1899', '51', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('1900', '51', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('1901', '51', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('1902', '51', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('1903', '51', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('1904', '51', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('1905', '51', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('1906', '51', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('1907', '51', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('1908', '51', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('1909', '51', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('1910', '51', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('1911', '51', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('1912', '51', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('1913', '51', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('1914', '51', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('1915', '51', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('1916', '51', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('1917', '51', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('1918', '51', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('1919', '51', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('1920', '51', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('1921', '51', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('1922', '51', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('1923', '51', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('1924', '51', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('1925', '51', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('1926', '51', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('1927', '51', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('1928', '51', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('1929', '51', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('1930', '51', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('1931', '51', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('1932', '51', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('1933', '51', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('1934', '51', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('1935', '51', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('1936', '51', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('1937', '51', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('1938', '52', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('1939', '52', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('1940', '52', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('1941', '52', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('1942', '52', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('1943', '52', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('1944', '52', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('1945', '52', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('1946', '52', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('1947', '52', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('1948', '52', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('1949', '52', '12', '0.53');
INSERT INTO `tbl_rank` VALUES ('1950', '52', '13', '0.53');
INSERT INTO `tbl_rank` VALUES ('1951', '52', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('1952', '52', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('1953', '52', '16', '0.53');
INSERT INTO `tbl_rank` VALUES ('1954', '52', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('1955', '52', '18', '0.53');
INSERT INTO `tbl_rank` VALUES ('1956', '52', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('1957', '52', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('1958', '52', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('1959', '52', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('1960', '52', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('1961', '52', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('1962', '52', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('1963', '52', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('1964', '52', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('1965', '52', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('1966', '52', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('1967', '52', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('1968', '52', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('1969', '52', '32', '0.53');
INSERT INTO `tbl_rank` VALUES ('1970', '52', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('1971', '52', '34', '0.53');
INSERT INTO `tbl_rank` VALUES ('1972', '52', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('1973', '52', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('1974', '52', '38', '0.53');
INSERT INTO `tbl_rank` VALUES ('1975', '52', '39', '0.53');
INSERT INTO `tbl_rank` VALUES ('1976', '52', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('1977', '53', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('1978', '53', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('1979', '53', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('1980', '53', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('1981', '53', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('1982', '53', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('1983', '53', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('1984', '53', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('1985', '53', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('1986', '53', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('1987', '53', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('1988', '53', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('1989', '53', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('1990', '53', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('1991', '53', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('1992', '53', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('1993', '53', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('1994', '53', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('1995', '53', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('1996', '53', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('1997', '53', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('1998', '53', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('1999', '53', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('2000', '53', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('2001', '53', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('2002', '53', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('2003', '53', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('2004', '53', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('2005', '53', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('2006', '53', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('2007', '53', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('2008', '53', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('2009', '53', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('2010', '53', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('2011', '53', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('2012', '53', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('2013', '53', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('2014', '53', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('2015', '53', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('2016', '54', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('2017', '54', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('2018', '54', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('2019', '54', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('2020', '54', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('2021', '54', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('2022', '54', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('2023', '54', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('2024', '54', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('2025', '54', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('2026', '54', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('2027', '54', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('2028', '54', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('2029', '54', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('2030', '54', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('2031', '54', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('2032', '54', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('2033', '54', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('2034', '54', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('2035', '54', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('2036', '54', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('2037', '54', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('2038', '54', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('2039', '54', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('2040', '54', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('2041', '54', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('2042', '54', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('2043', '54', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('2044', '54', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('2045', '54', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('2046', '54', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('2047', '54', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('2048', '54', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('2049', '54', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('2050', '54', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('2051', '54', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('2052', '54', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('2053', '54', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('2054', '54', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('2055', '55', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('2056', '55', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('2057', '55', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('2058', '55', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('2059', '55', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('2060', '55', '6', '0.63');
INSERT INTO `tbl_rank` VALUES ('2061', '55', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('2062', '55', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('2063', '55', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('2064', '55', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('2065', '55', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('2066', '55', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('2067', '55', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('2068', '55', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('2069', '55', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('2070', '55', '16', '0.63');
INSERT INTO `tbl_rank` VALUES ('2071', '55', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('2072', '55', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('2073', '55', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('2074', '55', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('2075', '55', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('2076', '55', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('2077', '55', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('2078', '55', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('2079', '55', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('2080', '55', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('2081', '55', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('2082', '55', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('2083', '55', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('2084', '55', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('2085', '55', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('2086', '55', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('2087', '55', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('2088', '55', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('2089', '55', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('2090', '55', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('2091', '55', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('2092', '55', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('2093', '55', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('2094', '56', '1', '0.42');
INSERT INTO `tbl_rank` VALUES ('2095', '56', '2', '0.42');
INSERT INTO `tbl_rank` VALUES ('2096', '56', '3', '0.42');
INSERT INTO `tbl_rank` VALUES ('2097', '56', '4', '0.42');
INSERT INTO `tbl_rank` VALUES ('2098', '56', '5', '0.42');
INSERT INTO `tbl_rank` VALUES ('2099', '56', '6', '0.912');
INSERT INTO `tbl_rank` VALUES ('2100', '56', '7', '0.42');
INSERT INTO `tbl_rank` VALUES ('2101', '56', '8', '0.42');
INSERT INTO `tbl_rank` VALUES ('2102', '56', '9', '0.42');
INSERT INTO `tbl_rank` VALUES ('2103', '56', '10', '0.42');
INSERT INTO `tbl_rank` VALUES ('2104', '56', '11', '0.42');
INSERT INTO `tbl_rank` VALUES ('2105', '56', '12', '0.42');
INSERT INTO `tbl_rank` VALUES ('2106', '56', '13', '0.42');
INSERT INTO `tbl_rank` VALUES ('2107', '56', '14', '0.42');
INSERT INTO `tbl_rank` VALUES ('2108', '56', '15', '0.42');
INSERT INTO `tbl_rank` VALUES ('2109', '56', '16', '0.42');
INSERT INTO `tbl_rank` VALUES ('2110', '56', '17', '0.42');
INSERT INTO `tbl_rank` VALUES ('2111', '56', '18', '0.42');
INSERT INTO `tbl_rank` VALUES ('2112', '56', '19', '0.42');
INSERT INTO `tbl_rank` VALUES ('2113', '56', '20', '0.42');
INSERT INTO `tbl_rank` VALUES ('2114', '56', '21', '0.42');
INSERT INTO `tbl_rank` VALUES ('2115', '56', '22', '0.42');
INSERT INTO `tbl_rank` VALUES ('2116', '56', '23', '0.42');
INSERT INTO `tbl_rank` VALUES ('2117', '56', '24', '0.42');
INSERT INTO `tbl_rank` VALUES ('2118', '56', '25', '0.42');
INSERT INTO `tbl_rank` VALUES ('2119', '56', '26', '0.42');
INSERT INTO `tbl_rank` VALUES ('2120', '56', '27', '0.42');
INSERT INTO `tbl_rank` VALUES ('2121', '56', '28', '0.42');
INSERT INTO `tbl_rank` VALUES ('2122', '56', '29', '0.42');
INSERT INTO `tbl_rank` VALUES ('2123', '56', '30', '0.42');
INSERT INTO `tbl_rank` VALUES ('2124', '56', '31', '0.42');
INSERT INTO `tbl_rank` VALUES ('2125', '56', '32', '0.42');
INSERT INTO `tbl_rank` VALUES ('2126', '56', '33', '0.42');
INSERT INTO `tbl_rank` VALUES ('2127', '56', '34', '0.42');
INSERT INTO `tbl_rank` VALUES ('2128', '56', '35', '0.42');
INSERT INTO `tbl_rank` VALUES ('2129', '56', '36', '0.42');
INSERT INTO `tbl_rank` VALUES ('2130', '56', '38', '0.42');
INSERT INTO `tbl_rank` VALUES ('2131', '56', '39', '0.42');
INSERT INTO `tbl_rank` VALUES ('2132', '56', '40', '0.42');
INSERT INTO `tbl_rank` VALUES ('2133', '57', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('2134', '57', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('2135', '57', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('2136', '57', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('2137', '57', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('2138', '57', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('2139', '57', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('2140', '57', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('2141', '57', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('2142', '57', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('2143', '57', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('2144', '57', '12', '0.526');
INSERT INTO `tbl_rank` VALUES ('2145', '57', '13', '0.53');
INSERT INTO `tbl_rank` VALUES ('2146', '57', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('2147', '57', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('2148', '57', '16', '0.525');
INSERT INTO `tbl_rank` VALUES ('2149', '57', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('2150', '57', '18', '0.53');
INSERT INTO `tbl_rank` VALUES ('2151', '57', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('2152', '57', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('2153', '57', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('2154', '57', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('2155', '57', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('2156', '57', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('2157', '57', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('2158', '57', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('2159', '57', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('2160', '57', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('2161', '57', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('2162', '57', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('2163', '57', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('2164', '57', '32', '0.53');
INSERT INTO `tbl_rank` VALUES ('2165', '57', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('2166', '57', '34', '0.53');
INSERT INTO `tbl_rank` VALUES ('2167', '57', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('2168', '57', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('2169', '57', '38', '0.53');
INSERT INTO `tbl_rank` VALUES ('2170', '57', '39', '0.525');
INSERT INTO `tbl_rank` VALUES ('2171', '57', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('2172', '58', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('2173', '58', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('2174', '58', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('2175', '58', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('2176', '58', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('2177', '58', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('2178', '58', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('2179', '58', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('2180', '58', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('2181', '58', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('2182', '58', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('2183', '58', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('2184', '58', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('2185', '58', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('2186', '58', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('2187', '58', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('2188', '58', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('2189', '58', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('2190', '58', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('2191', '58', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('2192', '58', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('2193', '58', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('2194', '58', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('2195', '58', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('2196', '58', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('2197', '58', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('2198', '58', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('2199', '58', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('2200', '58', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('2201', '58', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('2202', '58', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('2203', '58', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('2204', '58', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('2205', '58', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('2206', '58', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('2207', '58', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('2208', '58', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('2209', '58', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('2210', '58', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('2211', '59', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('2212', '59', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('2213', '59', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('2214', '59', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('2215', '59', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('2216', '59', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('2217', '59', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('2218', '59', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('2219', '59', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('2220', '59', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('2221', '59', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('2222', '59', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('2223', '59', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('2224', '59', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('2225', '59', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('2226', '59', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('2227', '59', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('2228', '59', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('2229', '59', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('2230', '59', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('2231', '59', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('2232', '59', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('2233', '59', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('2234', '59', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('2235', '59', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('2236', '59', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('2237', '59', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('2238', '59', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('2239', '59', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('2240', '59', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('2241', '59', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('2242', '59', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('2243', '59', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('2244', '59', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('2245', '59', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('2246', '59', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('2247', '59', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('2248', '59', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('2249', '59', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('2250', '60', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('2251', '60', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('2252', '60', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('2253', '60', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('2254', '60', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('2255', '60', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('2256', '60', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('2257', '60', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('2258', '60', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('2259', '60', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('2260', '60', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('2261', '60', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('2262', '60', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('2263', '60', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('2264', '60', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('2265', '60', '16', '1.33');
INSERT INTO `tbl_rank` VALUES ('2266', '60', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('2267', '60', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('2268', '60', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('2269', '60', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('2270', '60', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('2271', '60', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('2272', '60', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('2273', '60', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('2274', '60', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('2275', '60', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('2276', '60', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('2277', '60', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('2278', '60', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('2279', '60', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('2280', '60', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('2281', '60', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('2282', '60', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('2283', '60', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('2284', '60', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('2285', '60', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('2286', '60', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('2287', '60', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('2288', '60', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('2289', '61', '1', '0.92');
INSERT INTO `tbl_rank` VALUES ('2290', '61', '2', '0.92');
INSERT INTO `tbl_rank` VALUES ('2291', '61', '3', '0.92');
INSERT INTO `tbl_rank` VALUES ('2292', '61', '4', '0.92');
INSERT INTO `tbl_rank` VALUES ('2293', '61', '5', '0.92');
INSERT INTO `tbl_rank` VALUES ('2294', '61', '6', '0.92');
INSERT INTO `tbl_rank` VALUES ('2295', '61', '7', '0.92');
INSERT INTO `tbl_rank` VALUES ('2296', '61', '8', '0.92');
INSERT INTO `tbl_rank` VALUES ('2297', '61', '9', '0.92');
INSERT INTO `tbl_rank` VALUES ('2298', '61', '10', '0.92');
INSERT INTO `tbl_rank` VALUES ('2299', '61', '11', '0.92');
INSERT INTO `tbl_rank` VALUES ('2300', '61', '12', '0.92');
INSERT INTO `tbl_rank` VALUES ('2301', '61', '13', '0.92');
INSERT INTO `tbl_rank` VALUES ('2302', '61', '14', '0.92');
INSERT INTO `tbl_rank` VALUES ('2303', '61', '15', '0.92');
INSERT INTO `tbl_rank` VALUES ('2304', '61', '16', '0.92');
INSERT INTO `tbl_rank` VALUES ('2305', '61', '17', '0.92');
INSERT INTO `tbl_rank` VALUES ('2306', '61', '18', '0.92');
INSERT INTO `tbl_rank` VALUES ('2307', '61', '19', '0.92');
INSERT INTO `tbl_rank` VALUES ('2308', '61', '20', '0.92');
INSERT INTO `tbl_rank` VALUES ('2309', '61', '21', '0.92');
INSERT INTO `tbl_rank` VALUES ('2310', '61', '22', '0.92');
INSERT INTO `tbl_rank` VALUES ('2311', '61', '23', '0.92');
INSERT INTO `tbl_rank` VALUES ('2312', '61', '24', '0.92');
INSERT INTO `tbl_rank` VALUES ('2313', '61', '25', '0.92');
INSERT INTO `tbl_rank` VALUES ('2314', '61', '26', '0.92');
INSERT INTO `tbl_rank` VALUES ('2315', '61', '27', '0.92');
INSERT INTO `tbl_rank` VALUES ('2316', '61', '28', '0.92');
INSERT INTO `tbl_rank` VALUES ('2317', '61', '29', '0.92');
INSERT INTO `tbl_rank` VALUES ('2318', '61', '30', '0.92');
INSERT INTO `tbl_rank` VALUES ('2319', '61', '31', '0.92');
INSERT INTO `tbl_rank` VALUES ('2320', '61', '32', '0.92');
INSERT INTO `tbl_rank` VALUES ('2321', '61', '33', '0.92');
INSERT INTO `tbl_rank` VALUES ('2322', '61', '34', '0.92');
INSERT INTO `tbl_rank` VALUES ('2323', '61', '35', '0.92');
INSERT INTO `tbl_rank` VALUES ('2324', '61', '36', '0.92');
INSERT INTO `tbl_rank` VALUES ('2325', '61', '38', '0.92');
INSERT INTO `tbl_rank` VALUES ('2326', '61', '39', '0.92');
INSERT INTO `tbl_rank` VALUES ('2327', '61', '40', '0.92');
INSERT INTO `tbl_rank` VALUES ('2328', '62', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('2329', '62', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('2330', '62', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('2331', '62', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('2332', '62', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('2333', '62', '6', '0.727');
INSERT INTO `tbl_rank` VALUES ('2334', '62', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('2335', '62', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('2336', '62', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('2337', '62', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('2338', '62', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('2339', '62', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('2340', '62', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('2341', '62', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('2342', '62', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('2343', '62', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('2344', '62', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('2345', '62', '18', '0.726');
INSERT INTO `tbl_rank` VALUES ('2346', '62', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('2347', '62', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('2348', '62', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('2349', '62', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('2350', '62', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('2351', '62', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('2352', '62', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('2353', '62', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('2354', '62', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('2355', '62', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('2356', '62', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('2357', '62', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('2358', '62', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('2359', '62', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('2360', '62', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('2361', '62', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('2362', '62', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('2363', '62', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('2364', '62', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('2365', '62', '39', '0.726');
INSERT INTO `tbl_rank` VALUES ('2366', '62', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('2367', '63', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('2368', '63', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('2369', '63', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('2370', '63', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('2371', '63', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('2372', '63', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('2373', '63', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('2374', '63', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('2375', '63', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('2376', '63', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('2377', '63', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('2378', '63', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('2379', '63', '13', '0.609');
INSERT INTO `tbl_rank` VALUES ('2380', '63', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('2381', '63', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('2382', '63', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('2383', '63', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('2384', '63', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('2385', '63', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('2386', '63', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('2387', '63', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('2388', '63', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('2389', '63', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('2390', '63', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('2391', '63', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('2392', '63', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('2393', '63', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('2394', '63', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('2395', '63', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('2396', '63', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('2397', '63', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('2398', '63', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('2399', '63', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('2400', '63', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('2401', '63', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('2402', '63', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('2403', '63', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('2404', '63', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('2405', '63', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('2406', '64', '1', '0.93');
INSERT INTO `tbl_rank` VALUES ('2407', '64', '2', '0.93');
INSERT INTO `tbl_rank` VALUES ('2408', '64', '3', '0.93');
INSERT INTO `tbl_rank` VALUES ('2409', '64', '4', '0.93');
INSERT INTO `tbl_rank` VALUES ('2410', '64', '5', '0.93');
INSERT INTO `tbl_rank` VALUES ('2411', '64', '6', '0.93');
INSERT INTO `tbl_rank` VALUES ('2412', '64', '7', '0.93');
INSERT INTO `tbl_rank` VALUES ('2413', '64', '8', '0.93');
INSERT INTO `tbl_rank` VALUES ('2414', '64', '9', '0.93');
INSERT INTO `tbl_rank` VALUES ('2415', '64', '10', '0.93');
INSERT INTO `tbl_rank` VALUES ('2416', '64', '11', '0.93');
INSERT INTO `tbl_rank` VALUES ('2417', '64', '12', '1.437');
INSERT INTO `tbl_rank` VALUES ('2418', '64', '13', '0.93');
INSERT INTO `tbl_rank` VALUES ('2419', '64', '14', '0.93');
INSERT INTO `tbl_rank` VALUES ('2420', '64', '15', '0.93');
INSERT INTO `tbl_rank` VALUES ('2421', '64', '16', '0.93');
INSERT INTO `tbl_rank` VALUES ('2422', '64', '17', '0.93');
INSERT INTO `tbl_rank` VALUES ('2423', '64', '18', '0.93');
INSERT INTO `tbl_rank` VALUES ('2424', '64', '19', '0.93');
INSERT INTO `tbl_rank` VALUES ('2425', '64', '20', '0.93');
INSERT INTO `tbl_rank` VALUES ('2426', '64', '21', '0.93');
INSERT INTO `tbl_rank` VALUES ('2427', '64', '22', '0.93');
INSERT INTO `tbl_rank` VALUES ('2428', '64', '23', '0.93');
INSERT INTO `tbl_rank` VALUES ('2429', '64', '24', '0.93');
INSERT INTO `tbl_rank` VALUES ('2430', '64', '25', '0.93');
INSERT INTO `tbl_rank` VALUES ('2431', '64', '26', '0.93');
INSERT INTO `tbl_rank` VALUES ('2432', '64', '27', '0.93');
INSERT INTO `tbl_rank` VALUES ('2433', '64', '28', '0.93');
INSERT INTO `tbl_rank` VALUES ('2434', '64', '29', '0.93');
INSERT INTO `tbl_rank` VALUES ('2435', '64', '30', '0.93');
INSERT INTO `tbl_rank` VALUES ('2436', '64', '31', '0.93');
INSERT INTO `tbl_rank` VALUES ('2437', '64', '32', '0.93');
INSERT INTO `tbl_rank` VALUES ('2438', '64', '33', '0.93');
INSERT INTO `tbl_rank` VALUES ('2439', '64', '34', '0.93');
INSERT INTO `tbl_rank` VALUES ('2440', '64', '35', '0.93');
INSERT INTO `tbl_rank` VALUES ('2441', '64', '36', '0.93');
INSERT INTO `tbl_rank` VALUES ('2442', '64', '38', '0.93');
INSERT INTO `tbl_rank` VALUES ('2443', '64', '39', '0.93');
INSERT INTO `tbl_rank` VALUES ('2444', '64', '40', '0.93');
INSERT INTO `tbl_rank` VALUES ('2445', '65', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('2446', '65', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('2447', '65', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('2448', '65', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('2449', '65', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('2450', '65', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('2451', '65', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('2452', '65', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('2453', '65', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('2454', '65', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('2455', '65', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('2456', '65', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('2457', '65', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('2458', '65', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('2459', '65', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('2460', '65', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('2461', '65', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('2462', '65', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('2463', '65', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('2464', '65', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('2465', '65', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('2466', '65', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('2467', '65', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('2468', '65', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('2469', '65', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('2470', '65', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('2471', '65', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('2472', '65', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('2473', '65', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('2474', '65', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('2475', '65', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('2476', '65', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('2477', '65', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('2478', '65', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('2479', '65', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('2480', '65', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('2481', '65', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('2482', '65', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('2483', '65', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('2484', '66', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('2485', '66', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('2486', '66', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('2487', '66', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('2488', '66', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('2489', '66', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('2490', '66', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('2491', '66', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('2492', '66', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('2493', '66', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('2494', '66', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('2495', '66', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('2496', '66', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('2497', '66', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('2498', '66', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('2499', '66', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('2500', '66', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('2501', '66', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('2502', '66', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('2503', '66', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('2504', '66', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('2505', '66', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('2506', '66', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('2507', '66', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('2508', '66', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('2509', '66', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('2510', '66', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('2511', '66', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('2512', '66', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('2513', '66', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('2514', '66', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('2515', '66', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('2516', '66', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('2517', '66', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('2518', '66', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('2519', '66', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('2520', '66', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('2521', '66', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('2522', '66', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('2523', '67', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('2524', '67', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('2525', '67', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('2526', '67', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('2527', '67', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('2528', '67', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('2529', '67', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('2530', '67', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('2531', '67', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('2532', '67', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('2533', '67', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('2534', '67', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('2535', '67', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('2536', '67', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('2537', '67', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('2538', '67', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('2539', '67', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('2540', '67', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('2541', '67', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('2542', '67', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('2543', '67', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('2544', '67', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('2545', '67', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('2546', '67', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('2547', '67', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('2548', '67', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('2549', '67', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('2550', '67', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('2551', '67', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('2552', '67', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('2553', '67', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('2554', '67', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('2555', '67', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('2556', '67', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('2557', '67', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('2558', '67', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('2559', '67', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('2560', '67', '39', '0.739');
INSERT INTO `tbl_rank` VALUES ('2561', '67', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('2562', '68', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('2563', '68', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('2564', '68', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('2565', '68', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('2566', '68', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('2567', '68', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('2568', '68', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('2569', '68', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('2570', '68', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('2571', '68', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('2572', '68', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('2573', '68', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('2574', '68', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('2575', '68', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('2576', '68', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('2577', '68', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('2578', '68', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('2579', '68', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('2580', '68', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('2581', '68', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('2582', '68', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('2583', '68', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('2584', '68', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('2585', '68', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('2586', '68', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('2587', '68', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('2588', '68', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('2589', '68', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('2590', '68', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('2591', '68', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('2592', '68', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('2593', '68', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('2594', '68', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('2595', '68', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('2596', '68', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('2597', '68', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('2598', '68', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('2599', '68', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('2600', '68', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('2601', '69', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('2602', '69', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('2603', '69', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('2604', '69', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('2605', '69', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('2606', '69', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('2607', '69', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('2608', '69', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('2609', '69', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('2610', '69', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('2611', '69', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('2612', '69', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('2613', '69', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('2614', '69', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('2615', '69', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('2616', '69', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('2617', '69', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('2618', '69', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('2619', '69', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('2620', '69', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('2621', '69', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('2622', '69', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('2623', '69', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('2624', '69', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('2625', '69', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('2626', '69', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('2627', '69', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('2628', '69', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('2629', '69', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('2630', '69', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('2631', '69', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('2632', '69', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('2633', '69', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('2634', '69', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('2635', '69', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('2636', '69', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('2637', '69', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('2638', '69', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('2639', '69', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('2640', '70', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('2641', '70', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('2642', '70', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('2643', '70', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('2644', '70', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('2645', '70', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('2646', '70', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('2647', '70', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('2648', '70', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('2649', '70', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('2650', '70', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('2651', '70', '12', '0.53');
INSERT INTO `tbl_rank` VALUES ('2652', '70', '13', '0.53');
INSERT INTO `tbl_rank` VALUES ('2653', '70', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('2654', '70', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('2655', '70', '16', '0.53');
INSERT INTO `tbl_rank` VALUES ('2656', '70', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('2657', '70', '18', '0.53');
INSERT INTO `tbl_rank` VALUES ('2658', '70', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('2659', '70', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('2660', '70', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('2661', '70', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('2662', '70', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('2663', '70', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('2664', '70', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('2665', '70', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('2666', '70', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('2667', '70', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('2668', '70', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('2669', '70', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('2670', '70', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('2671', '70', '32', '0.5');
INSERT INTO `tbl_rank` VALUES ('2672', '70', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('2673', '70', '34', '0.5');
INSERT INTO `tbl_rank` VALUES ('2674', '70', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('2675', '70', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('2676', '70', '38', '0.53');
INSERT INTO `tbl_rank` VALUES ('2677', '70', '39', '0.499');
INSERT INTO `tbl_rank` VALUES ('2678', '70', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('2679', '71', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('2680', '71', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('2681', '71', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('2682', '71', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('2683', '71', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('2684', '71', '6', '1.127');
INSERT INTO `tbl_rank` VALUES ('2685', '71', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('2686', '71', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('2687', '71', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('2688', '71', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('2689', '71', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('2690', '71', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('2691', '71', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('2692', '71', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('2693', '71', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('2694', '71', '16', '0.63');
INSERT INTO `tbl_rank` VALUES ('2695', '71', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('2696', '71', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('2697', '71', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('2698', '71', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('2699', '71', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('2700', '71', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('2701', '71', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('2702', '71', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('2703', '71', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('2704', '71', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('2705', '71', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('2706', '71', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('2707', '71', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('2708', '71', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('2709', '71', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('2710', '71', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('2711', '71', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('2712', '71', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('2713', '71', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('2714', '71', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('2715', '71', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('2716', '71', '39', '0.626');
INSERT INTO `tbl_rank` VALUES ('2717', '71', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('2718', '72', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('2719', '72', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('2720', '72', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('2721', '72', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('2722', '72', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('2723', '72', '6', '2.222');
INSERT INTO `tbl_rank` VALUES ('2724', '72', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('2725', '72', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('2726', '72', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('2727', '72', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('2728', '72', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('2729', '72', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('2730', '72', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('2731', '72', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('2732', '72', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('2733', '72', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('2734', '72', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('2735', '72', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('2736', '72', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('2737', '72', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('2738', '72', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('2739', '72', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('2740', '72', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('2741', '72', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('2742', '72', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('2743', '72', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('2744', '72', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('2745', '72', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('2746', '72', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('2747', '72', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('2748', '72', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('2749', '72', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('2750', '72', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('2751', '72', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('2752', '72', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('2753', '72', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('2754', '72', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('2755', '72', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('2756', '72', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('2757', '73', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('2758', '73', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('2759', '73', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('2760', '73', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('2761', '73', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('2762', '73', '6', '0.63');
INSERT INTO `tbl_rank` VALUES ('2763', '73', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('2764', '73', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('2765', '73', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('2766', '73', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('2767', '73', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('2768', '73', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('2769', '73', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('2770', '73', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('2771', '73', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('2772', '73', '16', '0.63');
INSERT INTO `tbl_rank` VALUES ('2773', '73', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('2774', '73', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('2775', '73', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('2776', '73', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('2777', '73', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('2778', '73', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('2779', '73', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('2780', '73', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('2781', '73', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('2782', '73', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('2783', '73', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('2784', '73', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('2785', '73', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('2786', '73', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('2787', '73', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('2788', '73', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('2789', '73', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('2790', '73', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('2791', '73', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('2792', '73', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('2793', '73', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('2794', '73', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('2795', '73', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('2796', '74', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('2797', '74', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('2798', '74', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('2799', '74', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('2800', '74', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('2801', '74', '6', '1.336');
INSERT INTO `tbl_rank` VALUES ('2802', '74', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('2803', '74', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('2804', '74', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('2805', '74', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('2806', '74', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('2807', '74', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('2808', '74', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('2809', '74', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('2810', '74', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('2811', '74', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('2812', '74', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('2813', '74', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('2814', '74', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('2815', '74', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('2816', '74', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('2817', '74', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('2818', '74', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('2819', '74', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('2820', '74', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('2821', '74', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('2822', '74', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('2823', '74', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('2824', '74', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('2825', '74', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('2826', '74', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('2827', '74', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('2828', '74', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('2829', '74', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('2830', '74', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('2831', '74', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('2832', '74', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('2833', '74', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('2834', '74', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('2835', '75', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('2836', '75', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('2837', '75', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('2838', '75', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('2839', '75', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('2840', '75', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('2841', '75', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('2842', '75', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('2843', '75', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('2844', '75', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('2845', '75', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('2846', '75', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('2847', '75', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('2848', '75', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('2849', '75', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('2850', '75', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('2851', '75', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('2852', '75', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('2853', '75', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('2854', '75', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('2855', '75', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('2856', '75', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('2857', '75', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('2858', '75', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('2859', '75', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('2860', '75', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('2861', '75', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('2862', '75', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('2863', '75', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('2864', '75', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('2865', '75', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('2866', '75', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('2867', '75', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('2868', '75', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('2869', '75', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('2870', '75', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('2871', '75', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('2872', '75', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('2873', '75', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('2874', '76', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('2875', '76', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('2876', '76', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('2877', '76', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('2878', '76', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('2879', '76', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('2880', '76', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('2881', '76', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('2882', '76', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('2883', '76', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('2884', '76', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('2885', '76', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('2886', '76', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('2887', '76', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('2888', '76', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('2889', '76', '16', '0.82');
INSERT INTO `tbl_rank` VALUES ('2890', '76', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('2891', '76', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('2892', '76', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('2893', '76', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('2894', '76', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('2895', '76', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('2896', '76', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('2897', '76', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('2898', '76', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('2899', '76', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('2900', '76', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('2901', '76', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('2902', '76', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('2903', '76', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('2904', '76', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('2905', '76', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('2906', '76', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('2907', '76', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('2908', '76', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('2909', '76', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('2910', '76', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('2911', '76', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('2912', '76', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('2913', '77', '1', '1.02');
INSERT INTO `tbl_rank` VALUES ('2914', '77', '2', '1.02');
INSERT INTO `tbl_rank` VALUES ('2915', '77', '3', '1.02');
INSERT INTO `tbl_rank` VALUES ('2916', '77', '4', '1.02');
INSERT INTO `tbl_rank` VALUES ('2917', '77', '5', '1.02');
INSERT INTO `tbl_rank` VALUES ('2918', '77', '6', '1.02');
INSERT INTO `tbl_rank` VALUES ('2919', '77', '7', '1.02');
INSERT INTO `tbl_rank` VALUES ('2920', '77', '8', '1.02');
INSERT INTO `tbl_rank` VALUES ('2921', '77', '9', '1.02');
INSERT INTO `tbl_rank` VALUES ('2922', '77', '10', '1.02');
INSERT INTO `tbl_rank` VALUES ('2923', '77', '11', '1.02');
INSERT INTO `tbl_rank` VALUES ('2924', '77', '12', '1.02');
INSERT INTO `tbl_rank` VALUES ('2925', '77', '13', '1.02');
INSERT INTO `tbl_rank` VALUES ('2926', '77', '14', '1.02');
INSERT INTO `tbl_rank` VALUES ('2927', '77', '15', '1.02');
INSERT INTO `tbl_rank` VALUES ('2928', '77', '16', '1.02');
INSERT INTO `tbl_rank` VALUES ('2929', '77', '17', '1.02');
INSERT INTO `tbl_rank` VALUES ('2930', '77', '18', '1.02');
INSERT INTO `tbl_rank` VALUES ('2931', '77', '19', '1.02');
INSERT INTO `tbl_rank` VALUES ('2932', '77', '20', '1.02');
INSERT INTO `tbl_rank` VALUES ('2933', '77', '21', '1.02');
INSERT INTO `tbl_rank` VALUES ('2934', '77', '22', '1.02');
INSERT INTO `tbl_rank` VALUES ('2935', '77', '23', '1.019');
INSERT INTO `tbl_rank` VALUES ('2936', '77', '24', '1.02');
INSERT INTO `tbl_rank` VALUES ('2937', '77', '25', '1.02');
INSERT INTO `tbl_rank` VALUES ('2938', '77', '26', '1.02');
INSERT INTO `tbl_rank` VALUES ('2939', '77', '27', '1.02');
INSERT INTO `tbl_rank` VALUES ('2940', '77', '28', '1.02');
INSERT INTO `tbl_rank` VALUES ('2941', '77', '29', '1.02');
INSERT INTO `tbl_rank` VALUES ('2942', '77', '30', '1.02');
INSERT INTO `tbl_rank` VALUES ('2943', '77', '31', '1.02');
INSERT INTO `tbl_rank` VALUES ('2944', '77', '32', '1.02');
INSERT INTO `tbl_rank` VALUES ('2945', '77', '33', '1.02');
INSERT INTO `tbl_rank` VALUES ('2946', '77', '34', '1.02');
INSERT INTO `tbl_rank` VALUES ('2947', '77', '35', '1.02');
INSERT INTO `tbl_rank` VALUES ('2948', '77', '36', '1.02');
INSERT INTO `tbl_rank` VALUES ('2949', '77', '38', '1.02');
INSERT INTO `tbl_rank` VALUES ('2950', '77', '39', '1.02');
INSERT INTO `tbl_rank` VALUES ('2951', '77', '40', '1.02');
INSERT INTO `tbl_rank` VALUES ('2952', '78', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('2953', '78', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('2954', '78', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('2955', '78', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('2956', '78', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('2957', '78', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('2958', '78', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('2959', '78', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('2960', '78', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('2961', '78', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('2962', '78', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('2963', '78', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('2964', '78', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('2965', '78', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('2966', '78', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('2967', '78', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('2968', '78', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('2969', '78', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('2970', '78', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('2971', '78', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('2972', '78', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('2973', '78', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('2974', '78', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('2975', '78', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('2976', '78', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('2977', '78', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('2978', '78', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('2979', '78', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('2980', '78', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('2981', '78', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('2982', '78', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('2983', '78', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('2984', '78', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('2985', '78', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('2986', '78', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('2987', '78', '36', '0.622');
INSERT INTO `tbl_rank` VALUES ('2988', '78', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('2989', '78', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('2990', '78', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('2991', '79', '1', '0.627');
INSERT INTO `tbl_rank` VALUES ('2992', '79', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('2993', '79', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('2994', '79', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('2995', '79', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('2996', '79', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('2997', '79', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('2998', '79', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('2999', '79', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('3000', '79', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('3001', '79', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('3002', '79', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('3003', '79', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('3004', '79', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('3005', '79', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('3006', '79', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('3007', '79', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('3008', '79', '18', '0.729');
INSERT INTO `tbl_rank` VALUES ('3009', '79', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('3010', '79', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('3011', '79', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('3012', '79', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('3013', '79', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('3014', '79', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('3015', '79', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('3016', '79', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('3017', '79', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('3018', '79', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('3019', '79', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('3020', '79', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('3021', '79', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('3022', '79', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('3023', '79', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('3024', '79', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('3025', '79', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('3026', '79', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('3027', '79', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('3028', '79', '39', '0.729');
INSERT INTO `tbl_rank` VALUES ('3029', '79', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('3030', '80', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('3031', '80', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('3032', '80', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('3033', '80', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('3034', '80', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('3035', '80', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('3036', '80', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('3037', '80', '8', '1.991');
INSERT INTO `tbl_rank` VALUES ('3038', '80', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('3039', '80', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('3040', '80', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('3041', '80', '12', '2.097');
INSERT INTO `tbl_rank` VALUES ('3042', '80', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('3043', '80', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('3044', '80', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('3045', '80', '16', '2.095');
INSERT INTO `tbl_rank` VALUES ('3046', '80', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('3047', '80', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('3048', '80', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('3049', '80', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('3050', '80', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('3051', '80', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('3052', '80', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('3053', '80', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('3054', '80', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('3055', '80', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('3056', '80', '27', '2.097');
INSERT INTO `tbl_rank` VALUES ('3057', '80', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('3058', '80', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('3059', '80', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('3060', '80', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('3061', '80', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('3062', '80', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('3063', '80', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('3064', '80', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('3065', '80', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('3066', '80', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('3067', '80', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('3068', '80', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('3069', '81', '1', '0.92');
INSERT INTO `tbl_rank` VALUES ('3070', '81', '2', '0.92');
INSERT INTO `tbl_rank` VALUES ('3071', '81', '3', '0.92');
INSERT INTO `tbl_rank` VALUES ('3072', '81', '4', '0.92');
INSERT INTO `tbl_rank` VALUES ('3073', '81', '5', '0.92');
INSERT INTO `tbl_rank` VALUES ('3074', '81', '6', '0.92');
INSERT INTO `tbl_rank` VALUES ('3075', '81', '7', '0.92');
INSERT INTO `tbl_rank` VALUES ('3076', '81', '8', '0.92');
INSERT INTO `tbl_rank` VALUES ('3077', '81', '9', '0.92');
INSERT INTO `tbl_rank` VALUES ('3078', '81', '10', '0.92');
INSERT INTO `tbl_rank` VALUES ('3079', '81', '11', '0.92');
INSERT INTO `tbl_rank` VALUES ('3080', '81', '12', '0.925');
INSERT INTO `tbl_rank` VALUES ('3081', '81', '13', '0.92');
INSERT INTO `tbl_rank` VALUES ('3082', '81', '14', '0.92');
INSERT INTO `tbl_rank` VALUES ('3083', '81', '15', '0.92');
INSERT INTO `tbl_rank` VALUES ('3084', '81', '16', '0.924');
INSERT INTO `tbl_rank` VALUES ('3085', '81', '17', '0.92');
INSERT INTO `tbl_rank` VALUES ('3086', '81', '18', '0.92');
INSERT INTO `tbl_rank` VALUES ('3087', '81', '19', '0.92');
INSERT INTO `tbl_rank` VALUES ('3088', '81', '20', '0.92');
INSERT INTO `tbl_rank` VALUES ('3089', '81', '21', '0.92');
INSERT INTO `tbl_rank` VALUES ('3090', '81', '22', '0.92');
INSERT INTO `tbl_rank` VALUES ('3091', '81', '23', '0.92');
INSERT INTO `tbl_rank` VALUES ('3092', '81', '24', '0.92');
INSERT INTO `tbl_rank` VALUES ('3093', '81', '25', '0.92');
INSERT INTO `tbl_rank` VALUES ('3094', '81', '26', '0.92');
INSERT INTO `tbl_rank` VALUES ('3095', '81', '27', '0.92');
INSERT INTO `tbl_rank` VALUES ('3096', '81', '28', '0.92');
INSERT INTO `tbl_rank` VALUES ('3097', '81', '29', '0.92');
INSERT INTO `tbl_rank` VALUES ('3098', '81', '30', '0.92');
INSERT INTO `tbl_rank` VALUES ('3099', '81', '31', '0.92');
INSERT INTO `tbl_rank` VALUES ('3100', '81', '32', '0.925');
INSERT INTO `tbl_rank` VALUES ('3101', '81', '33', '0.92');
INSERT INTO `tbl_rank` VALUES ('3102', '81', '34', '0.92');
INSERT INTO `tbl_rank` VALUES ('3103', '81', '35', '0.92');
INSERT INTO `tbl_rank` VALUES ('3104', '81', '36', '0.92');
INSERT INTO `tbl_rank` VALUES ('3105', '81', '38', '0.92');
INSERT INTO `tbl_rank` VALUES ('3106', '81', '39', '0.92');
INSERT INTO `tbl_rank` VALUES ('3107', '81', '40', '0.92');
INSERT INTO `tbl_rank` VALUES ('3108', '82', '1', '0.52');
INSERT INTO `tbl_rank` VALUES ('3109', '82', '2', '0.52');
INSERT INTO `tbl_rank` VALUES ('3110', '82', '3', '0.52');
INSERT INTO `tbl_rank` VALUES ('3111', '82', '4', '0.52');
INSERT INTO `tbl_rank` VALUES ('3112', '82', '5', '0.52');
INSERT INTO `tbl_rank` VALUES ('3113', '82', '6', '0.52');
INSERT INTO `tbl_rank` VALUES ('3114', '82', '7', '0.52');
INSERT INTO `tbl_rank` VALUES ('3115', '82', '8', '0.52');
INSERT INTO `tbl_rank` VALUES ('3116', '82', '9', '0.52');
INSERT INTO `tbl_rank` VALUES ('3117', '82', '10', '0.52');
INSERT INTO `tbl_rank` VALUES ('3118', '82', '11', '0.52');
INSERT INTO `tbl_rank` VALUES ('3119', '82', '12', '0.52');
INSERT INTO `tbl_rank` VALUES ('3120', '82', '13', '0.52');
INSERT INTO `tbl_rank` VALUES ('3121', '82', '14', '0.52');
INSERT INTO `tbl_rank` VALUES ('3122', '82', '15', '0.52');
INSERT INTO `tbl_rank` VALUES ('3123', '82', '16', '0.52');
INSERT INTO `tbl_rank` VALUES ('3124', '82', '17', '0.52');
INSERT INTO `tbl_rank` VALUES ('3125', '82', '18', '0.52');
INSERT INTO `tbl_rank` VALUES ('3126', '82', '19', '0.52');
INSERT INTO `tbl_rank` VALUES ('3127', '82', '20', '0.52');
INSERT INTO `tbl_rank` VALUES ('3128', '82', '21', '0.52');
INSERT INTO `tbl_rank` VALUES ('3129', '82', '22', '0.52');
INSERT INTO `tbl_rank` VALUES ('3130', '82', '23', '0.52');
INSERT INTO `tbl_rank` VALUES ('3131', '82', '24', '0.52');
INSERT INTO `tbl_rank` VALUES ('3132', '82', '25', '0.52');
INSERT INTO `tbl_rank` VALUES ('3133', '82', '26', '0.52');
INSERT INTO `tbl_rank` VALUES ('3134', '82', '27', '0.52');
INSERT INTO `tbl_rank` VALUES ('3135', '82', '28', '0.52');
INSERT INTO `tbl_rank` VALUES ('3136', '82', '29', '0.52');
INSERT INTO `tbl_rank` VALUES ('3137', '82', '30', '0.52');
INSERT INTO `tbl_rank` VALUES ('3138', '82', '31', '0.52');
INSERT INTO `tbl_rank` VALUES ('3139', '82', '32', '0.52');
INSERT INTO `tbl_rank` VALUES ('3140', '82', '33', '0.52');
INSERT INTO `tbl_rank` VALUES ('3141', '82', '34', '0.52');
INSERT INTO `tbl_rank` VALUES ('3142', '82', '35', '0.52');
INSERT INTO `tbl_rank` VALUES ('3143', '82', '36', '0.52');
INSERT INTO `tbl_rank` VALUES ('3144', '82', '38', '0.52');
INSERT INTO `tbl_rank` VALUES ('3145', '82', '39', '0.52');
INSERT INTO `tbl_rank` VALUES ('3146', '82', '40', '0.52');
INSERT INTO `tbl_rank` VALUES ('3147', '83', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('3148', '83', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('3149', '83', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('3150', '83', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('3151', '83', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('3152', '83', '6', '1.122');
INSERT INTO `tbl_rank` VALUES ('3153', '83', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('3154', '83', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('3155', '83', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('3156', '83', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('3157', '83', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('3158', '83', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('3159', '83', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('3160', '83', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('3161', '83', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('3162', '83', '16', '0.621');
INSERT INTO `tbl_rank` VALUES ('3163', '83', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('3164', '83', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('3165', '83', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('3166', '83', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('3167', '83', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('3168', '83', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('3169', '83', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('3170', '83', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('3171', '83', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('3172', '83', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('3173', '83', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('3174', '83', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('3175', '83', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('3176', '83', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('3177', '83', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('3178', '83', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('3179', '83', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('3180', '83', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('3181', '83', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('3182', '83', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('3183', '83', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('3184', '83', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('3185', '83', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('3186', '84', '1', '0.42');
INSERT INTO `tbl_rank` VALUES ('3187', '84', '2', '0.42');
INSERT INTO `tbl_rank` VALUES ('3188', '84', '3', '0.42');
INSERT INTO `tbl_rank` VALUES ('3189', '84', '4', '0.42');
INSERT INTO `tbl_rank` VALUES ('3190', '84', '5', '0.42');
INSERT INTO `tbl_rank` VALUES ('3191', '84', '6', '0.42');
INSERT INTO `tbl_rank` VALUES ('3192', '84', '7', '0.42');
INSERT INTO `tbl_rank` VALUES ('3193', '84', '8', '0.42');
INSERT INTO `tbl_rank` VALUES ('3194', '84', '9', '0.42');
INSERT INTO `tbl_rank` VALUES ('3195', '84', '10', '0.42');
INSERT INTO `tbl_rank` VALUES ('3196', '84', '11', '0.412');
INSERT INTO `tbl_rank` VALUES ('3197', '84', '12', '0.42');
INSERT INTO `tbl_rank` VALUES ('3198', '84', '13', '0.42');
INSERT INTO `tbl_rank` VALUES ('3199', '84', '14', '0.42');
INSERT INTO `tbl_rank` VALUES ('3200', '84', '15', '0.42');
INSERT INTO `tbl_rank` VALUES ('3201', '84', '16', '0.42');
INSERT INTO `tbl_rank` VALUES ('3202', '84', '17', '0.42');
INSERT INTO `tbl_rank` VALUES ('3203', '84', '18', '0.42');
INSERT INTO `tbl_rank` VALUES ('3204', '84', '19', '0.42');
INSERT INTO `tbl_rank` VALUES ('3205', '84', '20', '0.42');
INSERT INTO `tbl_rank` VALUES ('3206', '84', '21', '0.42');
INSERT INTO `tbl_rank` VALUES ('3207', '84', '22', '0.42');
INSERT INTO `tbl_rank` VALUES ('3208', '84', '23', '0.42');
INSERT INTO `tbl_rank` VALUES ('3209', '84', '24', '0.42');
INSERT INTO `tbl_rank` VALUES ('3210', '84', '25', '0.42');
INSERT INTO `tbl_rank` VALUES ('3211', '84', '26', '0.42');
INSERT INTO `tbl_rank` VALUES ('3212', '84', '27', '0.42');
INSERT INTO `tbl_rank` VALUES ('3213', '84', '28', '0.42');
INSERT INTO `tbl_rank` VALUES ('3214', '84', '29', '0.42');
INSERT INTO `tbl_rank` VALUES ('3215', '84', '30', '0.42');
INSERT INTO `tbl_rank` VALUES ('3216', '84', '31', '0.42');
INSERT INTO `tbl_rank` VALUES ('3217', '84', '32', '0.42');
INSERT INTO `tbl_rank` VALUES ('3218', '84', '33', '0.42');
INSERT INTO `tbl_rank` VALUES ('3219', '84', '34', '0.42');
INSERT INTO `tbl_rank` VALUES ('3220', '84', '35', '0.42');
INSERT INTO `tbl_rank` VALUES ('3221', '84', '36', '0.42');
INSERT INTO `tbl_rank` VALUES ('3222', '84', '38', '0.42');
INSERT INTO `tbl_rank` VALUES ('3223', '84', '39', '0.42');
INSERT INTO `tbl_rank` VALUES ('3224', '84', '40', '0.42');
INSERT INTO `tbl_rank` VALUES ('3225', '85', '1', '0.812');
INSERT INTO `tbl_rank` VALUES ('3226', '85', '2', '0.918');
INSERT INTO `tbl_rank` VALUES ('3227', '85', '3', '0.918');
INSERT INTO `tbl_rank` VALUES ('3228', '85', '4', '0.918');
INSERT INTO `tbl_rank` VALUES ('3229', '85', '5', '0.918');
INSERT INTO `tbl_rank` VALUES ('3230', '85', '6', '0.918');
INSERT INTO `tbl_rank` VALUES ('3231', '85', '7', '0.918');
INSERT INTO `tbl_rank` VALUES ('3232', '85', '8', '0.918');
INSERT INTO `tbl_rank` VALUES ('3233', '85', '9', '0.918');
INSERT INTO `tbl_rank` VALUES ('3234', '85', '10', '0.918');
INSERT INTO `tbl_rank` VALUES ('3235', '85', '11', '0.918');
INSERT INTO `tbl_rank` VALUES ('3236', '85', '12', '0.918');
INSERT INTO `tbl_rank` VALUES ('3237', '85', '13', '0.918');
INSERT INTO `tbl_rank` VALUES ('3238', '85', '14', '0.918');
INSERT INTO `tbl_rank` VALUES ('3239', '85', '15', '0.918');
INSERT INTO `tbl_rank` VALUES ('3240', '85', '16', '0.918');
INSERT INTO `tbl_rank` VALUES ('3241', '85', '17', '0.918');
INSERT INTO `tbl_rank` VALUES ('3242', '85', '18', '0.918');
INSERT INTO `tbl_rank` VALUES ('3243', '85', '19', '0.918');
INSERT INTO `tbl_rank` VALUES ('3244', '85', '20', '0.918');
INSERT INTO `tbl_rank` VALUES ('3245', '85', '21', '0.918');
INSERT INTO `tbl_rank` VALUES ('3246', '85', '22', '0.918');
INSERT INTO `tbl_rank` VALUES ('3247', '85', '23', '0.918');
INSERT INTO `tbl_rank` VALUES ('3248', '85', '24', '0.918');
INSERT INTO `tbl_rank` VALUES ('3249', '85', '25', '0.918');
INSERT INTO `tbl_rank` VALUES ('3250', '85', '26', '0.918');
INSERT INTO `tbl_rank` VALUES ('3251', '85', '27', '0.918');
INSERT INTO `tbl_rank` VALUES ('3252', '85', '28', '0.918');
INSERT INTO `tbl_rank` VALUES ('3253', '85', '29', '0.918');
INSERT INTO `tbl_rank` VALUES ('3254', '85', '30', '0.918');
INSERT INTO `tbl_rank` VALUES ('3255', '85', '31', '0.918');
INSERT INTO `tbl_rank` VALUES ('3256', '85', '32', '0.918');
INSERT INTO `tbl_rank` VALUES ('3257', '85', '33', '0.918');
INSERT INTO `tbl_rank` VALUES ('3258', '85', '34', '0.918');
INSERT INTO `tbl_rank` VALUES ('3259', '85', '35', '0.918');
INSERT INTO `tbl_rank` VALUES ('3260', '85', '36', '0.918');
INSERT INTO `tbl_rank` VALUES ('3261', '85', '38', '0.918');
INSERT INTO `tbl_rank` VALUES ('3262', '85', '39', '0.918');
INSERT INTO `tbl_rank` VALUES ('3263', '85', '40', '0.918');
INSERT INTO `tbl_rank` VALUES ('3264', '86', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('3265', '86', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('3266', '86', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('3267', '86', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('3268', '86', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('3269', '86', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('3270', '86', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('3271', '86', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('3272', '86', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('3273', '86', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('3274', '86', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('3275', '86', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('3276', '86', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('3277', '86', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('3278', '86', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('3279', '86', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('3280', '86', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('3281', '86', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('3282', '86', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('3283', '86', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('3284', '86', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('3285', '86', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('3286', '86', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('3287', '86', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('3288', '86', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('3289', '86', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('3290', '86', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('3291', '86', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('3292', '86', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('3293', '86', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('3294', '86', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('3295', '86', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('3296', '86', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('3297', '86', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('3298', '86', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('3299', '86', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('3300', '86', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('3301', '86', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('3302', '86', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('3303', '87', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('3304', '87', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('3305', '87', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('3306', '87', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('3307', '87', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('3308', '87', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('3309', '87', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('3310', '87', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('3311', '87', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('3312', '87', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('3313', '87', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('3314', '87', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('3315', '87', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('3316', '87', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('3317', '87', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('3318', '87', '16', '0.736');
INSERT INTO `tbl_rank` VALUES ('3319', '87', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('3320', '87', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('3321', '87', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('3322', '87', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('3323', '87', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('3324', '87', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('3325', '87', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('3326', '87', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('3327', '87', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('3328', '87', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('3329', '87', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('3330', '87', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('3331', '87', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('3332', '87', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('3333', '87', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('3334', '87', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('3335', '87', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('3336', '87', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('3337', '87', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('3338', '87', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('3339', '87', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('3340', '87', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('3341', '87', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('3342', '88', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('3343', '88', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('3344', '88', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('3345', '88', '4', '0.729');
INSERT INTO `tbl_rank` VALUES ('3346', '88', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('3347', '88', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('3348', '88', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('3349', '88', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('3350', '88', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('3351', '88', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('3352', '88', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('3353', '88', '12', '0.729');
INSERT INTO `tbl_rank` VALUES ('3354', '88', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('3355', '88', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('3356', '88', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('3357', '88', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('3358', '88', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('3359', '88', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('3360', '88', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('3361', '88', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('3362', '88', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('3363', '88', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('3364', '88', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('3365', '88', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('3366', '88', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('3367', '88', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('3368', '88', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('3369', '88', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('3370', '88', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('3371', '88', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('3372', '88', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('3373', '88', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('3374', '88', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('3375', '88', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('3376', '88', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('3377', '88', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('3378', '88', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('3379', '88', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('3380', '88', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('3381', '89', '1', '0.52');
INSERT INTO `tbl_rank` VALUES ('3382', '89', '2', '0.52');
INSERT INTO `tbl_rank` VALUES ('3383', '89', '3', '0.52');
INSERT INTO `tbl_rank` VALUES ('3384', '89', '4', '1.001');
INSERT INTO `tbl_rank` VALUES ('3385', '89', '5', '0.52');
INSERT INTO `tbl_rank` VALUES ('3386', '89', '6', '0.52');
INSERT INTO `tbl_rank` VALUES ('3387', '89', '7', '0.52');
INSERT INTO `tbl_rank` VALUES ('3388', '89', '8', '0.52');
INSERT INTO `tbl_rank` VALUES ('3389', '89', '9', '0.52');
INSERT INTO `tbl_rank` VALUES ('3390', '89', '10', '0.52');
INSERT INTO `tbl_rank` VALUES ('3391', '89', '11', '0.52');
INSERT INTO `tbl_rank` VALUES ('3392', '89', '12', '1.001');
INSERT INTO `tbl_rank` VALUES ('3393', '89', '13', '0.52');
INSERT INTO `tbl_rank` VALUES ('3394', '89', '14', '0.52');
INSERT INTO `tbl_rank` VALUES ('3395', '89', '15', '0.52');
INSERT INTO `tbl_rank` VALUES ('3396', '89', '16', '0.52');
INSERT INTO `tbl_rank` VALUES ('3397', '89', '17', '0.52');
INSERT INTO `tbl_rank` VALUES ('3398', '89', '18', '0.52');
INSERT INTO `tbl_rank` VALUES ('3399', '89', '19', '0.52');
INSERT INTO `tbl_rank` VALUES ('3400', '89', '20', '0.52');
INSERT INTO `tbl_rank` VALUES ('3401', '89', '21', '0.52');
INSERT INTO `tbl_rank` VALUES ('3402', '89', '22', '0.52');
INSERT INTO `tbl_rank` VALUES ('3403', '89', '23', '0.52');
INSERT INTO `tbl_rank` VALUES ('3404', '89', '24', '0.52');
INSERT INTO `tbl_rank` VALUES ('3405', '89', '25', '0.52');
INSERT INTO `tbl_rank` VALUES ('3406', '89', '26', '0.52');
INSERT INTO `tbl_rank` VALUES ('3407', '89', '27', '0.52');
INSERT INTO `tbl_rank` VALUES ('3408', '89', '28', '0.52');
INSERT INTO `tbl_rank` VALUES ('3409', '89', '29', '0.52');
INSERT INTO `tbl_rank` VALUES ('3410', '89', '30', '0.52');
INSERT INTO `tbl_rank` VALUES ('3411', '89', '31', '0.52');
INSERT INTO `tbl_rank` VALUES ('3412', '89', '32', '0.52');
INSERT INTO `tbl_rank` VALUES ('3413', '89', '33', '0.52');
INSERT INTO `tbl_rank` VALUES ('3414', '89', '34', '0.52');
INSERT INTO `tbl_rank` VALUES ('3415', '89', '35', '0.52');
INSERT INTO `tbl_rank` VALUES ('3416', '89', '36', '0.52');
INSERT INTO `tbl_rank` VALUES ('3417', '89', '38', '0.52');
INSERT INTO `tbl_rank` VALUES ('3418', '89', '39', '0.52');
INSERT INTO `tbl_rank` VALUES ('3419', '89', '40', '0.52');
INSERT INTO `tbl_rank` VALUES ('3420', '90', '1', '0.608');
INSERT INTO `tbl_rank` VALUES ('3421', '90', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('3422', '90', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('3423', '90', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('3424', '90', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('3425', '90', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('3426', '90', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('3427', '90', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('3428', '90', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('3429', '90', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('3430', '90', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('3431', '90', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('3432', '90', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('3433', '90', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('3434', '90', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('3435', '90', '16', '0.612');
INSERT INTO `tbl_rank` VALUES ('3436', '90', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('3437', '90', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('3438', '90', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('3439', '90', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('3440', '90', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('3441', '90', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('3442', '90', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('3443', '90', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('3444', '90', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('3445', '90', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('3446', '90', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('3447', '90', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('3448', '90', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('3449', '90', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('3450', '90', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('3451', '90', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('3452', '90', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('3453', '90', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('3454', '90', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('3455', '90', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('3456', '90', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('3457', '90', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('3458', '90', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('3459', '91', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('3460', '91', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('3461', '91', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('3462', '91', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('3463', '91', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('3464', '91', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('3465', '91', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('3466', '91', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('3467', '91', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('3468', '91', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('3469', '91', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('3470', '91', '12', '0.53');
INSERT INTO `tbl_rank` VALUES ('3471', '91', '13', '0.53');
INSERT INTO `tbl_rank` VALUES ('3472', '91', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('3473', '91', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('3474', '91', '16', '0.53');
INSERT INTO `tbl_rank` VALUES ('3475', '91', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('3476', '91', '18', '0.53');
INSERT INTO `tbl_rank` VALUES ('3477', '91', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('3478', '91', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('3479', '91', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('3480', '91', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('3481', '91', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('3482', '91', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('3483', '91', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('3484', '91', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('3485', '91', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('3486', '91', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('3487', '91', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('3488', '91', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('3489', '91', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('3490', '91', '32', '0.53');
INSERT INTO `tbl_rank` VALUES ('3491', '91', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('3492', '91', '34', '0.53');
INSERT INTO `tbl_rank` VALUES ('3493', '91', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('3494', '91', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('3495', '91', '38', '0.53');
INSERT INTO `tbl_rank` VALUES ('3496', '91', '39', '0.53');
INSERT INTO `tbl_rank` VALUES ('3497', '91', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('3498', '92', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('3499', '92', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('3500', '92', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('3501', '92', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('3502', '92', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('3503', '92', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('3504', '92', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('3505', '92', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('3506', '92', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('3507', '92', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('3508', '92', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('3509', '92', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('3510', '92', '13', '0.886');
INSERT INTO `tbl_rank` VALUES ('3511', '92', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('3512', '92', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('3513', '92', '16', '0.886');
INSERT INTO `tbl_rank` VALUES ('3514', '92', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('3515', '92', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('3516', '92', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('3517', '92', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('3518', '92', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('3519', '92', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('3520', '92', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('3521', '92', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('3522', '92', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('3523', '92', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('3524', '92', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('3525', '92', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('3526', '92', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('3527', '92', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('3528', '92', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('3529', '92', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('3530', '92', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('3531', '92', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('3532', '92', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('3533', '92', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('3534', '92', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('3535', '92', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('3536', '92', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('3537', '93', '1', '0.53');
INSERT INTO `tbl_rank` VALUES ('3538', '93', '2', '0.53');
INSERT INTO `tbl_rank` VALUES ('3539', '93', '3', '0.53');
INSERT INTO `tbl_rank` VALUES ('3540', '93', '4', '0.53');
INSERT INTO `tbl_rank` VALUES ('3541', '93', '5', '0.53');
INSERT INTO `tbl_rank` VALUES ('3542', '93', '6', '0.53');
INSERT INTO `tbl_rank` VALUES ('3543', '93', '7', '0.53');
INSERT INTO `tbl_rank` VALUES ('3544', '93', '8', '0.53');
INSERT INTO `tbl_rank` VALUES ('3545', '93', '9', '0.53');
INSERT INTO `tbl_rank` VALUES ('3546', '93', '10', '0.53');
INSERT INTO `tbl_rank` VALUES ('3547', '93', '11', '0.53');
INSERT INTO `tbl_rank` VALUES ('3548', '93', '12', '0.53');
INSERT INTO `tbl_rank` VALUES ('3549', '93', '13', '0.53');
INSERT INTO `tbl_rank` VALUES ('3550', '93', '14', '0.53');
INSERT INTO `tbl_rank` VALUES ('3551', '93', '15', '0.53');
INSERT INTO `tbl_rank` VALUES ('3552', '93', '16', '0.53');
INSERT INTO `tbl_rank` VALUES ('3553', '93', '17', '0.53');
INSERT INTO `tbl_rank` VALUES ('3554', '93', '18', '0.439');
INSERT INTO `tbl_rank` VALUES ('3555', '93', '19', '0.53');
INSERT INTO `tbl_rank` VALUES ('3556', '93', '20', '0.53');
INSERT INTO `tbl_rank` VALUES ('3557', '93', '21', '0.53');
INSERT INTO `tbl_rank` VALUES ('3558', '93', '22', '0.53');
INSERT INTO `tbl_rank` VALUES ('3559', '93', '23', '0.53');
INSERT INTO `tbl_rank` VALUES ('3560', '93', '24', '0.53');
INSERT INTO `tbl_rank` VALUES ('3561', '93', '25', '0.53');
INSERT INTO `tbl_rank` VALUES ('3562', '93', '26', '0.53');
INSERT INTO `tbl_rank` VALUES ('3563', '93', '27', '0.53');
INSERT INTO `tbl_rank` VALUES ('3564', '93', '28', '0.53');
INSERT INTO `tbl_rank` VALUES ('3565', '93', '29', '0.53');
INSERT INTO `tbl_rank` VALUES ('3566', '93', '30', '0.53');
INSERT INTO `tbl_rank` VALUES ('3567', '93', '31', '0.53');
INSERT INTO `tbl_rank` VALUES ('3568', '93', '32', '0.53');
INSERT INTO `tbl_rank` VALUES ('3569', '93', '33', '0.53');
INSERT INTO `tbl_rank` VALUES ('3570', '93', '34', '0.53');
INSERT INTO `tbl_rank` VALUES ('3571', '93', '35', '0.53');
INSERT INTO `tbl_rank` VALUES ('3572', '93', '36', '0.53');
INSERT INTO `tbl_rank` VALUES ('3573', '93', '38', '0.53');
INSERT INTO `tbl_rank` VALUES ('3574', '93', '39', '0.53');
INSERT INTO `tbl_rank` VALUES ('3575', '93', '40', '0.53');
INSERT INTO `tbl_rank` VALUES ('3576', '94', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('3577', '94', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('3578', '94', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('3579', '94', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('3580', '94', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('3581', '94', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('3582', '94', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('3583', '94', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('3584', '94', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('3585', '94', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('3586', '94', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('3587', '94', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('3588', '94', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('3589', '94', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('3590', '94', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('3591', '94', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('3592', '94', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('3593', '94', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('3594', '94', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('3595', '94', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('3596', '94', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('3597', '94', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('3598', '94', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('3599', '94', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('3600', '94', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('3601', '94', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('3602', '94', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('3603', '94', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('3604', '94', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('3605', '94', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('3606', '94', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('3607', '94', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('3608', '94', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('3609', '94', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('3610', '94', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('3611', '94', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('3612', '94', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('3613', '94', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('3614', '94', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('3615', '95', '1', '1.326');
INSERT INTO `tbl_rank` VALUES ('3616', '95', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('3617', '95', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('3618', '95', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('3619', '95', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('3620', '95', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('3621', '95', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('3622', '95', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('3623', '95', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('3624', '95', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('3625', '95', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('3626', '95', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('3627', '95', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('3628', '95', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('3629', '95', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('3630', '95', '16', '1.328');
INSERT INTO `tbl_rank` VALUES ('3631', '95', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('3632', '95', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('3633', '95', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('3634', '95', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('3635', '95', '21', '1.329');
INSERT INTO `tbl_rank` VALUES ('3636', '95', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('3637', '95', '23', '1.329');
INSERT INTO `tbl_rank` VALUES ('3638', '95', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('3639', '95', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('3640', '95', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('3641', '95', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('3642', '95', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('3643', '95', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('3644', '95', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('3645', '95', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('3646', '95', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('3647', '95', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('3648', '95', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('3649', '95', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('3650', '95', '36', '1.329');
INSERT INTO `tbl_rank` VALUES ('3651', '95', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('3652', '95', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('3653', '95', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('3654', '96', '1', '0.427');
INSERT INTO `tbl_rank` VALUES ('3655', '96', '2', '0.42');
INSERT INTO `tbl_rank` VALUES ('3656', '96', '3', '0.42');
INSERT INTO `tbl_rank` VALUES ('3657', '96', '4', '0.42');
INSERT INTO `tbl_rank` VALUES ('3658', '96', '5', '0.42');
INSERT INTO `tbl_rank` VALUES ('3659', '96', '6', '0.42');
INSERT INTO `tbl_rank` VALUES ('3660', '96', '7', '0.42');
INSERT INTO `tbl_rank` VALUES ('3661', '96', '8', '0.42');
INSERT INTO `tbl_rank` VALUES ('3662', '96', '9', '0.42');
INSERT INTO `tbl_rank` VALUES ('3663', '96', '10', '0.42');
INSERT INTO `tbl_rank` VALUES ('3664', '96', '11', '0.42');
INSERT INTO `tbl_rank` VALUES ('3665', '96', '12', '0.42');
INSERT INTO `tbl_rank` VALUES ('3666', '96', '13', '0.42');
INSERT INTO `tbl_rank` VALUES ('3667', '96', '14', '0.42');
INSERT INTO `tbl_rank` VALUES ('3668', '96', '15', '0.42');
INSERT INTO `tbl_rank` VALUES ('3669', '96', '16', '0.42');
INSERT INTO `tbl_rank` VALUES ('3670', '96', '17', '0.42');
INSERT INTO `tbl_rank` VALUES ('3671', '96', '18', '0.42');
INSERT INTO `tbl_rank` VALUES ('3672', '96', '19', '0.42');
INSERT INTO `tbl_rank` VALUES ('3673', '96', '20', '0.42');
INSERT INTO `tbl_rank` VALUES ('3674', '96', '21', '0.42');
INSERT INTO `tbl_rank` VALUES ('3675', '96', '22', '0.42');
INSERT INTO `tbl_rank` VALUES ('3676', '96', '23', '0.42');
INSERT INTO `tbl_rank` VALUES ('3677', '96', '24', '0.42');
INSERT INTO `tbl_rank` VALUES ('3678', '96', '25', '0.42');
INSERT INTO `tbl_rank` VALUES ('3679', '96', '26', '0.42');
INSERT INTO `tbl_rank` VALUES ('3680', '96', '27', '0.42');
INSERT INTO `tbl_rank` VALUES ('3681', '96', '28', '0.42');
INSERT INTO `tbl_rank` VALUES ('3682', '96', '29', '0.42');
INSERT INTO `tbl_rank` VALUES ('3683', '96', '30', '0.42');
INSERT INTO `tbl_rank` VALUES ('3684', '96', '31', '0.42');
INSERT INTO `tbl_rank` VALUES ('3685', '96', '32', '0.42');
INSERT INTO `tbl_rank` VALUES ('3686', '96', '33', '0.42');
INSERT INTO `tbl_rank` VALUES ('3687', '96', '34', '0.42');
INSERT INTO `tbl_rank` VALUES ('3688', '96', '35', '0.42');
INSERT INTO `tbl_rank` VALUES ('3689', '96', '36', '0.42');
INSERT INTO `tbl_rank` VALUES ('3690', '96', '38', '0.42');
INSERT INTO `tbl_rank` VALUES ('3691', '96', '39', '0.42');
INSERT INTO `tbl_rank` VALUES ('3692', '96', '40', '0.42');
INSERT INTO `tbl_rank` VALUES ('3693', '97', '1', '0.837');
INSERT INTO `tbl_rank` VALUES ('3694', '97', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('3695', '97', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('3696', '97', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('3697', '97', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('3698', '97', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('3699', '97', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('3700', '97', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('3701', '97', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('3702', '97', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('3703', '97', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('3704', '97', '12', '0.83');
INSERT INTO `tbl_rank` VALUES ('3705', '97', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('3706', '97', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('3707', '97', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('3708', '97', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('3709', '97', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('3710', '97', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('3711', '97', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('3712', '97', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('3713', '97', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('3714', '97', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('3715', '97', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('3716', '97', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('3717', '97', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('3718', '97', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('3719', '97', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('3720', '97', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('3721', '97', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('3722', '97', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('3723', '97', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('3724', '97', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('3725', '97', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('3726', '97', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('3727', '97', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('3728', '97', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('3729', '97', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('3730', '97', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('3731', '97', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('3732', '98', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('3733', '98', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('3734', '98', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('3735', '98', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('3736', '98', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('3737', '98', '6', '0.63');
INSERT INTO `tbl_rank` VALUES ('3738', '98', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('3739', '98', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('3740', '98', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('3741', '98', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('3742', '98', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('3743', '98', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('3744', '98', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('3745', '98', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('3746', '98', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('3747', '98', '16', '0.63');
INSERT INTO `tbl_rank` VALUES ('3748', '98', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('3749', '98', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('3750', '98', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('3751', '98', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('3752', '98', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('3753', '98', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('3754', '98', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('3755', '98', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('3756', '98', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('3757', '98', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('3758', '98', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('3759', '98', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('3760', '98', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('3761', '98', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('3762', '98', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('3763', '98', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('3764', '98', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('3765', '98', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('3766', '98', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('3767', '98', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('3768', '98', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('3769', '98', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('3770', '98', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('3771', '99', '1', '0.52');
INSERT INTO `tbl_rank` VALUES ('3772', '99', '2', '0.52');
INSERT INTO `tbl_rank` VALUES ('3773', '99', '3', '0.52');
INSERT INTO `tbl_rank` VALUES ('3774', '99', '4', '0.52');
INSERT INTO `tbl_rank` VALUES ('3775', '99', '5', '0.52');
INSERT INTO `tbl_rank` VALUES ('3776', '99', '6', '1.023');
INSERT INTO `tbl_rank` VALUES ('3777', '99', '7', '0.52');
INSERT INTO `tbl_rank` VALUES ('3778', '99', '8', '0.52');
INSERT INTO `tbl_rank` VALUES ('3779', '99', '9', '0.52');
INSERT INTO `tbl_rank` VALUES ('3780', '99', '10', '0.52');
INSERT INTO `tbl_rank` VALUES ('3781', '99', '11', '0.52');
INSERT INTO `tbl_rank` VALUES ('3782', '99', '12', '0.52');
INSERT INTO `tbl_rank` VALUES ('3783', '99', '13', '0.52');
INSERT INTO `tbl_rank` VALUES ('3784', '99', '14', '0.52');
INSERT INTO `tbl_rank` VALUES ('3785', '99', '15', '0.52');
INSERT INTO `tbl_rank` VALUES ('3786', '99', '16', '0.52');
INSERT INTO `tbl_rank` VALUES ('3787', '99', '17', '0.52');
INSERT INTO `tbl_rank` VALUES ('3788', '99', '18', '0.52');
INSERT INTO `tbl_rank` VALUES ('3789', '99', '19', '0.52');
INSERT INTO `tbl_rank` VALUES ('3790', '99', '20', '0.52');
INSERT INTO `tbl_rank` VALUES ('3791', '99', '21', '0.52');
INSERT INTO `tbl_rank` VALUES ('3792', '99', '22', '0.52');
INSERT INTO `tbl_rank` VALUES ('3793', '99', '23', '0.52');
INSERT INTO `tbl_rank` VALUES ('3794', '99', '24', '0.52');
INSERT INTO `tbl_rank` VALUES ('3795', '99', '25', '0.52');
INSERT INTO `tbl_rank` VALUES ('3796', '99', '26', '0.52');
INSERT INTO `tbl_rank` VALUES ('3797', '99', '27', '0.52');
INSERT INTO `tbl_rank` VALUES ('3798', '99', '28', '0.52');
INSERT INTO `tbl_rank` VALUES ('3799', '99', '29', '0.52');
INSERT INTO `tbl_rank` VALUES ('3800', '99', '30', '0.52');
INSERT INTO `tbl_rank` VALUES ('3801', '99', '31', '0.52');
INSERT INTO `tbl_rank` VALUES ('3802', '99', '32', '0.52');
INSERT INTO `tbl_rank` VALUES ('3803', '99', '33', '0.52');
INSERT INTO `tbl_rank` VALUES ('3804', '99', '34', '0.52');
INSERT INTO `tbl_rank` VALUES ('3805', '99', '35', '0.52');
INSERT INTO `tbl_rank` VALUES ('3806', '99', '36', '0.52');
INSERT INTO `tbl_rank` VALUES ('3807', '99', '38', '0.52');
INSERT INTO `tbl_rank` VALUES ('3808', '99', '39', '0.52');
INSERT INTO `tbl_rank` VALUES ('3809', '99', '40', '0.52');
INSERT INTO `tbl_rank` VALUES ('3810', '100', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('3811', '100', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('3812', '100', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('3813', '100', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('3814', '100', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('3815', '100', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('3816', '100', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('3817', '100', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('3818', '100', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('3819', '100', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('3820', '100', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('3821', '100', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('3822', '100', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('3823', '100', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('3824', '100', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('3825', '100', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('3826', '100', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('3827', '100', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('3828', '100', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('3829', '100', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('3830', '100', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('3831', '100', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('3832', '100', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('3833', '100', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('3834', '100', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('3835', '100', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('3836', '100', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('3837', '100', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('3838', '100', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('3839', '100', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('3840', '100', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('3841', '100', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('3842', '100', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('3843', '100', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('3844', '100', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('3845', '100', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('3846', '100', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('3847', '100', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('3848', '100', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('3849', '101', '1', '0.32');
INSERT INTO `tbl_rank` VALUES ('3850', '101', '2', '0.32');
INSERT INTO `tbl_rank` VALUES ('3851', '101', '3', '0.32');
INSERT INTO `tbl_rank` VALUES ('3852', '101', '4', '0.32');
INSERT INTO `tbl_rank` VALUES ('3853', '101', '5', '0.32');
INSERT INTO `tbl_rank` VALUES ('3854', '101', '6', '0.32');
INSERT INTO `tbl_rank` VALUES ('3855', '101', '7', '0.32');
INSERT INTO `tbl_rank` VALUES ('3856', '101', '8', '0.32');
INSERT INTO `tbl_rank` VALUES ('3857', '101', '9', '0.32');
INSERT INTO `tbl_rank` VALUES ('3858', '101', '10', '0.32');
INSERT INTO `tbl_rank` VALUES ('3859', '101', '11', '0.32');
INSERT INTO `tbl_rank` VALUES ('3860', '101', '12', '0.32');
INSERT INTO `tbl_rank` VALUES ('3861', '101', '13', '0.32');
INSERT INTO `tbl_rank` VALUES ('3862', '101', '14', '0.32');
INSERT INTO `tbl_rank` VALUES ('3863', '101', '15', '0.32');
INSERT INTO `tbl_rank` VALUES ('3864', '101', '16', '0.32');
INSERT INTO `tbl_rank` VALUES ('3865', '101', '17', '0.32');
INSERT INTO `tbl_rank` VALUES ('3866', '101', '18', '0.3');
INSERT INTO `tbl_rank` VALUES ('3867', '101', '19', '0.32');
INSERT INTO `tbl_rank` VALUES ('3868', '101', '20', '0.32');
INSERT INTO `tbl_rank` VALUES ('3869', '101', '21', '0.32');
INSERT INTO `tbl_rank` VALUES ('3870', '101', '22', '0.32');
INSERT INTO `tbl_rank` VALUES ('3871', '101', '23', '0.32');
INSERT INTO `tbl_rank` VALUES ('3872', '101', '24', '0.32');
INSERT INTO `tbl_rank` VALUES ('3873', '101', '25', '0.32');
INSERT INTO `tbl_rank` VALUES ('3874', '101', '26', '0.32');
INSERT INTO `tbl_rank` VALUES ('3875', '101', '27', '0.32');
INSERT INTO `tbl_rank` VALUES ('3876', '101', '28', '0.32');
INSERT INTO `tbl_rank` VALUES ('3877', '101', '29', '0.32');
INSERT INTO `tbl_rank` VALUES ('3878', '101', '30', '0.32');
INSERT INTO `tbl_rank` VALUES ('3879', '101', '31', '0.32');
INSERT INTO `tbl_rank` VALUES ('3880', '101', '32', '0.32');
INSERT INTO `tbl_rank` VALUES ('3881', '101', '33', '0.32');
INSERT INTO `tbl_rank` VALUES ('3882', '101', '34', '0.32');
INSERT INTO `tbl_rank` VALUES ('3883', '101', '35', '0.32');
INSERT INTO `tbl_rank` VALUES ('3884', '101', '36', '0.32');
INSERT INTO `tbl_rank` VALUES ('3885', '101', '38', '0.32');
INSERT INTO `tbl_rank` VALUES ('3886', '101', '39', '0.32');
INSERT INTO `tbl_rank` VALUES ('3887', '101', '40', '0.32');
INSERT INTO `tbl_rank` VALUES ('3888', '102', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('3889', '102', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('3890', '102', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('3891', '102', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('3892', '102', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('3893', '102', '6', '0.64');
INSERT INTO `tbl_rank` VALUES ('3894', '102', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('3895', '102', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('3896', '102', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('3897', '102', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('3898', '102', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('3899', '102', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('3900', '102', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('3901', '102', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('3902', '102', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('3903', '102', '16', '0.639');
INSERT INTO `tbl_rank` VALUES ('3904', '102', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('3905', '102', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('3906', '102', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('3907', '102', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('3908', '102', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('3909', '102', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('3910', '102', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('3911', '102', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('3912', '102', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('3913', '102', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('3914', '102', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('3915', '102', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('3916', '102', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('3917', '102', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('3918', '102', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('3919', '102', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('3920', '102', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('3921', '102', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('3922', '102', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('3923', '102', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('3924', '102', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('3925', '102', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('3926', '102', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('3927', '103', '1', '1.509');
INSERT INTO `tbl_rank` VALUES ('3928', '103', '2', '1.509');
INSERT INTO `tbl_rank` VALUES ('3929', '103', '3', '1.509');
INSERT INTO `tbl_rank` VALUES ('3930', '103', '4', '1.509');
INSERT INTO `tbl_rank` VALUES ('3931', '103', '5', '1.509');
INSERT INTO `tbl_rank` VALUES ('3932', '103', '6', '2.009');
INSERT INTO `tbl_rank` VALUES ('3933', '103', '7', '1.509');
INSERT INTO `tbl_rank` VALUES ('3934', '103', '8', '1.509');
INSERT INTO `tbl_rank` VALUES ('3935', '103', '9', '1.509');
INSERT INTO `tbl_rank` VALUES ('3936', '103', '10', '1.509');
INSERT INTO `tbl_rank` VALUES ('3937', '103', '11', '1.509');
INSERT INTO `tbl_rank` VALUES ('3938', '103', '12', '1.509');
INSERT INTO `tbl_rank` VALUES ('3939', '103', '13', '1.509');
INSERT INTO `tbl_rank` VALUES ('3940', '103', '14', '1.509');
INSERT INTO `tbl_rank` VALUES ('3941', '103', '15', '1.509');
INSERT INTO `tbl_rank` VALUES ('3942', '103', '16', '1.509');
INSERT INTO `tbl_rank` VALUES ('3943', '103', '17', '1.509');
INSERT INTO `tbl_rank` VALUES ('3944', '103', '18', '1.509');
INSERT INTO `tbl_rank` VALUES ('3945', '103', '19', '1.509');
INSERT INTO `tbl_rank` VALUES ('3946', '103', '20', '1.509');
INSERT INTO `tbl_rank` VALUES ('3947', '103', '21', '1.509');
INSERT INTO `tbl_rank` VALUES ('3948', '103', '22', '1.509');
INSERT INTO `tbl_rank` VALUES ('3949', '103', '23', '1.509');
INSERT INTO `tbl_rank` VALUES ('3950', '103', '24', '1.509');
INSERT INTO `tbl_rank` VALUES ('3951', '103', '25', '1.509');
INSERT INTO `tbl_rank` VALUES ('3952', '103', '26', '1.509');
INSERT INTO `tbl_rank` VALUES ('3953', '103', '27', '1.509');
INSERT INTO `tbl_rank` VALUES ('3954', '103', '28', '1.509');
INSERT INTO `tbl_rank` VALUES ('3955', '103', '29', '1.509');
INSERT INTO `tbl_rank` VALUES ('3956', '103', '30', '1.509');
INSERT INTO `tbl_rank` VALUES ('3957', '103', '31', '1.509');
INSERT INTO `tbl_rank` VALUES ('3958', '103', '32', '1.509');
INSERT INTO `tbl_rank` VALUES ('3959', '103', '33', '1.509');
INSERT INTO `tbl_rank` VALUES ('3960', '103', '34', '1.509');
INSERT INTO `tbl_rank` VALUES ('3961', '103', '35', '1.509');
INSERT INTO `tbl_rank` VALUES ('3962', '103', '36', '1.509');
INSERT INTO `tbl_rank` VALUES ('3963', '103', '38', '1.509');
INSERT INTO `tbl_rank` VALUES ('3964', '103', '39', '1.509');
INSERT INTO `tbl_rank` VALUES ('3965', '103', '40', '1.509');
INSERT INTO `tbl_rank` VALUES ('3966', '104', '1', '0.43');
INSERT INTO `tbl_rank` VALUES ('3967', '104', '2', '0.43');
INSERT INTO `tbl_rank` VALUES ('3968', '104', '3', '0.43');
INSERT INTO `tbl_rank` VALUES ('3969', '104', '4', '0.43');
INSERT INTO `tbl_rank` VALUES ('3970', '104', '5', '0.43');
INSERT INTO `tbl_rank` VALUES ('3971', '104', '6', '0.43');
INSERT INTO `tbl_rank` VALUES ('3972', '104', '7', '0.43');
INSERT INTO `tbl_rank` VALUES ('3973', '104', '8', '0.43');
INSERT INTO `tbl_rank` VALUES ('3974', '104', '9', '0.43');
INSERT INTO `tbl_rank` VALUES ('3975', '104', '10', '0.43');
INSERT INTO `tbl_rank` VALUES ('3976', '104', '11', '0.43');
INSERT INTO `tbl_rank` VALUES ('3977', '104', '12', '0.43');
INSERT INTO `tbl_rank` VALUES ('3978', '104', '13', '0.43');
INSERT INTO `tbl_rank` VALUES ('3979', '104', '14', '0.43');
INSERT INTO `tbl_rank` VALUES ('3980', '104', '15', '0.43');
INSERT INTO `tbl_rank` VALUES ('3981', '104', '16', '0.43');
INSERT INTO `tbl_rank` VALUES ('3982', '104', '17', '0.43');
INSERT INTO `tbl_rank` VALUES ('3983', '104', '18', '0.43');
INSERT INTO `tbl_rank` VALUES ('3984', '104', '19', '0.43');
INSERT INTO `tbl_rank` VALUES ('3985', '104', '20', '0.43');
INSERT INTO `tbl_rank` VALUES ('3986', '104', '21', '0.43');
INSERT INTO `tbl_rank` VALUES ('3987', '104', '22', '0.43');
INSERT INTO `tbl_rank` VALUES ('3988', '104', '23', '0.43');
INSERT INTO `tbl_rank` VALUES ('3989', '104', '24', '0.43');
INSERT INTO `tbl_rank` VALUES ('3990', '104', '25', '0.43');
INSERT INTO `tbl_rank` VALUES ('3991', '104', '26', '0.43');
INSERT INTO `tbl_rank` VALUES ('3992', '104', '27', '0.43');
INSERT INTO `tbl_rank` VALUES ('3993', '104', '28', '0.43');
INSERT INTO `tbl_rank` VALUES ('3994', '104', '29', '0.43');
INSERT INTO `tbl_rank` VALUES ('3995', '104', '30', '0.43');
INSERT INTO `tbl_rank` VALUES ('3996', '104', '31', '0.43');
INSERT INTO `tbl_rank` VALUES ('3997', '104', '32', '0.43');
INSERT INTO `tbl_rank` VALUES ('3998', '104', '33', '0.43');
INSERT INTO `tbl_rank` VALUES ('3999', '104', '34', '0.43');
INSERT INTO `tbl_rank` VALUES ('4000', '104', '35', '0.43');
INSERT INTO `tbl_rank` VALUES ('4001', '104', '36', '0.43');
INSERT INTO `tbl_rank` VALUES ('4002', '104', '38', '0.43');
INSERT INTO `tbl_rank` VALUES ('4003', '104', '39', '0.43');
INSERT INTO `tbl_rank` VALUES ('4004', '104', '40', '0.43');
INSERT INTO `tbl_rank` VALUES ('4005', '105', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4006', '105', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4007', '105', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4008', '105', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('4009', '105', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4010', '105', '6', '1.223');
INSERT INTO `tbl_rank` VALUES ('4011', '105', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('4012', '105', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('4013', '105', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4014', '105', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4015', '105', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4016', '105', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('4017', '105', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4018', '105', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4019', '105', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4020', '105', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('4021', '105', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4022', '105', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4023', '105', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4024', '105', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4025', '105', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4026', '105', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4027', '105', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4028', '105', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4029', '105', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4030', '105', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4031', '105', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4032', '105', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4033', '105', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4034', '105', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4035', '105', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4036', '105', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4037', '105', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4038', '105', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4039', '105', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4040', '105', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4041', '105', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4042', '105', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('4043', '105', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4044', '106', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4045', '106', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4046', '106', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4047', '106', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('4048', '106', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4049', '106', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('4050', '106', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('4051', '106', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('4052', '106', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4053', '106', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4054', '106', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4055', '106', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('4056', '106', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4057', '106', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4058', '106', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4059', '106', '16', '0.782');
INSERT INTO `tbl_rank` VALUES ('4060', '106', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4061', '106', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4062', '106', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4063', '106', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4064', '106', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4065', '106', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4066', '106', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4067', '106', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4068', '106', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4069', '106', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4070', '106', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4071', '106', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4072', '106', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4073', '106', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4074', '106', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4075', '106', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4076', '106', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4077', '106', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4078', '106', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4079', '106', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4080', '106', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4081', '106', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('4082', '106', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4083', '107', '1', '0.82');
INSERT INTO `tbl_rank` VALUES ('4084', '107', '2', '0.82');
INSERT INTO `tbl_rank` VALUES ('4085', '107', '3', '0.82');
INSERT INTO `tbl_rank` VALUES ('4086', '107', '4', '0.82');
INSERT INTO `tbl_rank` VALUES ('4087', '107', '5', '0.82');
INSERT INTO `tbl_rank` VALUES ('4088', '107', '6', '0.82');
INSERT INTO `tbl_rank` VALUES ('4089', '107', '7', '0.82');
INSERT INTO `tbl_rank` VALUES ('4090', '107', '8', '0.82');
INSERT INTO `tbl_rank` VALUES ('4091', '107', '9', '0.82');
INSERT INTO `tbl_rank` VALUES ('4092', '107', '10', '0.82');
INSERT INTO `tbl_rank` VALUES ('4093', '107', '11', '0.82');
INSERT INTO `tbl_rank` VALUES ('4094', '107', '12', '0.82');
INSERT INTO `tbl_rank` VALUES ('4095', '107', '13', '0.82');
INSERT INTO `tbl_rank` VALUES ('4096', '107', '14', '0.82');
INSERT INTO `tbl_rank` VALUES ('4097', '107', '15', '0.82');
INSERT INTO `tbl_rank` VALUES ('4098', '107', '16', '0.826');
INSERT INTO `tbl_rank` VALUES ('4099', '107', '17', '0.82');
INSERT INTO `tbl_rank` VALUES ('4100', '107', '18', '0.82');
INSERT INTO `tbl_rank` VALUES ('4101', '107', '19', '0.82');
INSERT INTO `tbl_rank` VALUES ('4102', '107', '20', '0.82');
INSERT INTO `tbl_rank` VALUES ('4103', '107', '21', '0.82');
INSERT INTO `tbl_rank` VALUES ('4104', '107', '22', '0.82');
INSERT INTO `tbl_rank` VALUES ('4105', '107', '23', '0.82');
INSERT INTO `tbl_rank` VALUES ('4106', '107', '24', '0.82');
INSERT INTO `tbl_rank` VALUES ('4107', '107', '25', '0.82');
INSERT INTO `tbl_rank` VALUES ('4108', '107', '26', '0.82');
INSERT INTO `tbl_rank` VALUES ('4109', '107', '27', '0.82');
INSERT INTO `tbl_rank` VALUES ('4110', '107', '28', '0.82');
INSERT INTO `tbl_rank` VALUES ('4111', '107', '29', '0.82');
INSERT INTO `tbl_rank` VALUES ('4112', '107', '30', '0.82');
INSERT INTO `tbl_rank` VALUES ('4113', '107', '31', '0.82');
INSERT INTO `tbl_rank` VALUES ('4114', '107', '32', '0.82');
INSERT INTO `tbl_rank` VALUES ('4115', '107', '33', '0.82');
INSERT INTO `tbl_rank` VALUES ('4116', '107', '34', '0.82');
INSERT INTO `tbl_rank` VALUES ('4117', '107', '35', '0.82');
INSERT INTO `tbl_rank` VALUES ('4118', '107', '36', '0.82');
INSERT INTO `tbl_rank` VALUES ('4119', '107', '38', '0.82');
INSERT INTO `tbl_rank` VALUES ('4120', '107', '39', '0.82');
INSERT INTO `tbl_rank` VALUES ('4121', '107', '40', '0.82');
INSERT INTO `tbl_rank` VALUES ('4122', '108', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('4123', '108', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('4124', '108', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('4125', '108', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('4126', '108', '5', '0.837');
INSERT INTO `tbl_rank` VALUES ('4127', '108', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('4128', '108', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('4129', '108', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('4130', '108', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('4131', '108', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('4132', '108', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('4133', '108', '12', '0.837');
INSERT INTO `tbl_rank` VALUES ('4134', '108', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('4135', '108', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('4136', '108', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('4137', '108', '16', '0.836');
INSERT INTO `tbl_rank` VALUES ('4138', '108', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('4139', '108', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('4140', '108', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('4141', '108', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('4142', '108', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('4143', '108', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('4144', '108', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('4145', '108', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('4146', '108', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('4147', '108', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('4148', '108', '27', '0.83');
INSERT INTO `tbl_rank` VALUES ('4149', '108', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('4150', '108', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('4151', '108', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('4152', '108', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('4153', '108', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('4154', '108', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('4155', '108', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('4156', '108', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('4157', '108', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('4158', '108', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('4159', '108', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('4160', '108', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('4161', '109', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('4162', '109', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('4163', '109', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('4164', '109', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('4165', '109', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('4166', '109', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('4167', '109', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('4168', '109', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('4169', '109', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('4170', '109', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('4171', '109', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('4172', '109', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('4173', '109', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('4174', '109', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('4175', '109', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('4176', '109', '16', '1.227');
INSERT INTO `tbl_rank` VALUES ('4177', '109', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('4178', '109', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('4179', '109', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('4180', '109', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('4181', '109', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('4182', '109', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('4183', '109', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('4184', '109', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('4185', '109', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('4186', '109', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('4187', '109', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('4188', '109', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('4189', '109', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('4190', '109', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('4191', '109', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('4192', '109', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('4193', '109', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('4194', '109', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('4195', '109', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('4196', '109', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('4197', '109', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('4198', '109', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('4199', '109', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('4200', '110', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('4201', '110', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('4202', '110', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('4203', '110', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('4204', '110', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('4205', '110', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('4206', '110', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('4207', '110', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('4208', '110', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('4209', '110', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('4210', '110', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('4211', '110', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('4212', '110', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('4213', '110', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('4214', '110', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('4215', '110', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('4216', '110', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('4217', '110', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('4218', '110', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('4219', '110', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('4220', '110', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('4221', '110', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('4222', '110', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('4223', '110', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('4224', '110', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('4225', '110', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('4226', '110', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('4227', '110', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('4228', '110', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('4229', '110', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('4230', '110', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('4231', '110', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('4232', '110', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('4233', '110', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('4234', '110', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('4235', '110', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('4236', '110', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('4237', '110', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('4238', '110', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('4239', '111', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('4240', '111', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('4241', '111', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('4242', '111', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('4243', '111', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('4244', '111', '6', '1.14');
INSERT INTO `tbl_rank` VALUES ('4245', '111', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('4246', '111', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('4247', '111', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('4248', '111', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('4249', '111', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('4250', '111', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('4251', '111', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('4252', '111', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('4253', '111', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('4254', '111', '16', '0.639');
INSERT INTO `tbl_rank` VALUES ('4255', '111', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('4256', '111', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('4257', '111', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('4258', '111', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('4259', '111', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('4260', '111', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('4261', '111', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('4262', '111', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('4263', '111', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('4264', '111', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('4265', '111', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('4266', '111', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('4267', '111', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('4268', '111', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('4269', '111', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('4270', '111', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('4271', '111', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('4272', '111', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('4273', '111', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('4274', '111', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('4275', '111', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('4276', '111', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('4277', '111', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('4278', '112', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('4279', '112', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('4280', '112', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('4281', '112', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('4282', '112', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('4283', '112', '6', '0.63');
INSERT INTO `tbl_rank` VALUES ('4284', '112', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('4285', '112', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('4286', '112', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('4287', '112', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('4288', '112', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('4289', '112', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('4290', '112', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('4291', '112', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('4292', '112', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('4293', '112', '16', '0.63');
INSERT INTO `tbl_rank` VALUES ('4294', '112', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('4295', '112', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('4296', '112', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('4297', '112', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('4298', '112', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('4299', '112', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('4300', '112', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('4301', '112', '24', '0.635');
INSERT INTO `tbl_rank` VALUES ('4302', '112', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('4303', '112', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('4304', '112', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('4305', '112', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('4306', '112', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('4307', '112', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('4308', '112', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('4309', '112', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('4310', '112', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('4311', '112', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('4312', '112', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('4313', '112', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('4314', '112', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('4315', '112', '39', '0.63');
INSERT INTO `tbl_rank` VALUES ('4316', '112', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('4317', '113', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4318', '113', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4319', '113', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4320', '113', '4', '1.718');
INSERT INTO `tbl_rank` VALUES ('4321', '113', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4322', '113', '6', '1.718');
INSERT INTO `tbl_rank` VALUES ('4323', '113', '7', '1.718');
INSERT INTO `tbl_rank` VALUES ('4324', '113', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('4325', '113', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4326', '113', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4327', '113', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4328', '113', '12', '1.718');
INSERT INTO `tbl_rank` VALUES ('4329', '113', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4330', '113', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4331', '113', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4332', '113', '16', '1.717');
INSERT INTO `tbl_rank` VALUES ('4333', '113', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4334', '113', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4335', '113', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4336', '113', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4337', '113', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4338', '113', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4339', '113', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4340', '113', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4341', '113', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4342', '113', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4343', '113', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4344', '113', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4345', '113', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4346', '113', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4347', '113', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4348', '113', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4349', '113', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4350', '113', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4351', '113', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4352', '113', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4353', '113', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4354', '113', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('4355', '113', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4356', '114', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4357', '114', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4358', '114', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4359', '114', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('4360', '114', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4361', '114', '6', '0.729');
INSERT INTO `tbl_rank` VALUES ('4362', '114', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('4363', '114', '8', '0.723');
INSERT INTO `tbl_rank` VALUES ('4364', '114', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4365', '114', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4366', '114', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4367', '114', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('4368', '114', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4369', '114', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4370', '114', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4371', '114', '16', '0.727');
INSERT INTO `tbl_rank` VALUES ('4372', '114', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4373', '114', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4374', '114', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4375', '114', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4376', '114', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4377', '114', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4378', '114', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4379', '114', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4380', '114', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4381', '114', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4382', '114', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4383', '114', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4384', '114', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4385', '114', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4386', '114', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4387', '114', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4388', '114', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4389', '114', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4390', '114', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4391', '114', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4392', '114', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4393', '114', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('4394', '114', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4395', '115', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4396', '115', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4397', '115', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4398', '115', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('4399', '115', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4400', '115', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('4401', '115', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('4402', '115', '8', '0.73');
INSERT INTO `tbl_rank` VALUES ('4403', '115', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4404', '115', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4405', '115', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4406', '115', '12', '0.733');
INSERT INTO `tbl_rank` VALUES ('4407', '115', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4408', '115', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4409', '115', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4410', '115', '16', '0.73');
INSERT INTO `tbl_rank` VALUES ('4411', '115', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4412', '115', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4413', '115', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4414', '115', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4415', '115', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4416', '115', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4417', '115', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4418', '115', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4419', '115', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4420', '115', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4421', '115', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4422', '115', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4423', '115', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4424', '115', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4425', '115', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4426', '115', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4427', '115', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4428', '115', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4429', '115', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4430', '115', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4431', '115', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4432', '115', '39', '0.73');
INSERT INTO `tbl_rank` VALUES ('4433', '115', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4434', '116', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('4435', '116', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('4436', '116', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('4437', '116', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('4438', '116', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('4439', '116', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('4440', '116', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('4441', '116', '8', '0.725');
INSERT INTO `tbl_rank` VALUES ('4442', '116', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('4443', '116', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('4444', '116', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('4445', '116', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('4446', '116', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('4447', '116', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('4448', '116', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('4449', '116', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('4450', '116', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('4451', '116', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('4452', '116', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('4453', '116', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('4454', '116', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('4455', '116', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('4456', '116', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('4457', '116', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('4458', '116', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('4459', '116', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('4460', '116', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('4461', '116', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('4462', '116', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('4463', '116', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('4464', '116', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('4465', '116', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('4466', '116', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('4467', '116', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('4468', '116', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('4469', '116', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('4470', '116', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('4471', '116', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('4472', '116', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('4473', '117', '1', '0.83');
INSERT INTO `tbl_rank` VALUES ('4474', '117', '2', '0.83');
INSERT INTO `tbl_rank` VALUES ('4475', '117', '3', '0.83');
INSERT INTO `tbl_rank` VALUES ('4476', '117', '4', '0.83');
INSERT INTO `tbl_rank` VALUES ('4477', '117', '5', '0.83');
INSERT INTO `tbl_rank` VALUES ('4478', '117', '6', '0.83');
INSERT INTO `tbl_rank` VALUES ('4479', '117', '7', '0.83');
INSERT INTO `tbl_rank` VALUES ('4480', '117', '8', '0.83');
INSERT INTO `tbl_rank` VALUES ('4481', '117', '9', '0.83');
INSERT INTO `tbl_rank` VALUES ('4482', '117', '10', '0.83');
INSERT INTO `tbl_rank` VALUES ('4483', '117', '11', '0.83');
INSERT INTO `tbl_rank` VALUES ('4484', '117', '12', '1.335');
INSERT INTO `tbl_rank` VALUES ('4485', '117', '13', '0.83');
INSERT INTO `tbl_rank` VALUES ('4486', '117', '14', '0.83');
INSERT INTO `tbl_rank` VALUES ('4487', '117', '15', '0.83');
INSERT INTO `tbl_rank` VALUES ('4488', '117', '16', '0.83');
INSERT INTO `tbl_rank` VALUES ('4489', '117', '17', '0.83');
INSERT INTO `tbl_rank` VALUES ('4490', '117', '18', '0.83');
INSERT INTO `tbl_rank` VALUES ('4491', '117', '19', '0.83');
INSERT INTO `tbl_rank` VALUES ('4492', '117', '20', '0.83');
INSERT INTO `tbl_rank` VALUES ('4493', '117', '21', '0.83');
INSERT INTO `tbl_rank` VALUES ('4494', '117', '22', '0.83');
INSERT INTO `tbl_rank` VALUES ('4495', '117', '23', '0.83');
INSERT INTO `tbl_rank` VALUES ('4496', '117', '24', '0.83');
INSERT INTO `tbl_rank` VALUES ('4497', '117', '25', '0.83');
INSERT INTO `tbl_rank` VALUES ('4498', '117', '26', '0.83');
INSERT INTO `tbl_rank` VALUES ('4499', '117', '27', '1.335');
INSERT INTO `tbl_rank` VALUES ('4500', '117', '28', '0.83');
INSERT INTO `tbl_rank` VALUES ('4501', '117', '29', '0.83');
INSERT INTO `tbl_rank` VALUES ('4502', '117', '30', '0.83');
INSERT INTO `tbl_rank` VALUES ('4503', '117', '31', '0.83');
INSERT INTO `tbl_rank` VALUES ('4504', '117', '32', '0.83');
INSERT INTO `tbl_rank` VALUES ('4505', '117', '33', '0.83');
INSERT INTO `tbl_rank` VALUES ('4506', '117', '34', '0.83');
INSERT INTO `tbl_rank` VALUES ('4507', '117', '35', '0.83');
INSERT INTO `tbl_rank` VALUES ('4508', '117', '36', '0.83');
INSERT INTO `tbl_rank` VALUES ('4509', '117', '38', '0.83');
INSERT INTO `tbl_rank` VALUES ('4510', '117', '39', '0.83');
INSERT INTO `tbl_rank` VALUES ('4511', '117', '40', '0.83');
INSERT INTO `tbl_rank` VALUES ('4512', '118', '1', '0.72');
INSERT INTO `tbl_rank` VALUES ('4513', '118', '2', '0.72');
INSERT INTO `tbl_rank` VALUES ('4514', '118', '3', '0.72');
INSERT INTO `tbl_rank` VALUES ('4515', '118', '4', '0.72');
INSERT INTO `tbl_rank` VALUES ('4516', '118', '5', '0.72');
INSERT INTO `tbl_rank` VALUES ('4517', '118', '6', '0.72');
INSERT INTO `tbl_rank` VALUES ('4518', '118', '7', '0.72');
INSERT INTO `tbl_rank` VALUES ('4519', '118', '8', '0.72');
INSERT INTO `tbl_rank` VALUES ('4520', '118', '9', '0.72');
INSERT INTO `tbl_rank` VALUES ('4521', '118', '10', '0.72');
INSERT INTO `tbl_rank` VALUES ('4522', '118', '11', '0.72');
INSERT INTO `tbl_rank` VALUES ('4523', '118', '12', '0.72');
INSERT INTO `tbl_rank` VALUES ('4524', '118', '13', '0.72');
INSERT INTO `tbl_rank` VALUES ('4525', '118', '14', '0.72');
INSERT INTO `tbl_rank` VALUES ('4526', '118', '15', '0.72');
INSERT INTO `tbl_rank` VALUES ('4527', '118', '16', '0.72');
INSERT INTO `tbl_rank` VALUES ('4528', '118', '17', '0.72');
INSERT INTO `tbl_rank` VALUES ('4529', '118', '18', '0.72');
INSERT INTO `tbl_rank` VALUES ('4530', '118', '19', '0.72');
INSERT INTO `tbl_rank` VALUES ('4531', '118', '20', '0.72');
INSERT INTO `tbl_rank` VALUES ('4532', '118', '21', '0.72');
INSERT INTO `tbl_rank` VALUES ('4533', '118', '22', '0.72');
INSERT INTO `tbl_rank` VALUES ('4534', '118', '23', '0.72');
INSERT INTO `tbl_rank` VALUES ('4535', '118', '24', '0.72');
INSERT INTO `tbl_rank` VALUES ('4536', '118', '25', '0.72');
INSERT INTO `tbl_rank` VALUES ('4537', '118', '26', '0.72');
INSERT INTO `tbl_rank` VALUES ('4538', '118', '27', '0.72');
INSERT INTO `tbl_rank` VALUES ('4539', '118', '28', '0.72');
INSERT INTO `tbl_rank` VALUES ('4540', '118', '29', '0.72');
INSERT INTO `tbl_rank` VALUES ('4541', '118', '30', '0.72');
INSERT INTO `tbl_rank` VALUES ('4542', '118', '31', '0.72');
INSERT INTO `tbl_rank` VALUES ('4543', '118', '32', '0.72');
INSERT INTO `tbl_rank` VALUES ('4544', '118', '33', '0.72');
INSERT INTO `tbl_rank` VALUES ('4545', '118', '34', '0.72');
INSERT INTO `tbl_rank` VALUES ('4546', '118', '35', '0.72');
INSERT INTO `tbl_rank` VALUES ('4547', '118', '36', '0.72');
INSERT INTO `tbl_rank` VALUES ('4548', '118', '38', '0.72');
INSERT INTO `tbl_rank` VALUES ('4549', '118', '39', '0.72');
INSERT INTO `tbl_rank` VALUES ('4550', '118', '40', '0.72');
INSERT INTO `tbl_rank` VALUES ('4551', '119', '1', '0.62');
INSERT INTO `tbl_rank` VALUES ('4552', '119', '2', '0.62');
INSERT INTO `tbl_rank` VALUES ('4553', '119', '3', '0.62');
INSERT INTO `tbl_rank` VALUES ('4554', '119', '4', '0.62');
INSERT INTO `tbl_rank` VALUES ('4555', '119', '5', '0.62');
INSERT INTO `tbl_rank` VALUES ('4556', '119', '6', '0.62');
INSERT INTO `tbl_rank` VALUES ('4557', '119', '7', '0.62');
INSERT INTO `tbl_rank` VALUES ('4558', '119', '8', '0.62');
INSERT INTO `tbl_rank` VALUES ('4559', '119', '9', '0.62');
INSERT INTO `tbl_rank` VALUES ('4560', '119', '10', '0.62');
INSERT INTO `tbl_rank` VALUES ('4561', '119', '11', '0.62');
INSERT INTO `tbl_rank` VALUES ('4562', '119', '12', '0.62');
INSERT INTO `tbl_rank` VALUES ('4563', '119', '13', '0.62');
INSERT INTO `tbl_rank` VALUES ('4564', '119', '14', '0.62');
INSERT INTO `tbl_rank` VALUES ('4565', '119', '15', '0.62');
INSERT INTO `tbl_rank` VALUES ('4566', '119', '16', '0.62');
INSERT INTO `tbl_rank` VALUES ('4567', '119', '17', '0.62');
INSERT INTO `tbl_rank` VALUES ('4568', '119', '18', '0.62');
INSERT INTO `tbl_rank` VALUES ('4569', '119', '19', '0.62');
INSERT INTO `tbl_rank` VALUES ('4570', '119', '20', '0.62');
INSERT INTO `tbl_rank` VALUES ('4571', '119', '21', '0.62');
INSERT INTO `tbl_rank` VALUES ('4572', '119', '22', '0.62');
INSERT INTO `tbl_rank` VALUES ('4573', '119', '23', '0.62');
INSERT INTO `tbl_rank` VALUES ('4574', '119', '24', '0.62');
INSERT INTO `tbl_rank` VALUES ('4575', '119', '25', '0.62');
INSERT INTO `tbl_rank` VALUES ('4576', '119', '26', '0.62');
INSERT INTO `tbl_rank` VALUES ('4577', '119', '27', '0.62');
INSERT INTO `tbl_rank` VALUES ('4578', '119', '28', '0.62');
INSERT INTO `tbl_rank` VALUES ('4579', '119', '29', '0.62');
INSERT INTO `tbl_rank` VALUES ('4580', '119', '30', '0.62');
INSERT INTO `tbl_rank` VALUES ('4581', '119', '31', '0.62');
INSERT INTO `tbl_rank` VALUES ('4582', '119', '32', '0.62');
INSERT INTO `tbl_rank` VALUES ('4583', '119', '33', '0.62');
INSERT INTO `tbl_rank` VALUES ('4584', '119', '34', '0.62');
INSERT INTO `tbl_rank` VALUES ('4585', '119', '35', '0.62');
INSERT INTO `tbl_rank` VALUES ('4586', '119', '36', '0.62');
INSERT INTO `tbl_rank` VALUES ('4587', '119', '38', '0.62');
INSERT INTO `tbl_rank` VALUES ('4588', '119', '39', '0.62');
INSERT INTO `tbl_rank` VALUES ('4589', '119', '40', '0.62');
INSERT INTO `tbl_rank` VALUES ('4590', '120', '1', '0.73');
INSERT INTO `tbl_rank` VALUES ('4591', '120', '2', '0.73');
INSERT INTO `tbl_rank` VALUES ('4592', '120', '3', '0.73');
INSERT INTO `tbl_rank` VALUES ('4593', '120', '4', '0.73');
INSERT INTO `tbl_rank` VALUES ('4594', '120', '5', '0.73');
INSERT INTO `tbl_rank` VALUES ('4595', '120', '6', '0.73');
INSERT INTO `tbl_rank` VALUES ('4596', '120', '7', '0.73');
INSERT INTO `tbl_rank` VALUES ('4597', '120', '8', '0.725');
INSERT INTO `tbl_rank` VALUES ('4598', '120', '9', '0.73');
INSERT INTO `tbl_rank` VALUES ('4599', '120', '10', '0.73');
INSERT INTO `tbl_rank` VALUES ('4600', '120', '11', '0.73');
INSERT INTO `tbl_rank` VALUES ('4601', '120', '12', '0.73');
INSERT INTO `tbl_rank` VALUES ('4602', '120', '13', '0.73');
INSERT INTO `tbl_rank` VALUES ('4603', '120', '14', '0.73');
INSERT INTO `tbl_rank` VALUES ('4604', '120', '15', '0.73');
INSERT INTO `tbl_rank` VALUES ('4605', '120', '16', '0.727');
INSERT INTO `tbl_rank` VALUES ('4606', '120', '17', '0.73');
INSERT INTO `tbl_rank` VALUES ('4607', '120', '18', '0.73');
INSERT INTO `tbl_rank` VALUES ('4608', '120', '19', '0.73');
INSERT INTO `tbl_rank` VALUES ('4609', '120', '20', '0.73');
INSERT INTO `tbl_rank` VALUES ('4610', '120', '21', '0.73');
INSERT INTO `tbl_rank` VALUES ('4611', '120', '22', '0.73');
INSERT INTO `tbl_rank` VALUES ('4612', '120', '23', '0.73');
INSERT INTO `tbl_rank` VALUES ('4613', '120', '24', '0.73');
INSERT INTO `tbl_rank` VALUES ('4614', '120', '25', '0.73');
INSERT INTO `tbl_rank` VALUES ('4615', '120', '26', '0.73');
INSERT INTO `tbl_rank` VALUES ('4616', '120', '27', '0.73');
INSERT INTO `tbl_rank` VALUES ('4617', '120', '28', '0.73');
INSERT INTO `tbl_rank` VALUES ('4618', '120', '29', '0.73');
INSERT INTO `tbl_rank` VALUES ('4619', '120', '30', '0.73');
INSERT INTO `tbl_rank` VALUES ('4620', '120', '31', '0.73');
INSERT INTO `tbl_rank` VALUES ('4621', '120', '32', '0.73');
INSERT INTO `tbl_rank` VALUES ('4622', '120', '33', '0.73');
INSERT INTO `tbl_rank` VALUES ('4623', '120', '34', '0.73');
INSERT INTO `tbl_rank` VALUES ('4624', '120', '35', '0.73');
INSERT INTO `tbl_rank` VALUES ('4625', '120', '36', '0.73');
INSERT INTO `tbl_rank` VALUES ('4626', '120', '38', '0.73');
INSERT INTO `tbl_rank` VALUES ('4627', '120', '39', '0.727');
INSERT INTO `tbl_rank` VALUES ('4628', '120', '40', '0.73');
INSERT INTO `tbl_rank` VALUES ('4629', '121', '1', '0.63');
INSERT INTO `tbl_rank` VALUES ('4630', '121', '2', '0.63');
INSERT INTO `tbl_rank` VALUES ('4631', '121', '3', '0.63');
INSERT INTO `tbl_rank` VALUES ('4632', '121', '4', '0.63');
INSERT INTO `tbl_rank` VALUES ('4633', '121', '5', '0.63');
INSERT INTO `tbl_rank` VALUES ('4634', '121', '6', '1.138');
INSERT INTO `tbl_rank` VALUES ('4635', '121', '7', '0.63');
INSERT INTO `tbl_rank` VALUES ('4636', '121', '8', '0.63');
INSERT INTO `tbl_rank` VALUES ('4637', '121', '9', '0.63');
INSERT INTO `tbl_rank` VALUES ('4638', '121', '10', '0.63');
INSERT INTO `tbl_rank` VALUES ('4639', '121', '11', '0.63');
INSERT INTO `tbl_rank` VALUES ('4640', '121', '12', '0.63');
INSERT INTO `tbl_rank` VALUES ('4641', '121', '13', '0.63');
INSERT INTO `tbl_rank` VALUES ('4642', '121', '14', '0.63');
INSERT INTO `tbl_rank` VALUES ('4643', '121', '15', '0.63');
INSERT INTO `tbl_rank` VALUES ('4644', '121', '16', '0.637');
INSERT INTO `tbl_rank` VALUES ('4645', '121', '17', '0.63');
INSERT INTO `tbl_rank` VALUES ('4646', '121', '18', '0.63');
INSERT INTO `tbl_rank` VALUES ('4647', '121', '19', '0.63');
INSERT INTO `tbl_rank` VALUES ('4648', '121', '20', '0.63');
INSERT INTO `tbl_rank` VALUES ('4649', '121', '21', '0.63');
INSERT INTO `tbl_rank` VALUES ('4650', '121', '22', '0.63');
INSERT INTO `tbl_rank` VALUES ('4651', '121', '23', '0.63');
INSERT INTO `tbl_rank` VALUES ('4652', '121', '24', '0.63');
INSERT INTO `tbl_rank` VALUES ('4653', '121', '25', '0.63');
INSERT INTO `tbl_rank` VALUES ('4654', '121', '26', '0.63');
INSERT INTO `tbl_rank` VALUES ('4655', '121', '27', '0.63');
INSERT INTO `tbl_rank` VALUES ('4656', '121', '28', '0.63');
INSERT INTO `tbl_rank` VALUES ('4657', '121', '29', '0.63');
INSERT INTO `tbl_rank` VALUES ('4658', '121', '30', '0.63');
INSERT INTO `tbl_rank` VALUES ('4659', '121', '31', '0.63');
INSERT INTO `tbl_rank` VALUES ('4660', '121', '32', '0.63');
INSERT INTO `tbl_rank` VALUES ('4661', '121', '33', '0.63');
INSERT INTO `tbl_rank` VALUES ('4662', '121', '34', '0.63');
INSERT INTO `tbl_rank` VALUES ('4663', '121', '35', '0.63');
INSERT INTO `tbl_rank` VALUES ('4664', '121', '36', '0.63');
INSERT INTO `tbl_rank` VALUES ('4665', '121', '38', '0.63');
INSERT INTO `tbl_rank` VALUES ('4666', '121', '39', '0.637');
INSERT INTO `tbl_rank` VALUES ('4667', '121', '40', '0.63');
INSERT INTO `tbl_rank` VALUES ('5415', '111', '47', '0.64');

-- ----------------------------
-- Table structure for `tbl_replacements`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_replacements`;
CREATE TABLE `tbl_replacements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `objeto` varchar(255) DEFAULT NULL,
  `subobjeto` varchar(255) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_replacements
-- ----------------------------
INSERT INTO `tbl_replacements` VALUES ('1', '##NOMBRE', 'especie', 'Aves', 'Especies', '');
INSERT INTO `tbl_replacements` VALUES ('2', '##APELLIDOS', 'fecha', 'Aves', 'Partes', '');
INSERT INTO `tbl_replacements` VALUES ('3', '##EDAD', 'parte_id', 'Aves', '', '');

-- ----------------------------
-- Table structure for `tbl_reportes`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reportes`;
CREATE TABLE `tbl_reportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporte` longtext,
  `base` longtext,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_reportes
-- ----------------------------
INSERT INTO `tbl_reportes` VALUES ('1', '<div class=\"WordSection1\">\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:center;line-height:150%\"><b><span style=\"font-size: 28pt; line-height: 150%; color: rgb(46, 116, 181); font-family: arial, helvetica, sans-serif;\">PROPUESTA ##EDAD DE DESARROLLO DE SISTEMA DE GESTIÓN DE INFORMACIÓN MULTIPLATAFORMA PARA EMPRESA AVÍCOLA DE CAMAGÜEY ##NOMBRE</span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><o:p>&nbsp;</o:p></p>\n\n</div>\n\n<span style=\"font-size:11.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"page-break-before:always;mso-break-type:section-break\">\n</span>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><a name=\"_Toc480806174\">INTRODUCCIÓN&nbsp;</a>##APELLIDOS<a></a></span></b><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El empleo de\nSistemas Automatizados de Gestión en el ámbito corporativo constituye en la\nactualidad la opción ideal para el manejo de toda empresa, independientemente\nde su tamaño, alcance y objeto. Esta adopción tecnológica, sistémicamente\nenfocada y conducida, posibilita no solo resultados en el orden inmediato; la\nmisma brinda, además, la posibilidad de basar cada decisión inminente&nbsp; o predictiva en el resultado informativo\nobtenido mediante el procesamiento del cúmulo de datos sucesivamente\nalmacenados. Dichos datos han de haber sido previamente sometidos a un conjunto\nde rutinas de verificación y corrección antes de ingresar al sistema,\nasegurando así su confiabilidad y certeza. Los algoritmos de decisión\nutilizados con tal fin, son ajustados y redefinidos tras cada puesta en\nejecución, optimizándose así, de forma progresiva, la precisión de sus resultados.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El presente\ndocumento refleja los aspectos fundamentales de la estructura arquitectónica y\nmetodología ingeniera propuestas en el diseño y elaboración del Sistema\nAutomatizado de Gestión de Información para “Empresa Avícola de Camagüey”.\nDicho proyecto ha sido concebido teniendo en cuenta la explotación y\naprovechamiento de aquellas plataformas de desarrollo e implantación, así como\nlas interfaces de conectividad, actualmente disponibles a nivel nacional. Dichos\nrecursos ofrecen un amplio y creciente abanico de posibilidades tecnológicas\npropicias para acentuar la eficiencia, confiablidad y seguridad de los\nproductos softwares desarrollados en la actualidad. Cabe puntualizar que esta\npropuesta es genérica, en base a las necesidades y disponibilidades\nempíricamente capturadas, ya que el levantamiento de requisitos propios del\nnegocio ha de constituirse dentro de la primera etapa de conducción del proceso\nde desarrollo.<o:p></o:p></span></p>\n\n<span style=\"font-size:11.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"mso-special-character:line-break;page-break-before:always\">\n</span>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><o:p>&nbsp;</o:p></p>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806175\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\">DESARROLLO</span></b></a><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<h2 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806176\"><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\">CARACTERÍSTICAS GENERALES DE LA PROPUESTA</span></a><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></h2>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El sistema\npropuesto se encuentra conformado por dos objetos de automatización, definidos\na partir de su objeto, objetivos, plataforma de desarrollo y características generales\nde Hosting. Dichos objetos se encontrarán en comunicación, y serán capaces de\nsincronizar sus datos en tiempo real, a través del empleo de una capa de\nservicios Web REST dotada con las características de interface de desarrollo de\nuna API.&nbsp; Estos objetos se detallan a\ncontinuación a partir de las características antes mencionadas:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><a name=\"_Toc480665104\"><b><i><u><span lang=\"EN-US\" style=\"font-size:13.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sitio Web Corporativo</span></u></i></b></a><b><i><u><span lang=\"EN-US\" style=\"font-size:13.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\"> <o:p></o:p></span></u></i></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objeto: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraph\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Acceso\ninformativo pertinente a usuarios de internet.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objetivos:<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Posibilitar al usuario\nregistrado la consulta de datos actualizados en tiempo real.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Proveer al usuario\nregistrado de una herramienta de comprobaciones, verificaciones y análisis.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Nutrir al usuario\nregistrado de informaciones, sugerencias y alertas en base a sus intereses\nparticulares.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Servir como\nproveedor de servicios web REST para el futuro intercambio de información y\nsincronización constante de bases de datos con la Aplicación Corporativa y la\nAplicación Android.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Plataforma de\ndesarrollo: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Sistema de\nGestión de Contenidos WordPress con empleo de plugins externos necesarios\n(Lenguaje PHP, DBMS MySQL, JavaScript, JSON).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nplugins propios para funcionalidades específicas del negocio.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><a name=\"_Toc480665105\"><b><i><u><span style=\"font-size:13.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Software de Gestión\nCorporativo</span></u></i></b></a><b><i><u><span style=\"font-size:13.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></u></i></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Objeto: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraph\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestión integral\nde procesos corporativos.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objetivos:<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Gestión de procesos informativos.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestión de\nanálisis estadísticos descriptivos e inferenciales<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Nutrición de\nSitio Web mediante sincronización de bases de datos<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Plataforma de\ndesarrollo: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Framework de\ndesarrollo Yii (Lenguaje PHP, DBMS MySQL, JavaScript, JSON).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Framework de\ndesarrollo Bootstrap (JavaScript, HTML5, CSS3).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nbiblioteca de funciones propias en lenguaje PHP.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nbiblioteca de funciones propias en lenguaje C.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Características mínimas requeridas de Hosting:\n<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><a name=\"_Toc480665106\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sistema Operativo: Linux o Windows<o:p></o:p></span></a></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Servidor web\nHTTP: Apache 2.2 + con PHP 5.1 + o Nginx con FPM SAPI habilitado<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Interprete\nLenguaje de Programación: PHP 5.6<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestor de Bases\nde Datos: MySQL 5.1<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">2 GB RAM<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Interfaz TCP/IP<o:p></o:p></span></p>\n\n\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">La decisión\nde separar estos objetos y posibilitar su comunicación mediante el desarrollo\nde una interfaz a propósito persigue un conjunto de objetivos concretos. Han\nsido seleccionados los más relevantes para detallarlos a continuación:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Seguridad:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Ningún usuario o cliente accede bajo ninguna\ncircunstancia a la base de datos central o las máquinas (Servidores\nlocales)&nbsp; que albergan a estas.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Eficiencia:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Se aprovechan los recursos de Hosting dedicados\nal manejo de CMS para el caso de la Web. La Aplicación &nbsp;Corporativa, a su vez, dispone del máximo de\nlos recursos locales y posibilita total libertad para caracterizar dichos\nservidores a propósito de nuestra plataforma y su estrategia de optimización\npropia.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Inmediatez y continuidad:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Ante un trabajo en la aplicación local, sus\nbases de datos, o la infraestructura de soporte de estas, no se afecta o cae\nningún servicio. En el caso de la próxima Aplicación Android, en el momento que\nno haya conectividad sigue disponiendo de todos sus datos y funcionalidades\noffline, en el momento de volver online los datos se actualizan automáticos\nmediante el módulo de sincronización de bases de datos.<o:p></o:p></span></p>\n\n<h2 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806183\"><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\">ORDEN DE EJECUCIÓN DE LOS OBJETOS DE AUTOMATIZACIÓN</span></a><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></h2>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Dado el\ncarácter estructuralmente distribuido y multiplataforma del proyecto, es\ndeterminante establecer el orden de prioridad en la ejecución de los objetos de\nautomatización. Para establecer dicho orden se recurre al análisis a partir del\ncriterio de dependencia funcional que se establece entre estos. El orden final,\nen consecuencia, es el mostrado a continuación:<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">1.<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Software de Gestión Corporativo <o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">2.<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sitio Web Corporativo<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Este orden\nresponde al hecho de que el Sitio Web depende informativamente del Software.\nLas operaciones de inserción, modificación y eliminación efectuadas en la base\nde datos central del Software determinan el estado de la información mostrada y\ndisponible en la Web. La Aplicación, por otra parte, depende funcionalmente de\nla Web para hace llegar al usuario remoto el subconjunto informativo\npreviamente extraído del Software. Este orden de ejecución se llevará a cabo\nsiguiendo los principios y pautas metodológicas correspondientes a SCRUM,\nanteriormente abordadas en este informe.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p>&nbsp;</o:p></span></p>\n\n<span style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"mso-special-character:line-break;page-break-before:always\">\n</span>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:\nCalibri;mso-bidi-theme-font:minor-latin\"><o:p>&nbsp;</o:p></span></p>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806184\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\">CONCLUSIONES</span></b></a><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Este\nproyecto se ha trazado como objetivo máximo la integración de aquellas técnicas\ny tecnologías informáticas que posibiliten contribuir, de manera eficiente y\ncon un enfoque integral, a la gestión de los procesos fundamentales de la Empresa\nAvícola de Camagüey. Este propósito se logra a través del diseño, desarrollo e\nimplementación de un Sistema de Gestión de Información soportado sobre una arquitectura\ndistribuida multiplataforma. En la búsqueda de tal propósito se hará empleo de\nlas técnicas, herramientas y metodologías analizadas en el presente informe\ntécnico. La explotación del producto resultante posibilitará una gestión\nadministrativa y comercial confiable y eficiente, a la vez que nutrirá de\nvalores positivos los indicadores corporativos concernientes a la eficacia,\neficiencia y control.&nbsp;</span><o:p></o:p></p>', '<div class=\"WordSection1\">\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:center;line-height:150%\"><b><span style=\"font-size: 28pt; line-height: 150%; color: rgb(46, 116, 181); font-family: arial, helvetica, sans-serif;\">PROPUESTA 7 DE DESARROLLO DE SISTEMA DE GESTIÓN DE INFORMACIÓN MULTIPLATAFORMA PARA EMPRESA AVÍCOLA DE CAMAGÜEY Campero</span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><o:p>&nbsp;</o:p></p>\n\n</div>\n\n<span style=\"font-size:11.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"page-break-before:always;mso-break-type:section-break\">\n</span>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><a name=\"_Toc480806174\">INTRODUCCIÓN&nbsp;</a>2018-01-29 00:00:00<a></a></span></b><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El empleo de\nSistemas Automatizados de Gestión en el ámbito corporativo constituye en la\nactualidad la opción ideal para el manejo de toda empresa, independientemente\nde su tamaño, alcance y objeto. Esta adopción tecnológica, sistémicamente\nenfocada y conducida, posibilita no solo resultados en el orden inmediato; la\nmisma brinda, además, la posibilidad de basar cada decisión inminente&nbsp; o predictiva en el resultado informativo\nobtenido mediante el procesamiento del cúmulo de datos sucesivamente\nalmacenados. Dichos datos han de haber sido previamente sometidos a un conjunto\nde rutinas de verificación y corrección antes de ingresar al sistema,\nasegurando así su confiabilidad y certeza. Los algoritmos de decisión\nutilizados con tal fin, son ajustados y redefinidos tras cada puesta en\nejecución, optimizándose así, de forma progresiva, la precisión de sus resultados.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El presente\ndocumento refleja los aspectos fundamentales de la estructura arquitectónica y\nmetodología ingeniera propuestas en el diseño y elaboración del Sistema\nAutomatizado de Gestión de Información para “Empresa Avícola de Camagüey”.\nDicho proyecto ha sido concebido teniendo en cuenta la explotación y\naprovechamiento de aquellas plataformas de desarrollo e implantación, así como\nlas interfaces de conectividad, actualmente disponibles a nivel nacional. Dichos\nrecursos ofrecen un amplio y creciente abanico de posibilidades tecnológicas\npropicias para acentuar la eficiencia, confiablidad y seguridad de los\nproductos softwares desarrollados en la actualidad. Cabe puntualizar que esta\npropuesta es genérica, en base a las necesidades y disponibilidades\nempíricamente capturadas, ya que el levantamiento de requisitos propios del\nnegocio ha de constituirse dentro de la primera etapa de conducción del proceso\nde desarrollo.<o:p></o:p></span></p>\n\n<span style=\"font-size:11.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"mso-special-character:line-break;page-break-before:always\">\n</span>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><o:p>&nbsp;</o:p></p>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806175\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\">DESARROLLO</span></b></a><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<h2 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806176\"><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\">CARACTERÍSTICAS GENERALES DE LA PROPUESTA</span></a><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></h2>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">El sistema\npropuesto se encuentra conformado por dos objetos de automatización, definidos\na partir de su objeto, objetivos, plataforma de desarrollo y características generales\nde Hosting. Dichos objetos se encontrarán en comunicación, y serán capaces de\nsincronizar sus datos en tiempo real, a través del empleo de una capa de\nservicios Web REST dotada con las características de interface de desarrollo de\nuna API.&nbsp; Estos objetos se detallan a\ncontinuación a partir de las características antes mencionadas:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><a name=\"_Toc480665104\"><b><i><u><span lang=\"EN-US\" style=\"font-size:13.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sitio Web Corporativo</span></u></i></b></a><b><i><u><span lang=\"EN-US\" style=\"font-size:13.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\"> <o:p></o:p></span></u></i></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objeto: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraph\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Acceso\ninformativo pertinente a usuarios de internet.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objetivos:<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Posibilitar al usuario\nregistrado la consulta de datos actualizados en tiempo real.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Proveer al usuario\nregistrado de una herramienta de comprobaciones, verificaciones y análisis.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Nutrir al usuario\nregistrado de informaciones, sugerencias y alertas en base a sus intereses\nparticulares.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Servir como\nproveedor de servicios web REST para el futuro intercambio de información y\nsincronización constante de bases de datos con la Aplicación Corporativa y la\nAplicación Android.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Plataforma de\ndesarrollo: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Sistema de\nGestión de Contenidos WordPress con empleo de plugins externos necesarios\n(Lenguaje PHP, DBMS MySQL, JavaScript, JSON).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nplugins propios para funcionalidades específicas del negocio.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><a name=\"_Toc480665105\"><b><i><u><span style=\"font-size:13.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Software de Gestión\nCorporativo</span></u></i></b></a><b><i><u><span style=\"font-size:13.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></u></i></b></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Objeto: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraph\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestión integral\nde procesos corporativos.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Objetivos:<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Gestión de procesos informativos.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestión de\nanálisis estadísticos descriptivos e inferenciales<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Nutrición de\nSitio Web mediante sincronización de bases de datos<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">Plataforma de\ndesarrollo: <o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Framework de\ndesarrollo Yii (Lenguaje PHP, DBMS MySQL, JavaScript, JSON).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Framework de\ndesarrollo Bootstrap (JavaScript, HTML5, CSS3).<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nbiblioteca de funciones propias en lenguaje PHP.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;\nline-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\nSymbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Desarrollo de\nbiblioteca de funciones propias en lenguaje C.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><i><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Características mínimas requeridas de Hosting:\n<o:p></o:p></span></u></i></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><a name=\"_Toc480665106\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sistema Operativo: Linux o Windows<o:p></o:p></span></a></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Servidor web\nHTTP: Apache 2.2 + con PHP 5.1 + o Nginx con FPM SAPI habilitado<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Interprete\nLenguaje de Programación: PHP 5.6<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:\n12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;line-height:150%;\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Gestor de Bases\nde Datos: MySQL 5.1<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">2 GB RAM<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-indent:-18.0pt;line-height:150%;mso-list:l2 level1 lfo2\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:Symbol;mso-fareast-font-family:\nSymbol;mso-bidi-font-family:Symbol;mso-ansi-language:EN-US\">·<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Interfaz TCP/IP<o:p></o:p></span></p>\n\n\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">La decisión\nde separar estos objetos y posibilitar su comunicación mediante el desarrollo\nde una interfaz a propósito persigue un conjunto de objetivos concretos. Han\nsido seleccionados los más relevantes para detallarlos a continuación:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Seguridad:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Ningún usuario o cliente accede bajo ninguna\ncircunstancia a la base de datos central o las máquinas (Servidores\nlocales)&nbsp; que albergan a estas.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Eficiencia:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Se aprovechan los recursos de Hosting dedicados\nal manejo de CMS para el caso de la Web. La Aplicación &nbsp;Corporativa, a su vez, dispone del máximo de\nlos recursos locales y posibilita total libertad para caracterizar dichos\nservidores a propósito de nuestra plataforma y su estrategia de optimización\npropia.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><b><u><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\">Inmediatez y continuidad:</span></u></b><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin\"> Ante un trabajo en la aplicación local, sus\nbases de datos, o la infraestructura de soporte de estas, no se afecta o cae\nningún servicio. En el caso de la próxima Aplicación Android, en el momento que\nno haya conectividad sigue disponiendo de todos sus datos y funcionalidades\noffline, en el momento de volver online los datos se actualizan automáticos\nmediante el módulo de sincronización de bases de datos.<o:p></o:p></span></p>\n\n<h2 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806183\"><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\">ORDEN DE EJECUCIÓN DE LOS OBJETOS DE AUTOMATIZACIÓN</span></a><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></h2>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Dado el\ncarácter estructuralmente distribuido y multiplataforma del proyecto, es\ndeterminante establecer el orden de prioridad en la ejecución de los objetos de\nautomatización. Para establecer dicho orden se recurre al análisis a partir del\ncriterio de dependencia funcional que se establece entre estos. El orden final,\nen consecuencia, es el mostrado a continuación:<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpFirst\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">1.<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Software de Gestión Corporativo <o:p></o:p></span></p>\n\n<p class=\"MsoListParagraphCxSpLast\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;mso-add-space:auto;text-align:justify;text-indent:-18.0pt;line-height:\n150%;mso-list:l1 level1 lfo3\"><!--[if !supportLists]--><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:Calibri;\nmso-bidi-theme-font:minor-latin;mso-ansi-language:EN-US\">2.<span style=\"font-variant-numeric: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span><!--[endif]--><span lang=\"EN-US\" style=\"font-size:12.0pt;\nline-height:150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:EN-US\">Sitio Web Corporativo<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Este orden\nresponde al hecho de que el Sitio Web depende informativamente del Software.\nLas operaciones de inserción, modificación y eliminación efectuadas en la base\nde datos central del Software determinan el estado de la información mostrada y\ndisponible en la Web. La Aplicación, por otra parte, depende funcionalmente de\nla Web para hace llegar al usuario remoto el subconjunto informativo\npreviamente extraído del Software. Este orden de ejecución se llevará a cabo\nsiguiendo los principios y pautas metodológicas correspondientes a SCRUM,\nanteriormente abordadas en este informe.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p>&nbsp;</o:p></span></p>\n\n<span style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\nminor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin;\nmso-ansi-language:ES-TRAD;mso-fareast-language:EN-US;mso-bidi-language:AR-SA\"><br clear=\"all\" style=\"mso-special-character:line-break;page-break-before:always\">\n</span>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\nline-height:150%\"><span style=\"font-size:12.0pt;line-height:150%;mso-bidi-font-family:\nCalibri;mso-bidi-theme-font:minor-latin\"><o:p>&nbsp;</o:p></span></p>\n\n<h1 style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:150%\"><a name=\"_Toc480806184\"><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;\nmso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-latin\">CONCLUSIONES</span></b></a><b><span style=\"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;\nmso-ascii-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:\nminor-latin\"><o:p></o:p></span></b></h1>\n\n<p class=\"MsoNormal\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;\ntext-align:justify;line-height:150%\"><span style=\"font-size:12.0pt;line-height:\n150%;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\">Este\nproyecto se ha trazado como objetivo máximo la integración de aquellas técnicas\ny tecnologías informáticas que posibiliten contribuir, de manera eficiente y\ncon un enfoque integral, a la gestión de los procesos fundamentales de la Empresa\nAvícola de Camagüey. Este propósito se logra a través del diseño, desarrollo e\nimplementación de un Sistema de Gestión de Información soportado sobre una arquitectura\ndistribuida multiplataforma. En la búsqueda de tal propósito se hará empleo de\nlas técnicas, herramientas y metodologías analizadas en el presente informe\ntécnico. La explotación del producto resultante posibilitará una gestión\nadministrativa y comercial confiable y eficiente, a la vez que nutrirá de\nvalores positivos los indicadores corporativos concernientes a la eficacia,\neficiencia y control.&nbsp;</span><o:p></o:p></p>', 'Reporte 1');
INSERT INTO `tbl_reportes` VALUES ('2', '<h5 style=\"text-align: center;\"><span style=\"font-size: x-large; font-weight: bold;\">REY REPORTE</span></h5>', '', 'Reporte 2');

-- ----------------------------
-- Table structure for `tbl_servicios`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_servicios`;
CREATE TABLE `tbl_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_servicios
-- ----------------------------
INSERT INTO `tbl_servicios` VALUES ('1', 'Gastronomía');
INSERT INTO `tbl_servicios` VALUES ('2', 'Comercio');

-- ----------------------------
-- Table structure for `tbl_subitems`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subitems`;
CREATE TABLE `tbl_subitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `subitem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `tbl_subitems_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `tbl_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_subitems
-- ----------------------------
INSERT INTO `tbl_subitems` VALUES ('1', '1', 'FFFFF');
INSERT INTO `tbl_subitems` VALUES ('2', '2', 'hyhyhyhyh');
INSERT INTO `tbl_subitems` VALUES ('3', '3', 'GGGGG');

-- ----------------------------
-- Table structure for `tbl_tipos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tipos`;
CREATE TABLE `tbl_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_tipos
-- ----------------------------
INSERT INTO `tbl_tipos` VALUES ('1', 'D');

-- ----------------------------
-- Table structure for `tbl_usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE `tbl_usuarios` (
  `id` int(11) NOT NULL,
  `nick` longtext NOT NULL,
  `password` longtext NOT NULL,
  `nombapel` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_usuarios
-- ----------------------------
INSERT INTO `tbl_usuarios` VALUES ('1', 'root', '0a23fda2b883b5cf93480e06ab1da6ab', 'root');
