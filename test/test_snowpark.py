def run(session):
    df_snowpark_curated = session.table("snowpark_curated")
    df_snowpark_delta = session.table("snowpark_delta")
    try:
        df_snowpark_final = df_snowpark_curated.join(df_snowpark_delta,
        (df_snowpark_delta.col("customer_id")==df_snowpark_curated.col("customer_id"))
& (df_snowpark_delta.col("transaction_id")==df_snowpark_curated.col("transaction_id"))).select (df_snowpark_curated.col("customer_id"),df_snowpark_curated.col("transaction_id"),
        (df_snowpark_delta.col("amount")+df_snowpark_curated.col("amount")).alias ("amount")) 
    except:
        return "curation unsuccessfull"
    else:
        pass

    df_snowpark_final.write.mode("overwrite").save_as_table("snowpark_curated_1")
    return "curation successfull"
