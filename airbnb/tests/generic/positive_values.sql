{% test positive_values(model, column_name) %}
SELECT * FROM {{ model }} where {{ column_name }} <= 0
{% endtest %}