{%- macro now(tz=None) -%}
{{ adapter.dispatch('now', 'dbt_date') (tz) }}
{%- endmacro -%}

{%- macro default__now(tz=None) -%}
{{ dbt_date.convert_timezone(dbt.current_timestamp(), tz) }}
{%- endmacro -%}

{%- macro doris__now(tz=None) -%}
dbt.current_timestamp()
{%- endmacro -%}