with dem as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),
cc as
(
    select * from country_code
),

final as (
    select cc.name, dem.* from dem
    left join cc on cc.code = dem.ISO3166_1
)

select * from final