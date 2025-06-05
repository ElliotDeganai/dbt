
select
{%- for country in var('countries') %}
    {% if ' ' not in country %} count(case when name = '{{country}}' then name end) as {{country}}_amount
    {% else %} 
    {%- set country_w_space = country.replace(" ", "_") -%}
    count(case when name = '{{country}}' then name end) as {{country_w_space}}_count
    {% endif %}
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('w_country_code') }}