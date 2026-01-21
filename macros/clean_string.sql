{% macro clean_string(col) %}
    upper(trim({{ col }}))
{% endmacro %}

{% macro safe_divide(numerator, denominator) %}
    case when {{ denominator }} = 0 then null
         else {{ numerator }} / {{ denominator }} end
{% endmacro %}

{% macro coalesce_zero(col) %}
    coalesce({{ col }}, 0)
{% endmacro %}

{% macro percent_of_total(part, total) %}
    case when {{ total }} = 0 then 0
         else round(100.0 * {{ part }} / {{ total }}, 2) end
{% endmacro %}