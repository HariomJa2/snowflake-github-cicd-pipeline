def run(session):
    df_snowpark_curated = session.table("customer")
    df_snowpark_delta = session.table("orders")
    try:
        df_snowpark_final =select(df_snowpark_curated.col("c_custkey")) 
    except:
        return "curation unsuccessfull"
    else:
        pass

    df_snowpark_final.write.mode("overwrite").save_as_table("demo_db.public.snowpark_curated_2")
    return "curation successfull"
