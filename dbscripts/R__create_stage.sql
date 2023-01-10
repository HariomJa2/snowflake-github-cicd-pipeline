-- create database if not exists CICD_TEST_DB;

-- create schema if not exists CICD_TEST_DB.CICD_SCHEMA;

-- create table if not exists CICD_TEST_DB.CICD_SCHEMA.EMP_TEST(
--   firstname string,
--   lastname string
-- );

-- insert overwrite into CICD_TEST_DB.CICD_SCHEMA.EMP_TEST values('Hariom', 'jangir'),('H', 'Jangid');

-- create or replace file format CICD_TEST_DB.CICD_SCHEMA.NONE_COMPRESSION
-- compression = None;

-- create or replace stage CICD_TEST_DB.CICD_SCHEMA.TEST_STAGE
-- file_format = CICD_TEST_DB.CICD_SCHEMA.NONE_COMPRESSION;

put file://test/test_snowpark_1.py @DEMO_DB.PUBLIC.snowpark_internal_stage AUTO_COMPRESS = FALSE SOURCE_COMPRESSION = NONE OVERWRITE = TRUE;

