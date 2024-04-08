{% test positive_value_test(model, column_name) %}
    select
    *
    from
        {{model}}
    where 
        {{column_name}} < 1
{% endtest %}