{% test positive_amount(model, column_name) %}
    -- This test fails if any value in the column is negative
    select *
    from {{ model }}
    where {{ column_name }} < 0
{% endtest %}
