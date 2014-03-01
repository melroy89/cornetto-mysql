SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cornetto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `cornetto` ;

-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_lexical_units`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_lexical_units` (
  `lu_id` VARCHAR(45) NOT NULL ,
  `cdb_lu_c_seq_nr` INT NULL ,
  `cdb_lu_comment` VARCHAR(255) NULL ,
  `cdb_lu_is_complete` TINYINT(1) NULL ,
  `cdb_lu_type` VARCHAR(45) NULL ,
  `form_count` VARCHAR(45) NULL ,
  `form_form-cat` VARCHAR(85) NULL ,
  `form_form-formvar` VARCHAR(255) NULL ,
  `form_form-length` VARCHAR(65) NULL ,
  `form_form-spelling` VARCHAR(120) NULL ,
  `form_form-spelvar` VARCHAR(255) NULL ,
  `form_subcount` VARCHAR(45) NULL ,
  `morphology_adj_mor-base` VARCHAR(85) NULL ,
  `morphology_adj_mor-comparative` VARCHAR(120) NULL ,
  `morphology_adj_mor-comparison` VARCHAR(85) NULL ,
  `morphology_adj_mor-declinability` VARCHAR(45) NULL ,
  `morphology_adj_mor-flectional-type` VARCHAR(45) NULL ,
  `morphology_adj_mor-superlative` VARCHAR(120) NULL ,
  `morphology_adj_morpho-structure` VARCHAR(45) NULL ,
  `morphology_adj_morpho-type` VARCHAR(45) NULL ,
  `morphology_noun_morpho-structure` VARCHAR(45) NULL ,
  `morphology_noun_morpho-type` VARCHAR(45) NULL ,
  `morphology_verb_flex-mode` VARCHAR(45) NULL ,
  `morphology_verb_flex-number` VARCHAR(45) NULL ,
  `morphology_verb_flex-person` VARCHAR(45) NULL ,
  `morphology_verb_flex-tense` VARCHAR(45) NULL ,
  `morphology_verb_morpho-structure` VARCHAR(45) NULL ,
  `morphology_verb_morpho-type` VARCHAR(45) NULL ,
  `prag-chronology_prag-chronology` VARCHAR(45) NULL ,
  `prag-connotation_prag-connotation` VARCHAR(45) NULL ,
  `prag-domain_general` VARCHAR(45) NULL ,
  `prag-domain_subjectfield` VARCHAR(45) NULL ,
  `prag-frequency_prag-frequency` VARCHAR(45) NULL ,
  `prag-geography_prag-geography` VARCHAR(45) NULL ,
  `prag-origin_prag-origin` VARCHAR(45) NULL ,
  `prag-socGroup_prag-socGroup` VARCHAR(45) NULL ,
  `prag-style_prag-style` VARCHAR(45) NULL ,
  `prag-subj-gen_prag-subj-gen` VARCHAR(45) NULL ,
  `sem-definition_sem-def` MEDIUMTEXT NULL ,
  `sem-definition_sem-defSource` VARCHAR(45) NULL ,
  `sem-definition_sem-genus` MEDIUMTEXT NULL ,
  `sem-definition_sem-specificae` LONGTEXT NULL ,
  `sem-hypernym_r_form` VARCHAR(90) NULL ,
  `semantics_adj_sem-resume` VARCHAR(255) NULL ,
  `semantics_adj_sem-shift` VARCHAR(255) NULL ,
  `semantics_adj_sem-subclass` VARCHAR(45) NULL ,
  `semantics_adj_sem-type` VARCHAR(45) NULL ,
  `semantics_noun_sem-countability` VARCHAR(45) NULL ,
  `semantics_noun_sem-reference` VARCHAR(45) NULL ,
  `semantics_noun_sem-resume` VARCHAR(255) NULL ,
  `semantics_noun_sem-shift` VARCHAR(255) NULL ,
  `semantics_noun_sem-subclass` VARCHAR(255) NULL ,
  `semantics_noun_sem-type` VARCHAR(45) NULL ,
  `semantics_verb_sem-resume` VARCHAR(255) NULL ,
  `semantics_verb_sem-selrestriction` VARCHAR(255) NULL ,
  `semantics_verb_sem-type` VARCHAR(45) NULL ,
  `syntax_adj_sy-advusage` VARCHAR(45) NULL ,
  `syntax_adj_sy-complementation` VARCHAR(45) NULL ,
  `syntax_adj_sy-position` VARCHAR(45) NULL ,
  `syntax_noun_sy-article` VARCHAR(45) NULL ,
  `syntax_noun_sy-complementation` VARCHAR(45) NULL ,
  `syntax_noun_sy-gender` VARCHAR(45) NULL ,
  `syntax_noun_sy-number` VARCHAR(45) NULL ,
  `syntax_verb_sy-class` VARCHAR(45) NULL ,
  `syntax_verb_sy-peraux` VARCHAR(45) NULL ,
  `syntax_verb_sy-reflexiv` VARCHAR(45) NULL ,
  `syntax_verb_sy-separ` VARCHAR(45) NULL ,
  `syntax_verb_sy-subject` VARCHAR(45) NULL ,
  `syntax_verb_sy-trans` VARCHAR(45) NULL ,
  `syntax_verb_sy-valency` VARCHAR(45) NULL ,
  PRIMARY KEY (`lu_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_examples`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_examples` (
  `ex_id` VARCHAR(45) NOT NULL ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `form_example_canonicalform` MEDIUMTEXT NULL ,
  `form_example_category` VARCHAR(45) NULL ,
  `form_example_text-category` VARCHAR(45) NULL ,
  `form_example_textualform` MEDIUMTEXT NULL ,
  `semantics_example_sem-gc-compl` VARCHAR(45) NULL ,
  `semantics_example_sem-gc-gramword` VARCHAR(45) NULL ,
  `semantics_example_sem-lc-collocator` VARCHAR(45) NULL ,
  `semantics_example_sem-meaningdescription` MEDIUMTEXT NULL ,
  `semantics_example_sem-spec-collocator` VARCHAR(45) NULL ,
  `semantics_example_sem-subtype-argument` VARCHAR(45) NULL ,
  `syntax_example_sy-subtype` VARCHAR(45) NULL ,
  `syntax_example_sy-type` VARCHAR(45) NULL ,
  PRIMARY KEY (`ex_id`) ,
  INDEX `fk_cornetto_examples_cornetto_lexical_units_idx` (`lu_id` ASC) ,
  CONSTRAINT `fk_cornetto_examples_cornetto_lexical_units`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_combipairs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_combipairs` (
  `combipairs_id` INT NOT NULL AUTO_INCREMENT ,
  `ex_id` VARCHAR(45) NOT NULL ,
  `sy-combicat` VARCHAR(45) NULL ,
  `sy-combiword` VARCHAR(45) NULL ,
  PRIMARY KEY (`combipairs_id`) ,
  INDEX `fk_cornetto_combipairs_cornetto_examples1_idx` (`ex_id` ASC) ,
  CONSTRAINT `fk_cornetto_combipairs_cornetto_examples1`
    FOREIGN KEY (`ex_id` )
    REFERENCES `cornetto`.`cornetto_examples` (`ex_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_syntax_complementations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_syntax_complementations` (
  `syntax_complementations_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `sy-comp` VARCHAR(45) NULL ,
  `sy-compl-text` VARCHAR(45) NULL ,
  PRIMARY KEY (`syntax_complementations_id`) ,
  CONSTRAINT `fk_cornetto_syntax_complementations_cornetto_lexical_units1`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_semantics_caseframe_args`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_semantics_caseframe_args` (
  `semantics_caseframe_args_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `caserole` VARCHAR(45) NULL ,
  `selrestrole` VARCHAR(45) NULL ,
  `synset_list` VARCHAR(45) NULL ,
  INDEX `fk_cornetto_semantics_caseframe_args_cornetto_lexical_units_idx` (`lu_id` ASC) ,
  PRIMARY KEY (`semantics_caseframe_args_id`) ,
  CONSTRAINT `fk_cornetto_semantics_caseframe_args_cornetto_lexical_units2`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_morphology_flex_conjugation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_morphology_flex_conjugation` (
  `morphology_flex_conjugation_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `flex-conjugationtype` VARCHAR(45) NULL ,
  `flex-pastpart` VARCHAR(45) NULL ,
  `flex-pasttense` VARCHAR(45) NULL ,
  PRIMARY KEY (`morphology_flex_conjugation_id`) ,
  CONSTRAINT `fk_cornetto_morphology_flex_conjugation_cornetto_lexical_units1`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_morphology_plurforms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_morphology_plurforms` (
  `morphology_plurforms_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `morpho-plurform` VARCHAR(45) NULL ,
  PRIMARY KEY (`morphology_plurforms_id`) ,
  CONSTRAINT `fk_cornetto_morphology_plurforms_cornetto_lexical_units1`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_semantics_synonyms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_semantics_synonyms` (
  `semantics_synonyms_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `sem-synonym_r_form` VARCHAR(255) NULL ,
  PRIMARY KEY (`semantics_synonyms_id`) ,
  CONSTRAINT `fk_cornetto_semantics_synonyms_cornetto_lexical_units1`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_semantics_selrestrictions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_semantics_selrestrictions` (
  `semantics_selrestrictions_id` INT NOT NULL AUTO_INCREMENT ,
  `lu_id` VARCHAR(45) NOT NULL ,
  `selrestriction` VARCHAR(65) NULL ,
  PRIMARY KEY (`semantics_selrestrictions_id`) ,
  INDEX `fk_cornetto_semantics_selrestrictions_cornetto_lexical_unit_idx` (`lu_id` ASC) ,
  CONSTRAINT `fk_cornetto_semantics_selrestrictions_cornetto_lexical_units1`
    FOREIGN KEY (`lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_synsets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_synsets` (
  `synset_id` VARCHAR(45) NOT NULL ,
  `cdb_synset_d_synset_id` VARCHAR(45) NULL ,
  `cdb_synset_comment` VARCHAR(65) NULL ,
  `cdb_synset_posSpecific` VARCHAR(85) NULL ,
  PRIMARY KEY (`synset_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_synonyms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_synonyms` (
  `cornetto_synonyms_id` INT NOT NULL AUTO_INCREMENT ,
  `synset_id` VARCHAR(45) NOT NULL ,
  `synonym_c_cid_id` VARCHAR(45) NULL ,
  `synonym_c_lu_id` VARCHAR(45) NOT NULL ,
  `synonym_status` VARCHAR(85) NULL ,
  INDEX `fk_cornetto_synonyms_cornetto_synsets2_idx` (`synset_id` ASC) ,
  PRIMARY KEY (`cornetto_synonyms_id`) ,
  INDEX `fk_cornetto_synonyms_cornetto_lexical_units1_idx` (`synonym_c_lu_id` ASC) ,
  CONSTRAINT `fk_cornetto_synonyms_cornetto_synsets2`
    FOREIGN KEY (`synset_id` )
    REFERENCES `cornetto`.`cornetto_synsets` (`synset_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cornetto_synonyms_cornetto_lexical_units1`
    FOREIGN KEY (`synonym_c_lu_id` )
    REFERENCES `cornetto`.`cornetto_lexical_units` (`lu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_wordnet_domains`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_wordnet_domains` (
  `cornetto_wordnet_domains_id` INT NOT NULL AUTO_INCREMENT ,
  `synset_id` VARCHAR(45) NOT NULL ,
  `dom_relation_name` VARCHAR(120) NULL ,
  `dom_relation_status` TINYINT(1) NULL ,
  `dom_relation_term` VARCHAR(120) NULL ,
  PRIMARY KEY (`cornetto_wordnet_domains_id`) ,
  INDEX `fk_cornetto_wordnet_domains_cornetto_synsets1_idx` (`synset_id` ASC) ,
  CONSTRAINT `fk_cornetto_wordnet_domains_cornetto_synsets1`
    FOREIGN KEY (`synset_id` )
    REFERENCES `cornetto`.`cornetto_synsets` (`synset_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_wordnet_internal_relations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_wordnet_internal_relations` (
  `cornetto_wordnet_internal_relations_id` INT NOT NULL AUTO_INCREMENT ,
  `synset_id` VARCHAR(45) NOT NULL ,
  `relation_coordinative` TINYINT(1) NULL ,
  `relation_disjunctive` TINYINT(1) NULL ,
  `relation_negative` TINYINT(1) NULL ,
  `relation_relation_name` VARCHAR(45) NULL ,
  `relation_reversed` TINYINT(1) NULL ,
  `relation_target` VARCHAR(45) NULL ,
  `author_date` DATE NULL ,
  `author_name` VARCHAR(65) NULL ,
  `author_score` DOUBLE NULL ,
  `author_source_id` VARCHAR(65) NULL ,
  `author_status` TINYINT(1) NULL ,
  PRIMARY KEY (`cornetto_wordnet_internal_relations_id`) ,
  INDEX `fk_cornetto_wordnet_internal_relations_cornetto_synsets1_idx` (`synset_id` ASC) ,
  CONSTRAINT `fk_cornetto_wordnet_internal_relations_cornetto_synsets1`
    FOREIGN KEY (`synset_id` )
    REFERENCES `cornetto`.`cornetto_synsets` (`synset_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_wordnet_equivalence_relations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_wordnet_equivalence_relations` (
  `cornetto_wordnet_equivalence_relations_id` INT NOT NULL AUTO_INCREMENT ,
  `synset_id` VARCHAR(45) NOT NULL ,
  `relation_relation_name` VARCHAR(85) NULL ,
  `relation_target15` VARCHAR(85) NULL ,
  `relation_target20` VARCHAR(85) NULL ,
  `relation_target20-target20Previewtext` MEDIUMTEXT NULL ,
  `relation_target30` VARCHAR(85) NULL ,
  `relation_version` VARCHAR(45) NULL ,
  `author_date` DATE NULL ,
  `author_name` VARCHAR(65) NULL ,
  `author_score` DOUBLE NULL ,
  `author_source_id` VARCHAR(65) NULL ,
  `author_status` TINYINT(1) NULL ,
  PRIMARY KEY (`cornetto_wordnet_equivalence_relations_id`) ,
  INDEX `fk_cornetto_wordnet_equivalence_relations_cornetto_synsets1_idx` (`synset_id` ASC) ,
  CONSTRAINT `fk_cornetto_wordnet_equivalence_relations_cornetto_synsets1`
    FOREIGN KEY (`synset_id` )
    REFERENCES `cornetto`.`cornetto_synsets` (`synset_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cornetto`.`cornetto_sumo_ontology_relations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cornetto`.`cornetto_sumo_ontology_relations` (
  `cornetto_sumo_ontology_relations_id` INT NOT NULL AUTO_INCREMENT ,
  `synset_id` VARCHAR(45) NOT NULL ,
  `ont_relation_arg1` VARCHAR(255) NULL ,
  `ont_relation_arg2` VARCHAR(255) NULL ,
  `ont_relation_name` VARCHAR(85) NULL ,
  `ont_relation_negative` TINYINT(1) NULL ,
  `ont_relation_relation_name` VARCHAR(45) NULL ,
  `ont_relation_status` TINYINT(1) NULL ,
  PRIMARY KEY (`cornetto_sumo_ontology_relations_id`) ,
  INDEX `fk_sumo_ontology_relations_cornetto_synsets1_idx` (`synset_id` ASC) ,
  CONSTRAINT `fk_sumo_ontology_relations_cornetto_synsets1`
    FOREIGN KEY (`synset_id` )
    REFERENCES `cornetto`.`cornetto_synsets` (`synset_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cornetto` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
