# Data Platform

A postgres database app modeling customer data with an alerting feature for an operations team.

## How to use:

### Requirements
- Docker or Python > DBT
- Accompanying CSV datasets

### Initialization
- Edit the compose file line containing '/home/niccolo/projects/' with the correct absolute path snippet depending on where you save this repository.
- In the project directory and with Docker installed, run the command "docker compose up".
- Wait for a minute while everything spins up.
- Open http://localhost:8080/#!/overview to see the DBT project documentation.
- Replace pass with send_alert(organization_id, balance_change_rate, previous_balance, balance) and run "python ./alert_script.py or restart the container to see the alerting feature in action (albeit spammy).

### Troubleshooting
For initialization issues, try:
- Installing DBT and Postgres, navigating to the dbt/data_platform directory, and running the commands:
  - dbt seed
  - dbt run
  - dbt test
  - dbt docs generate
  - dbt docs serve
- Open http://localhost:8080/#!/overview to see the DBT project documentation.

## Reference Materials
### Lineage graph

<img width="1219" alt="image" src="https://github.com/niccoloalexander/data_platform/assets/44615193/c8bf4a22-7aae-462e-8126-30481d1dcc76">

### Project tree

```bash
.
├── alert_script.py
├── compose.yaml
├── csv_data
│   ├── invoices.csv
│   └── organizations.csv
├── dbt
│   ├── data_platform__customer
│   │   ├── README.md
│   │   ├── analyses
│   │   │   ├── analyze_customer_balance_change_alert.sql
│   │   │   └── messy_eda.sql
│   │   ├── dbt_packages
│   │   │   ├── codegen
│   │   │   │   ├── CHANGELOG.md
│   │   │   │   ├── CONTRIBUTING.md
│   │   │   │   ├── LICENSE
│   │   │   │   ├── Makefile
│   │   │   │   ├── README.md
│   │   │   │   ├── RELEASE.md
│   │   │   │   ├── bash_scripts
│   │   │   │   │   └── base_model_creation.sh
│   │   │   │   ├── dbt_project.yml
│   │   │   │   ├── docker-compose.yml
│   │   │   │   ├── integration_tests
│   │   │   │   │   ├── README.md
│   │   │   │   │   ├── ci
│   │   │   │   │   │   └── sample.profiles.yml
│   │   │   │   │   ├── dbt_project.yml
│   │   │   │   │   ├── macros
│   │   │   │   │   │   ├── assert_equal.sql
│   │   │   │   │   │   ├── integer_type_value.sql
│   │   │   │   │   │   ├── operations
│   │   │   │   │   │   │   └── create_source_table.sql
│   │   │   │   │   │   └── text_type_value.sql
│   │   │   │   │   ├── models
│   │   │   │   │   │   ├── child_model.sql
│   │   │   │   │   │   ├── model_data_a.sql
│   │   │   │   │   │   ├── model_struct.sql
│   │   │   │   │   │   ├── model_without_any_ctes.sql
│   │   │   │   │   │   ├── model_without_import_ctes.sql
│   │   │   │   │   │   ├── schema.yml
│   │   │   │   │   │   └── source.yml
│   │   │   │   │   ├── packages.yml
│   │   │   │   │   ├── seeds
│   │   │   │   │   │   ├── data__a_relation.csv
│   │   │   │   │   │   ├── data__b_relation.csv
│   │   │   │   │   │   └── data__campaign_analytics.csv
│   │   │   │   │   └── tests
│   │   │   │   │       ├── test_generate_base_models.sql
│   │   │   │   │       ├── test_generate_base_models_all_args.sql
│   │   │   │   │       ├── test_generate_base_models_case_sensitive.sql
│   │   │   │   │       ├── test_generate_base_models_leading.sql
│   │   │   │   │       ├── test_generate_model_import_ctes.sql
│   │   │   │   │       ├── test_generate_model_import_ctes_leading.sql
│   │   │   │   │       ├── test_generate_model_import_ctes_no_ctes.sql
│   │   │   │   │       ├── test_generate_model_struct_yaml.sql
│   │   │   │   │       ├── test_generate_model_yaml.sql
│   │   │   │   │       ├── test_generate_model_yaml_multiple_models.sql
│   │   │   │   │       ├── test_generate_model_yaml_upstream_descriptions.sql
│   │   │   │   │       ├── test_generate_source.sql
│   │   │   │   │       ├── test_generate_source_all_args.sql
│   │   │   │   │       ├── test_generate_source_exclude.sql
│   │   │   │   │       ├── test_generate_source_include_database_property.sql
│   │   │   │   │       ├── test_generate_source_include_schema_property.sql
│   │   │   │   │       ├── test_generate_source_some_tables.sql
│   │   │   │   │       ├── test_generate_source_table_descriptions.sql
│   │   │   │   │       ├── test_generate_source_table_name.sql
│   │   │   │   │       ├── test_generate_source_table_pattern.sql
│   │   │   │   │       └── test_helper_get_models.sql
│   │   │   │   ├── macros
│   │   │   │   │   ├── create_base_models.sql
│   │   │   │   │   ├── generate_base_model.sql
│   │   │   │   │   ├── generate_model_import_ctes.sql
│   │   │   │   │   ├── generate_model_yaml.sql
│   │   │   │   │   ├── generate_source.sql
│   │   │   │   │   ├── helpers
│   │   │   │   │   │   └── helpers.sql
│   │   │   │   │   └── vendored
│   │   │   │   │       └── dbt_core
│   │   │   │   │           └── format_column.sql
│   │   │   │   ├── packages.yml
│   │   │   │   └── run_test.sh
│   │   │   └── dbt_utils
│   │   │       ├── CHANGELOG.md
│   │   │       ├── CONTRIBUTING.md
│   │   │       ├── LICENSE
│   │   │       ├── Makefile
│   │   │       ├── README.md
│   │   │       ├── RELEASE.md
│   │   │       ├── dbt_project.yml
│   │   │       ├── dev-requirements.txt
│   │   │       ├── docker-compose.yml
│   │   │       ├── docs
│   │   │       │   └── decisions
│   │   │       │       ├── README.md
│   │   │       │       ├── adr-0000-documenting-architecture-decisions.md
│   │   │       │       ├── adr-0001-decision-record-format.md
│   │   │       │       └── adr-0002-cross-database-utils.md
│   │   │       ├── etc
│   │   │       │   └── dbt-logo.png
│   │   │       ├── integration_tests
│   │   │       │   ├── README.md
│   │   │       │   ├── ci
│   │   │       │   │   └── sample.profiles.yml
│   │   │       │   ├── data
│   │   │       │   │   ├── datetime
│   │   │       │   │   │   └── data_date_spine.csv
│   │   │       │   │   ├── etc
│   │   │       │   │   │   └── data_people.csv
│   │   │       │   │   ├── geo
│   │   │       │   │   │   ├── data_haversine_km.csv
│   │   │       │   │   │   └── data_haversine_mi.csv
│   │   │       │   │   ├── schema_tests
│   │   │       │   │   │   ├── data_cardinality_equality_a.csv
│   │   │       │   │   │   ├── data_cardinality_equality_b.csv
│   │   │       │   │   │   ├── data_not_null_proportion.csv
│   │   │       │   │   │   ├── data_test_accepted_range.csv
│   │   │       │   │   │   ├── data_test_at_least_one.csv
│   │   │       │   │   │   ├── data_test_equal_rowcount.csv
│   │   │       │   │   │   ├── data_test_expression_is_true.csv
│   │   │       │   │   │   ├── data_test_fewer_rows_than_table_1.csv
│   │   │       │   │   │   ├── data_test_fewer_rows_than_table_2.csv
│   │   │       │   │   │   ├── data_test_mutually_exclusive_ranges_no_gaps.csv
│   │   │       │   │   │   ├── data_test_mutually_exclusive_ranges_with_gaps.csv
│   │   │       │   │   │   ├── data_test_mutually_exclusive_ranges_with_gaps_zero_length.csv
│   │   │       │   │   │   ├── data_test_not_accepted_values.csv
│   │   │       │   │   │   ├── data_test_not_constant.csv
│   │   │       │   │   │   ├── data_test_relationships_where_table_1.csv
│   │   │       │   │   │   ├── data_test_relationships_where_table_2.csv
│   │   │       │   │   │   ├── data_test_sequential_timestamps.csv
│   │   │       │   │   │   ├── data_test_sequential_values.csv
│   │   │       │   │   │   ├── data_unique_combination_of_columns.csv
│   │   │       │   │   │   └── schema.yml
│   │   │       │   │   ├── sql
│   │   │       │   │   │   ├── data_deduplicate.csv
│   │   │       │   │   │   ├── data_deduplicate_expected.csv
│   │   │       │   │   │   ├── data_events_20180101.csv
│   │   │       │   │   │   ├── data_events_20180102.csv
│   │   │       │   │   │   ├── data_events_20180103.csv
│   │   │       │   │   │   ├── data_filtered_columns_in_relation.csv
│   │   │       │   │   │   ├── data_filtered_columns_in_relation_expected.csv
│   │   │       │   │   │   ├── data_generate_series.csv
│   │   │       │   │   │   ├── data_generate_surrogate_key.csv
│   │   │       │   │   │   ├── data_get_column_values.csv
│   │   │       │   │   │   ├── data_get_column_values_dropped.csv
│   │   │       │   │   │   ├── data_get_column_values_where.csv
│   │   │       │   │   │   ├── data_get_column_values_where_expected.csv
│   │   │       │   │   │   ├── data_get_query_results_as_dict.csv
│   │   │       │   │   │   ├── data_get_single_value.csv
│   │   │       │   │   │   ├── data_nullcheck_table.csv
│   │   │       │   │   │   ├── data_pivot.csv
│   │   │       │   │   │   ├── data_pivot_expected.csv
│   │   │       │   │   │   ├── data_pivot_expected_apostrophe.csv
│   │   │       │   │   │   ├── data_safe_add.csv
│   │   │       │   │   │   ├── data_safe_divide.csv
│   │   │       │   │   │   ├── data_safe_divide_denominator_expressions.csv
│   │   │       │   │   │   ├── data_safe_divide_numerator_expressions.csv
│   │   │       │   │   │   ├── data_safe_subtract.csv
│   │   │       │   │   │   ├── data_star.csv
│   │   │       │   │   │   ├── data_star_aggregate.csv
│   │   │       │   │   │   ├── data_star_aggregate_expected.csv
│   │   │       │   │   │   ├── data_star_expected.csv
│   │   │       │   │   │   ├── data_star_prefix_suffix_expected.csv
│   │   │       │   │   │   ├── data_star_quote_identifiers.csv
│   │   │       │   │   │   ├── data_union_events_expected.csv
│   │   │       │   │   │   ├── data_union_exclude_expected.csv
│   │   │       │   │   │   ├── data_union_expected.csv
│   │   │       │   │   │   ├── data_union_table_1.csv
│   │   │       │   │   │   ├── data_union_table_2.csv
│   │   │       │   │   │   ├── data_unpivot.csv
│   │   │       │   │   │   ├── data_unpivot_bool.csv
│   │   │       │   │   │   ├── data_unpivot_bool_expected.csv
│   │   │       │   │   │   ├── data_unpivot_expected.csv
│   │   │       │   │   │   ├── data_unpivot_original_api_expected.csv
│   │   │       │   │   │   └── data_width_bucket.csv
│   │   │       │   │   └── web
│   │   │       │   │       ├── data_url_host.csv
│   │   │       │   │       ├── data_url_path.csv
│   │   │       │   │       └── data_urls.csv
│   │   │       │   ├── dbt_project.yml
│   │   │       │   ├── macros
│   │   │       │   │   ├── assert_equal_values.sql
│   │   │       │   │   ├── limit_zero.sql
│   │   │       │   │   └── tests.sql
│   │   │       │   ├── models
│   │   │       │   │   ├── datetime
│   │   │       │   │   │   ├── schema.yml
│   │   │       │   │   │   └── test_date_spine.sql
│   │   │       │   │   ├── generic_tests
│   │   │       │   │   │   ├── recency_time_excluded.sql
│   │   │       │   │   │   ├── recency_time_included.sql
│   │   │       │   │   │   ├── schema.yml
│   │   │       │   │   │   ├── test_equal_column_subset.sql
│   │   │       │   │   │   ├── test_equal_rowcount.sql
│   │   │       │   │   │   └── test_fewer_rows_than.sql
│   │   │       │   │   ├── geo
│   │   │       │   │   │   ├── schema.yml
│   │   │       │   │   │   ├── test_haversine_distance_km.sql
│   │   │       │   │   │   └── test_haversine_distance_mi.sql
│   │   │       │   │   ├── sql
│   │   │       │   │   │   ├── schema.yml
│   │   │       │   │   │   ├── test_deduplicate.sql
│   │   │       │   │   │   ├── test_generate_series.sql
│   │   │       │   │   │   ├── test_generate_surrogate_key.sql
│   │   │       │   │   │   ├── test_get_column_values.sql
│   │   │       │   │   │   ├── test_get_column_values_where.sql
│   │   │       │   │   │   ├── test_get_filtered_columns_in_relation.sql
│   │   │       │   │   │   ├── test_get_relations_by_pattern.sql
│   │   │       │   │   │   ├── test_get_relations_by_prefix_and_union.sql
│   │   │       │   │   │   ├── test_get_single_value.sql
│   │   │       │   │   │   ├── test_get_single_value_default.sql
│   │   │       │   │   │   ├── test_groupby.sql
│   │   │       │   │   │   ├── test_not_empty_string_failing.sql
│   │   │       │   │   │   ├── test_not_empty_string_passing.sql
│   │   │       │   │   │   ├── test_nullcheck_table.sql
│   │   │       │   │   │   ├── test_pivot.sql
│   │   │       │   │   │   ├── test_pivot_apostrophe.sql
│   │   │       │   │   │   ├── test_safe_add.sql
│   │   │       │   │   │   ├── test_safe_divide.sql
│   │   │       │   │   │   ├── test_safe_subtract.sql
│   │   │       │   │   │   ├── test_star.sql
│   │   │       │   │   │   ├── test_star_aggregate.sql
│   │   │       │   │   │   ├── test_star_no_columns.sql
│   │   │       │   │   │   ├── test_star_prefix_suffix.sql
│   │   │       │   │   │   ├── test_star_quote_identifiers.sql
│   │   │       │   │   │   ├── test_star_uppercase.sql
│   │   │       │   │   │   ├── test_union.sql
│   │   │       │   │   │   ├── test_union_base.sql
│   │   │       │   │   │   ├── test_union_exclude_base_lowercase.sql
│   │   │       │   │   │   ├── test_union_exclude_base_uppercase.sql
│   │   │       │   │   │   ├── test_union_exclude_lowercase.sql
│   │   │       │   │   │   ├── test_union_exclude_uppercase.sql
│   │   │       │   │   │   ├── test_union_no_source_column.sql
│   │   │       │   │   │   ├── test_union_where.sql
│   │   │       │   │   │   ├── test_union_where_base.sql
│   │   │       │   │   │   ├── test_unpivot.sql
│   │   │       │   │   │   ├── test_unpivot_bool.sql
│   │   │       │   │   │   └── test_width_bucket.sql
│   │   │       │   │   └── web
│   │   │       │   │       ├── schema.yml
│   │   │       │   │       ├── test_url_host.sql
│   │   │       │   │       ├── test_url_path.sql
│   │   │       │   │       └── test_urls.sql
│   │   │       │   ├── packages.yml
│   │   │       │   └── tests
│   │   │       │       ├── assert_get_query_results_as_dict_objects_equal.sql
│   │   │       │       ├── generic
│   │   │       │       │   └── expect_table_columns_to_match_set.sql
│   │   │       │       ├── jinja_helpers
│   │   │       │       │   ├── assert_pretty_output_msg_is_string.sql
│   │   │       │       │   ├── assert_pretty_time_is_string.sql
│   │   │       │       │   └── test_slugify.sql
│   │   │       │       └── sql
│   │   │       │           ├── test_get_column_values_use_default.sql
│   │   │       │           └── test_get_single_value_multiple_rows.sql
│   │   │       ├── macros
│   │   │       │   ├── generic_tests
│   │   │       │   │   ├── accepted_range.sql
│   │   │       │   │   ├── at_least_one.sql
│   │   │       │   │   ├── cardinality_equality.sql
│   │   │       │   │   ├── equal_rowcount.sql
│   │   │       │   │   ├── equality.sql
│   │   │       │   │   ├── expression_is_true.sql
│   │   │       │   │   ├── fewer_rows_than.sql
│   │   │       │   │   ├── mutually_exclusive_ranges.sql
│   │   │       │   │   ├── not_accepted_values.sql
│   │   │       │   │   ├── not_constant.sql
│   │   │       │   │   ├── not_empty_string.sql
│   │   │       │   │   ├── not_null_proportion.sql
│   │   │       │   │   ├── recency.sql
│   │   │       │   │   ├── relationships_where.sql
│   │   │       │   │   ├── sequential_values.sql
│   │   │       │   │   └── unique_combination_of_columns.sql
│   │   │       │   ├── jinja_helpers
│   │   │       │   │   ├── _is_ephemeral.sql
│   │   │       │   │   ├── _is_relation.sql
│   │   │       │   │   ├── log_info.sql
│   │   │       │   │   ├── pretty_log_format.sql
│   │   │       │   │   ├── pretty_time.sql
│   │   │       │   │   └── slugify.sql
│   │   │       │   ├── sql
│   │   │       │   │   ├── date_spine.sql
│   │   │       │   │   ├── deduplicate.sql
│   │   │       │   │   ├── generate_series.sql
│   │   │       │   │   ├── generate_surrogate_key.sql
│   │   │       │   │   ├── get_column_values.sql
│   │   │       │   │   ├── get_filtered_columns_in_relation.sql
│   │   │       │   │   ├── get_query_results_as_dict.sql
│   │   │       │   │   ├── get_relations_by_pattern.sql
│   │   │       │   │   ├── get_relations_by_prefix.sql
│   │   │       │   │   ├── get_single_value.sql
│   │   │       │   │   ├── get_table_types_sql.sql
│   │   │       │   │   ├── get_tables_by_pattern_sql.sql
│   │   │       │   │   ├── get_tables_by_prefix_sql.sql
│   │   │       │   │   ├── groupby.sql
│   │   │       │   │   ├── haversine_distance.sql
│   │   │       │   │   ├── nullcheck.sql
│   │   │       │   │   ├── nullcheck_table.sql
│   │   │       │   │   ├── pivot.sql
│   │   │       │   │   ├── safe_add.sql
│   │   │       │   │   ├── safe_divide.sql
│   │   │       │   │   ├── safe_subtract.sql
│   │   │       │   │   ├── star.sql
│   │   │       │   │   ├── surrogate_key.sql
│   │   │       │   │   ├── union.sql
│   │   │       │   │   ├── unpivot.sql
│   │   │       │   │   └── width_bucket.sql
│   │   │       │   └── web
│   │   │       │       ├── get_url_host.sql
│   │   │       │       ├── get_url_parameter.sql
│   │   │       │       └── get_url_path.sql
│   │   │       ├── pytest.ini
│   │   │       ├── run_functional_test.sh
│   │   │       ├── run_test.sh
│   │   │       └── tests
│   │   │           ├── __init__.py
│   │   │           └── conftest.py
│   │   ├── dbt_project.yml
│   │   ├── docs
│   │   │   └── docs.md
│   │   ├── logs
│   │   │   ├── dbt.log
│   │   │   └── dbt.log.1
│   │   ├── macros
│   │   │   ├── filter_new_rows.sql
│   │   │   └── get_custom_schema.sql
│   │   ├── models
│   │   │   ├── exposures.yml
│   │   │   ├── intermediate
│   │   │   │   ├── int_invoices_enriched.sql
│   │   │   │   └── int_organizations_joined_invoices_enriched.sql
│   │   │   ├── marts
│   │   │   │   ├── dim_invoices.sql
│   │   │   │   ├── dim_organizations.sql
│   │   │   │   └── fct_organization_daily_financials.sql
│   │   │   ├── schema.yml
│   │   │   ├── staging
│   │   │   │   ├── stg_customer__invoices.sql
│   │   │   │   └── stg_customer__organizations.sql
│   │   │   └── utilities
│   │   ├── package-lock.yml
│   │   ├── packages.yml
│   │   ├── seeds
│   │   │   ├── schema.yml
│   │   │   └── utilities
│   │   │       └── invoice_enrichment.csv
│   │   ├── snapshots
│   │   ├── target
│   │   │   ├── catalog.json
│   │   │   ├── compiled
│   │   │   │   └── deel_platform__customer
│   │   │   │       ├── analyses
│   │   │   │       │   ├── analyze_customer_balance_change_alert.sql
│   │   │   │       │   ├── eda.sql
│   │   │   │       │   └── messy_eda.sql
│   │   │   │       ├── models
│   │   │   │       │   ├── intermediate
│   │   │   │       │   │   ├── int_invoices_defined_with_balances.sql
│   │   │   │       │   │   ├── int_invoices_enriched.sql
│   │   │   │       │   │   ├── int_invoices_joined_invoice_status_enrichment.sql
│   │   │   │       │   │   ├── int_invoices_status_defined.sql
│   │   │   │       │   │   ├── int_organization_balances.sql
│   │   │   │       │   │   └── int_organizations_joined_invoices_enriched.sql
│   │   │   │       │   ├── marts
│   │   │   │       │   │   ├── dim_invoices.sql
│   │   │   │       │   │   ├── dim_organizations.sql
│   │   │   │       │   │   ├── fct_organization_daily_financials.sql
│   │   │   │       │   │   └── fct_organization_metrics.sql
│   │   │   │       │   ├── schema.yml
│   │   │   │       │   │   ├── accepted_values_dim_invoices_315d174bc5894e94c58a4f60940df81f.sql
│   │   │   │       │   │   ├── accepted_values_stg_customer___832f5b905ca73ce8488884d9524b8736.sql
│   │   │   │       │   │   ├── accepted_values_stg_customer___c6a04a980af27de0e42aa0a6b9d75bf9.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_1fc477eaf056af4b7829f5057761743e.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_5306bc8569e4327345927d5116728d47.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_6dcaa0b88f1a1deee84848afd5549391.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_9008f74c01d4ae77a2ff6ae1e0b0f2b8.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_organization_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_transaction_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_type_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_fct_6ffeda2333be1f1caaeeaae5384c4861.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_074af014f843993bea0c4d428167ea9a.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_type_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_d3ab044f0815cd362d0192655253c77a.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_dc466935066f05e2146cf79b2c7631b0.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_f7de7235ec56c7a3a84c03eb049c8b7a.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_at__0.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_at__1.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_date__0.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_date__1.sql
│   │   │   │       │   │   ├── dbt_utils_recency_fct_organiza_63ce6b4d4e1745670b570819567cb8c7.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_20151e240a384246f2f3d2058c5f4268.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_2fd61d04d772875f07c462184b90f353.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_57c97a2e91150354bd11074161c15eec.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_8522dc253fb1f18a0d8c9fd1d63fb125.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_bf807fecb89c42edd4f577945ce1c6dc.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_string_postgres_raw_invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_string_postgres_raw_invoices_type_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_balance.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_fx_rate.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_organization_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_record_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_status_type.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_transaction_id.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_balance.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_created_date.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_accrued_revenue.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_organization_id.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_record_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_amount.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_fx_rate.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_organization_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_payment_method.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_status.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_status_type.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_transaction_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_type.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_type_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__organizations_created_date.sql
│   │   │   │       │   │   ├── not_null_stg_customer__organizations_organization_id.sql
│   │   │   │       │   │   ├── source_accepted_values_postgre_b6d4df3421dfef0c6429888dfa23ea9a.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_amount.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_fx_rate.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_invoice_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_organization_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_payment_method.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_status.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_transaction_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_type.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_type_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_o_59a7e2b093170ef095506f463b8d708d.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_created_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_first_payment_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_last_payment_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_organization_id.sql
│   │   │   │       │   │   ├── source_unique_postgres_raw_invoices_invoice_id.sql
│   │   │   │       │   │   ├── source_unique_postgres_raw_organizations_organization_id.sql
│   │   │   │       │   │   ├── unique_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── unique_dim_invoices_record_id.sql
│   │   │   │       │   │   ├── unique_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── unique_fct_organization_daily_financials_record_id.sql
│   │   │   │       │   │   ├── unique_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   └── unique_stg_customer__organizations_organization_id.sql
│   │   │   │       │   ├── staging
│   │   │   │       │   │   ├── stg_customer__invoices.sql
│   │   │   │       │   │   └── stg_customer__organizations.sql
│   │   │   │       │   └── utilities
│   │   │   │       │       └── date_spine.sql
│   │   │   │       └── seeds
│   │   │   │           └── schema.yml
│   │   │   │               ├── dbt_utils_not_empty_string_inv_34e8b0b9da7e8c9602b2162590baaf59.sql
│   │   │   │               ├── dbt_utils_not_empty_string_inv_88458b0675b7cffe9aae66cbaf923694.sql
│   │   │   │               ├── dbt_utils_not_empty_string_inv_f330a3e958b41a3b8032e7c549c466fe.sql
│   │   │   │               ├── dbt_utils_not_empty_string_invoice_enrichment_in_status_type.sql
│   │   │   │               ├── dbt_utils_not_empty_string_invoice_enrichment_out_is_final.sql
│   │   │   │               ├── not_null_invoice_enrichment_in_status_type.sql
│   │   │   │               ├── not_null_invoice_enrichment_out_amount_coefficient.sql
│   │   │   │               ├── not_null_invoice_enrichment_out_is_final.sql
│   │   │   │               ├── not_null_invoice_enrichment_out_payment_amount_coefficient.sql
│   │   │   │               ├── not_null_invoice_enrichment_out_status_definition.sql
│   │   │   │               ├── unique_invoice_enrichment_in_status_type.sql
│   │   │   │               └── unique_invoice_status_enrichment_in_status_type.sql
│   │   │   ├── graph.gpickle
│   │   │   ├── graph_summary.json
│   │   │   ├── index.html
│   │   │   ├── manifest.json
│   │   │   ├── partial_parse.msgpack
│   │   │   ├── run
│   │   │   │   └── deel_platform__customer
│   │   │   │       ├── models
│   │   │   │       │   ├── marts
│   │   │   │       │   │   ├── dim_invoices.sql
│   │   │   │       │   │   ├── dim_organizations.sql
│   │   │   │       │   │   ├── fct_organization_daily_financials.sql
│   │   │   │       │   │   └── fct_organization_metrics.sql
│   │   │   │       │   ├── schema.yml
│   │   │   │       │   │   ├── accepted_values_dim_invoices_315d174bc5894e94c58a4f60940df81f.sql
│   │   │   │       │   │   ├── accepted_values_stg_customer___832f5b905ca73ce8488884d9524b8736.sql
│   │   │   │       │   │   ├── accepted_values_stg_customer___c6a04a980af27de0e42aa0a6b9d75bf9.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_1fc477eaf056af4b7829f5057761743e.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_5306bc8569e4327345927d5116728d47.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_6dcaa0b88f1a1deee84848afd5549391.sql
│   │   │   │       │   │   ├── dbt_utils_equality_fct_organiz_9008f74c01d4ae77a2ff6ae1e0b0f2b8.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_organization_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_transaction_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_invoices_type_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_fct_6ffeda2333be1f1caaeeaae5384c4861.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_074af014f843993bea0c4d428167ea9a.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_customer__invoices_type_id.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_d3ab044f0815cd362d0192655253c77a.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_dc466935066f05e2146cf79b2c7631b0.sql
│   │   │   │       │   │   ├── dbt_utils_not_empty_string_stg_f7de7235ec56c7a3a84c03eb049c8b7a.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_at__0.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_at__1.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_date__0.sql
│   │   │   │       │   │   ├── dbt_utils_recency_dim_organizations_day__recorded_date__1.sql
│   │   │   │       │   │   ├── dbt_utils_recency_fct_organiza_63ce6b4d4e1745670b570819567cb8c7.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_20151e240a384246f2f3d2058c5f4268.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_2fd61d04d772875f07c462184b90f353.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_57c97a2e91150354bd11074161c15eec.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_8522dc253fb1f18a0d8c9fd1d63fb125.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_str_bf807fecb89c42edd4f577945ce1c6dc.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_string_postgres_raw_invoices_type.sql
│   │   │   │       │   │   ├── dbt_utils_source_not_empty_string_postgres_raw_invoices_type_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_balance.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_fx_rate.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_organization_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_record_id.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_status_type.sql
│   │   │   │       │   │   ├── not_null_dim_invoices_transaction_id.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_balance.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_created_date.sql
│   │   │   │       │   │   ├── not_null_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_accrued_revenue.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_organization_id.sql
│   │   │   │       │   │   ├── not_null_fct_organization_daily_financials_record_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_amount.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_fx_rate.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_organization_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_payment_method.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_status.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_status_type.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_transaction_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_type.sql
│   │   │   │       │   │   ├── not_null_stg_customer__invoices_type_id.sql
│   │   │   │       │   │   ├── not_null_stg_customer__organizations_created_date.sql
│   │   │   │       │   │   ├── not_null_stg_customer__organizations_organization_id.sql
│   │   │   │       │   │   ├── source_accepted_values_postgre_b6d4df3421dfef0c6429888dfa23ea9a.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_amount.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_fx_rate.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_invoice_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_organization_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_parent_invoice_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_payment_method.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_status.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_transaction_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_type.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_invoices_type_id.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_o_59a7e2b093170ef095506f463b8d708d.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_created_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_first_payment_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_last_payment_date.sql
│   │   │   │       │   │   ├── source_not_null_postgres_raw_organizations_organization_id.sql
│   │   │   │       │   │   ├── source_unique_postgres_raw_invoices_invoice_id.sql
│   │   │   │       │   │   ├── source_unique_postgres_raw_organizations_organization_id.sql
│   │   │   │       │   │   ├── unique_dim_invoices_invoice_id.sql
│   │   │   │       │   │   ├── unique_dim_invoices_record_id.sql
│   │   │   │       │   │   ├── unique_dim_organizations_organization_id.sql
│   │   │   │       │   │   ├── unique_fct_organization_daily_financials_record_id.sql
│   │   │   │       │   │   ├── unique_stg_customer__invoices_invoice_id.sql
│   │   │   │       │   │   └── unique_stg_customer__organizations_organization_id.sql
│   │   │   │       │   ├── staging
│   │   │   │       │   │   ├── stg_customer__invoices.sql
│   │   │   │       │   │   └── stg_customer__organizations.sql
│   │   │   │       │   └── utilities
│   │   │   │       │       └── date_spine.sql
│   │   │   │       └── seeds
│   │   │   │           ├── schema.yml
│   │   │   │           │   ├── dbt_utils_not_empty_string_inv_34e8b0b9da7e8c9602b2162590baaf59.sql
│   │   │   │           │   ├── dbt_utils_not_empty_string_inv_88458b0675b7cffe9aae66cbaf923694.sql
│   │   │   │           │   ├── dbt_utils_not_empty_string_inv_f330a3e958b41a3b8032e7c549c466fe.sql
│   │   │   │           │   ├── dbt_utils_not_empty_string_invoice_enrichment_in_status_type.sql
│   │   │   │           │   ├── dbt_utils_not_empty_string_invoice_enrichment_out_is_final.sql
│   │   │   │           │   ├── not_null_invoice_enrichment_in_status_type.sql
│   │   │   │           │   ├── not_null_invoice_enrichment_out_amount_coefficient.sql
│   │   │   │           │   ├── not_null_invoice_enrichment_out_is_final.sql
│   │   │   │           │   ├── not_null_invoice_enrichment_out_payment_amount_coefficient.sql
│   │   │   │           │   ├── not_null_invoice_enrichment_out_status_definition.sql
│   │   │   │           │   └── unique_invoice_enrichment_in_status_type.sql
│   │   │   │           └── utilities
│   │   │   │               ├── invoice_enrichment.csv
│   │   │   │               ├── invoice_status_definitions.csv
│   │   │   │               └── invoice_status_enrichment.csv
│   │   │   ├── run_results.json
│   │   │   └── semantic_manifest.json
│   │   └── tests
│   ├── dbt_packages
│   └── logs
│       └── dbt.log
├── init.sh
└── init.sql
```
