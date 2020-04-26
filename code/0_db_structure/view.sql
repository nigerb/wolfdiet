-- VIEW OF THE PIVOT-TABLE
-- Partial
CREATE OR REPLACE VIEW main.diet_item_users AS
 SELECT crosstab.diet_analysis_id,
    crosstab."moose_alces alces",
    crosstab."blackbuck_antilope cervicapra",
    crosstab."american bison_bison bison",
    crosstab."european bison_bison bonasus",
    crosstab."yak_bos grunniens",
    crosstab."cattle_bos taurus",
    crosstab."nilgai_boselaphus tragocamelus",
    crosstab."buffalo_bubalus bubalis",
    crosstab."camel_camelus ferus",
    crosstab."dog_canis familiaris",
    crosstab."wolf_canis lupus",
    crosstab."wild goat_capra aegagrus",
    crosstab."goat_capra aegagrus hircus",
    crosstab."markhor_capra falconeri",
    crosstab."alpine ibex_capra ibex",
    crosstab."siberian ibex_capra sibirica",
    crosstab."roe deer_capreolus capreolus",
    crosstab."carnivorae_carnivorae",
    crosstab."elk_cervus elaphus canadensis",
    crosstab."red deer_cervus elaphus elaphus",
    crosstab."sika deer_cervus nippon",
    crosstab."fallow deer_dama dama",
    crosstab."donkey_equus africanus asinus",
    crosstab."horse_equus ferus caballus",
    crosstab."przewalski horse_equus ferus przewalskii",
    crosstab."onager_equus hemionus",
    crosstab."cat_felis catus",
    crosstab."chinkara_gazella bennettii",
    crosstab."goitered gazelle_gazella subgutturosa",
    crosstab."crested porcupine_hystrix cristata",
    crosstab."badger_meles meles",
    crosstab."musk deer_moschus sp",
    crosstab."raccoon dog_nyctereutes procyonoides",
    crosstab."mule deer_odocoileus hemionus",
    crosstab."black tailed deer_odocoileus hemionus columbianus",
    crosstab."white tailed deer_odocoileus virginianus",
    crosstab."mountain goat_oreamnos americanus",
    crosstab."muskox_ovibos moschatus",
    crosstab."argali_ovis ammon",
    crosstab."sheep_ovis aries",
    crosstab."bighorn_ovis canadensis",
    crosstab."dall sheep_ovis dalli",
    crosstab."snow sheep_ovis nivicola",
    crosstab."mouflon_ovis orientalis",
    crosstab."urial_ovis orientalis vignei",
    crosstab."mongolian gazelle_procapra gutturosa",
    crosstab."przewalski gazelle_procapra przewalskii",
    crosstab."blue sheep_pseudois nayaur",
    crosstab."wild reindeer_rangifer tarandus",
    crosstab."chamois_rupicapra rupicapra",
    crosstab."saiga_saiga tatarica",
    crosstab."wild boar_sus scrofa",
    crosstab."pig_sus scrofa domesticus",
    crosstab."brown bear_ursus arctos",
    crosstab."red fox_vulpes vulpes",
    crosstab."wild artiodactyla_wild artiodactyla",
    crosstab."wild bovidae_wild bovidae",
    crosstab."bird_aves",
    crosstab."castor sp_castor sp",
    crosstab."cervidae_cervidae",
    crosstab."domestic ungulata_domestic ungulata",
    crosstab."fish_fish",
    crosstab."garbage_garbage",
    crosstab."lagomorpha_lagomorpha",
    crosstab."marmota sp_marmota sp",
    crosstab."mesomammals_mesomammals",
    crosstab."micromammals_micromammals",
    crosstab."microrodents_microrodents",
    crosstab."other_other",
    crosstab."other domestic ungulata_other domestic ungulata",
    crosstab."semiaquatic rodentia_semiaquatic rodentia",
    crosstab."undefined item_undefined item",
    crosstab."vegetable fruit_vegetable fruit"
   FROM crosstab($bb$SELECT diet_analysis_id,(common_name || '_' || species_name) comsp,diet_item_frequency FROM (
	SELECT diet_analysis_id, diet_item_id,diet_item_frequency FROM 
	(SELECT diet_analysis_id, diet_item_id
	FROM main.diet_item b
	CROSS JOIN main.diet_analysis a
	ORDER BY diet_analysis_id, diet_item_id) x
	LEFT OUTER JOIN 
	(SELECT diet_analysis_id, diet_item_frequency, diet_item_id FROM main.wolfdiet JOIN main.diet_item USING (diet_item_id)) y
	USING (diet_item_id, diet_analysis_id)
	) zz JOIN main.diet_item USING (diet_item_id) 
	ORDER BY diet_analysis_id, diet_item_id::text$bb$, $aa$SELECT CASE WHEN species_name IS NULL THEN common_name ELSE (common_name || '_' || species_name) END comsp FROM main.diet_item ORDER BY diet_item_id$aa$::text) crosstab(diet_analysis_id integer, 
    "moose_alces alces" double precision, 
    "blackbuck_antilope cervicapra" double precision, 
    "american bison_bison bison" double precision, 
    "european bison_bison bonasus" double precision, 
    "yak_bos grunniens" double precision, 
    "cattle_bos taurus" double precision, 
    "nilgai_boselaphus tragocamelus" double precision, 
    "buffalo_bubalus bubalis" double precision, 
    "camel_camelus ferus" double precision, 
    "dog_canis familiaris" double precision, 
    "wolf_canis lupus" double precision, 
    "wild goat_capra aegagrus" double precision, 
    "goat_capra aegagrus hircus" double precision, 
    "markhor_capra falconeri" double precision, 
    "alpine ibex_capra ibex" double precision, 
    "siberian ibex_capra sibirica" double precision, 
    "roe deer_capreolus capreolus" double precision, 
    "carnivorae_carnivorae" double precision, 
    "elk_cervus elaphus canadensis" double precision, 
    "red deer_cervus elaphus elaphus" double precision, 
    "sika deer_cervus nippon" double precision, 
    "fallow deer_dama dama" double precision, 
    "donkey_equus africanus asinus" double precision, 
    "horse_equus ferus caballus" double precision, 
    "przewalski horse_equus ferus przewalskii" double precision, 
    "onager_equus hemionus" double precision, 
    "cat_felis catus" double precision, 
    "chinkara_gazella bennettii" double precision, 
    "goitered gazelle_gazella subgutturosa" double precision, 
    "crested porcupine_hystrix cristata" double precision, 
    "badger_meles meles" double precision, 
    "musk deer_moschus sp" double precision, 
    "raccoon dog_nyctereutes procyonoides" double precision,
    "mule deer_odocoileus hemionus" double precision, 
    "black tailed deer_odocoileus hemionus columbianus" double precision, 
    "white tailed deer_odocoileus virginianus" double precision, 
    "mountain goat_oreamnos americanus" double precision, 
    "muskox_ovibos moschatus" double precision, 
    "argali_ovis ammon" double precision, 
    "sheep_ovis aries" double precision, 
    "bighorn_ovis canadensis" double precision, 
    "dall sheep_ovis dalli" double precision, 
    "snow sheep_ovis nivicola" double precision,
    "mouflon_ovis orientalis" double precision, 
    "urial_ovis orientalis vignei" double precision, 
    "mongolian gazelle_procapra gutturosa" double precision, 
    "przewalski gazelle_procapra przewalskii" double precision, 
    "blue sheep_pseudois nayaur" double precision, 
    "wild reindeer_rangifer tarandus" double precision, 
    "chamois_rupicapra rupicapra" double precision, 
    "saiga_saiga tatarica" double precision, 
    "wild boar_sus scrofa" double precision, 
    "pig_sus scrofa domesticus" double precision, 
    "brown bear_ursus arctos" double precision, 
    "red fox_vulpes vulpes" double precision, 
    "wild artiodactyla_wild artiodactyla" double precision, 
    "wild bovidae_wild bovidae" double precision, 
    "bird_aves" double precision,
    "castor sp_castor sp" double precision, 
    "cervidae_cervidae" double precision, 
    "domestic ungulata_domestic ungulata" double precision, 
    "fish_fish" double precision, 
    "garbage_garbage" double precision, 
    "lagomorpha_lagomorpha" double precision, 
    "marmota sp_marmota sp" double precision, 
    "mesomammals_mesomammals" double precision, 
    "micromammals_micromammals" double precision, 
    "microrodents_microrodents" double precision, 
    "other_other" double precision, 
    "other domestic ungulata_other domestic ungulata" double precision, 
    "semiaquatic rodentia_semiaquatic rodentia" double precision, 
    "undefined item_undefined item" double precision, 
    "vegetable fruit_vegetable fruit" double precision
    );


-- Complete
CREATE OR REPLACE VIEW main.diet_item_complete AS
	SELECT DISTINCT diet_analysis_id, 
	world_country_description,
	wolf_population_code,
	wolf_subspecies_code,
	study_area,
	pack,
	latitude,
	longitude,
	source_code,
	analytical_method_code,
	identification_method_code,
	temporal_scale_code,
	derived_diet,
	sample_size,
	surface_area,
	sampling_period,
	time_series,
	spatial_effort,
	temporal_effort,
	total_effort,
	moose, blackbuck, "american bison", "european bison", yak, cattle, nilgai, buffalo, camel, dog, wolf, "wild goat", goat, markhor, "alpine ibex", "siberian ibex", "roe deer", carnivorae, elk, "red deer", "sika deer", "fallow deer", donkey, horse, "przewalski horse", onager, cat, chinkara, "goitered gazelle", "crested porcupine", badger, "musk deer", "raccoon dog", "mule deer", "black tailed deer", "white tailed deer", "mountain goat", muskox, argali, sheep, bighorn, "dall sheep", "snow sheep", mouflon, urial, "mongolian gazelle", "przewalski gazelle", "blue sheep", "wild reindeer", chamois, saiga, "wild boar", pig, "brown bear", "red fox", "wild artiodactyla", "wild bovidae", bird, "castor sp", cervidae, "domestic ungulata", fish, garbage, lagomorpha, "marmota sp", mesomammals, micromammals, microrodents, other, "other domestic ungulata", "semiaquatic rodentia", "undefined item", "vegetable fruit"
		FROM main.diet_item_users 
		JOIN main.wolfdiet USING (diet_analysis_id)
		JOIN main.diet_analysis
		USING (diet_analysis_id) 
		JOIN main.site USING (site_id) 
		JOIN lu_tables.lu_wolf_population using (wolf_population_id) 
		JOIN lu_tables.lu_source using (source_id) 
		JOIN lu_tables.lu_analytical_method using (analytical_method_id) 
		--JOIN lu_tables.lu_temporal_scale using (temporal_scale_id) 
		JOIN env_data.world_country using (world_country_id) 
		JOIN lu_tables.lu_wolf_subspecies using (wolf_subspecies_id)
		--JOIN lu_tables.lu_identification_method using (identification_method_id);

