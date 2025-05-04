{% macro clean_email(column_name) %}
    CASE 
        WHEN NULLIF(TRIM({{ column_name }}), '') IS NULL 
        THEN 'no_email@domain.com'
        ELSE {{ column_name }}
    END
{% endmacro %}