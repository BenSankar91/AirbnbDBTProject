{% macro not_null_check(model) %}
  select * from {{model}} where
    {% for c in adapter.get_columns_in_relation(model) %}
        {{c.column}} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}