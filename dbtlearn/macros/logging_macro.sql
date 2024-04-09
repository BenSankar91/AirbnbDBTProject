{% macro logging_macro() %}
    {{ log("Hello DBT World",info=True) }}
    {{var}}
{% endmacro %}