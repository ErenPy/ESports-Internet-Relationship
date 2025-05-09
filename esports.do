describe

summarize

// Histograms

// Scatter Plots

// Set Pooled Cross Sectional Model
xtset country_id year

gen pen_0_50 = int_pen < 50

reg ln_earnings ln_lat_ms ln_d_mbps pen_0_50 sui_rt urban_pop ln_gdp_p ln_pop, vce(cluster country_id)

reg ln_earnings ln_lat_ms pen_0_50 sui_rt urban_pop ln_gdp_p ln_pop, vce(cluster country_id)

reg ln_earnings ln_lat_ms pen_0_50 sui_rt urban_pop ln_pop, vce(cluster country_id)

reg ln_earnings ln_lat_ms pen_0_50 sui_rt ln_gdp_p ln_pop, vce(cluster country_id)

// Set Extended Model

gen lat_0_25 = ln_lat_ms < 3.21887582487

gen pen_0_75 = int_pen < 75

gen lat_025_x_pen_075 = lat_0_25 * pen_0_75

reg ln_earnings lat_0_25 pen_0_75 lat_025_x_pen_075 unemp_15_24 sui_rt urban_pop ln_gdp_p pop_15_29 ln_pop, vce(cluster country_id)

reg ln_earnings lat_0_25 pen_0_75 lat_025_x_pen_075 sui_rt urban_pop ln_gdp_p pop_15_29 ln_pop, vce(cluster country_id)

reg ln_earnings lat_0_25 pen_0_75 lat_025_x_pen_075 urban_pop ln_gdp_p pop_15_29 ln_pop, vce(cluster country_id)

reg ln_earnings lat_0_25 pen_0_75 lat_025_x_pen_075 ln_gdp_p pop_15_29 ln_pop, vce(cluster country_id)

// Set Fixed Effects Regression Model

gen ln_d_mbps_sq = ln_d_mbps^2

xtreg ln_earnings ln_lat_ms ln_d_mbps ln_d_mbps_sq sui_rt urban_pop ln_gdp_p pop_15_29 ln_pop,fe vce(cluster country_id)

xtreg ln_earnings ln_lat_ms ln_d_mbps ln_d_mbps_sq unemp_15_24 sui_rt urban_pop ln_gdp_p ln_pop,fe vce(cluster country_id)

xtreg ln_earnings ln_lat_ms ln_d_mbps ln_d_mbps_sq unemp_15_24 sui_rt ln_gdp_p ln_pop,fe vce(cluster country_id)

xtreg ln_earnings ln_lat_ms ln_d_mbps ln_d_mbps_sq unemp_15_24 ln_gdp_p ln_pop,fe vce(cluster country_id)


// Set Extended Model

xtreg ln_earnings ln_lat_ms ln_d_mbps ln_d_mbps_sq unemp_15_24 c.ln_gdp_p##c.pop_15_29 ln_pop,fe vce(cluster country_id)

margins, at(ln_gdp_p = (5.86(2)11.86) pop_15_29 = (14 22 32))

marginsplot, recast(line) ///
    plotopts(lwidth(medthick)) ///
    ylabel(, angle(0)) ///
    ytitle("Marginal Effect of Youth Population Share", size(medsmall)) ///
    xtitle("ln(GDP per capita)", size(medsmall)) ///
    graphregion(color(white)) ///
    title("Marginal Effect of Youth Share at Different Income Levels", size(medsmall))

