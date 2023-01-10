def run(session):
    df_snowpark_curated = session.table("snowflake_sample_data.tpch_sf100.customer")
    df_snowpark_delta = session.table("snowflake_sample_data.tpch_sf100.orders")
    try:
        df_snowpark_final = df_snowpark_curated.join(df_snowpark_delta,
        (df_snowpark_delta.col("c_custkey")==df_snowpark_curated.col("c_custkey"))).select (df_snowpark_curated.col("c_custkey"),
        (df_snowpark_delta.col("o_totalprice")-df_snowpark_curated.col("c_acctbal")).alias ("avl_bal")) 
    except:
        return "curation unsuccessfull"
    else:
        pass

    df_snowpark_final.write.mode("overwrite").save_as_table("snowflake_sample_data.tpch_sf100.snowpark_curated_2")
    return "curation successfull"
