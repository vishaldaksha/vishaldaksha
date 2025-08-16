{% snapshot customer_snapshot %}
{{
    config(
        target_database='MyDatabase',
        dbt_valid_to_default='2999-12-31',
        target_schema='dbt_target',
        unique_key='CustomerID',
        strategy='check',
        check_cols=['LastName'],
        updated_at='subscriptionDate'
    )
}}

SELECT CustomerID, FirstName, LastName,subscriptionDate, null as is_active
 FROM {{ source('dbo', 'Customers_stg') }}

{% endsnapshot %}
