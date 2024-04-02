{% macro filter_new_rows(filter_column='snapshot_at', source_column='snapshot_at', additional_filter_sql=none, inject_where=True) -%} 
    {{ 'where' if inject_where }} {{filter_column}} > (
        select coalesce( max({{source_column}}), '1900-01-01') 
        from {{ this }}  
        {{ ' where ( ' ~ additional_filter_sql ~ ' ) ' if additional_filter_sql is not none  }}
    )
{%- endmacro %}