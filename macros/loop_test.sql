{% test loop_test(model, column_name, val) %}

select * from {{model}}
where {{column_name}} = '{{val}}'

{% endtest %}