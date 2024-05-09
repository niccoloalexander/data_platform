{% test values_present_in_other_model(model, field_to_test, reference_model, field_to_compare) %}

-- Define a CTE to retrieve all distinct values from the field_to_test column in the model being tested
with test_values as (
    select distinct {{ field_to_test }}
    from {{ model }}
),

-- Define a CTE to retrieve all distinct values from the field_to_compare column in the reference_model
reference_values as (
    select distinct {{ field_to_compare }}
    from {{ reference_model }}
)

-- Select values from test_values that are not present in reference_values
select distinct test_values.{{ field_to_test }}
from test_values
left join reference_values 
on test_values.{{ field_to_test }} = reference_values.{{ field_to_compare }}
where reference_values.{{ field_to_compare }} is null

{% endtest %}