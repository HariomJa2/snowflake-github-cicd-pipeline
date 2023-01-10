create database if not exists CICD_TEST_DB;

create schema if not exists CICD_TEST_DB.CICD_SCHEMA;

create table if not exists CICD_TEST_DB.CICD_SCHEMA.EMP_TEST(
  firstname string,
  lastname string
);

insert overwrite into CICD_TEST_DB.CICD_SCHEMA.EMP_TEST values('Hariom', 'jangir'),('H', 'Jangid');

create stage if not exists CICD_TEST_DB.CICD_SCHEMA.TEST_STAGE;

put file://test/test_file.sql @CICD_TEST_DB.CICD_SCHEMA.TEST_STAGE;

