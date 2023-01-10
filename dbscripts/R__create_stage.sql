create database if not exists CICD_TEST_DB;

create schema if not exists CICD_TEST_DB.CICD_SCHEMA;

create table if not exists CICD_TEST_DB.CICD_SCHEMA.EMP_TEST(
  firstname string,
  lastname string
);

insert overwrite into CICD_TEST_DB.CICD_SCHEMA.EMP_TEST values('Hariom', 'jangir'),('H', 'Jangid');

create or replace file format none_compression
compression = None;

create stage if not exists CICD_TEST_DB.CICD_SCHEMA.TEST_STAGE
file_format = none_compression;

put file://test/* @CICD_TEST_DB.CICD_SCHEMA.TEST_STAGE;

