USE [DB]
GO
/****** Object:  View [Auxiliar].[VW_CAMPAIGN_EXT]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [Auxiliar].[VW_CAMPAIGN_EXT] AS SELECT CAMPAIGN_SK, ORDEN, PRODUCTO, SUBPRODUCTO, TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM ( SELECT CAMPAIGN_SK, 1 AS ORDEN, PRODUCTO_1 AS PRODUCTO, SUB_PRODUCTO_1 AS SUBPRODUCTO, TIPO_1 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_1 IS NOT NULL OR SUB_PRODUCTO_1 IS NOT NULL OR TIPO_1 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 2 AS ORDEN, PRODUCTO_2 AS PRODUCTO, SUB_PRODUCTO_2 AS SUBPRODUCTO, TIPO_2 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_2 IS NOT NULL OR SUB_PRODUCTO_2 IS NOT NULL OR TIPO_2 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 3 AS ORDEN, PRODUCTO_3 AS PRODUCTO, SUB_PRODUCTO_3 AS SUBPRODUCTO, TIPO_3 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_3 IS NOT NULL OR SUB_PRODUCTO_3 IS NOT NULL OR TIPO_3 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 4 AS ORDEN, PRODUCTO_4 AS PRODUCTO, SUB_PRODUCTO_4 AS SUBPRODUCTO, TIPO_4 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_4 IS NOT NULL OR SUB_PRODUCTO_4 IS NOT NULL OR TIPO_4 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 5 AS ORDEN, PRODUCTO_5 AS PRODUCTO, SUB_PRODUCTO_5 AS SUBPRODUCTO, TIPO_5 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_5 IS NOT NULL OR SUB_PRODUCTO_5 IS NOT NULL OR TIPO_5 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 6 AS ORDEN, PRODUCTO_6 AS PRODUCTO, SUB_PRODUCTO_6 AS SUBPRODUCTO, TIPO_6 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_6 IS NOT NULL OR SUB_PRODUCTO_6 IS NOT NULL OR TIPO_6 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 7 AS ORDEN, PRODUCTO_7 AS PRODUCTO, SUB_PRODUCTO_7 AS SUBPRODUCTO, TIPO_7 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_7 IS NOT NULL OR SUB_PRODUCTO_7 IS NOT NULL OR TIPO_7 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 8 AS ORDEN, PRODUCTO_8 AS PRODUCTO, SUB_PRODUCTO_8 AS SUBPRODUCTO, TIPO_8 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_8 IS NOT NULL OR SUB_PRODUCTO_8 IS NOT NULL OR TIPO_8 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 9 AS ORDEN, PRODUCTO_9 AS PRODUCTO, SUB_PRODUCTO_9 AS SUBPRODUCTO, TIPO_9 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_9 IS NOT NULL OR SUB_PRODUCTO_9 IS NOT NULL OR TIPO_9 IS NOT NULL UNION ALL SELECT CAMPAIGN_SK, 10 AS ORDEN, PRODUCTO_10 AS PRODUCTO, SUB_PRODUCTO_10 AS SUBPRODUCTO, TIPO_10 AS TIPO, SEGMENTO, ACCION, OBJ_DESCRIP, MONTO_OBJETIVO, CANT_OBJETIVO, HIT_RATE_OBJ, FRECUENCIA, VIGENCIA_DESDE, VIGENCIA_HASTA, AREA_RESP FROM [CDM].[CI_CAMPAIGN_EXT] WHERE PRODUCTO_10 IS NOT NULL OR SUB_PRODUCTO_10 IS NOT NULL OR TIPO_10 IS NOT NULL ) SQ;
GO
/****** Object:  View [Auxiliar].[VW_CLIENTE_SUCURSAL_DELIVERY]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [Auxiliar].[VW_CLIENTE_SUCURSAL_DELIVERY] AS SELECT DISTINCT A.ID_CLIENTE, B.BAN_ESTADO_DELIVERY AS ESTADO_DELIVERY, B.ID_SUCURSAL_DELIVERY AS SUCURSAL_DELIVERY FROM DATAMART.DIM_CLIENTES A LEFT JOIN DATAMART.FCT_BANELCO B ON (A.ID_CLIENTE = B.ID_CLIENTE) INNER JOIN ( SELECT ID_CLIENTE FROM (SELECT DISTINCT B.ID_CLIENTE, B.ID_SUCURSAL_DELIVERY FROM DATAMART.FCT_BANELCO B WHERE B.ID_SUCURSAL_DELIVERY > 0 AND B.BAN_ESTADO_DELIVERY = 'En sucursal' AND B.BAN_FECHA_ESTADO_DELIVERY >= DATEADD(DAY, -90, GETDATE()) AND B.TAR_FEC_ULT_USO IS NULL ) sq1 GROUP BY ID_CLIENTE HAVING COUNT(*) = 1 ) C ON (B.ID_CLIENTE = C.ID_CLIENTE) WHERE B.ID_SUCURSAL_DELIVERY > 0 AND B.BAN_ESTADO_DELIVERY = 'En sucursal' AND B.BAN_FECHA_ESTADO_DELIVERY >= DATEADD(DAY, -90, GETDATE()) AND B.TAR_FEC_ULT_USO IS NULL UNION SELECT DISTINCT A.ID_CLIENTE, B.TCT_ESTADO_DELIVERY AS ESTADO_DELIVERY, B.ID_SUCURSAL_DELIVERY AS SUCURSAL_DELIVERY FROM DATAMART.DIM_CLIENTES A LEFT JOIN DATAMART.FCT_TARJETASCREDITO B ON (A.ID_CLIENTE = B.ID_CLIENTE) INNER JOIN ( SELECT ID_CLIENTE FROM ( SELECT DISTINCT B.Id_Cliente, b.Id_Sucursal_Delivery FROM DATAMART.FCT_TARJETASCREDITO B WHERE b.ID_SUCURSAL_DELIVERY > 0 AND b.TCT_ESTADO_DELIVERY = 'En sucursal' AND B.TCT_FECHA_ESTADO_DELIVERY >= DATEADD(DAY, -90, GETDATE()) AND B.TCC_ID_ESTADO = 1 AND B.TCT_ID_ESTADO = 1 AND B.TCC_ID_TIPO <> 2 AND B.TCX_FEC_ULT_COMPRA_PES IS NULL AND B.TCX_FEC_ULT_COMPRA_DOL IS NULL AND B.TCC_MARCA IN ('Argencard','Visa') ) sq1 GROUP BY ID_CLIENTE HAVING COUNT(*) = 1 ) C ON (B.ID_CLIENTE = C.ID_CLIENTE) WHERE b.ID_SUCURSAL_DELIVERY > 0 AND b.TCT_ESTADO_DELIVERY = 'En sucursal' AND B.TCT_FECHA_ESTADO_DELIVERY >= DATEADD(DAY, -90, GETDATE()) AND B.TCC_ID_ESTADO = 1 AND B.TCT_ID_ESTADO = 1 AND B.TCC_ID_TIPO <> 2 AND B.TCX_FEC_ULT_COMPRA_PES IS NULL AND B.TCX_FEC_ULT_COMPRA_DOL IS NULL AND B.TCC_MARCA IN ('Argencard','Visa');
GO
/****** Object:  View [Auxiliar].[VW_OFERTASPIC_PRESENCIAL]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [Auxiliar].[VW_OFERTASPIC_PRESENCIAL] AS SELECT ID_CLIENTE, PER_LOTE, PER_CANAL, PAQ_COD_SELECCIONADO_APROB, PP_CFTNA_12M, PP_CFTEA_12M, PP_DISPONIBLE_12M, PP_DESEMBOLSO_12M, PP_CUOTA_12M, PP_TASA_12M, PP_CAPITAL_12M, PP_CFTNA_18M, PP_CFTEA_18M, PP_DISPONIBLE_18M, PP_DESEMBOLSO_18M, PP_CUOTA_18M, PP_TASA_18M, PP_CAPITAL_18M, PP_CFTNA_24M, PP_CFTEA_24M, PP_DISPONIBLE_24M, PP_DESEMBOLSO_24M, PP_CUOTA_24M, PP_TASA_24M, PP_CAPITAL_24M, PP_CFTNA_36M, PP_CFTEA_36M, PP_DISPONIBLE_36M, PP_DESEMBOLSO_36M, PP_CUOTA_36M, PP_TASA_36M, PP_CAPITAL_36M, PP_CFTNA_48M, PP_CFTEA_48M, PP_DISPONIBLE_48M, PP_DESEMBOLSO_48M, PP_CUOTA_48M, PP_TASA_48M, PP_CAPITAL_48M, PP_CFTNA_60M, PP_CFTEA_60M, PP_DISPONIBLE_60M, PP_DESEMBOLSO_60M, PP_CUOTA_60M, PP_TASA_60M, PP_CAPITAL_60M, PP_CFTNA_72M, PP_CFTEA_72M, PP_DISPONIBLE_72M, PP_DESEMBOLSO_72M, PP_CUOTA_72M, PP_TASA_72M, PP_CAPITAL_72M, PP_CFTNA_84M, PP_CFTEA_84M, PP_DISPONIBLE_84M, PP_DESEMBOLSO_84M, PP_CUOTA_84M, PP_TASA_84M, PP_CAPITAL_84M, PP_CFTNA_96M, PP_CFTEA_96M, PP_DISPONIBLE_96M, PP_DESEMBOLSO_96M, PP_CUOTA_96M, PP_TASA_96M, PP_CAPITAL_96M, TCC_LIMITE_VISA, TCC_DESCRIPCION_VISA, TCT_VISA_ACTUAL, TCT_OFERTA_VISA, TCC_LIMITE_MASTER, TCC_DESCRIPCION_MASTER, TCT_MASTER_ACTUAL, TCT_OFERTA_MASTER, PRE_CUOTA_DEFAULT, PRE_CFT_DEFAULT, PRE_TNA_DEFAULT, PRE_CANT_CUOTA_DEFAULT, PRE_MTO_PRE_CANCELACION_TOTAL_ACTUAL_APROB, PRE_MTO_CAPITAL_DISPONIBLE, PRE_MTO_OFERTA_DEFAULT, FECHACARGA, FECHAACTUALIZACION FROM [DataMart].[FCT_OFERTASPIC] WHERE PER_CANAL = 1;
GO
/****** Object:  View [Auxiliar].[VW_SASCampaign_Control]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Auxiliar].[VW_SASCampaign_Control] AS

-- STA
SELECT Esquema, Tabla, MinF, MaxF, Q_F, R, CONVERT(DATETIME,NULL) FechaActualizacion
FROM (
SELECT 'sta' Esquema, 'sta_historico_respuestas' Tabla, MIN(fecha_carga) MinF, MAX(fecha_carga) MaxF, COUNT(DISTINCT fecha_carga) Q_F, COUNT(*) R FROM sta.sta_historico_respuestas UNION
SELECT 'sta' Esquema, 'sta_load_responses' Tabla, MIN(response_dt) MinF, MAX(response_dt) MaxF, COUNT(DISTINCT response_dt) Q_F, COUNT(*) R FROM sta.sta_load_responses UNION
SELECT 'sta' Esquema, 'sta_lkv_suc_sucursal' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R FROM sta.sta_lkv_suc_sucursal UNION
SELECT 'sta' Esquema, 'sta_lkv_suc_tipo' Tabla, NULL MinF, NULL MaxF, NULL Q_F,/*MIN() MinF, MAX() MaxF, COUNT(DISTINCT ) Q_F,*/ COUNT(*) R FROM sta.sta_lkv_suc_tipo UNION
SELECT 'sta' Esquema, 'sta_lkv_rv_nomina' Tabla, MIN(fecha_carga) MinF, MAX(fecha_carga) MaxF, COUNT(DISTINCT fecha_carga) Q_F, COUNT(*) R FROM sta.sta_lkv_rv_nomina UNION
SELECT 'sta' Esquema, 'sta_dcl_persona' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_persona UNION
SELECT 'sta' Esquema, 'sta_dcl_inhab_cambios' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_inhab_cambios UNION
SELECT 'sta' Esquema, 'sta_dcl_calificacion_masiva_semaforos_canal' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_calificacion_masiva_semaforos_canal UNION
SELECT 'sta' Esquema, 'sta_dcl_estado_plasticos_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_estado_plasticos_bm UNION
SELECT 'sta' Esquema, 'sta_dcl_jubilados_rci' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_jubilados_rci UNION
SELECT 'sta' Esquema, 'sta_dhb_usuarios' Tabla, MIN(hb_fec_carga) MinF, MAX(hb_fec_carga) MaxF, COUNT(DISTINCT hb_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dhb_usuarios UNION
SELECT 'sta' Esquema, 'sta_dtc_tarjeta_credito' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dtc_tarjeta_credito UNION
SELECT 'sta' Esquema, 'sta_dtd_banelco' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dtd_banelco UNION
SELECT 'sta' Esquema, 'sta_dtd_banelco_padron' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_dtd_banelco_padron UNION
SELECT 'sta' Esquema, 'sta_dcl_lista_negra_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_lista_negra_bm UNION
SELECT 'sta' Esquema, 'sta_dcl_maestro_emails_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_maestro_emails_bm UNION
SELECT 'sta' Esquema, 'sta_dcl_riesgos_fraude_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_riesgos_fraude_bm UNION
SELECT 'sta' Esquema, 'sta_dcc_cuenta_corriente' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcc_cuenta_corriente UNION
SELECT 'sta' Esquema, 'sta_dca_caja_ahorro' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dca_caja_ahorro UNION
SELECT 'sta' Esquema, 'sta_dcl_contactacion_producto_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_contactacion_producto_bm UNION
SELECT 'sta' Esquema, 'sta_dcl_no_admitidos' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_no_admitidos UNION
SELECT 'sta' Esquema, 'sta_dcl_telefonos_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_telefonos_bm UNION
SELECT 'sta' Esquema, 'sta_dcu_operacion' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcu_operacion UNION
SELECT 'sta' Esquema, 'sta_dpp_prestamo' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dpp_prestamo UNION
SELECT 'sta' Esquema, 'sta_dpp_prestamo_consumo' Tabla, MIN(fecha_carga) MinF, MAX(fecha_carga) MaxF, COUNT(DISTINCT fecha_carga) Q_F, COUNT(*) R FROM sta.sta_dpp_prestamo_consumo UNION
SELECT 'sta' Esquema, 'sta_crm_parametros_api' Tabla, MIN(crm_fec_carga) MinF, MAX(crm_fec_carga) MaxF, COUNT(DISTINCT crm_fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_parametros_api UNION
SELECT 'sta' Esquema, 'sta_crm_in_usuario' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_usuario UNION
SELECT 'sta' Esquema, 'sta_crm_unidad_negocio' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_unidad_negocio UNION
SELECT 'sta' Esquema, 'sta_crm_in_cuenta_cliente' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_cuenta_cliente UNION
SELECT 'sta' Esquema, 'sta_crm_in_producto' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_producto UNION
SELECT 'sta' Esquema, 'sta_mcl_clientes' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mcl_clientes UNION
SELECT 'sta' Esquema, 'sta_mcl_indeseable' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_mcl_indeseable UNION
SELECT 'sta' Esquema, 'sta_msg_ent_liq_bcra' Tabla, MIN(sel_fec_carga) MinF, MAX(sel_fec_carga) MaxF, COUNT(DISTINCT sel_fec_carga) Q_F, COUNT(*) R FROM sta.sta_msg_ent_liq_bcra UNION
SELECT 'sta' Esquema, 'sta_msg_riesgo_bcra' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_msg_riesgo_bcra UNION
SELECT 'sta' Esquema, 'sta_mcu_transaccion' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mcu_transaccion UNION
SELECT 'sta' Esquema, 'sta_mse_padron_seguros' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mse_padron_seguros UNION
SELECT 'sta' Esquema, 'sta_mtd_trans_banelco' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mtd_trans_banelco UNION
SELECT 'sta' Esquema, 'sta_mtd_trans_electron' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mtd_trans_electron UNION
SELECT 'sta' Esquema, 'sta_mcl_indicadores' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mcl_indicadores UNION
SELECT 'sta' Esquema, 'sta_mri_prevision_prsdeu' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT cta_fec_carga) Q_F, COUNT(*) R FROM sta.sta_mri_prevision_prsdeu UNION
SELECT 'sta' Esquema, 'sta_dcl_prospectos_bm' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R FROM sta.sta_dcl_prospectos_bm UNION
SELECT 'sta' Esquema, 'sta_crm_in_localidad' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_localidad UNION
SELECT 'sta' Esquema, 'sta_crm_in_equipo' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_equipo UNION
SELECT 'sta' Esquema, 'sta_segmento_calif' Tabla, NULL MinF, NULL MaxF, NULL Q_F, /*MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F,*/ COUNT(*) R FROM sta.sta_segmento_calif UNION
SELECT 'sta' Esquema, 'sta_crm_in_segmento' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_segmento UNION
SELECT 'sta' Esquema, 'sta_crm_in_lead' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_lead UNION
SELECT 'sta' Esquema, 'sta_crm_in_pais' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_pais UNION
SELECT 'sta' Esquema, 'sta_lk_cmp_oficiales' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_lk_cmp_oficiales UNION
SELECT 'sta' Esquema, 'sta_crm_in_atributo' Tabla, MIN(fec_carga) MinF, MAX(fec_carga) MaxF, COUNT(DISTINCT fec_carga) Q_F, COUNT(*) R FROM sta.sta_crm_in_atributo UNION
SELECT 'sta' Esquema, 'sta_stock_cordial_servicios' Tabla, MIN(CONVERT(CHAR,fec_carga,112)) MinF, MAX(CONVERT(CHAR,fec_carga,112)) MaxF, COUNT(DISTINCT CONVERT(CHAR,fec_carga,112)) Q_F, COUNT(*) R FROM sta.sta_stock_cordial_servicios UNION
SELECT 'sta' Esquema, 'sta_api_campaign_referidos' Tabla, MIN(fec_creacion_origen) MinF, MAX(fec_creacion_origen) MaxF, COUNT(DISTINCT CONVERT(CHAR,fec_creacion_origen,112)) Q_F, COUNT(*) R FROM sta.sta_api_campaign_referidos UNION
SELECT 'sta' Esquema, 'sta_dpf_plazo_fijo' Tabla, MIN(cta_fec_carga) MinF, MAX(cta_fec_carga) MaxF, COUNT(DISTINCT CONVERT(CHAR,cta_fec_carga,112)) Q_F, COUNT(*) R FROM sta.sta_dpf_plazo_fijo UNION
SELECT 'sta' Esquema, 'sta_lk_mon_moneda' Tabla, MIN(fecha_actualizacion) MinF, MAX(fecha_actualizacion) MaxF, COUNT(DISTINCT CONVERT(CHAR,fecha_actualizacion,112)) Q_F, COUNT(*) R FROM sta.sta_lk_mon_moneda
) STA UNION


-- AUXILIAR
SELECT 'Auxiliar' Esquema, 'CLIENTES_DUPLICADOS' Tabla, MIN(per_fec_carga) MinF, MAX(per_fec_carga) MaxF, COUNT(DISTINCT per_fec_carga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM Auxiliar.CLIENTES_DUPLICADOS UNION
SELECT 'Auxiliar' Esquema, 'AUX_CONTACTACION' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM Auxiliar.AUX_CONTACTACION UNION
SELECT 'Auxiliar' Esquema, 'AUX_CROSS_SELL' Tabla, NULL MinF, NULL MaxF, NULL Q_F, COUNT(*) R, NULL fechaactualizacion FROM Auxiliar.AUX_CROSS_SELL UNION
SELECT 'Auxiliar' Esquema, 'AUX_CRM_IN_UNIDAD_NEGOCIO' Tabla, MIN(fecha_carga) MinF, MAX(fecha_carga) MaxF, COUNT(DISTINCT fecha_carga) Q_F, COUNT(*) R, MAX(fecha_actualizacion) fechaactualizacion FROM Auxiliar.AUX_CRM_IN_UNIDAD_NEGOCIO UNION
SELECT 'Auxiliar' Esquema, 'AUX_CRM_IN_PRODUCTO' Tabla, MIN(fecha_carga) MinF, MAX(fecha_carga) MaxF, COUNT(DISTINCT fecha_carga) Q_F, COUNT(*) R, MAX(fecha_actualizacion) fechaactualizacion FROM Auxiliar.AUX_CRM_IN_PRODUCTO UNION


-- DATAMART
SELECT 'DataMart' Esquema, 'VW_FCT_CUENTACORRIENTE_ELEGIDA' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.VW_FCT_CUENTACORRIENTE_ELEGIDA UNION
SELECT 'DataMart' Esquema, 'VW_FCT_CAJAAHORRO_ELEGIDAS' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.VW_FCT_CAJAAHORRO_ELEGIDAS UNION
SELECT 'DataMart' Esquema, 'VW_FCT_TARJETASCREDITO_ELEGIDAS' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.VW_FCT_TARJETASCREDITO_ELEGIDAS UNION
SELECT 'DataMart' Esquema, 'DIM_SUCURSALES' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.DIM_SUCURSALES UNION
SELECT 'DataMart' Esquema, 'FCT_CAJAAHORRO' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_CAJAAHORRO UNION
SELECT 'DataMart' Esquema, 'FCT_CUENTACORRIENTE' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_CUENTACORRIENTE UNION
SELECT 'DataMart' Esquema, 'FCT_SEGUROS' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_SEGUROS UNION
SELECT 'DataMart' Esquema, 'FCT_OFERTASPIC' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_OFERTASPIC UNION
SELECT 'DataMart' Esquema, 'FCT_USUARIOSCRM' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_USUARIOSCRM UNION
SELECT 'DataMart' Esquema, 'DIM_CLIENTES' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.DIM_CLIENTES UNION
SELECT 'DataMart' Esquema, 'FCT_TARJETASCREDITO' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_TARJETASCREDITO UNION
SELECT 'DataMart' Esquema, 'FCT_BANELCO' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_BANELCO UNION
SELECT 'DataMart' Esquema, 'FCT_NOMINAOFICIALES' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_NOMINAOFICIALES UNION
SELECT 'DataMart' Esquema, 'DIM_PROSPECTOS' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT fechacarga) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.DIM_PROSPECTOS UNION
SELECT 'DataMart' Esquema, 'DIM_REFERIDOS' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT CONVERT(CHAR,fechacarga,112)) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.DIM_REFERIDOS UNION
SELECT 'DataMart' Esquema, 'FCT_PLAZO_FIJO' Tabla, MIN(pfi_fecha_alta) MinF, MAX(pfi_fecha_alta) MaxF, COUNT(DISTINCT CONVERT(CHAR,pfi_fecha_alta,112)) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.FCT_PLAZO_FIJO UNION
SELECT 'DataMart' Esquema, 'AUX_TARJETAS_TASA_CERO' Tabla, MIN(fechacarga) MinF, MAX(fechacarga) MaxF, COUNT(DISTINCT CONVERT(CHAR,fechacarga,112)) Q_F, COUNT(*) R, MAX(fechaactualizacion) fechaactualizacion FROM DataMart.AUX_TARJETAS_TASA_CERO UNION

-- REPORTERIA
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_CAMPANIAS' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_CAMPANIAS UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_CAMPANIAS_DETALLE' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_CAMPANIAS_DETALLE UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_COMUNICACIONES' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_COMUNICACIONES UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_CONTACTOS' Tabla, null MinF, null MaxF,null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_CONTACTOS UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_CLIENTES_DETALLE' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_CLIENTES_DETALLE UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_PROSPECTOS_DETALLE' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_PROSPECTOS_DETALLE UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_RESPUESTAS' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_RESPUESTAS UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_RESPUESTAS_CC' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_RESPUESTAS_CC UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_TRATAMIENTOS' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_TRATAMIENTOS UNION
SELECT 'DataMart' Esquema, 'VW_FCT_RPT_TRATAMIENTOS_DETALLE' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_FCT_RPT_TRATAMIENTOS_DETALLE UNION
SELECT 'DataMart' Esquema, 'VW_RPT_CAMPAING_CUBO' Tabla, null MinF, null MaxF, null Q_F, COUNT(*) R, MAX(getdate()) fechaactualizacion FROM DataMart.VW_RPT_CAMPAING_CUBO

;
GO
/****** Object:  View [Auxiliar].[VW_SASCampaign_INFORMATIONSCHEMA]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Auxiliar].[VW_SASCampaign_INFORMATIONSCHEMA]

AS 

SELECT
	C.TABLE_CATALOG,
	T.TABLE_TYPE,
	C.TABLE_SCHEMA,
	C.TABLE_NAME,
	C.COLUMN_NAME,
	C.ORDINAL_POSITION,
	C.COLUMN_DEFAULT,
	C.IS_NULLABLE,
	C.DATA_TYPE,
	C.CHARACTER_MAXIMUM_LENGTH,
	C.CHARACTER_OCTET_LENGTH,
	C.NUMERIC_PRECISION,
	C.NUMERIC_PRECISION_RADIX,
	C.NUMERIC_SCALE,
	C.DATETIME_PRECISION,
	C.CHARACTER_SET_CATALOG,
	C.CHARACTER_SET_SCHEMA,
	C.CHARACTER_SET_NAME,
	C.COLLATION_CATALOG,
	C.COLLATION_SCHEMA,
	C.COLLATION_NAME,
	C.DOMAIN_CATALOG,
	C.DOMAIN_SCHEMA,
	C.DOMAIN_NAME
FROM INFORMATION_SCHEMA.COLUMNS C
LEFT JOIN INFORMATION_SCHEMA.TABLES T
	ON	 T.TABLE_CATALOG = C.TABLE_CATALOG
	 AND T.TABLE_SCHEMA = C.TABLE_SCHEMA
	 AND T.TABLE_NAME = C.TABLE_NAME
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_CHAR_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_CHAR_UDF] AS SELECT CAMPAIGN_SK , CHAR_UDF_NM , CHAR_UDF_VAL, CHAR_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_PAGE_CHAR_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_DATE_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_DATE_UDF] AS SELECT CAMPAIGN_SK , DATE_UDF_NM , DATE_UDF_VAL , DATE_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_PAGE_DATE_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_GROUP_CHAR_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_GROUP_CHAR_UDF] AS SELECT CAMPAIGN_GROUP_SK , CHAR_UDF_NM , CHAR_UDF_VAL , CHAR_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_GRP_PAGE_CHAR_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_GROUP_DATE_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_GROUP_DATE_UDF] AS SELECT CAMPAIGN_GROUP_SK , DATE_UDF_NM , DATE_UDF_VAL , DATE_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_GRP_PAGE_DATE_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_GROUP_NUM_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_GROUP_NUM_UDF] AS SELECT CAMPAIGN_GROUP_SK , NUM_UDF_NM , NUM_UDF_VAL , NUM_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_GRP_PAGE_NUM_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [CDM].[CI_CAMPAIGN_NUM_UDF]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [CDM].[CI_CAMPAIGN_NUM_UDF] AS SELECT CAMPAIGN_SK , NUM_UDF_NM , NUM_UDF_VAL , NUM_EXT_COLUMN_NM , PROCESSED_DTTM FROM CDM.CI_CAMP_PAGE_NUM_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
/****** Object:  View [DataMart].[VW_FCT_CAJAAHORRO_ELEGIDAS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_CAJAAHORRO_ELEGIDAS] AS
SELECT
ID_CLIENTE, CTA_ID_EMPRESA, OPE_ID_MODULO,
CASE WHEN CA_ELEGIDA = 0 THEN 'SD' ELSE CAST(CTA_NUMERO AS VARCHAR(7)) END AS CTA_NUMERO,
CASE WHEN CA_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_ID_SUCURSAL AS VARCHAR(3)) END AS OPE_ID_SUCURSAL,
OPE_OPERACION,
CASE WHEN CA_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_SUB_OPERACION AS VARCHAR(3)) END AS OPE_SUB_OPERACION,
OPE_ID_MONEDA, OPE_ID_PAPEL,
CASE WHEN CA_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_ID_TIPO_OPERACION AS VARCHAR(3)) END AS OPE_ID_TIPO_OPERACION,
CASE WHEN CA_ELEGIDA = 0 THEN 'SD' ELSE LTRIM(RTRIM(CAST(OPE_CBU AS VARCHAR(25)))) END AS OPE_CBU,
CAH_ID_ESTADO, CAH_FECHA_ULT_TRANS, CA_ELEGIDA, FECHACARGA, FECHAACTUALIZACION
FROM [DataMart].[FCT_CAJAAHORRO]
WHERE [CA_ELEGIDA] = 1;
GO
/****** Object:  View [DataMart].[VW_FCT_CUENTACORRIENTE_ELEGIDA]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_CUENTACORRIENTE_ELEGIDA] AS
SELECT
ID_CLIENTE, CTA_ID_EMPRESA,
CASE WHEN CTE_ELEGIDA = 0 THEN 'SD' ELSE CAST(CTA_NUMERO AS VARCHAR(7)) END AS CTA_NUMERO,
OPE_ID_MODULO, OPE_ID_MONEDA, OPE_ID_PAPEL,
CASE WHEN CTE_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_ID_SUCURSAL AS VARCHAR(3)) END AS OPE_ID_SUCURSAL,
OPE_OPERACION,
CASE WHEN CTE_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_SUB_OPERACION AS VARCHAR(3)) END AS OPE_SUB_OPERACION,
CASE WHEN CTE_ELEGIDA = 0 THEN 'SD' ELSE CAST(OPE_ID_TIPO_OPERACION AS VARCHAR(3)) END AS OPE_ID_TIPO_OPERACION,
CASE WHEN CTE_ELEGIDA = 0 THEN 'SD' ELSE LTRIM(RTRIM(CAST(OPE_CBU AS VARCHAR(25)))) END AS OPE_CBU,
CTE_ID_ESTADO, CTE_MESES_ULT_TRANS, CTE_ELEGIDA, FECHACARGA, FECHAACTUALIZACION
FROM [DataMart].[FCT_CUENTACORRIENTE]
WHERE [CTE_ELEGIDA] = 1;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_CAMPANIAS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_CAMPANIAS] AS
SELECT	--CI_CAMPAIGN
		cc.CAMPAIGN_SK, 
		cc.CAMPAIGN_NM, 
		cc.CAMPAIGN_DESC,
		cc.MIN_BUDGET_AMT PRESUPUESTO_MIN, 
		cc.MAX_BUDGET_AMT PRESUPUESTO_MAX,
		--
		--CI_CAMPAIGN_STATUS
		ccs.CAMPAIGN_STATUS_CD ESTADO_CAMPANIA,
		ccs.CAMPAIGN_STATUS_DESC DESCRIPCION_ESTADO,
		--
		--CI_CAMPAIGN_EXT
		SEGMENTO, 
		ACCION, 
		OBJ_DESCRIP, 
		AREA_RESP, 
		FRECUENCIA, 
		HIT_RATE_OBJ, 
		MONTO_OBJETIVO, 
		CANT_OBJETIVO, 
		VIGENCIA_DESDE, 
		VIGENCIA_HASTA
FROM	CDM.CI_CAMPAIGN cc
		inner join cdm.CI_CAMPAIGN_STATUS ccs
			on cc.CAMPAIGN_STATUS_CD = ccs.CAMPAIGN_STATUS_CD
		left join CDM.CI_CAMPAIGN_EXT cce
			on cc.CAMPAIGN_SK = cce.CAMPAIGN_SK
WHERE 0=0
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_CAMPANIAS_DETALLE]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_CAMPANIAS_DETALLE] AS

--GENERO MODULO 

SELECT * FROM (

SELECT A.CAMPAIGN_SK, A.CAMPAIGN_PRODUCT_SK, A.PRODUCTO, B.SUBPRODUCTO, C.TIPO
FROM 

--PRODUCTO
(SELECT CAMPAIGN_SK,RIGHT(PRODUCTO,1) AS CAMPAIGN_PRODUCT_SK,VALOR AS PRODUCTO, NULL AS SUB_PRODUCTO
FROM [CDM].[CI_CAMPAIGN_EXT] PRODUCTO
UNPIVOT ( VALOR FOR PRODUCTO IN (PRODUCTO_1, PRODUCTO_2, PRODUCTO_3,PRODUCTO_4,PRODUCTO_5,PRODUCTO_6,PRODUCTO_7,PRODUCTO_8,PRODUCTO_9,PRODUCTO_10) ) AS unpvt) AS A

LEFT JOIN 

--SUBPRODUCTO
(SELECT CAMPAIGN_SK,RIGHT(SUBPRODUCTO,1) AS CAMPAIGN_PRODUCT_SK,NULL AS PRODUCTO, VALOR AS SUBPRODUCTO
FROM [CDM].[CI_CAMPAIGN_EXT] S
UNPIVOT ( VALOR FOR SUBPRODUCTO IN (SUB_PRODUCTO_1, SUB_PRODUCTO_2, SUB_PRODUCTO_3,SUB_PRODUCTO_4,SUB_PRODUCTO_5,SUB_PRODUCTO_6,SUB_PRODUCTO_7,SUB_PRODUCTO_8,SUB_PRODUCTO_9,SUB_PRODUCTO_10) ) AS unpvt) AS B
ON A.CAMPAIGN_SK = B.CAMPAIGN_SK
AND A.CAMPAIGN_PRODUCT_SK = B.CAMPAIGN_PRODUCT_SK

LEFT JOIN 

--TIPO
(SELECT CAMPAIGN_SK,RIGHT(TIPO,1) AS CAMPAIGN_PRODUCT_SK,NULL AS PRODUCTO,NULL AS SUB_PRODUCTO, VALOR AS TIPO
FROM [CDM].[CI_CAMPAIGN_EXT] S
UNPIVOT ( VALOR FOR TIPO IN (TIPO_1, TIPO_2, TIPO_3,TIPO_4,TIPO_5,TIPO_6,TIPO_7,TIPO_8,TIPO_9,TIPO_10) ) AS unpvt) AS C
ON A.CAMPAIGN_SK = C.CAMPAIGN_SK
AND A.CAMPAIGN_PRODUCT_SK = C.CAMPAIGN_PRODUCT_SK

)MODULO

--WHERE MODULO.CAMPAIGN_SK IN (SELECT DISTINCT CAMPAIGN_SK FROM [CDM].[CI_COMMUNICATION])
where 0=0
and	exists (select	1
			from	DataMart.VW_FCT_RPT_COMUNICACIONES vw
			where	0=0
			and		vw.campaign_sk = modulo.CAMPAIGN_SK
			)

GO
/****** Object:  View [DataMart].[VW_FCT_RPT_CLIENTES_DETALLE]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_CLIENTES_DETALLE] AS
SELECT	--DIM_CLIENTES
		dc.id_cliente, 
		dc.per_id_tipo_doc, 
		dc.per_id_pais, 
		dc.per_nro_documento, 
		dc.per_cuit_cuil 
FROM	cdm.ci_communication cm 
		INNER JOIN cdm.ci_cell_package pkg 
			ON cm.communication_sk = pkg.communication_sk 
		INNER JOIN cdm.ci_contact_history_cliente ch 
			ON pkg.cell_package_sk = ch.cell_package_sk 
		INNER JOIN datamart.dim_clientes dc 
			ON ch.id_cliente = dc.id_cliente 
WHERE	0=0
group by
		dc.id_cliente, 
		dc.per_id_tipo_doc, 
		dc.per_id_pais, 
		dc.per_nro_documento, 
		dc.per_cuit_cuil
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_COMUNICACIONES]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_COMUNICACIONES] AS
SELECT	cc.campaign_sk, 
		cc.communication_sk, 
		ccp.cell_package_sk,
		(cc.campaign_sk + SUBSTRING(REPLACE(REPLACE(REPLACE((SUBSTRING(convert(varchar,cc.processed_dttm,23),1,16) + ':00'),'-',''),':',''),' ',''),1,12)) shot_no,
		cc.communication_cd, 
		cc.communication_nm, 
		cc.communication_desc, 
		cc.communication_occurrence_no ocurrencia, 
		ccp.channel_cd,
		cch.channel_desc,
		cce.canal,
		cce.subcanal,
		cce.unidad_negocio,
		cce.equipo,
		ISNULL(cce.duracion_de_gestion,0) duracion_de_gestion,
		cc.processed_dttm inicio_comunicacion,
		DATEADD(DAY,ISNULL(cce.duracion_de_gestion,0),cc.processed_dttm) fin_comunicacion,
		cc.min_budget_offer_amt presup_oferta_min, 
		cc.max_budget_offer_amt presup_oferta_max,
		CASE WHEN cc.deleted_flg = 'N' THEN 0 ELSE 1 END flag_borrado,
		cc.processed_dttm fecha_proceso 
		--
		--ccp.response_tracking_cd,
		--
FROM	cdm.ci_communication cc 
		left join cdm.ci_communication_ext cce
			on cce.communication_sk = cc.communication_sk
		inner join cdm.ci_cell_package ccp
			on ccp.communication_sk = cc.communication_sk
			and	ccp.campaign_sk = cc.campaign_sk
		inner join cdm.ci_channel cch
			on cch.channel_cd = ccp.channel_cd
WHERE	0=0
and	exists (select	1
			from	cdm.ci_campaign cca
			where	0=0
			and		cca.campaign_sk = cc.campaign_sk
			)
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_CONTACTOS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_CONTACTOS] AS
select	qry.cell_package_sk,
		ISNULL(qry.id_cliente,-1) id_cliente,
		ISNULL(qry.prs_cuit_cuil,-1) prs_cuit_cuil,
		--qry.per_nro_lote,
		qry.contact_dttm,
		qry.contact_history_status_cd,
		chs.contact_history_status_desc,
		qry.response_tracking_cd,
		qry.package_hash_val,
		qry.flg_tipo_miembro
from	(
		select	chc.cell_package_sk,
				chc.id_cliente,
				null prs_cuit_cuil,
				--null per_nro_lote,
				chc.contact_dttm,
				chc.contact_history_status_cd,
				chc.response_tracking_cd,
				chc.package_hash_val,
				1 flg_tipo_miembro
		from	cdm.ci_contact_history_cliente chc
		union all
		select	chp.cell_package_sk,
				null id_cliente,
				chp.prs_cuit_cuil,
				--pd.per_nro_lote, CAMBIO DE DEF: No considerar el Nro de Lote del Prospecto porque no se utiliza, y se debe analizar de que manera se debera incorporarlo para CUIL y LOTE correspondan a una sola campaña, asi como esta puede levantar mas de una.
				chp.contact_dttm,
				chp.contact_history_status_cd,
				chp.response_tracking_cd,
				chp.package_hash_val,
				2 flg_tipo_miembro
		from	cdm.ci_contact_history_prospect chp
				--inner join sta.VW_FCT_RPT_PROSPECTOS_DETALLE pd
						--	on pd.prs_cuit_cuil = rhp.prs_cuit_cuil	
		) qry
		inner join cdm.ci_contact_history_status chs
			on chs.contact_history_status_cd = qry.contact_history_status_cd
where	0=0
and exists (select	1
			from	DataMart.vw_fct_rpt_comunicaciones fc
			where	0=0
			and		fc.cell_package_sk = qry.CELL_PACKAGE_SK
			)
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_PROSPECTOS_DETALLE]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_PROSPECTOS_DETALLE] AS
SELECT	--DIM_PROSPECTOS
		ppk.prs_cuit_cuil, 
		ppk.per_nro_lote, 
		ppk.per_id_tipo_doc, 
		ppk.per_id_pais, 
		ppk.per_nro_documento 
FROM	cdm.ci_communication cm 
		INNER JOIN cdm.ci_cell_package pkg 
			ON cm.communication_sk = pkg.communication_sk
		INNER JOIN cdm.ci_contact_history_prospect chp 
			ON pkg.cell_package_sk = chp.cell_package_sk
		INNER JOIN datamart.dim_prospectos ppk 
			ON chp.prs_cuit_cuil = ppk.prs_cuit_cuil
WHERE	0=0
group by
		ppk.prs_cuit_cuil, 
		ppk.per_nro_lote, 
		ppk.per_id_tipo_doc, 
		ppk.per_id_pais, 
		ppk.per_nro_documento
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_RESPUESTAS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_RESPUESTAS] AS
select	qry.cell_package_sk,
		qry.treatment_sk,
		t.treatment_nm,
		qry.response_sk,
		r.response_nm,
		ISNULL(qry.id_cliente,-1) id_cliente,
		ISNULL(qry.prs_cuit_cuil,-1) prs_cuit_cuil,
		--qry.per_nro_lote,
		qry.response_dttm,
		qry.processed_dttm,
		qry.response_tracking_cd,
		qry.response_channel_cd,
		rcr.response_channel_response_cd,
		qry.flg_tipo_miembro
from	(
		select	rhc.cell_package_sk,
				rhc.treatment_sk,
				rhc.response_sk,
				rhc.id_cliente,
				NULL prs_cuit_cuil,
				--NULL per_nro_lote,
				rhc.response_dttm,
				rhc.processed_dttm,
				rhc.response_tracking_cd,
				rhc.response_channel_cd,
				1 flg_tipo_miembro
		from	cdm.ci_response_history_cliente rhc
		union all
		select	rhp.cell_package_sk,
				rhp.treatment_sk,
				rhp.response_sk,
				NULL id_cliente,
				rhp.prs_cuit_cuil,
				--pd.per_nro_lote, CAMBIO DE DEF: No considerar el Nro de Lote del Prospecto porque no se utiliza, y se debe analizar de que manera se debera incorporarlo para CUIL y LOTE correspondan a una sola campaña, asi como esta puede levantar mas de una.
				rhp.response_dttm,
				rhp.processed_dttm,
				rhp.response_tracking_cd,
				rhp.response_channel_cd,
				2 flg_tipo_miembro
		from	cdm.ci_response_history_prospect rhp
				--inner join sta.VW_FCT_RPT_PROSPECTOS_DETALLE pd
				--	on pd.prs_cuit_cuil = rhp.prs_cuit_cuil		
		) qry
		inner join cdm.ci_response r
			on r.response_sk = qry.response_sk
		inner join cdm.ci_treatment t
			on t.treatment_sk = qry.treatment_sk
		inner join	cdm.ci_response_channel_response rcr
			on rcr.response_sk = qry.response_sk
			and	rcr.response_channel_cd = qry.response_channel_cd
where	0=0
and	exists (select	1
			from	DataMart.vw_fct_rpt_comunicaciones fc
			where	0=0
			and		fc.cell_package_sk = qry.cell_package_sk
			)
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_RESPUESTAS_CC]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_RESPUESTAS_CC] AS
select	hr.id_cliente,
		convert(varchar,hr.id_campania) response_tracking_cd,
		hr.telefono,
		hr.telefono_erroneo,
		hr.dia_contacto_inicio,
		hr.dia_contacto_fin,
		hr.tipo_de_gestion,
		hr.gestion,
		hr.motivo_gestion,
		hr.gestion_de_cierre,
		hr.multiple_oferta,
		hr.producto,
		hr.codigo_operador,
		hr.nombre_operador,
		hr.telefono_enriquecido,
		hr.mail_enriquecido,
		hr.celular_enriquecido,
		hr.canal,
		hr.mail,
		hr.estado_mail,
		rcr.response_sk,
		fr.flg_tipo_miembro
from	auxiliar.historico_respuestas hr --65585
		inner join CDM.CI_RESPONSE_CHANNEL_RESPONSE rcr
			on rcr.response_channel_response_cd = hr.tipo_de_gestion
		inner join DataMart.vw_fct_rpt_respuestas fr
			on fr.id_cliente = hr.id_cliente
			and	fr.response_sk = rcr.RESPONSE_SK
			and	fr.response_tracking_cd = convert(varchar,hr.id_campania)
			and	fr.response_dttm = hr.dia_contacto_fin
			--and	fr.flg_tipo_miembro = 1 -- ANALIZAR LOS CASOS CUANDO SE SUMEN LOS PROSPECTOS
where	0=0
;
GO
/****** Object:  View [DataMart].[VW_FCT_RPT_TRATAMIENTOS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [DataMart].[VW_FCT_RPT_TRATAMIENTOS] AS

SELECT 
	   A.TREATMENT_SK
      ,C.CELL_PACKAGE_SK
      ,D.COMMUNICATION_SK
      ,D.CAMPAIGN_SK
      ,A.TREATMENT_NM
      ,A.TREATMENT_DESC
      ,C.PACKAGE_HASH_VAL
      ,B.VIGENCIA_OFERTA
      ,B.ID_ALTA

FROM	CDM.CI_TREATMENT A, 
		CDM.CI_DYNAMIC_TREATMENT_ATTR_EXT B, 
		CDM.CI_DYNAMIC_TREATMENT_ATTRIBUTE C, 
		DataMart.VW_FCT_RPT_COMUNICACIONES D
WHERE	A.TREATMENT_SK=B.TREATMENT_SK 
AND		B.TREATMENT_SK=C.TREATMENT_SK 
AND		C.CELL_PACKAGE_SK=D.CELL_PACKAGE_SK
GROUP BY
	   A.TREATMENT_SK
      ,C.CELL_PACKAGE_SK
      ,D.COMMUNICATION_SK
      ,D.CAMPAIGN_SK
      ,A.TREATMENT_NM
      ,A.TREATMENT_DESC
      ,C.PACKAGE_HASH_VAL
      ,B.VIGENCIA_OFERTA
      ,B.ID_ALTA

GO
/****** Object:  View [DataMart].[VW_FCT_RPT_TRATAMIENTOS_DETALLE]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_RPT_TRATAMIENTOS_DETALLE] AS

SELECT 
	   A.CELL_PACKAGE_SK
      ,A.TREATMENT_SK
      ,B.TREATMENT_HASH_VAL
      ,B.CAMPAIGN_PRODUCT_SK AS TREATMENT_DETAIL_SK
      ,B.PRODUCTO
      ,B.SUBPRODUCTO
      ,B.TIPO
      
FROM [DataMart].[VW_FCT_RPT_TRATAMIENTOS] A, 

--OBTENGO TABLA
(

--CREO TABLA MODULO DESDE CDM.CI_DYNAMIC_TREATMENT_ATTR_EXT
SELECT * FROM (

SELECT A.TREATMENT_SK, A.CAMPAIGN_PRODUCT_SK, B.PRODUCTO, A.SUBPRODUCTO, C.TIPO, A.TREATMENT_HASH_VAL
FROM 

/*
	-------------------------------------------------------
	PARTO DE SUBPRODUCTO PORQUE PUEDE EXISTIR PRODUCTO NULL
	-------------------------------------------------------
*/

--SUBPRODUCTO
(

SELECT TREATMENT_SK,RIGHT(SUBPRODUCTO,1) AS CAMPAIGN_PRODUCT_SK,NULL AS PRODUCTO, VALOR AS SUBPRODUCTO, TREATMENT_HASH_VAL
FROM CDM.CI_DYNAMIC_TREATMENT_ATTR_EXT S
UNPIVOT ( VALOR FOR SUBPRODUCTO IN (SUB_PRODUCTO_1, SUB_PRODUCTO_2, SUB_PRODUCTO_3,SUB_PRODUCTO_4,SUB_PRODUCTO_5,SUB_PRODUCTO_6,SUB_PRODUCTO_7,SUB_PRODUCTO_8,SUB_PRODUCTO_9,SUB_PRODUCTO_10) ) AS unpvt
GROUP BY TREATMENT_SK, RIGHT(SUBPRODUCTO,1),VALOR, TREATMENT_HASH_VAL

) AS A

	LEFT JOIN

--PRODUCTO
(

SELECT TREATMENT_SK,RIGHT(PRODUCTO,1) AS CAMPAIGN_PRODUCT_SK,VALOR AS PRODUCTO
FROM CDM.CI_DYNAMIC_TREATMENT_ATTR_EXT PRODUCTO
UNPIVOT ( VALOR FOR PRODUCTO IN (PRODUCTO_1, PRODUCTO_2, PRODUCTO_3,PRODUCTO_4,PRODUCTO_5,PRODUCTO_6,PRODUCTO_7,PRODUCTO_8,PRODUCTO_9,PRODUCTO_10) ) AS unpvt

) AS B
ON A.CAMPAIGN_PRODUCT_SK=B.CAMPAIGN_PRODUCT_SK


	LEFT JOIN 

--TIPO
(

SELECT TREATMENT_SK,RIGHT(TIPO,1) AS CAMPAIGN_PRODUCT_SK,NULL AS PRODUCTO,NULL AS SUB_PRODUCTO, VALOR AS TIPO, TREATMENT_HASH_VAL
FROM CDM.CI_DYNAMIC_TREATMENT_ATTR_EXT S
UNPIVOT ( VALOR FOR TIPO IN (TIPO_1, TIPO_2, TIPO_3,TIPO_4,TIPO_5,TIPO_6,TIPO_7,TIPO_8,TIPO_9,TIPO_10) ) AS unpvt

) AS C
ON A.TREATMENT_SK = C.TREATMENT_SK AND A.TREATMENT_HASH_VAL=C.TREATMENT_HASH_VAL
AND A.CAMPAIGN_PRODUCT_SK = C.CAMPAIGN_PRODUCT_SK

)MODULO

--WHERE MODULO.PRODUCTO IS NOT NULL OR MODULO.SUBPRODUCTO IS NOT NULL OR MODULO.TIPO IS NOT NULL

)B

WHERE A.TREATMENT_SK=B.TREATMENT_SK

GROUP BY  A.CELL_PACKAGE_SK
		 ,A.TREATMENT_SK
		 ,B.TREATMENT_HASH_VAL
		 ,B.CAMPAIGN_PRODUCT_SK
		 ,B.PRODUCTO
		 ,B.SUBPRODUCTO
		 ,B.TIPO

GO
/****** Object:  View [DataMart].[VW_FCT_TARJETASCREDITO_DETALLE]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_TARJETASCREDITO_DETALLE] AS
SELECT DISTINCT
ID_CLIENTE, CTA_ID_EMPRESA, CTA_NUMERO,OPE_ID_MODULO, 
OPE_ID_MONEDA, OPE_ID_PAPEL, OPE_OPERACION,OPE_ID_TIPO_OPERACION,
OPE_SUB_OPERACION, TCC_ID_ESTADO, TCT_ID_ESTADO,
TCT_FLG_TITULAR,  TCC_FLG_ELEGIDA_CLIENTE_MARCA,
TCC_FLG_ELEGIDA_CLIENTE, FECHACARGA, FECHAACTUALIZACION, 
CASE WHEN TCC_FLG_ELEGIDA_CLIENTE=1 THEN TCC_FECHA_VENCI  ELSE ' ' END AS TCC_FECHA_VENCI,
CASE WHEN TCC_FLG_ELEGIDA_CLIENTE=1 THEN tct_numero_tarjeta ELSE ' ' END AS TCT_NUMERO_TARJETA,
CASE WHEN TCC_FLG_ELEGIDA_CLIENTE=1 THEN TCC_MARCA ELSE ' ' END AS TCC_MARCA,
CASE WHEN TCC_ID_MARCA = 2 THEN OPE_ID_SUCURSAL END AS SUC_TARJETA_VISA,
CASE WHEN TCC_ID_MARCA = 1 THEN OPE_ID_SUCURSAL END AS SUC_TARJETA_MASTER,
CASE WHEN TCC_ID_MARCA = 2 THEN tct_numero_tarjeta END AS TCT_NUMERO_TARJETA_VISA,
CASE WHEN TCC_ID_MARCA = 1 THEN tct_numero_tarjeta END AS TCT_NUMERO_TARJETA_MASTER,
CASE WHEN TCC_ID_MARCA = 2 THEN TCC_MARCA END AS TCC_MARCA_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCC_MARCA END AS TCC_MARCA_MASTER, 
CASE WHEN TCC_ID_MARCA = 2 THEN TCC_LIMITE_COMPRA END AS TCC_LIMITE_COMPRA_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCC_LIMITE_COMPRA END AS TCC_LIMITE_COMPRA_MASTER ,
CASE WHEN TCC_ID_MARCA = 2 THEN TCS_PES_SALDO END AS TCS_PES_SALDO_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCS_PES_SALDO END AS TCS_PES_SALDO_MASTER,
CASE WHEN TCC_ID_MARCA = 2 THEN TCS_MONTO_COMPRAS_PES END AS TCS_MONTO_COMPRAS_PE_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCS_MONTO_COMPRAS_PES END AS TCS_MONTO_COMPRAS_PE_MASTER ,
CASE WHEN TCC_ID_MARCA = 2 THEN TCX_FEC_ULT_COMPRA_PES END AS TCX_FEC_ULT_COMPRA_PES_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCX_FEC_ULT_COMPRA_PES END AS TCX_FEC_ULT_COMPRA_PES_MASTER ,
CASE WHEN TCC_ID_MARCA = 2 THEN TCX_FEC_ULT_COMPRA_DOL END AS TCX_FEC_ULT_COMPRA_DOL_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCX_FEC_ULT_COMPRA_DOL END AS TCX_FEC_ULT_COMPRA_DOL_MASTER,
CASE WHEN TCC_ID_MARCA = 2 THEN TCX_FEC_ULT_COMPRA END AS TCX_FEC_ULT_COMPRA_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCX_FEC_ULT_COMPRA END AS TCX_FEC_ULT_COMPRA_MASTER,
CASE WHEN TCC_ID_MARCA = 2 THEN TCS_MONTO_COBRANZA_PERI_PES END AS TCS_MONTO_COBRANZA_PERI_PES_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCS_MONTO_COBRANZA_PERI_PES END AS TCS_MONTO_COBRANZA_PERI_PES_MAST,
CASE WHEN TCC_ID_MARCA = 2 THEN TCT_ESTADO_DELIVERY END AS TCT_ESTADO_DELIVERY_VISA, 
CASE WHEN TCC_ID_MARCA = 1 THEN TCT_ESTADO_DELIVERY END AS TCT_ESTADO_DELIVERY_MASTER
FROM [DataMart].[FCT_TARJETASCREDITO]
WHERE [TCC_FLG_ELEGIDA_CLIENTE_MARCA] = 1;
GO
/****** Object:  View [DataMart].[VW_FCT_TARJETASCREDITO_ELEGIDAS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_FCT_TARJETASCREDITO_ELEGIDAS] AS 
SELECT [ID_CLIENTE], [CTA_ID_EMPRESA], [CTA_NUMERO], [OPE_ID_MODULO], [OPE_ID_MONEDA], [OPE_ID_PAPEL], [OPE_ID_SUCURSAL], [OPE_OPERACION],
[OPE_SUB_OPERACION], [OPE_ID_TIPO_OPERACION], [TCT_NUMERO_TARJETA], [TCC_ID_TIPO], [TCC_ID_MARCA], [TCC_MARCA], [TCC_ID_ESTADO], [TCT_ID_ESTADO],
[TCT_FLG_TITULAR], [TCC_FECHA_VENCI], [TCC_LIMITE_COMPRA], [TCS_PES_SALDO], [TCS_MONTO_COMPRAS_PES], [TCX_FEC_ULT_COMPRA_PES],
[TCX_FEC_ULT_COMPRA_DOL], [TCX_FEC_ULT_COMPRA], [TCS_MONTO_COBRANZA_PERI_PES], [TCT_ESTADO_DELIVERY], [TCC_FLG_ELEGIDA_CLIENTE_MARCA],
[TCC_FLG_ELEGIDA_CLIENTE], [FECHACARGA], [FECHAACTUALIZACION]
FROM [DataMart].[FCT_TARJETASCREDITO]
WHERE [TCC_FLG_ELEGIDA_CLIENTE_MARCA] = 1;
GO
/****** Object:  View [DataMart].[VW_RPT_CAMPAING_CUBO]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DataMart].[VW_RPT_CAMPAING_CUBO] AS
SELECT --top 100000
		--sta_rpt_campanias
		rc.campaign_sk,
		rc.campaign_nm,
		rc.campaign_desc,
		rc.area_resp,
		rc.segmento,
		rc.accion,
		rc.cant_objetivo,
		--
		--[sta_rpt_comunicaciones]
		rco.communication_sk,
		rco.communication_cd, 
		rco.communication_nm, 
		rco.communication_desc, 
		rco.ocurrencia,
		rco.flag_borrado,
		rco.channel_desc,
		rco.subcanal,
		CONVERT(DATE, rco.inicio_comunicacion) as inicio_comunicacion,
		CONVERT(DATE, rco.fin_comunicacion) as fin_comunicacion,
		--
		--sta_rpt_clientes_detalles | sta_rpt_contanctos
		qry.per_nro_documento,
		qry.per_cuit_cuil,
		qry.per_id_pais,
		qry.per_id_tipo_doc,
		qry.cell_package_sk,
		qry.flg_tipo_miembro,
		CONVERT(DATE, qry.contact_dttm) as contact_dttm,
		--
		--sta_rpt_respuestas
		lk_atrb.response_dttm,
		lk_atrb.response_nm,
		lk_atrb.response_tracking_cd,
		lk_atrb.response_channel_cd,
		--
		--sta_rpt_respuestas_cc
		CONVERT(DATE, lk_atrb.dia_contacto_inicio) as fec_vigencia_gestion_desde,
		CONVERT(DATE, lk_atrb.dia_contacto_fin) as fec_vigencia_gestion_hasta,
		lk_atrb.gestion,
		--
		--Maestro de Atributos
		lk_atrb.venta,
		lk_atrb.contacto_efectivo,
		lk_atrb.contacto,
		lk_atrb.gestion_de_cierre,
		lk_atrb.gestionado
		--
FROM	datamart.vw_fct_rpt_campanias rc
             --inner join DataMart.sta_rpt_campanias_detalle rcd
             --     on rc.campaign_sk = rcd.campaign_sk
             INNER JOIN datamart.vw_fct_rpt_comunicaciones rco
                    ON rc.campaign_sk = rco.campaign_sk
             INNER JOIN (SELECT rcdet.id_cliente,
								rcdet.per_nro_documento,
								rcdet.per_cuit_cuil,
								rcdet.per_id_pais,
								rcdet.per_id_tipo_doc,
								rcon.cell_package_sk,
								rcon.flg_tipo_miembro,
								rcon.response_tracking_cd,
								rcon.contact_dttm
						FROM    datamart.vw_fct_rpt_contactos rcon,
								datamart.vw_fct_rpt_clientes_detalle rcdet
						WHERE	0=0
						AND		rcon.id_cliente = rcdet.id_cliente
						AND		rcon.flg_tipo_miembro = 1
						) qry
                    ON qry.cell_package_sk = rco.cell_package_sk
             LEFT JOIN  (SELECT *
						 FROM   (SELECT ROW_NUMBER() OVER(PARTITION BY id_cliente, response_tracking_cd ORDER BY venta DESC, gestion_de_cierre DESC, dia_contacto_fin DESC) AS orden,*
								 FROM
                                        (SELECT	e.*,f.canal,f.dia_contacto_inicio,f.dia_contacto_fin,f.gestion,
                                                CASE WHEN f.GESTION = 'Real' THEN 1 ELSE 0 END AS VENTA,
                                                CASE WHEN f.GESTION IN ('Llamar Luego','No Cumple Requisitos','Real','Sin interes - Cargos del producto elevados','Sin interes - Escucha pero no le interesa la propuesta','Sin interes - No le interesa escuchar/corta','Sin interes - Otros motivos','Sin interes - Prefiere gestionarlo en sucursal','Sin interes - Ya posee el producto en otra entidad') THEN 1 ELSE 0 END AS contacto_efectivo,
                                                case when f.GESTION IN ('Llamar Luego','No Cumple Requisitos','Real','Sin interes - Cargos del producto elevados','Sin interes - Escucha pero no le interesa la propuesta','Sin interes - No le interesa escuchar/corta','Sin interes - Otros motivos','Sin interes - Prefiere gestionarlo en sucursal','Sin interes - Ya posee el producto en otra entidad','Atiende un Tercero','Fallecio') THEN 1 ELSE 0 END AS contacto,
                                                CASE WHEN f.GESTION IN ('Fallecio','No Cumple Requisitos','Real','Sin interes - Cargos del producto elevados','Sin interes - Escucha pero no le interesa la propuesta','Sin interes - No le interesa escuchar/corta','Sin interes - Otros motivos','Sin interes - Prefiere gestionarlo en sucursal','Sin interes - Ya posee el producto en otra entidad') THEN 1 ELSE 0 END AS gestion_de_cierre,
												CASE WHEN e.response_nm IS NOT NULL then 1 ELSE 0 END gestionado
                                         FROM	datamart.vw_fct_rpt_respuestas e
												INNER JOIN datamart.vw_fct_rpt_respuestas_cc f 
													ON e.id_cliente = f.id_cliente 
                                                    AND e.response_tracking_cd = f.response_tracking_cd 
                                                    AND e.response_dttm = f.dia_contacto_fin
                                         WHERE  response_channel_cd = '_CC') AS cc_atributos) AS cc_orden
                                 WHERE orden=1
								 UNION ALL
								 SELECT	1 AS orden,e.*,f.canal,f.dia_contacto_inicio,f.dia_contacto_fin,f.gestion,
                                        0 AS venta,
                                        0 AS contacto_efectivo,
                                        0 AS contacto,
                                        0 AS gestion_de_cierre,
										CASE WHEN e.response_nm IS NOT NULL THEN 1 ELSE 0 END gestionado
                                 FROM   datamart.vw_fct_rpt_respuestas e
										LEFT JOIN datamart.vw_fct_rpt_respuestas_cc f 
											ON e.id_cliente = f.id_cliente 
                                            AND e.response_tracking_cd = f.response_tracking_cd
                                            AND e.response_dttm = f.dia_contacto_fin
                                 WHERE	response_channel_cd <> '_CC'
                                 ) lk_atrb
                     ON lk_atrb.cell_package_sk = qry.cell_package_sk
                     AND lk_atrb.Id_cliente = qry.id_cliente
WHERE	0=0
AND		rco.flag_borrado = 0
--AND		qry.flg_tipo_miembro = 1
--AND		channel_desc = 'Canal Centro de llamadas'
;
GO
/****** Object:  StoredProcedure [Auxiliar].[LDR_AUX_CROSS_SELL]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Auxiliar].[LDR_AUX_CROSS_SELL] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Destino VARCHAR(65);

	SET @Tabla_destino = 'AUX_CROSS_SELL';
	SET @Esquema_destino = 'Auxiliar';

	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @FecIni DATETIME, @FecFin DATETIME, @nivel SMALLINT, @Error VARCHAR(1000);
	SELECT @FecIni = GETDATE(), @nivel = 3;

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		IF @desde = 0 OR @hasta = 0 PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		ELSE
		BEGIN
			PRINT ' Carga de Parametros: ';
			PRINT ' Fecha desde: ' + CONVERT(VARCHAR, @desde);  
			PRINT ' Fecha hasta: ' + CONVERT(VARCHAR, @hasta);  
			PRINT ' ELIMINACION DE REGISTROS: ' + CONVERT(VARCHAR, GETDATE(), 114);
		END;
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @Truncar VARCHAR(128);
		SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
		EXEC(@Truncar);

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;
		--Genero la temporal y las reglas de negocio para obtener la caja de ahorro elegida
	
		CREATE TABLE #C26
		(
			ID_CLIENTE VARCHAR(18) NOT NULL PRIMARY KEY,
			CUENTA VARCHAR(17) NULL
		);

		INSERT INTO #C26 (ID_CLIENTE, CUENTA)
		SELECT CLI.ID_CLIENTE, COALESCE(CC.CUENTA, '') AS CUENTA
		FROM [DataMart].[DIM_CLIENTES] CLI
		LEFT JOIN (
			SELECT ID_CLIENTE, CUENTA
			FROM (
				SELECT
				COALESCE(CA.ID_CLIENTE, CC.ID_CLIENTE) AS ID_CLIENTE, COALESCE(CA.CUENTA, CC.CUENTA) AS CUENTA,
				ROW_NUMBER() OVER(PARTITION BY COALESCE(CA.ID_CLIENTE, CC.ID_CLIENTE) ORDER BY COALESCE(CA.CUENTA, CC.CUENTA) DESC) AS DEDUP
				FROM (
					SELECT ID_CLIENTE,
					'4' + RIGHT('000' + CONVERT(VARCHAR(3), OPE_ID_SUCURSAL), 3) + RIGHT('0000000000' + CONVERT(VARCHAR(10), CTA_NUMERO), 10) + LTRIM(RTRIM(ISNULL(OPE_SUB_OPERACION, ''))) AS CUENTA
					FROM [DataMart].[FCT_CAJAAHORRO]
					WHERE CA_ELEGIDA = 1
				) CA
				FULL OUTER JOIN
				(
					SELECT ID_CLIENTE,
					'3' + RIGHT('000' + CONVERT(VARCHAR(3), OPE_ID_SUCURSAL), 3) + RIGHT('0000000000' + CONVERT(VARCHAR(10), CTA_NUMERO), 10) + LTRIM(RTRIM(ISNULL(OPE_SUB_OPERACION, ''))) AS CUENTA
					FROM [DataMart].[FCT_CUENTACORRIENTE]
					WHERE CTE_ELEGIDA = 1
				) CC
				ON CA.ID_CLIENTE = CC.ID_CLIENTE
			) SQ
			WHERE SQ.DEDUP = 1
		) CC
		ON CLI.ID_CLIENTE = CC.ID_CLIENTE
		ORDER BY CLI.ID_CLIENTE;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;
				
		CREATE TABLE #CROSS_SELL
		(
			ID_CLIENTE VARCHAR(18) NOT NULL PRIMARY KEY,
			CROSS_SELL VARCHAR(120) NOT NULL
		);

		INSERT INTO #CROSS_SELL (ID_CLIENTE, CROSS_SELL)
		SELECT ID_CLIENTE,
		CASE WHEN NULLIF(CROSS_SELL, '') IS NOT NULL THEN SUBSTRING(CROSS_SELL, 1, LEN(CROSS_SELL)-1) ELSE '' END AS CROSS_SELL
		FROM (
			SELECT CLI.ID_CLIENTE,
			LTRIM(RTRIM(COALESCE(CA.CONCATENACION, '') + COALESCE(CTE.CONCATENACION, '') + COALESCE(TC.CONCATENACION, '') + COALESCE(SEG.CONCATENACION, ''))) AS CROSS_SELL
			FROM [DataMart].[DIM_CLIENTES] CLI
			LEFT JOIN 
			(
				SELECT DISTINCT ID_CLIENTE, 'Cja. Ahorro+' AS CONCATENACION
				FROM [DataMart].[FCT_CAJAAHORRO]
				WHERE CA_ELEGIDA = 1
			) CA
			ON CLI.ID_CLIENTE = CA.ID_CLIENTE
			LEFT JOIN
			(
				SELECT DISTINCT ID_CLIENTE, 'Cta. Corriente+' AS CONCATENACION
				FROM [DataMart].[FCT_CUENTACORRIENTE]
				WHERE CTE_ELEGIDA = 1
			) CTE
			ON CLI.ID_CLIENTE = CTE.ID_CLIENTE
			LEFT JOIN
			(
				SELECT DISTINCT ID_CLIENTE, CASE WHEN TCC_ID_MARCA = 1 THEN 'Master+' ELSE 'Visa+' END AS CONCATENACION
				FROM [DataMart].[FCT_TARJETASCREDITO]
				WHERE TCC_FLG_ELEGIDA_CLIENTE = 1
			) TC
			ON CLI.ID_CLIENTE = TC.ID_CLIENTE
			LEFT JOIN
			(
				SELECT ID_CLIENTE, AP + BP + VIDA + DESEMPLEO + ATM + HOGAR + MASCOTAS + CP + AUTO + BB + TP AS CONCATENACION
				FROM (
					SELECT DISTINCT ID_CLIENTE,
					CASE WHEN SEG_FLG_ACCIDENTESPERSONALES > 0 THEN 'AP+' ELSE '' END AS AP,
					CASE WHEN SEG_FLG_ROBOBOLSOPROTEGIDO > 0 THEN 'BP+' ELSE '' END AS BP,
					CASE WHEN SEG_FLG_VIDA > 0 THEN 'Vida+' ELSE '' END AS VIDA,
					CASE WHEN SEG_FLG_DESEMPLEO > 0 THEN 'Desempleo+' ELSE '' END AS DESEMPLEO,
					CASE WHEN SEG_FLG_ROBOATM > 0 THEN 'ATM+' ELSE '' END AS ATM,
					CASE WHEN SEG_FLG_HOGAR > 0 THEN 'Hogar+' ELSE '' END AS HOGAR,
					CASE WHEN SEG_FLG_MASCOTAS > 0 THEN 'Mascotas+' ELSE '' END AS MASCOTAS,
					CASE WHEN SEG_FLG_ROBOCONTENIDOPROTEGIDO > 0 THEN 'CP+' ELSE '' END AS CP,
					CASE WHEN SEG_FLG_AUTO > 0 THEN 'Auto+' ELSE '' END AS AUTO,
					CASE WHEN SEG_FLG_BROKENBONES > 0 THEN 'Huesos Rotos+' ELSE '' END AS BB,
					CASE WHEN SEG_FLG_ROBOTECNOLOGIAPROTEGIDA > 0 THEN 'TP+' ELSE '' END AS TP
					FROM [DataMart].[DIM_CLIENTES]
					WHERE SEG_CNT_TOTAL > 0
				) SQ
			) SEG
			ON CLI.ID_CLIENTE = SEG.ID_CLIENTE
		) SQ
		ORDER BY ID_CLIENTE;

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO [Auxiliar].[AUX_CROSS_SELL] (ID_CLIENTE, C26, CROSS_SELL)
		SELECT C.ID_CLIENTE, NULLIF(C.CUENTA, '') AS C26, NULLIF(CS.CROSS_SELL, '') AS CROSS_SELL
		FROM #C26 C
		INNER JOIN #CROSS_SELL CS
		ON C.ID_CLIENTE = CS.ID_CLIENTE
		ORDER BY C.ID_CLIENTE;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		DROP TABLE #C26;
		DROP TABLE #CROSS_SELL;
	
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------CARGA LOG FIN-----------------
		SET @FecFin = GETDATE();
		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @FecFin = GETDATE(), @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END;


GO
/****** Object:  StoredProcedure [DataMart].[LDR_AUX_TARJETAS_TASA_CERO]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_AUX_TARJETAS_TASA_CERO] AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	
	SET @Tabla_origen = 'sta_creditostasa0_mensajes';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'AUX_TARJETAS_TASA_CERO';
	SET @Esquema_destino = 'DataMart';
	
	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);
	
	-------------------CARGA LOG INICIO--------------  
	DECLARE @nivel SMALLINT, @Error VARCHAR(1000);

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de nuevos mensajes de creditos de tasa 0: ' + @Destino + '.';
		---------------------------------------------------------------------------------------  
		-- Novedades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACantNov INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @v_query NVARCHAR(256);
		DECLARE @v_ultimo_id_mensaje_procesado INT;

		DECLARE @v_datos_mensaje TABLE (ID_MENSAJE BIGINT, 
										FLG_CLIENTE TINYINT,
										PER_ID_PAIS SMALLINT,
										PER_ID_TIPO_DOC SMALLINT,
										PER_NRO_DOCUMENTO VARCHAR(12),
										MAIL VARCHAR(200),
										PER_APELLIDO_NOMBRE VARCHAR(100),
										ID_SUC_SUCURSAL SMALLINT);

		--Toma el último ID_MENSAJE de la tabla destino para saber hasta dónde tiene cargado
		SET @v_ultimo_id_mensaje_procesado = (SELECT ISNULL(MAX(ID_MENSAJE), 0) FROM DataMart.AUX_TARJETAS_TASA_CERO);

		--Cuenta todas las novedades de la tabla origen (IDMensaje > al último de mi tabla destino)
		SET @v_query = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen + ' WHERE IDMensaje > @ultimo_id_mensaje_procesado';
		EXECUTE sp_executesql @v_query, N'@Cantidad int output, @ultimo_id_mensaje_procesado int', @Cantidad = @STACantNov OUTPUT, @ultimo_id_mensaje_procesado = @v_ultimo_id_mensaje_procesado;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACantNov = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' sin novedades para procesar.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;

		/*Toma los datos de la tabla stage para poblar la tabla variable @v_datos_mensaje. 
		Parsea los DatosMensajes delimitados por | y los inserta separados en columnas junto a su ID.*/
		INSERT INTO @v_datos_mensaje
			(ID_MENSAJE
			,FLG_CLIENTE
			,PER_ID_PAIS
			,PER_ID_TIPO_DOC
			,PER_NRO_DOCUMENTO
			,MAIL
			,PER_APELLIDO_NOMBRE
			,ID_SUC_SUCURSAL)
		SELECT IDMensaje
			,[1] AS FlagCliente
			,[2] AS PaisCod
			,[3] AS TipoDoc
			,[4] AS NroDoc
			,[5] AS Mail
			,[6] AS NombreCompleto
			,[7] AS Sucursal
		FROM (
			SELECT 
				IDMensaje
				,value 
				,ROW_NUMBER() OVER(PARTITION BY DatosMensaje ORDER BY (SELECT NULL)) as RowNumber
			FROM sta.sta_creditostasa0_mensajes
			CROSS APPLY STRING_SPLIT(DatosMensaje, '|')
			WHERE	0=0
			AND		IDMensaje > @v_ultimo_id_mensaje_procesado
			AND		DatosMensaje IS NOT NULL
		) AS DM
		PIVOT(
			    MAX(VALUE)
		    FOR RowNumber IN([1],[2],[3],[4],[5],[6],[7]) --'FlagCliente|PaísCod|TipoDoc|NroDoc|Mail|NombreCompleto|Sucursal'
		) AS PVT;
		
		--Inserta en la tabla destino tomando datos de la tabla stage y de la tabla temporal @v_datos_mensaje.
		INSERT INTO DataMart.AUX_TARJETAS_TASA_CERO
			(ID_PERSONA_CI
			,ID_MENSAJE
			,ESTADO_MENSAJE
			,PER_ID_PAIS
			,PER_ID_TIPO_DOC
			,PER_NRO_DOCUMENTO
			,PER_APELLIDO_NOMBRE
			,FLG_CLIENTE
			,MAIL
			,ID_SUC_SUCURSAL
			,FEC_ALTA_MENSAJE
			,FECHACARGA
			,FECHAACTUALIZACION)
		SELECT	
			CONVERT(VARCHAR(18),
				((REPLICATE('0',3-LEN(LTRIM(RTRIM(CONVERT(CHAR,PER_ID_PAIS)))))+LTRIM(RTRIM(CONVERT(CHAR,PER_ID_PAIS))))
				+(REPLICATE('0',3-LEN(        LTRIM(RTRIM(CONVERT(CHAR,PER_ID_TIPO_DOC)))))+LTRIM(RTRIM(CONVERT(CHAR,PER_ID_TIPO_DOC))))
				+(REPLICATE('0',12-LEN(LTRIM(RTRIM(PER_NRO_DOCUMENTO))))+LTRIM        (RTRIM(PER_NRO_DOCUMENTO))))) 
			AS ID_PERSONA_CI
			,IDMensaje AS ID_MENSAJE
			,Mensaje AS ESTADO_MENSAJE
			,PER_ID_PAIS
			,PER_ID_TIPO_DOC
			,PER_NRO_DOCUMENTO
			,PER_APELLIDO_NOMBRE
			,FLG_CLIENTE
			,MAIL
			,ID_SUC_SUCURSAL
			,AltaFecha AS FEC_ALTA_MENSAJE
			,GETDATE() AS FECHACARGA
			,fecha_actualizacion AS FECHAACTUALIZACION
		FROM	sta.sta_creditostasa0_mensajes AS CM 
		LEFT JOIN @v_datos_mensaje AS DM 
			ON DM.ID_MENSAJE = CM.IDMensaje
		WHERE	0=0
		AND		IDMensaje > @v_ultimo_id_mensaje_procesado;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'PROCESO DE CARGA AUX_TARJETAS_TASA_CERO'
		PRINT 'Se procesaro/n: ' + CONVERT(VARCHAR, @STACantNov) + ' nueva/s novedad/es de mensaje/s';
		PRINT '--------------------------------------------------------------------------------------------';
		
		/*La tabla stage no tiene una columna de fecha de proceso, así que no tengo que actualizarla.
		No debo borrar los datos de la tabla stage en este caso para que puedan cargarse en la misma sólo las novedades (y no todos los datos del origen Tarjetas).*/

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DE PROCESO - Carga de nuevos mensajes de creditos de tasa 0'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END
GO
/****** Object:  StoredProcedure [DataMart].[LDR_DIM_CLIENTES]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_DIM_CLIENTES] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	
 	DECLARE @Fecha_hasta DATE;

	SET @Tabla_origen = 'sta_dcl_persona';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'DIM_CLIENTES';
	SET @Esquema_destino = 'DataMart';
	SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8)));

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @nivel SMALLINT, @Error VARCHAR(1000);

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			--EXEC(@Truncar); --CZ:20191025 - Se ejecuta mÃ¡s adelante validando una condiciÃ³n adicional previamente. 
			TRUNCATE TABLE [Auxiliar].[CLIENTES_DUPLICADOS];
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #dcl_persona_ddp
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_id_pais SMALLINT NOT NULL,
			per_id_tipo_doc SMALLINT NOT NULL,
			per_nro_documento VARCHAR(12) NOT NULL,
			per_nombre VARCHAR(50) NULL,
			per_id_banca SMALLINT NULL,
			per_sexo VARCHAR(1) NULL,
			per_fecha_nacimiento DATE NULL,
			per_edad SMALLINT NULL,
			per_antiguedad SMALLINT NULL,
			per_estado_civil VARCHAR(50) NULL,
			per_cuit_cuil VARCHAR(12) NULL,
			per_flg_activo TINYINT NULL,
			per_flg_titular TINYINT NULL,
			per_flg_empleado TINYINT NULL,
			pqp_tit_ppal_id_tipo SMALLINT NULL,
			pqp_tit_ppal_tipo VARCHAR(80) NULL,
			desc_segmento VARCHAR(80) NULL,
			per_id_sucursal SMALLINT NULL,
			per_tipo_persona VARCHAR(50) NULL,
			per_fec_carga DATE NOT NULL
		);

		--Genero una temporal que quita todos los casos de clientes con duplicados
		CREATE TABLE #clientes_dup
		(
			id_cliente VARCHAR(18) NOT NULL,
			per_id_pais SMALLINT NOT NULL,
			per_id_tipo_doc SMALLINT NOT NULL,
			per_nro_documento VARCHAR(12) NOT NULL
		);

		INSERT INTO #clientes_dup (id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento)
		SELECT SQ.id_cliente, dp.per_id_pais, dp.per_id_tipo_doc, dp.per_nro_documento
		FROM (
			SELECT id_cliente, COUNT(*) as Cantidad
			FROM [sta].[sta_dcl_persona]
			WHERE per_fec_carga = @Fecha_hasta
			GROUP BY id_cliente
			HAVING COUNT(*) > 1
		) SQ
		INNER JOIN [sta].[sta_dcl_persona] dp
		ON SQ.id_cliente = dp.id_cliente
		WHERE dp.per_fec_carga =  @Fecha_hasta
		ORDER BY SQ.id_cliente;

		CREATE TABLE #clientes_exc (id_cliente VARCHAR(18) NOT NULL PRIMARY KEY);
		INSERT INTO #clientes_exc (id_cliente)
		SELECT DISTINCT id_cliente
		FROM #clientes_dup;

		INSERT INTO #dcl_persona_ddp
		(id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, per_nombre, per_id_banca, per_sexo, per_fecha_nacimiento, per_edad, per_antiguedad, 
		per_estado_civil, per_cuit_cuil, per_flg_activo, per_flg_titular, per_flg_empleado, pqp_tit_ppal_id_tipo, pqp_tit_ppal_tipo, desc_segmento, 
		per_id_sucursal, per_tipo_persona, per_fec_carga)
		SELECT DP.id_cliente, per_id_pais, per_id_tipo_doc, LTRIM(RTRIM(per_nro_documento)) as per_nro_documento, per_nombre, per_id_banca, per_sexo,
		per_fecha_nacimiento, per_edad, per_antiguedad, per_estado_civil, per_cuit_cuil, per_flg_activo, per_flg_titular, per_flg_empleado,
		pqp_tit_ppal_id_tipo, pqp_tit_ppal_tipo, desc_segmento, per_id_sucursal, per_tipo_persona, per_fec_carga
		FROM [sta].[sta_dcl_persona] DP
		LEFT JOIN #clientes_exc CE
		ON DP.id_cliente = CE.id_cliente
		WHERE CE.id_cliente IS NULL
		AND DP.per_fec_carga = @Fecha_hasta;

		--Desduplico los clientes repetidos en MCL_CLIENTES
		CREATE TABLE #mcl_clientes_ddp
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_id_pais SMALLINT NOT NULL,
			per_id_tipo_doc SMALLINT NOT NULL,
			per_nro_documento VARCHAR (12) NOT NULL,
			dop_calle VARCHAR (50) NULL,
			dop_numero INT NULL,
			dop_departamento VARCHAR (20) NULL,
			dop_codigo_postal VARCHAR (20) NULL,
			dop_localidad VARCHAR (50) NULL,
			dop_provincia VARCHAR (50) NULL
		);

		INSERT INTO #mcl_clientes_ddp
		(id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, dop_calle, dop_numero, dop_departamento, dop_codigo_postal, dop_localidad, 
		dop_provincia)
		SELECT MC.id_cliente, per_id_pais, per_id_tipo_doc, LTRIM(RTRIM(per_nro_documento)) as per_nro_documento, UPPER(dop_calle) as dop_calle, dop_numero,
		UPPER(NULLIF(LTRIM(RTRIM(dop_departamento)), '')) as dop_departamento, dop_codigo_postal, dop_localidad, dop_provincia
		FROM [sta].[sta_mcl_clientes] MC
		LEFT JOIN #clientes_exc CE
		ON MC.id_cliente = CE.id_cliente
		WHERE CE.id_cliente IS NULL
		AND MC.per_fec_carga = (SELECT MAX(per_fec_carga) FROM [sta].[sta_mcl_clientes]);

		
		--Creo la temporal de segmentaciones y subsegmentaciones ICOM

		CREATE TABLE #dcl_segmentacion
		(
			[per_id_pais] [smallint] NOT NULL,
			[per_id_tipo_doc] [smallint] NOT NULL,
			[per_nro_documento] [varchar](12) NOT NULL,
			[per_segmentoICOM] VARCHAR(100) NULL,
			[per_SUBsegmentoICOM] VARCHAR(100) NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_SEGMENTACION] ON #dcl_segmentacion
		(
			[PER_ID_TIPO_DOC] ASC,
			[PER_ID_PAIS] ASC,
			[PER_NRO_DOCUMENTO] ASC
		)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];


		INSERT #dcl_segmentacion 
		SELECT
			 per_id_pais
			,per_id_tipo_doc 
			,per_nro_documento
			,per_segmentoICOM
			,per_SUBsegmentoICOM
		FROM [STA].[sta_dcl_segmentacion];
		--WHERE per_fec_carga = @Fecha_hasta;

			
		--Creo la temporal y desduplico los clientes con correos electronicos y fuentes repetidas
		CREATE TABLE #maestro_emails_tmp
		(
			[id_cliente] VARCHAR(18) NOT NULL,
			[per_id_pais] [smallint] NOT NULL,
			[per_id_tipo_doc] [smallint] NOT NULL,
			[per_nro_documento] [varchar](12) NOT NULL,
			[mail_1] VARCHAR(200) NULL,
			[mail_2] VARCHAR(200) NULL,
			[mail_3] VARCHAR(200) NULL,
			[mail_4] VARCHAR(200) NULL,
			[mail_5] VARCHAR(200) NULL,
			[mail_fuente_1] VARCHAR(50)	NULL,
			[mail_fuente_2] VARCHAR(50)	NULL,
			[mail_fuente_3] VARCHAR(50)	NULL,
			[mail_fuente_4] VARCHAR(50)	NULL,
			[mail_fuente_5] VARCHAR(50)	NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_EMAILS] ON #maestro_emails_tmp
		(
			[PER_ID_TIPO_DOC] ASC,
			[PER_ID_PAIS] ASC,
			[PER_NRO_DOCUMENTO] ASC
		)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		INSERT INTO #maestro_emails_tmp
		(id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, mail_1, mail_2, mail_3, mail_4, mail_5, mail_fuente_1, mail_fuente_2, mail_fuente_3,
		mail_fuente_4, mail_fuente_5)
		SELECT id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, mail_1, mail_2, mail_3, mail_4, mail_5, mail_fuente_1, mail_fuente_2, mail_fuente_3,
		mail_fuente_4, mail_fuente_5
		FROM (
			SELECT ME.id_cliente, ME.per_id_pais, ME.per_id_tipo_doc, LTRIM(RTRIM(per_nro_documento)) as per_nro_documento,
			LTRIM(RTRIM(per_mail)) as mail_1, LTRIM(RTRIM(per_mail_2)) as mail_2, LTRIM(RTRIM(per_mail_3)) as mail_3,
			LTRIM(RTRIM(per_mail_4)) as mail_4, LTRIM(RTRIM(per_mail_5)) as mail_5,
			LTRIM(RTRIM(per_origen)) as mail_fuente_1, LTRIM(RTRIM(per_origen_2)) as mail_fuente_2, LTRIM(RTRIM(per_origen_3)) as mail_fuente_3,
			LTRIM(RTRIM(per_origen_4)) as mail_fuente_4, LTRIM(RTRIM(per_origen_5)) as mail_fuente_5,
			ROW_NUMBER() OVER (PARTITION BY ME.per_id_pais, ME.per_id_tipo_doc, LTRIM(RTRIM(per_nro_documento))
			ORDER BY TRIM(RTRIM(per_mail)) DESC, LTRIM(RTRIM(per_mail_2)) DESC, LTRIM(RTRIM(per_mail_3)) DESC,
			LTRIM(RTRIM(per_mail_4)) DESC, LTRIM(RTRIM(per_mail_5)) DESC) AS CONTADOR
			FROM [sta].[sta_dcl_maestro_emails_bm] ME
			LEFT JOIN #clientes_exc CE
			ON ME.id_cliente = CE.id_cliente
			WHERE CE.id_cliente IS NULL
			AND ME.per_fec_carga =  @Fecha_hasta
		) SQ
		WHERE CONTADOR = 1;

		--Creo la temporal y desduplico los clientes con telefonos repetidos
		CREATE TABLE #tmp_telefonos
		(
			[id_cliente] VARCHAR(18) NOT NULL PRIMARY KEY,
			[tel1_numero_telefono] VARCHAR(50) NULL,
			[tel2_numero_telefono] VARCHAR(50) NULL,
			[tel3_numero_telefono] VARCHAR(50) NULL,
			[tel4_numero_telefono] VARCHAR(50) NULL,
			[tel1_origeninfo] VARCHAR(50) NULL,
			[tel2_origeninfo] VARCHAR(50) NULL,
			[tel3_origeninfo] VARCHAR(50) NULL,
			[tel4_origeninfo] VARCHAR(50) NULL,
			[tel1_tipo] VARCHAR(50) NULL,
			[tel2_tipo] VARCHAR(50) NULL,
			[tel3_tipo] VARCHAR(50) NULL,
			[tel4_tipo] VARCHAR(50) NULL,
			[tel1_flg_movil] TINYINT NULL,
			[tel2_flg_movil] TINYINT NULL,
			[tel3_flg_movil] TINYINT NULL,
			[tel4_flg_movil] TINYINT NULL,
			[tel1_movil_compania] VARCHAR(50) NULL,
			[tel2_movil_compania] VARCHAR(50) NULL,
			[tel3_movil_compania] VARCHAR(50) NULL,
			[tel4_movil_compania] VARCHAR(50) NULL
		);

		INSERT INTO #tmp_telefonos (id_cliente, tel1_numero_telefono, tel2_numero_telefono, tel3_numero_telefono, tel4_numero_telefono,
		tel1_origeninfo, tel2_origeninfo, tel3_origeninfo, tel4_origeninfo,	tel1_tipo, tel2_tipo, tel3_tipo, tel4_tipo,
		tel1_flg_movil, tel2_flg_movil, tel3_flg_movil, tel4_flg_movil, tel1_movil_compania, tel2_movil_compania, tel3_movil_compania, tel4_movil_compania)
		SELECT id_cliente, tel1_numero_telefono, tel2_numero_telefono, tel3_numero_telefono, tel4_numero_telefono, tel1_origeninfo, tel2_origeninfo, tel3_origeninfo,
		tel4_origeninfo, tel1_tipo, tel2_tipo, tel3_tipo, tel4_tipo, tel1_flg_movil, tel2_flg_movil, tel3_flg_movil, tel4_flg_movil, tel1_movil_compania,
		tel2_movil_compania, tel3_movil_compania, tel4_movil_compania
		FROM (
			SELECT TL.id_cliente,
			tep_numero as tel1_numero_telefono, tep_numero_2 as tel2_numero_telefono, tep_numero_3 as tel3_numero_telefono, tep_numero_4 as tel4_numero_telefono,
			'EBOOK' as tel1_origeninfo, 'EBOOK' as tel2_origeninfo, 'EBOOK' as tel3_origeninfo, 'EBOOK' as tel4_origeninfo,
			desc_tipo_telefono_merlin as tel1_tipo, desc_tipo_telefono_merlin_2 as tel2_tipo,
			desc_tipo_telefono_merlin_3 as tel3_tipo, desc_tipo_telefono_merlin_4 as tel4_tipo,
			CASE WHEN LTRIM(RTRIM(desc_tipo_telefono_merlin)) = 'CELULAR' THEN 1 ELSE 0 END AS tel1_flg_movil,
			CASE WHEN LTRIM(RTRIM(desc_tipo_telefono_merlin_2)) = 'CELULAR' THEN 1 ELSE 0 END AS tel2_flg_movil,
			CASE WHEN LTRIM(RTRIM(desc_tipo_telefono_merlin_3)) = 'CELULAR' THEN 1 ELSE 0 END AS tel3_flg_movil,
			CASE WHEN LTRIM(RTRIM(desc_tipo_telefono_merlin_4)) = 'CELULAR' THEN 1 ELSE 0 END AS tel4_flg_movil,
			NULL AS tel1_movil_compania, NULL AS tel2_movil_compania, NULL AS tel3_movil_compania, NULL AS tel4_movil_compania,
			ROW_NUMBER() OVER(PARTITION BY TL.id_cliente ORDER BY tep_numero DESC, tep_numero_2 DESC, tep_numero_3 DESC, tep_numero_4 DESC) as FILTRO_DUP
			FROM [sta].[sta_dcl_telefonos_bm] TL
			LEFT JOIN #clientes_exc CE
			ON TL.id_cliente = CE.id_cliente
			WHERE CE.id_cliente IS NULL
			AND TL.per_fec_carga =  @Fecha_hasta
		) SQ
		WHERE FILTRO_DUP = 1
		ORDER BY id_cliente;

		--Seccion de creacion de flags
		CREATE TABLE #mcu_transaccion
		(
			[id_cliente] VARCHAR(18) NOT NULL PRIMARY KEY,
			[flg_empleado] TINYINT NOT NULL
		);

		INSERT INTO #mcu_transaccion (id_cliente, flg_empleado)
		SELECT DP.id_cliente, CASE WHEN MT.id_cliente IS NOT NULL THEN 1 ELSE 0 END as flg_empleado
		FROM #dcl_persona_ddp DP
		LEFT JOIN
		(
			SELECT DISTINCT id_cliente FROM [sta].[sta_mcu_transaccion]
			WHERE trx_debito_credito = 'C' AND trx_id_modulo_ori = 191
			AND cta_fec_carga = (SELECT MAX(cta_fec_carga) FROM [sta].[sta_mcu_transaccion])
		) MT
		ON dp.id_cliente = mt.id_cliente;

		CREATE TABLE #dcl_lista_negra_bm
		(
			[id_cliente] VARCHAR(18) NOT NULL PRIMARY KEY,
			[flg_lista_negra] TINYINT NOT NULL
		); 

		INSERT INTO #dcl_lista_negra_bm (id_cliente, flg_lista_negra)
		SELECT DP.id_cliente, CASE WHEN LN.per_nro_documento IS NOT NULL THEN 1 ELSE 0 END AS flg_lista_negra
		FROM #dcl_persona_ddp DP
		LEFT JOIN
		(
			SELECT DISTINCT LTRIM(RTRIM(per_nro_documento)) as per_nro_documento
			FROM [sta].[sta_dcl_lista_negra_bm]
			WHERE per_fec_carga = @Fecha_hasta
		) LN
		ON DP.per_nro_documento = LN.per_nro_documento;
	
		CREATE TABLE #dcl_rechazados_riesgos
		(
			[id_cliente] VARCHAR(18) NOT NULL PRIMARY KEY,
			[flg_rechazados_riesgos] TINYINT NOT NULL
		);

		INSERT INTO #dcl_rechazados_riesgos (id_cliente, flg_rechazados_riesgos)
		SELECT DP.id_cliente, CASE WHEN RF.id_cliente IS NOT NULL THEN 1 ELSE 0 END as flg_rechazados_riesgos
		FROM #dcl_persona_ddp DP
		LEFT JOIN [sta].[sta_dcl_riesgos_fraude_bm] RF
		ON dp.id_cliente = rf.id_cliente
		AND RF.per_fec_carga = @Fecha_hasta
		ORDER BY DP.id_cliente;

		CREATE TABLE #ent_liq_bcra
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_flg_ent_liq_bcra TINYINT NOT NULL
		);

		INSERT INTO #ent_liq_bcra (id_cliente, per_flg_ent_liq_bcra)
		SELECT
			DP.id_cliente,
			CASE WHEN ELB.per_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as per_flg_ent_liq_bcra
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
					SELECT DISTINCT per_cuit_cuil
					FROM [sta].[sta_msg_ent_liq_bcra]
					WHERE sel_fec_carga BETWEEN DATEADD(DAY,-1,SUBSTRING(CONVERT(CHAR,DATEADD(MONTH,-10,(SELECT MAX(sel_fec_carga) FROM [sta].[sta_msg_ent_liq_bcra])),112),1,6)+'01') AND (SELECT MAX(sel_fec_carga) FROM [sta].[sta_msg_ent_liq_bcra])
					) ELB
		ON DP.per_cuit_cuil = ELB.per_cuit_cuil;

			
		CREATE TABLE #flg_gestion_mora
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			flg_gestion_mora TINYINT NOT NULL
		);

		INSERT INTO #flg_gestion_mora (id_cliente, flg_gestion_mora)
		SELECT DP.id_cliente,
		CASE WHEN OP.id_cliente IS NOT NULL THEN 1 ELSE 0 END as flg_gestion_mora
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT DISTINCT id_cliente
			FROM [sta].[sta_dcu_operacion]
			WHERE ope_id_modulo = 34
			AND cta_fec_carga = @Fecha_hasta
		) OP
		ON DP.id_cliente = OP.id_cliente
		ORDER BY DP.id_cliente;

		CREATE TABLE #dpp_prestamo
		(
			[cta_fec_carga] DATE NOT NULL,
			[id_cliente] VARCHAR(18) NULL,
			[per_id_pais] SMALLINT NULL,
			[per_id_tipo_doc] SMALLINT NULL,
			[per_nro_documento] VARCHAR(12) NULL,
			[pre_dias_atraso] SMALLINT NULL,
			[ope_id_modulo] SMALLINT NOT NULL,
			[ope_id_tipo_operacion] SMALLINT NOT NULL,
			[pre_id_estado] TINYINT NULL
		);

		INSERT INTO #dpp_prestamo
		(cta_fec_carga, id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, ope_id_modulo, ope_id_tipo_operacion, pre_id_estado, pre_dias_atraso)
		SELECT cta_fec_carga, id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, ope_id_modulo, ope_id_tipo_operacion, pre_id_estado, 
		MAX(pre_dias_atraso) as pre_dias_atraso
		FROM [sta].[sta_dpp_prestamo]
		GROUP BY cta_fec_carga, id_cliente, per_id_pais, per_id_tipo_doc, per_nro_documento, ope_id_modulo, ope_id_tipo_operacion, pre_id_estado;

		
		CREATE TABLE #flg_refinanciaciones
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			flg_refinanciaciones TINYINT NOT NULL
		);

		INSERT INTO #flg_refinanciaciones (id_cliente, flg_refinanciaciones)
		SELECT id_cliente, flg_refinanciaciones
		FROM (
			SELECT DP.id_cliente,
			CASE WHEN PR.id_cliente IS NOT NULL THEN 1 ELSE 0 END as flg_refinanciaciones,
			ROW_NUMBER() OVER (PARTITION BY DP.id_cliente ORDER BY CASE WHEN PR.id_cliente IS NOT NULL THEN 1 ELSE 0 END DESC) as DEDUP
			FROM #dcl_persona_ddp DP
			LEFT JOIN (
				SELECT id_cliente FROM #dpp_prestamo
				WHERE pre_id_estado = 1
				AND (
					(ope_id_modulo=103 AND ope_id_tipo_operacion = 171) OR 
					(ope_id_modulo=106 AND ope_id_tipo_operacion IN (101, 06, 171)) OR
					(ope_id_modulo=103 AND ope_id_tipo_operacion = 175)
				)
				AND cta_fec_carga = @Fecha_hasta
			) PR
			ON DP.id_cliente = PR.id_cliente
		) SQ
		WHERE DEDUP = 1
		ORDER BY id_cliente;

		CREATE TABLE #dias_mora_pp
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			pp_dias_mora SMALLINT NULL
		);

		INSERT INTO #dias_mora_pp (id_cliente, pp_dias_mora)
		SELECT DP.id_cliente,
		CASE WHEN PP.pre_dias_atraso IS NULL AND PP.pre_dias_mora IS NULL THEN 0
		WHEN PP.pre_dias_atraso > PP.pre_dias_mora THEN PP.pre_dias_atraso ELSE PP.pre_dias_mora END as pp_dias_mora
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT COALESCE(pr.id_cliente, pc.id_cliente) as id_cliente,
			COALESCE(pr.pre_dias_atraso, 0) as pre_dias_atraso, COALESCE(pc.pre_dias_mora, 0) as pre_dias_mora
			FROM (
				SELECT id_cliente, MAX(pre_dias_atraso) as pre_dias_atraso
				FROM #dpp_prestamo
				WHERE (ope_id_modulo = 103 OR (ope_id_tipo_operacion IN (5, 6, 223) AND ope_id_modulo = 30))
				AND cta_fec_carga = @Fecha_hasta
				GROUP BY id_cliente
			) pr
			FULL OUTER JOIN
			(
				SELECT id_cliente, MAX(COALESCE(pre_dias_mora, 0)) as pre_dias_mora
				FROM [sta].[sta_dpp_prestamo_consumo]
				WHERE	ope_id_modulo = 333 AND pre_saldo_capital > 0 AND pre_cant_cuotas > 1 AND pre_dias_mora > 0
					AND cta_fec_carga = @Fecha_Hasta
				GROUP BY id_cliente
			) pc
			ON pr.id_cliente = pc.id_cliente
		) PP
		ON DP.id_cliente = PP.id_cliente
		ORDER BY DP.id_cliente;

		CREATE TABLE #dias_mora_cc
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			cte_dias_mora SMALLINT NULL
		);

		INSERT INTO #dias_mora_cc (id_cliente, cte_dias_mora)
		SELECT DP.id_cliente, COALESCE(CC.cte_dias_mora, 0) as cte_dias_mora
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT id_cliente, MAX(cte_dias_mora) as cte_dias_mora
			FROM [sta].[sta_dcc_cuenta_corriente]
			WHERE cte_id_estado <> 14
			AND cta_fec_carga = @Fecha_hasta
			GROUP BY id_cliente
		) CC
		ON DP.id_cliente = CC.id_cliente;
--SEGUIR
		CREATE TABLE #dias_mora_tc
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			tcm_dias_mora SMALLINT NULL
		); 

		INSERT INTO #dias_mora_tc (id_cliente, tcm_dias_mora)
		SELECT DP.id_cliente, MAX(COALESCE(TC.tcm_dias_mora, 0)) as tcm_dias_mora
		FROM #dcl_persona_ddp DP
		LEFT JOIN (SELECT tcm_dias_mora, id_cliente FROM [sta].[sta_dtc_tarjeta_credito] WHERE cta_fec_carga = @Fecha_hasta
		) TC
		ON DP.id_cliente = TC.id_cliente
		GROUP BY DP.id_cliente;

		CREATE TABLE #flag_no_admitidos
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_flg_no_admitidos TINYINT NOT NULL
		);

		INSERT INTO #flag_no_admitidos (id_cliente, per_flg_no_admitidos)
		SELECT DP.id_cliente, CASE WHEN NA.id_cliente IS NOT NULL THEN 1 ELSE 0 END as per_flg_no_admitidos
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT DISTINCT id_cliente
			FROM (
				SELECT DP.id_cliente
				FROM #dcl_persona_ddp DP
				INNER JOIN (SELECT id_cliente, per_id_tipo_doc, per_cuit_cuil, fec_carga FROM [sta].[sta_dcl_no_admitidos] WHERE LTRIM(RTRIM(per_nro_documento)) <> '-1') NA
				ON DP.per_cuit_cuil = NA.per_cuit_cuil
				WHERE NA.per_id_tipo_doc BETWEEN 1 AND 3
				AND NA.fec_carga = @Fecha_hasta

				UNION ALL
				
				SELECT DP.id_cliente
				FROM #dcl_persona_ddp DP
				INNER JOIN (SELECT id_cliente, per_id_tipo_doc, per_id_pais, per_nro_documento, fec_carga FROM [sta].[sta_dcl_no_admitidos] WHERE LTRIM(RTRIM(per_nro_documento)) <> '-1') NA
				ON DP.per_id_pais = NA.per_id_pais AND DP.per_id_tipo_doc = NA.per_id_tipo_doc
				AND LTRIM(RTRIM(DP.per_nro_documento)) = LTRIM(RTRIM(NA.per_nro_documento))
				WHERE NA.per_id_tipo_doc >= 4
				AND NA.fec_carga =  @Fecha_hasta
			) SQ
		) NA
		ON DP.id_cliente = NA.id_cliente;

		CREATE TABLE #flag_deudores_bcra
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			flag_deudores_bcra TINYINT NOT NULL
		);

		INSERT INTO #flag_deudores_bcra (id_cliente, flag_deudores_bcra)
		SELECT DP.id_cliente, CASE WHEN RB.per_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flag_deudores_bcra
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
					SELECT DISTINCT per_cuit_cuil
					FROM [sta].[sta_msg_riesgo_bcra]
					WHERE per_fec_carga BETWEEN DATEADD(DAY,-1,SUBSTRING(CONVERT(CHAR,DATEADD(MONTH,-10,(SELECT MAX(per_fec_carga) FROM [sta].[sta_msg_riesgo_bcra])),112),1,6)+'01') AND (SELECT MAX(per_fec_carga) FROM [sta].[sta_msg_riesgo_bcra])
					) RB
		ON DP.per_cuit_cuil = RB.per_cuit_cuil;


		CREATE TABLE #flg_indes_bantotal
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			flg_indes_bantotal TINYINT NOT NULL
		);

		INSERT INTO #flg_indes_bantotal (id_cliente, flg_indes_bantotal)
		SELECT DP.id_cliente, CASE WHEN IB.flg_indes_bantotal > 0 THEN 1 ELSE 0 END as flg_indes_bantotal
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT id_cliente, COUNT(Cliente_conteo) as flg_indes_bantotal
			FROM (
				SELECT DP.id_cliente, IC.id_cliente as Cliente_conteo
				FROM #dcl_persona_ddp DP
				LEFT JOIN [sta].[sta_dcl_inhab_cambios] IC
				ON DP.per_cuit_cuil = IC.per_nro_documento
				WHERE IC.per_id_tipo_doc BETWEEN 1 AND 3
				AND IC.per_fec_carga =  @Fecha_hasta

				UNION ALL

				SELECT DP.id_cliente, IC.id_cliente as Cliente_conteo
				FROM #dcl_persona_ddp DP
				LEFT JOIN [sta].[sta_dcl_inhab_cambios] IC
				ON DP.per_id_pais = IC.per_id_pais AND DP.per_id_tipo_doc = IC.per_id_tipo_doc
				AND LTRIM(RTRIM(DP.per_nro_documento)) = LTRIM(RTRIM(IC.per_nro_documento))
				WHERE IC.per_id_tipo_doc >= 4
				AND IC.per_fec_carga =  @Fecha_hasta
			) SQ
			GROUP BY id_cliente
		) IB
		ON DP.id_cliente = IB.id_cliente;

		CREATE TABLE #flg_cartera_castig
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_flg_cartera_castigada TINYINT NOT NULL
		);

		INSERT INTO #flg_cartera_castig (id_cliente, per_flg_cartera_castigada)
		SELECT DP.id_cliente,
		CASE WHEN OP.id_cliente IS NOT NULL THEN 1 ELSE 0 END as per_flg_cartera_castigada
		FROM #dcl_persona_ddp DP
		LEFT JOIN (
			SELECT DISTINCT id_cliente
			FROM [sta].[sta_dcu_operacion]
			WHERE ope_id_modulo = 33
			AND cta_fec_carga =   @Fecha_hasta
		) OP
		ON DP.id_cliente = OP.id_cliente
		ORDER BY DP.id_cliente;

		CREATE TABLE #flag_ctas_embargadas
		(
			id_cliente VARCHAR(18) NOT NULL PRIMARY KEY,
			per_flg_ctas_embargadas TINYINT NOT NULL
		);

		INSERT INTO #flag_ctas_embargadas (id_cliente, per_flg_ctas_embargadas)
		SELECT id_cliente, SUM(Cliente_conteo) as flag_ctas_embargadas
		FROM (
			SELECT DP.id_cliente, CASE WHEN CA.id_cliente IS NOT NULL THEN 1 ELSE 0 END as Cliente_conteo
			FROM #dcl_persona_ddp DP
			LEFT JOIN (SELECT DISTINCT id_cliente FROM [sta].[sta_dca_caja_ahorro] WHERE cah_id_estado = 15 AND cta_fec_carga =  @Fecha_hasta
			) CA
			ON DP.id_cliente = CA.id_cliente

			UNION ALL

			SELECT DP.id_cliente, CASE WHEN CC.id_cliente IS NOT NULL THEN 1 ELSE 0 END Cliente_conteo
			FROM #dcl_persona_ddp DP
			LEFT JOIN (SELECT DISTINCT id_cliente FROM [sta].[sta_dcc_cuenta_corriente] WHERE cte_id_estado = 15 AND cta_fec_carga =  @Fecha_hasta
			) CC
			ON DP.id_cliente = CC.id_cliente
		) SQ
		GROUP BY id_cliente;

		CREATE TABLE #flags_clientes
		(
			[id_cliente] VARCHAR(18) NOT NULL PRIMARY KEY,
			[per_flg_empleado] TINYINT NOT NULL,
			[per_flg_ent_liq_bcra] TINYINT NOT NULL,
			[per_flg_ctas_embargadas] TINYINT NOT NULL,
			[per_flg_deudores_bcra] TINYINT NOT NULL,
			[per_flg_indeseables_AS400] TINYINT NOT NULL,
			[per_flg_embargos] TINYINT NOT NULL,
			[per_flg_cartera_castigada] TINYINT NOT NULL,
			[per_flg_gestion_y_mora] TINYINT NOT NULL,
			[per_flg_indeseables_Bantotal] TINYINT NOT NULL,
			[per_flg_no_admitidos] TINYINT NOT NULL,
			[per_flg_refinanciaciones] TINYINT NOT NULL,
			[per_sit_BS_BE] TINYINT NOT NULL,
			[per_flg_lista_negra] TINYINT NOT NULL,
			[per_flg_rechazados_riesgos] TINYINT NOT NULL,
			[pp_dias_mora] SMALLINT NULL,
			[cte_dias_mora] SMALLINT NULL,
			[tcm_dias_mora] SMALLINT NULL
		);

		--Concentracion de los flags en una unica tabla
		INSERT INTO #flags_clientes
		(id_cliente, per_flg_empleado, per_flg_ent_liq_bcra, per_flg_ctas_embargadas, per_flg_deudores_bcra, per_flg_indeseables_AS400, per_flg_embargos,
		per_flg_cartera_castigada, per_flg_gestion_y_mora, per_flg_indeseables_Bantotal, per_flg_no_admitidos, per_flg_refinanciaciones, per_sit_BS_BE,
		per_flg_lista_negra, per_flg_rechazados_riesgos, pp_dias_mora, cte_dias_mora, tcm_dias_mora)
		SELECT DP.id_cliente, MT.flg_empleado, ELB.per_flg_ent_liq_bcra, CE.per_flg_ctas_embargadas,
		BC.flag_deudores_bcra as per_flg_deudores_bcra,0 as per_flg_indeseables_AS400,
		0 as per_flg_embargos, CC.per_flg_cartera_castigada, FGM.flg_gestion_mora as per_flg_gestion_y_mora, IB.flg_indes_bantotal as per_flg_indeseables_Bantotal,
		NA.per_flg_no_admitidos, RF.flg_refinanciaciones as per_flg_refinanciaciones, 0 as per_sit_BS_BE,
		LN.flg_lista_negra, RR.flg_rechazados_riesgos, PDM.pp_dias_mora, CDM.cte_dias_mora, TDM.tcm_dias_mora
		FROM #dcl_persona_ddp DP
		INNER JOIN #mcu_transaccion MT ON DP.id_cliente = MT.id_cliente
		INNER JOIN #flag_ctas_embargadas CE ON DP.id_cliente = CE.id_cliente
		INNER JOIN #flg_gestion_mora FGM ON DP.id_cliente = FGM.id_cliente
		INNER JOIN #flg_refinanciaciones RF ON DP.id_cliente = RF.id_cliente
		INNER JOIN #dias_mora_pp PDM ON DP.id_cliente = PDM.id_cliente
		INNER JOIN #dias_mora_cc CDM ON DP.id_cliente = CDM.id_cliente
		INNER JOIN #dias_mora_tc TDM ON DP.id_cliente = TDM.id_cliente
		INNER JOIN #flag_no_admitidos NA ON DP.id_cliente = NA.id_cliente
		INNER JOIN #flag_deudores_bcra BC ON DP.id_cliente = BC.id_cliente
		INNER JOIN #flg_indes_bantotal IB ON DP.id_cliente = IB.id_cliente
		INNER JOIN #flg_cartera_castig CC ON DP.id_cliente = CC.id_cliente
		INNER JOIN #ent_liq_bcra ELB ON DP.id_cliente = ELB.id_cliente
		INNER JOIN #dcl_lista_negra_bm LN ON DP.id_cliente = LN.id_cliente
		INNER JOIN #dcl_rechazados_riesgos RR ON DP.id_cliente = RR.id_cliente
		ORDER BY DP.id_cliente;
		
		--select * from #flags_clientes

		DROP TABLE #flg_gestion_mora;
		DROP TABLE #flg_refinanciaciones;
		DROP TABLE #dias_mora_pp;
		DROP TABLE #dias_mora_cc;
		DROP TABLE #dias_mora_tc;
		DROP TABLE #flag_no_admitidos;
		DROP TABLE #flag_deudores_bcra;
		DROP TABLE #flg_indes_bantotal;
		DROP TABLE #flg_cartera_castig;
		DROP TABLE #flag_ctas_embargadas;
		DROP TABLE #ent_liq_bcra;
		DROP TABLE #dcl_lista_negra_bm;
		DROP TABLE #dcl_rechazados_riesgos;
		DROP TABLE #mcu_transaccion;
		DROP TABLE #dpp_prestamo;				   

		
		--Adicion del sprint 4 para clientes Homebanking
		CREATE TABLE #dhb_usuarios
		(
			[id_cliente] VARCHAR (18) NOT NULL PRIMARY KEY,
			[flag_adhesion_hb] TINYINT NOT NULL,
			[hb_fec_creacion] DATETIME NULL,
			[hb_ultim_logon] DATETIME NULL
		);

		INSERT INTO #dhb_usuarios (id_cliente, flag_adhesion_hb, hb_fec_creacion, hb_ultim_logon)
		SELECT DP.id_cliente,
		CASE WHEN HB.hb_id_pais IS NOT NULL AND HB.hb_tipo_doc IS NOT NULL AND HB.hb_nro_doc IS NOT NULL THEN 1 ELSE 0 END AS flag_adhesion_hb,
		HB.hb_fec_creacion, HB.hb_ultim_logon
		FROM #dcl_persona_ddp DP
		LEFT JOIN
		(
			SELECT hb_id_pais, hb_tipo_doc, hb_nro_doc, hb_fec_creacion, hb_ultim_logon
			FROM (
				SELECT ROW_NUMBER() OVER (PARTITION BY hb_id_pais, hb_tipo_doc, hb_nro_doc ORDER BY hb_ultim_logon DESC, hb_fec_carga ASC) AS CONTADOR,
				id_cliente, hb_id_pais, hb_tipo_doc, hb_nro_doc, hb_fec_creacion, hb_ultim_logon
				FROM [sta].[sta_dhb_usuarios]
				WHERE hb_origen = 'HBI'
				AND hb_fec_carga =  @Fecha_hasta
			) SQ
			WHERE SQ.CONTADOR = 1
		) HB
		ON DP.per_id_pais = HB.hb_id_pais AND DP.per_id_tipo_doc = HB.hb_tipo_doc AND DP.per_nro_documento = HB.hb_nro_doc;

		--Adicion del sprint 5 para variables RCI (06/06/2019)
		CREATE TABLE #rci_jubilados
		(
			[per_id_pais] SMALLINT NOT NULL,
			[per_id_tipo_doc] SMALLINT NOT NULL,
			[per_nro_documento] VARCHAR(12) NOT NULL,
			[per_ingreso_promo] DECIMAL(20,4) NOT NULL,
			[per_rci_cre] DECIMAL(20,16) NOT NULL,
			[per_rci] DECIMAL(20,16) NOT NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_RCI_JUB] ON #rci_jubilados
		([PER_ID_TIPO_DOC] ASC, [PER_ID_PAIS] ASC, [PER_NRO_DOCUMENTO] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
	
		INSERT INTO #rci_jubilados (per_id_pais, per_id_tipo_doc, per_nro_documento, per_ingreso_promo, per_rci_cre, per_rci)
		SELECT per_id_pais, per_id_tipo_doc, per_nro_documento, per_ingreso_promo, per_rci_cre, per_rci
		FROM [sta].[sta_dcl_jubilados_rci]
		WHERE per_fec_carga =   @Fecha_hasta;

		--Adicion del sprint 5 para variables de actividad del cliente (12/06/2019)
		CREATE TABLE #mcl_indicadores
		(
			[per_id_pais] SMALLINT NOT NULL,
			[per_id_tipo_doc] SMALLINT NOT NULL,
			[per_nro_documento] VARCHAR(12) NOT NULL,
			[per_id_rango_ult_actividad] SMALLINT NULL,
			[per_rango_ult_actividad] VARCHAR(20) NULL,
			[per_fec_ult_actividad] DATE NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_MCL_IND] ON #mcl_indicadores
		([per_id_tipo_doc] ASC, [per_id_pais] ASC, [per_nro_documento] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		INSERT INTO #mcl_indicadores (per_id_pais, per_id_tipo_doc, per_nro_documento, per_id_rango_ult_actividad, per_rango_ult_actividad, per_fec_ult_actividad)
		SELECT per_id_pais, per_id_tipo_doc, per_nro_documento, per_id_rango_ult_actividad, per_rango_ult_actividad, per_fec_ult_actividad
		FROM [sta].[sta_mcl_indicadores]
		WHERE per_fec_carga = (SELECT MAX(per_fec_carga) FROM [sta].[sta_mcl_indicadores]);
		
		--Adicion del sprint 7 para variables de actividad del cliente (08/08/2019)
		CREATE TABLE #crm_cuenta_cliente
		(
			[id_cuenta_cliente_crm] VARCHAR(255) NOT NULL,
			[per_id_pais] SMALLINT NOT NULL,
			[per_id_tipo_doc] SMALLINT NOT NULL,
			[per_nro_documento] VARCHAR(12) NOT NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_MCL_IND] ON #crm_cuenta_cliente
		([per_id_pais] ASC, [per_id_tipo_doc] ASC, [per_nro_documento] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		INSERT INTO #crm_cuenta_cliente (per_id_pais, per_id_tipo_doc, per_nro_documento, id_cuenta_cliente_crm)
		SELECT per_id_pais, per_id_tipo_doc, per_nro_documento, id_cuenta_cliente_crm
		FROM [sta].[sta_crm_in_cuenta_cliente]
		WHERE per_fec_carga =  @Fecha_hasta;
		
		--SEGUROS
		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;
		CREATE TABLE #Catalogo_seguros
		(
			[tipo_seguro] VARCHAR(30) NOT NULL,
			[tpr_descripcion] VARCHAR(40) NOT NULL,
			[pro_descripcion] VARCHAR(80) NOT NULL
		);

		INSERT INTO #Catalogo_seguros(tpr_descripcion, pro_descripcion, tipo_seguro)
		SELECT tpr_descripcion, pro_descripcion,
		CASE
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE 'auto%' THEN 'Automoviles'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE 'broken%' THEN 'Broken Bones'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE 'vida%' THEN 'Vida'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%accid%' THEN 'Accidentes Personales'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%atm%' THEN 'ATM'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%desempleo%' THEN 'Desempleo'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%masc%' THEN 'Mascotas'
		WHEN LOWER(LTRIM(RTRIM(pro_descripcion))) LIKE '%asist%' OR LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%asist%' THEN 'Asistencia'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%vivi%' THEN 'Hogar'
		WHEN LOWER(LTRIM(RTRIM(pro_descripcion))) LIKE '%conte%' THEN 'Contenido Protegido'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) = 'robo bolso protegido' THEN 'Bolso Protegido'
		WHEN LOWER(LTRIM(RTRIM(pro_descripcion))) LIKE '%tecno%' THEN 'Tecnologia Protegida'
		WHEN LOWER(LTRIM(RTRIM(tpr_descripcion))) LIKE '%desempleo%' THEN 'Desempleo'
		ELSE 'Otros' END as tipo_seguro
		FROM (
			SELECT DISTINCT LOWER(LTRIM(RTRIM(tpr_descripcion))) as tpr_descripcion, LOWER(LTRIM(RTRIM(pro_descripcion))) as pro_descripcion
			FROM [sta].[sta_mse_padron_seguros]
		) SQ;

		CREATE TABLE #SEGUROS_CLIENTES--FCT_SEGUROS
		(
			ID_CLIENTE VARCHAR(18) NOT NULL,
			SEG_FLG_BROKENBONES TINYINT NOT NULL,
			SEG_FLG_ACCIDENTESPERSONALES TINYINT NOT NULL,
			SEG_FLG_VIDA TINYINT NOT NULL,
			SEG_FLG_ROBOATM TINYINT NOT NULL,
			SEG_FLG_AUTO TINYINT NOT NULL,
			SEG_FLG_DESEMPLEO TINYINT NOT NULL,
			SEG_FLG_ROBOBOLSOPROTEGIDO TINYINT NOT NULL,
			SEG_FLG_ROBOTECNOLOGIAPROTEGIDA TINYINT NOT NULL,
			SEG_FLG_ROBOCONTENIDOPROTEGIDO TINYINT NOT NULL,
			SEG_FLG_MASCOTAS TINYINT NOT NULL,
			SEG_FLG_HOGAR TINYINT NOT NULL,
			SEG_FLG_OTROS TINYINT NOT NULL,
			SEG_FLG_MULTIASISTENCIA TINYINT NOT NULL,
			SEG_FLG_HOGAR_EBOOK TINYINT NOT NULL,
			SEG_CNT_TOTAL SMALLINT NOT NULL,
			FECHACARGA DATETIME NOT NULL,
			FECHAACTUALIZACION DATETIME NOT NULL
		);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;

		INSERT INTO #SEGUROS_CLIENTES
		(ID_CLIENTE, SEG_FLG_BROKENBONES, SEG_FLG_ACCIDENTESPERSONALES, SEG_FLG_VIDA, SEG_FLG_ROBOATM, SEG_FLG_AUTO, SEG_FLG_DESEMPLEO, 
		SEG_FLG_ROBOBOLSOPROTEGIDO, SEG_FLG_ROBOTECNOLOGIAPROTEGIDA, SEG_FLG_ROBOCONTENIDOPROTEGIDO, SEG_FLG_MASCOTAS, SEG_FLG_HOGAR,
		SEG_FLG_OTROS, SEG_FLG_MULTIASISTENCIA, SEG_FLG_HOGAR_EBOOK, SEG_CNT_TOTAL, FECHACARGA, FECHAACTUALIZACION)
		SELECT DP.ID_CLIENTE,
		--Limitacion por cada tipo de seguro. Si es mayor a 1 se deja en 1, ya que es un flag
		COALESCE(CASE WHEN SQ.SEG_FLG_BROKENBONES >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_BROKENBONES,
		COALESCE(CASE WHEN SQ.SEG_FLG_ACCIDENTESPERSONALES >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_ACCIDENTESPERSONALES,
		COALESCE(CASE WHEN SQ.SEG_FLG_VIDA >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_VIDA,
		COALESCE(CASE WHEN SQ.SEG_FLG_ROBOATM >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_ROBOATM,
		COALESCE(CASE WHEN SQ.SEG_FLG_AUTO >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_AUTO,
		COALESCE(CASE WHEN SQ.SEG_FLG_DESEMPLEO >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_DESEMPLEO,
		COALESCE(CASE WHEN SQ.SEG_FLG_ROBOBOLSOPROTEGIDO >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_ROBOBOLSOPROTEGIDO,
		COALESCE(CASE WHEN SQ.SEG_FLG_ROBOTECNOLOGIAPROTEGIDA >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_ROBOTECNOLOGIAPROTEGIDA,
		COALESCE(CASE WHEN SQ.SEG_FLG_ROBOCONTENIDOPROTEGIDO >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_ROBOCONTENIDOPROTEGIDO,
		COALESCE(CASE WHEN SQ.SEG_FLG_MASCOTAS >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_MASCOTAS,
		COALESCE(CASE WHEN SQ.SEG_FLG_HOGAR >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_HOGAR,
		COALESCE(CASE WHEN SQ.SEG_FLG_OTROS >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_OTROS,
		--
		COALESCE(CASE WHEN SQ.SEG_FLG_MULTIASISTENCIA >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_MULTIASISTENCIA,
		--
		COALESCE(CASE WHEN SQ.SEG_FLG_HOGAR_EBOOK >= 1 THEN 1 ELSE 0 END, 0) AS SEG_FLG_HOGAR_EBOOK,
		--Sumatoria de cada seguro en un totalizador de puntaje
		(COALESCE(CASE WHEN SEG_FLG_BROKENBONES >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_ACCIDENTESPERSONALES >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_VIDA >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_ROBOATM >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_AUTO >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_DESEMPLEO >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_ROBOBOLSOPROTEGIDO >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_ROBOTECNOLOGIAPROTEGIDA >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_ROBOCONTENIDOPROTEGIDO >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_MASCOTAS >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_HOGAR >= 1 THEN 1 ELSE 0 END, 0) +
		COALESCE(CASE WHEN SEG_FLG_OTROS >= 1 THEN 1 ELSE 0 END, 0) +
		--
		COALESCE(CASE WHEN SEG_FLG_MULTIASISTENCIA >= 1 THEN 1 ELSE 0 END, 0) +
		--
		COALESCE(CASE WHEN SEG_FLG_HOGAR_EBOOK > 1 THEN 1 ELSE 0 END, 0)) AS SEG_CNT_TOTAL,
		DP.per_fec_carga AS FECHACARGA, GETDATE() AS FECHAACTUALIZACION
		FROM
		(
			--Criterio de desduplicacion de clientes, para que el origen sea toda la base de los mismos, tengan o no un seguro asignado
			SELECT id_cliente, per_fec_carga FROM (
				SELECT ROW_NUMBER() OVER (PARTITION BY id_cliente ORDER BY per_antiguedad DESC, per_edad DESC) as CONTADOR, id_cliente, per_fec_carga
				FROM [sta].[sta_dcl_persona]) DDP
			WHERE DDP.CONTADOR = 1
		) DP
		LEFT JOIN
		(
			SELECT PS.id_cliente,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Broken Bones' THEN 1 ELSE 0 END) AS SEG_FLG_BROKENBONES,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Accidentes Personales' THEN 1 ELSE 0 END) AS SEG_FLG_ACCIDENTESPERSONALES,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Vida' THEN 1 ELSE 0 END) AS SEG_FLG_VIDA,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'ATM' THEN 1 ELSE 0 END) AS SEG_FLG_ROBOATM,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Automoviles' THEN 1 ELSE 0 END) AS SEG_FLG_AUTO,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Desempleo' THEN 1 ELSE 0 END) AS SEG_FLG_DESEMPLEO,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Bolso Protegido' THEN 1 ELSE 0 END) AS SEG_FLG_ROBOBOLSOPROTEGIDO,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Tecnologia Protegida' THEN 1 ELSE 0 END) AS SEG_FLG_ROBOTECNOLOGIAPROTEGIDA,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Contenido Protegido' THEN 1 ELSE 0 END) AS SEG_FLG_ROBOCONTENIDOPROTEGIDO,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Mascotas' THEN 1 ELSE 0 END) AS SEG_FLG_MASCOTAS,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Hogar' THEN 1 ELSE 0 END) AS SEG_FLG_HOGAR,
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Otros' THEN 1 ELSE 0 END) AS SEG_FLG_OTROS,
			--
			SUM(CASE WHEN PS.pza_estado = 1 AND CS.tipo_seguro = 'Asistencia' THEN 1 ELSE 0 END) AS SEG_FLG_MULTIASISTENCIA,
			--
			SUM(0) AS SEG_FLG_HOGAR_EBOOK --Por ahora no se encuentra definido
			FROM [sta].[sta_mse_padron_seguros] PS
			INNER JOIN #Catalogo_seguros CS
			ON LOWER(LTRIM(RTRIM(PS.tpr_descripcion))) = CS.tpr_descripcion
			AND LOWER(LTRIM(RTRIM(PS.pro_descripcion))) = CS.pro_descripcion
			--WHERE CS.tipo_seguro <> 'Asistencia'
			WHERE 0=0
			GROUP BY PS.id_cliente
		) SQ
		ON DP.id_cliente = SQ.id_cliente
		ORDER BY DP.id_cliente;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

	
		--FIN SEGUROS

		--INICIO ASISTENCIAS CORDIAL
		SELECT 	per_id_pais, per_id_tipo_doc, per_nro_documento, per_cuit_cuil, 
				MAX(CASE WHEN servicio LIKE '%Emergencia%' THEN 1 ELSE 0 END) AS cor_flg_emergencias,
				MAX(CASE WHEN servicio LIKE '%gerdan%' THEN 1 ELSE 0 END) AS cor_flg_gerdana,
				MAX(CASE WHEN servicio LIKE '%kinesiolo%' THEN 1 ELSE 0 END) AS cor_flg_kinesiologia,
				MAX(CASE WHEN servicio LIKE '%odontolo%' THEN 1 ELSE 0 END) AS cor_flg_odontologia,
				MAX(CASE WHEN servicio LIKE '%oftalmolog%' THEN 1 ELSE 0 END) AS cor_flg_oftalmologia,
				MAX(CASE WHEN servicio LIKE '%asistenc%' THEN 1 ELSE 0 END) AS cor_flg_multiasistencia,
				MAX(CASE WHEN servicio NOT IN ('%EMERGENCIA%','%GERDANA%','%KINESIOLOGIA%', '%ODONTOLOGIA%', '%OFTALMOLOGIA%', '%ASISTENCIA%') THEN 0 ELSE 1 END) AS cor_flg_otros,
				fecha_carga ,
				fec_carga AS fechaactualizacion
		INTO 	#cordial_tenencias
		FROM	[sascampaign].[sta].[sta_stock_cordial_servicios]
		WHERE	0=0
		AND		titular = 1
		AND		activo = 1
		GROUP BY per_id_pais, per_id_tipo_doc, per_nro_documento, per_cuit_cuil, fecha_carga, fec_carga 

 		--FIN ASISTENCIAS CORDIAL


		CREATE TABLE #STA_DCL_PERSONA
		(
			--Datos de persona
			ID_CLIENTE VARCHAR(18) NOT NULL PRIMARY KEY,
			PER_NRO_DOCUMENTO VARCHAR(12) NOT NULL,
			PER_ID_TIPO_DOC SMALLINT NOT NULL,
			PER_ID_PAIS SMALLINT NOT NULL,
			PER_CUIT_CUIL VARCHAR(12) NULL,
			PER_FLG_TITULAR TINYINT NOT NULL,
			PER_FLG_ACTIVO TINYINT NOT NULL,
			PER_ID_BANCA SMALLINT NOT NULL,
			DESC_SEGMENTO VARCHAR(80) NULL,
			PER_FECHA_NACIMIENTO DATE NULL,
			PER_RAZON_SOCIAL VARCHAR(50) NOT NULL,
			PER_APELLIDO VARCHAR(50) NULL,
			PER_NOMBRE VARCHAR(50) NULL,
			PER_ANTIGUEDAD SMALLINT NOT NULL,
			PER_EDAD SMALLINT NULL,
			PQP_TIT_PPAL_ID_TIPO SMALLINT NULL,
			PQP_TIT_PPAL_TIPO VARCHAR(80) NULL,
			PER_SEXO CHAR(1) NULL,
			PER_ESTADO_CIVIL VARCHAR(50) NULL,
			PER_ID_SUCURSAL SMALLINT NULL,
			PER_TIPO_PERSONA VARCHAR(50) NULL,
			--Datos demograficos de la tabla mensual de clientes
			DOP_PROVINCIA VARCHAR(50) NULL,
			DOP_LOCALIDAD VARCHAR(50) NULL,
			DOP_CALLE VARCHAR(50) NULL,
			DOP_NUMERO INTEGER NULL,
			DOP_DEPARTAMENTO VARCHAR(20) NULL,
			DOP_CODIGO_POSTAL VARCHAR(20) NULL,
			--Telefonos
			TEL1_NUMERO_TELEFONO VARCHAR(50) NULL,
			TEL2_NUMERO_TELEFONO VARCHAR(50) NULL,
			TEL3_NUMERO_TELEFONO VARCHAR(50) NULL,
			TEL4_NUMERO_TELEFONO VARCHAR(50) NULL,
			TEL1_ORIGENINFO VARCHAR(50) NULL,
			TEL2_ORIGENINFO VARCHAR(50) NULL,
			TEL3_ORIGENINFO VARCHAR(50) NULL,
			TEL4_ORIGENINFO VARCHAR(50) NULL,
			TEL1_TIPO VARCHAR(50) NULL,
			TEL2_TIPO VARCHAR(50) NULL,
			TEL3_TIPO VARCHAR(50) NULL,
			TEL4_TIPO VARCHAR(50) NULL,
			TEL1_FLG_MOVIL TINYINT NULL,
			TEL2_FLG_MOVIL TINYINT NULL,
			TEL3_FLG_MOVIL TINYINT NULL,
			TEL4_FLG_MOVIL TINYINT NULL,
			TEL1_MOVIL_COMPANIA VARCHAR(50) NULL,
			TEL2_MOVIL_COMPANIA VARCHAR(50) NULL,
			TEL3_MOVIL_COMPANIA VARCHAR(50) NULL,
			TEL4_MOVIL_COMPANIA VARCHAR(50) NULL,
			--Emails
			MAIL_1 VARCHAR(200) NULL,
			MAIL_2 VARCHAR(200) NULL,
			MAIL_3 VARCHAR(200) NULL,
			MAIL_4 VARCHAR(200) NULL,
			MAIL_5 VARCHAR(200) NULL,
			--Fuentes de email
			MAIL_FUENTE_1 VARCHAR(50) NULL,
			MAIL_FUENTE_2 VARCHAR(50) NULL,
			MAIL_FUENTE_3 VARCHAR(50) NULL,
			MAIL_FUENTE_4 VARCHAR(50) NULL,
			MAIL_FUENTE_5 VARCHAR(50) NULL,
			--Flags
			PER_FLG_EMPLEADO TINYINT NOT NULL,
			PER_FLG_ENT_LIQ_BCRA TINYINT NOT NULL,
			PER_FLG_CTAS_EMBARGADAS TINYINT NOT NULL,
			PER_FLG_DEUDORES_BCRA TINYINT NOT NULL,
			PER_MONTO_DEUDORES_BCRA NUMERIC(18,2) NOT NULL,
			PER_DEUDATOTAL_DEUDORES_BCRA NUMERIC(18,2) NOT NULL,
			PER_SIT_DEUDORES_BCRA SMALLINT NOT NULL,
			PER_FLG_INDESEABLES_AS400 TINYINT NOT NULL,
			PER_FLG_LISTA_NEGRA TINYINT NOT NULL,
			PER_FLG_EMBARGOS TINYINT NOT NULL,
			PER_FLG_CARTERA_CASTIGADA TINYINT NOT NULL,
			PER_FLG_GESTION_Y_MORA TINYINT NOT NULL,
			PER_FLG_INDESEABLES_BANTOTAL TINYINT NOT NULL,
			PER_FLG_RECHAZADOS_RIESGOS TINYINT NOT NULL,
			PER_FLG_NO_ADMITIDOS TINYINT NOT NULL,
			PER_FLG_REFINANCIACIONES TINYINT NOT NULL,
			PER_SIT_BS_BE TINYINT NOT NULL,
			PER_FLG_GM_SIOC TINYINT NOT NULL,
			CTE_DIAS_MORA INTEGER NOT NULL,
			PP_DIAS_MORA INTEGER NOT NULL,
			TCM_DIAS_MORA INTEGER NOT NULL,
			--Clientes Homebanking
			HB_ULTIM_LOGON DATETIME NULL,
			HB_FEC_CREACION DATETIME NULL,
			HB_FLG_ADHESION TINYINT NULL,
			--Variables RCI Jubilados
			PER_RCI_INTEGRAL DECIMAL(20,16) NULL,
			PER_RCI_CREDITICIO DECIMAL(20,16) NULL,
			PER_RCI_INGRESO_PROMO DECIMAL(20,4) NULL,
			--Variables de actividad del cliente
			PER_FEC_ULT_ACTIVIDAD DATE NULL,
			PER_ID_RANGO_ULT_ACTIVIDAD SMALLINT NULL,
			PER_RANGO_ULT_ACTIVIDAD VARCHAR(20) NULL,
			--Sprint 7
			ID_CUENTA_CLIENTE_CRM VARCHAR(255) NULL,
			--Sprint 10
			PER_SEGMENTOICOM VARCHAR(100) NULL,
			PER_SUBSEGMENTOICOM VARCHAR(100) NULL,
			--Seguros
			SEG_FLG_BROKENBONES TINYINT NOT NULL,
			SEG_FLG_ACCIDENTESPERSONALES TINYINT NOT NULL,
			SEG_FLG_VIDA TINYINT NOT NULL,
			SEG_FLG_ROBOATM TINYINT NOT NULL,
			SEG_FLG_AUTO TINYINT NOT NULL,
			SEG_FLG_DESEMPLEO TINYINT NOT NULL,
			SEG_FLG_ROBOBOLSOPROTEGIDO TINYINT NOT NULL,
			SEG_FLG_ROBOTECNOLOGIAPROTEGIDA TINYINT NOT NULL,
			SEG_FLG_ROBOCONTENIDOPROTEGIDO TINYINT NOT NULL,
			SEG_FLG_MASCOTAS TINYINT NOT NULL,
			SEG_FLG_HOGAR TINYINT NOT NULL,
			SEG_FLG_OTROS TINYINT NOT NULL,
			SEG_FLG_HOGAR_EBOOK TINYINT NOT NULL,
			SEG_CNT_TOTAL SMALLINT NOT NULL,
			--CORDIAL
			COR_FLG_EMERGENCIAS TINYINT NOT NULL,
			COR_FLG_GERDANA TINYINT NOT NULL,
			COR_FLG_KINESIOLOGIA TINYINT NOT NULL,
			COR_FLG_ODONTOLOGIA TINYINT NOT NULL,
			COR_FLG_OFTALMOLOGIA TINYINT NOT NULL,
			COR_FLG_MULTIASISTENCIA TINYINT NOT NULL,
			COR_FLG_OTROS TINYINT NOT NULL,
			--Variables de control por fecha
			FECHACARGA DATETIME NOT NULL,
			FECHAACTUALIZACION DATETIME NOT NULL
		);

		CREATE NONCLUSTERED INDEX [IDX_PERSONA] ON #STA_DCL_PERSONA
		([PER_ID_TIPO_DOC] ASC, [PER_ID_PAIS] ASC, [PER_NRO_DOCUMENTO] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;
		--select * from #STA_DCL_PERSONA
		INSERT INTO #STA_DCL_PERSONA
		(ID_CLIENTE, PER_NRO_DOCUMENTO, PER_ID_TIPO_DOC, PER_ID_PAIS, PER_CUIT_CUIL, PER_FLG_TITULAR, PER_FLG_ACTIVO, PER_ID_BANCA, DESC_SEGMENTO, 
		PER_FECHA_NACIMIENTO, PER_RAZON_SOCIAL, PER_APELLIDO, PER_NOMBRE, PER_ANTIGUEDAD, PER_EDAD, PQP_TIT_PPAL_ID_TIPO, PQP_TIT_PPAL_TIPO, PER_SEXO, 
		PER_ESTADO_CIVIL, DOP_PROVINCIA, DOP_LOCALIDAD, DOP_CALLE, DOP_NUMERO, DOP_DEPARTAMENTO, DOP_CODIGO_POSTAL, TEL1_NUMERO_TELEFONO, 
		TEL2_NUMERO_TELEFONO, TEL3_NUMERO_TELEFONO, TEL4_NUMERO_TELEFONO, TEL1_ORIGENINFO, TEL2_ORIGENINFO, TEL3_ORIGENINFO, TEL4_ORIGENINFO, TEL1_TIPO, 
		TEL2_TIPO, TEL3_TIPO, TEL4_TIPO, TEL1_FLG_MOVIL, TEL2_FLG_MOVIL, TEL3_FLG_MOVIL, TEL4_FLG_MOVIL, TEL1_MOVIL_COMPANIA, TEL2_MOVIL_COMPANIA, 
		TEL3_MOVIL_COMPANIA, TEL4_MOVIL_COMPANIA, MAIL_1, MAIL_2, MAIL_3, MAIL_4, MAIL_5, MAIL_FUENTE_1, MAIL_FUENTE_2, MAIL_FUENTE_3, MAIL_FUENTE_4, 
		MAIL_FUENTE_5, PER_FLG_EMPLEADO, PER_FLG_ENT_LIQ_BCRA, PER_FLG_CTAS_EMBARGADAS, PER_FLG_DEUDORES_BCRA, PER_MONTO_DEUDORES_BCRA, 
		PER_DEUDATOTAL_DEUDORES_BCRA, PER_SIT_DEUDORES_BCRA, PER_FLG_INDESEABLES_AS400, PER_FLG_LISTA_NEGRA, PER_FLG_EMBARGOS, PER_FLG_CARTERA_CASTIGADA, 
		PER_FLG_GESTION_Y_MORA, PER_FLG_INDESEABLES_BANTOTAL, PER_FLG_RECHAZADOS_RIESGOS, PER_FLG_NO_ADMITIDOS, PER_FLG_REFINANCIACIONES, PER_SIT_BS_BE, 
		PER_FLG_GM_SIOC, CTE_DIAS_MORA, PP_DIAS_MORA, TCM_DIAS_MORA, HB_ULTIM_LOGON, HB_FEC_CREACION, HB_FLG_ADHESION,
		PER_RCI_INTEGRAL, PER_RCI_CREDITICIO, PER_RCI_INGRESO_PROMO, PER_FEC_ULT_ACTIVIDAD, PER_ID_RANGO_ULT_ACTIVIDAD, PER_RANGO_ULT_ACTIVIDAD,
		PER_ID_SUCURSAL, PER_TIPO_PERSONA, ID_CUENTA_CLIENTE_CRM, PER_SEGMENTOICOM, PER_SUBSEGMENTOICOM,
		SEG_FLG_BROKENBONES, SEG_FLG_ACCIDENTESPERSONALES, SEG_FLG_VIDA, SEG_FLG_ROBOATM, SEG_FLG_AUTO, SEG_FLG_DESEMPLEO, 
		SEG_FLG_ROBOBOLSOPROTEGIDO, SEG_FLG_ROBOTECNOLOGIAPROTEGIDA, SEG_FLG_ROBOCONTENIDOPROTEGIDO, SEG_FLG_MASCOTAS, SEG_FLG_HOGAR, 
		SEG_FLG_OTROS,	SEG_FLG_HOGAR_EBOOK, SEG_CNT_TOTAL, 
		COR_FLG_EMERGENCIAS,COR_FLG_GERDANA,COR_FLG_KINESIOLOGIA,COR_FLG_ODONTOLOGIA,COR_FLG_OFTALMOLOGIA,COR_FLG_MULTIASISTENCIA,COR_FLG_OTROS,
		FECHACARGA, FECHAACTUALIZACION)
		SELECT
		dp.id_cliente, --Concatenacion de tipo de documento + nro documento + pais de documento
		dp.per_nro_documento, --NÃºmero de documento
		dp.per_id_tipo_doc, --Tipo de documento
		dp.per_id_pais, --Pais del documento
		dp.per_cuit_cuil, --NÃºmero de CUIT/CUIL
		dp.per_flg_titular, --Titular
		dp.per_flg_activo, --Activo
		ISNULL(dp.per_id_banca,0), --ID Banca
		dp.desc_segmento, --Segmento DW
		dp.per_fecha_nacimiento, --Fecha de nacimiento
		dp.per_nombre as per_razon_social, --Nombre y apellido
		NULLIF(LTRIM(RTRIM(SUBSTRING(ISNULL(dp.per_nombre, ''), 1, CASE WHEN PATINDEX('%,%', ISNULL(dp.per_nombre, '')) = 0 THEN 1 ELSE PATINDEX('%,%', ISNULL(dp.per_nombre, ''))-1 END))), '') AS apellido, --Apellido solamente
		NULLIF(LTRIM(RTRIM(SUBSTRING(ISNULL(dp.per_nombre, ''), PATINDEX('%,%', ISNULL(dp.per_nombre, '')) + 1, LEN(dp.per_nombre)))), '') AS nombre, --Nombre solamente
		ISNULL(dp.per_antiguedad,0), --AntigÃ¼edad
		dp.per_edad, --Edad
		dp.pqp_tit_ppal_id_tipo, --NÃºmero de paquete principal
		dp.pqp_tit_ppal_tipo, --DescripciÃ³n de paquete principal
		CAST(LTRIM(RTRIM(dp.per_sexo)) AS CHAR(1)) as per_sexo, --Sexo
		dp.per_estado_civil, --Estado civil
		mc.dop_provincia, --Provincia
		mc.dop_localidad, --Localidad
		mc.dop_calle, --Calle de domicilio
		mc.dop_numero, --Numero de domicilio
		mc.dop_departamento, --Piso/departamento
		mc.dop_codigo_postal, --Codigo postal
		tl.tel1_numero_telefono, --tel1_telefono
		tl.tel2_numero_telefono, --tel2_telefono
		tl.tel3_numero_telefono, --tel3_telefono
		tl.tel4_numero_telefono, --tel4_telefono
		tl.tel1_origeninfo, --Para BM valor fijo "ebook"; Para BE: Se relevarÃ¡ cuando se implemente campanhas empresa
		tl.tel2_origeninfo, --Para BM valor fijo "ebook"; Para BE: Se relevarÃ¡ cuando se implemente campanhas empresa
		tl.tel3_origeninfo, --Para BM valor fijo "ebook"; Para BE: Se relevarÃ¡ cuando se implemente campanhas empresa
		tl.tel4_origeninfo, --Para BM valor fijo "ebook"; Para BE: Se relevarÃ¡ cuando se implemente campanhas empresa
		tl.tel1_tipo, -- Tel1_Merlin_Tipo_Telefono; BE: Se relevara cuando se implemente campanhas de empresas
		tl.tel2_tipo, -- Tel2_Merlin_Tipo_Telefono; BE: Se relevara cuando se implemente campanhas de empresas
		tl.tel3_tipo, -- Tel3_Merlin_Tipo_Telefono; BE: Se relevara cuando se implemente campanhas de empresas
		tl.tel4_tipo, -- Tel4_Merlin_Tipo_Telefono; BE: Se relevara cuando se implemente campanhas de empresas
		tl.tel1_flg_movil, --BM: construido en base a flag; BE: Campo construido. Se relevara cuando se implemente empresas
		tl.tel2_flg_movil, --BM: construido en base a flag; BE: Campo construido. Se relevara cuando se implemente empresas
		tl.tel3_flg_movil, --BM: construido en base a flag; BE: Campo construido. Se relevara cuando se implemente empresas
		tl.tel4_flg_movil, --BM: construido en base a flag; BE: Campo construido. Se relevara cuando se implemente empresas
		tl.tel1_movil_compania, --Solo para BE
		tl.tel2_movil_compania, --Solo para BE
		tl.tel3_movil_compania, --Solo para BE
		tl.tel4_movil_compania, --Solo para BE
		me.mail_1, --Email 1
		me.mail_2, --Email 2
		me.mail_3, --Email 3
		me.mail_4, --Email 4
		me.mail_5, --Email 5
		me.mail_fuente_1, --Fuente de email 1
		me.mail_fuente_2, --Fuente de email 2
		me.mail_fuente_3, --Fuente de email 3
		me.mail_fuente_4, --Fuente de email 4
		me.mail_fuente_5, --Fuente de email 5
		CASE WHEN flg.per_flg_empleado = 1 THEN 1 WHEN dp.per_flg_empleado > 0 THEN 1 ELSE 0 END as PER_FLG_EMPLEADO,
		flg.per_flg_ent_liq_bcra, --Entidades Liquidadas
		flg.per_flg_ctas_embargadas, --Con cuentas Embargadas
		flg.per_flg_deudores_bcra, --Deudores BCRA Flag
		0 AS per_monto_deudores_bcra, --TBD --Deudores BCRA Monto
		0 AS per_deudatotal_deudores_bcra, --TBD --Deuda total
		0 AS per_sit_deudores_bcra, --TBD --Deudores BCRA Situacion
		flg.per_flg_indeseables_as400, --Indeseables AS400
		flg.per_flg_lista_negra, --Lista negra
		flg.per_flg_embargos, --Embargos
		flg.per_flg_cartera_castigada, --Cartera Castigada
		flg.per_flg_gestion_y_mora, --Gestion y Mora
		flg.per_flg_indeseables_bantotal, --Indeseables Bantotal
		flg.per_flg_rechazados_riesgos, --Rechazados riesgos
		flg.per_flg_no_admitidos, --No admitidos
		flg.per_flg_refinanciaciones, --Con refinanciaciones
		flg.per_sit_bs_be, --Situacion BS BE
		0 as per_flg_gm_sioc, --TBD
		flg.cte_dias_mora, --Dias Mora CC
		flg.pp_dias_mora, --Dias Mora PP
		flg.tcm_dias_mora, --Dias Mora TC	
		hb.hb_ultim_logon, --Fecha ultimo login al HB Individuos
		hb.hb_fec_creacion, --Fecha de Adhesion al HB Individuos
		hb.flag_adhesion_hb, --Flag de adhesion HB Individuos
		jb.per_rci as per_rci_integral, -- RCI Integral
		jb.per_rci_cre as per_rci_crediticio, -- RCI Crediticio
		jb.per_ingreso_promo as per_rci_ingreso_promo, -- RCI Ingreso Promo
		mi.per_fec_ult_actividad, --Fecha Ultima Actividad
		mi.per_id_rango_ult_actividad, --Rango Ultima actividad ID
		mi.per_rango_ult_actividad, --Rango Ultima actividad Descripcion
		dp.per_id_sucursal, --ID sucursal cliente
		dp.per_tipo_persona, --Tipo de Persona
		crm.id_cuenta_cliente_crm, --Identificador de cliente CRM
		cl.per_segmentoICOM, --Segmento ICOM
		cl.per_SUBsegmentoICOM, --SUBsegmento ICOM
		--SEGUROS
		sc.SEG_FLG_BROKENBONES, 
		sc.SEG_FLG_ACCIDENTESPERSONALES, 
		sc.SEG_FLG_VIDA, 
		sc.SEG_FLG_ROBOATM, 
		sc.SEG_FLG_AUTO, 
		sc.SEG_FLG_DESEMPLEO,
		sc.SEG_FLG_ROBOBOLSOPROTEGIDO, 
		sc.SEG_FLG_ROBOTECNOLOGIAPROTEGIDA, 
		sc.SEG_FLG_ROBOCONTENIDOPROTEGIDO, 
		sc.SEG_FLG_MASCOTAS, 
		sc.SEG_FLG_HOGAR,
		sc.SEG_FLG_OTROS, 
		sc.SEG_FLG_HOGAR_EBOOK, 
		sc.SEG_CNT_TOTAL,
		--CORDIAL
		isnull(cor.COR_FLG_EMERGENCIAS,0)COR_FLG_EMERGENCIAS,
		isnull(cor.COR_FLG_GERDANA,0)COR_FLG_GERDANA,
		isnull(cor.COR_FLG_KINESIOLOGIA,0)COR_FLG_KINESIOLOGIA,
		isnull(cor.COR_FLG_ODONTOLOGIA,0)COR_FLG_ODONTOLOGIA,
		isnull(cor.COR_FLG_OFTALMOLOGIA,0)COR_FLG_OFTALMOLOGIA,
		isnull (CASE WHEN (cor.COR_FLG_MULTIASISTENCIA = 1 OR sc.SEG_FLG_MULTIASISTENCIA = 1) THEN 1 ELSE 0 END, 0) COR_FLG_MULTIASISTENCIA,
		isnull(cor.COR_FLG_OTROS,0)COR_FLG_OTROS,
		dp.per_fec_carga as fecha_carga, --Fecha de carga de datos
		GETDATE() as fecha_actualizacion --Fecha de actualizacion de datos
		FROM #dcl_persona_ddp dp
		LEFT JOIN #maestro_emails_tmp me
		ON dp.per_id_pais = me.per_id_pais AND dp.per_id_tipo_doc = me.per_id_tipo_doc AND dp.per_nro_documento = me.per_nro_documento
		LEFT JOIN #mcl_clientes_ddp mc
		ON dp.id_cliente = mc.id_cliente
		LEFT JOIN #tmp_telefonos tl
		ON dp.id_cliente = tl.id_cliente
		LEFT JOIN #dhb_usuarios hb
		ON dp.id_cliente = hb.id_cliente
		INNER JOIN #flags_clientes flg
		ON dp.id_cliente = flg.id_cliente
		LEFT JOIN #rci_jubilados jb
		ON dp.per_id_pais = jb.per_id_pais AND dp.per_id_tipo_doc = jb.per_id_tipo_doc AND dp.per_nro_documento = jb.per_nro_documento
		LEFT JOIN #mcl_indicadores mi
		ON dp.per_id_pais = mi.per_id_pais AND dp.per_id_tipo_doc = mi.per_id_tipo_doc AND dp.per_nro_documento = mi.per_nro_documento
		LEFT JOIN #crm_cuenta_cliente crm
		ON dp.per_id_tipo_doc = crm.per_id_tipo_doc AND dp.per_id_pais = crm.per_id_pais AND dp.per_nro_documento = crm.per_nro_documento
		LEFT JOIN #dcl_segmentacion cl
		ON dp.per_id_pais = cl.per_id_pais AND dp.per_id_tipo_doc = cl.per_id_tipo_doc AND dp.per_nro_documento = cl.per_nro_documento
		LEFT JOIN #SEGUROS_CLIENTES sc 
		ON dp.id_cliente = sc.id_cliente
		LEFT JOIN #CORDIAL_TENENCIAS cor
		ON dp.per_id_pais = cor.per_id_pais AND dp.per_id_tipo_doc = cor.per_id_tipo_doc AND dp.per_nro_documento = cor.per_nro_documento;

		
			
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';


		IF ((SELECT COUNT(*) FROM #STA_DCL_PERSONA) > 0)
			BEGIN

				EXEC(@Truncar);
				---------------------------------------------------------------------------------------  
				-- Carga final de datos a tabla fisica
				---------------------------------------------------------------------------------------
				PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;
				
				INSERT INTO DataMart.[DIM_CLIENTES]
				(
				ID_CLIENTE, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PER_ID_PAIS, PER_CUIT_CUIL, PER_RAZON_SOCIAL, PER_APELLIDO, PER_NOMBRE, PER_FECHA_NACIMIENTO, 
				PER_EDAD, PER_SEXO, PER_ESTADO_CIVIL, PER_ID_BANCA, DESC_SEGMENTO, PER_FLG_TITULAR, PER_FLG_ACTIVO, PER_FLG_EMPLEADO, PER_ANTIGUEDAD, 
				PQP_TIT_PPAL_ID_TIPO, PQP_TIT_PPAL_TIPO, DOP_PROVINCIA, DOP_LOCALIDAD, DOP_CALLE, DOP_NUMERO, DOP_DEPARTAMENTO, DOP_CODIGO_POSTAL, 
				TEL1_NUMERO_TELEFONO, TEL2_NUMERO_TELEFONO, TEL3_NUMERO_TELEFONO, TEL4_NUMERO_TELEFONO, TEL1_ORIGENINFO, TEL2_ORIGENINFO, TEL3_ORIGENINFO, 
				TEL4_ORIGENINFO, TEL1_TIPO, TEL2_TIPO, TEL3_TIPO, TEL4_TIPO, TEL1_FLG_MOVIL, TEL2_FLG_MOVIL, TEL3_FLG_MOVIL, TEL4_FLG_MOVIL, TEL1_MOVIL_COMPANIA, 
				TEL2_MOVIL_COMPANIA, TEL3_MOVIL_COMPANIA, TEL4_MOVIL_COMPANIA, MAIL_1, MAIL_2, MAIL_3, MAIL_4, MAIL_5, MAIL_FUENTE_1, MAIL_FUENTE_2, MAIL_FUENTE_3, 
				MAIL_FUENTE_4, MAIL_FUENTE_5, PER_FLG_ENT_LIQ_BCRA, PER_FLG_CTAS_EMBARGADAS, PER_FLG_DEUDORES_BCRA, PER_MONTO_DEUDORES_BCRA, 
				PER_DEUDATOTAL_DEUDORES_BCRA, PER_SIT_DEUDORES_BCRA, PER_FLG_INDESEABLES_AS400, PER_FLG_LISTA_NEGRA, PER_FLG_EMBARGOS, PER_FLG_CARTERA_CASTIGADA, 
				PER_FLG_GESTION_Y_MORA, PER_FLG_INDESEABLES_BANTOTAL, PER_FLG_RECHAZADOS_RIESGOS, PER_FLG_NO_ADMITIDOS, PER_FLG_REFINANCIACIONES, PER_SIT_BS_BE, 
				PER_FLG_GM_SIOC, CTE_DIAS_MORA, PP_DIAS_MORA, TCM_DIAS_MORA, HB_FLG_ADHESION, HB_FEC_CREACION, HB_ULTIM_LOGON,
				PER_RCI_INTEGRAL, PER_RCI_CREDITICIO, PER_RCI_INGRESO_PROMO, PER_FEC_ULT_ACTIVIDAD, PER_ID_RANGO_ULT_ACTIVIDAD, PER_RANGO_ULT_ACTIVIDAD,
				PER_ID_SUCURSAL, PER_TIPO_PERSONA, ID_CUENTA_CLIENTE_CRM, PER_SEGMENTOICOM, PER_SUBSEGMENTOICOM,
				SEG_FLG_BROKENBONES, SEG_FLG_ACCIDENTESPERSONALES, 	SEG_FLG_VIDA, SEG_FLG_ROBOATM, SEG_FLG_AUTO, SEG_FLG_DESEMPLEO,
				SEG_FLG_ROBOBOLSOPROTEGIDO, SEG_FLG_ROBOTECNOLOGIAPROTEGIDA, SEG_FLG_ROBOCONTENIDOPROTEGIDO, SEG_FLG_MASCOTAS, SEG_FLG_HOGAR,
				SEG_FLG_OTROS, 	SEG_FLG_HOGAR_EBOOK, SEG_CNT_TOTAL,
				COR_FLG_EMERGENCIAS,COR_FLG_GERDANA,COR_FLG_KINESIOLOGIA,COR_FLG_ODONTOLOGIA,COR_FLG_OFTALMOLOGIA,COR_FLG_MULTIASISTENCIA,COR_FLG_OTROS,
				FECHACARGA, FECHAACTUALIZACION
				)
				SELECT 
				ID_CLIENTE, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PER_ID_PAIS, PER_CUIT_CUIL, PER_RAZON_SOCIAL, PER_APELLIDO, PER_NOMBRE, PER_FECHA_NACIMIENTO, 
				PER_EDAD, PER_SEXO, PER_ESTADO_CIVIL, PER_ID_BANCA, DESC_SEGMENTO, PER_FLG_TITULAR, PER_FLG_ACTIVO, PER_FLG_EMPLEADO, PER_ANTIGUEDAD, 
				PQP_TIT_PPAL_ID_TIPO, PQP_TIT_PPAL_TIPO, DOP_PROVINCIA, DOP_LOCALIDAD, DOP_CALLE, DOP_NUMERO, DOP_DEPARTAMENTO, DOP_CODIGO_POSTAL, 
				TEL1_NUMERO_TELEFONO, TEL2_NUMERO_TELEFONO, TEL3_NUMERO_TELEFONO, TEL4_NUMERO_TELEFONO, TEL1_ORIGENINFO, TEL2_ORIGENINFO, TEL3_ORIGENINFO, 
				TEL4_ORIGENINFO, TEL1_TIPO, TEL2_TIPO, TEL3_TIPO, TEL4_TIPO, 
				isnull(TEL1_FLG_MOVIL,0) as TEL1_FLG_MOVIL, 
				isnull(TEL2_FLG_MOVIL,0) as TEL2_FLG_MOVIL, 
				isnull(TEL3_FLG_MOVIL,0) as TEL3_FLG_MOVIL, 
				isnull(TEL4_FLG_MOVIL,0) as TEL4_FLG_MOVIL, 
			    TEL1_MOVIL_COMPANIA, 
				TEL2_MOVIL_COMPANIA, TEL3_MOVIL_COMPANIA, TEL4_MOVIL_COMPANIA, MAIL_1, MAIL_2, MAIL_3, MAIL_4, MAIL_5, MAIL_FUENTE_1, MAIL_FUENTE_2, MAIL_FUENTE_3, 
				MAIL_FUENTE_4, MAIL_FUENTE_5, PER_FLG_ENT_LIQ_BCRA, PER_FLG_CTAS_EMBARGADAS, PER_FLG_DEUDORES_BCRA, PER_MONTO_DEUDORES_BCRA, 
				PER_DEUDATOTAL_DEUDORES_BCRA, PER_SIT_DEUDORES_BCRA, PER_FLG_INDESEABLES_AS400, PER_FLG_LISTA_NEGRA, PER_FLG_EMBARGOS, PER_FLG_CARTERA_CASTIGADA, 
				PER_FLG_GESTION_Y_MORA, PER_FLG_INDESEABLES_BANTOTAL, PER_FLG_RECHAZADOS_RIESGOS, PER_FLG_NO_ADMITIDOS, PER_FLG_REFINANCIACIONES, PER_SIT_BS_BE, 
				PER_FLG_GM_SIOC, CTE_DIAS_MORA, PP_DIAS_MORA, TCM_DIAS_MORA, HB_FLG_ADHESION, HB_FEC_CREACION, HB_ULTIM_LOGON,
				PER_RCI_INTEGRAL, PER_RCI_CREDITICIO, PER_RCI_INGRESO_PROMO, PER_FEC_ULT_ACTIVIDAD, PER_ID_RANGO_ULT_ACTIVIDAD, PER_RANGO_ULT_ACTIVIDAD,
				PER_ID_SUCURSAL, PER_TIPO_PERSONA, ID_CUENTA_CLIENTE_CRM, PER_SEGMENTOICOM, PER_SUBSEGMENTOICOM,
				isnull (SEG_FLG_BROKENBONES,0) SEG_FLG_BROKENBONES , 
				isnull (SEG_FLG_ACCIDENTESPERSONALES,0)SEG_FLG_ACCIDENTESPERSONALES , 
				isnull (SEG_FLG_VIDA,0) SEG_FLG_VIDA, 
				isnull (SEG_FLG_ROBOATM,0) SEG_FLG_ROBOATM, 
				isnull (SEG_FLG_AUTO,0) SEG_FLG_AUTO, 
				isnull (SEG_FLG_DESEMPLEO,0) SEG_FLG_DESEMPLEO,
				isnull (SEG_FLG_ROBOBOLSOPROTEGIDO,0) SEG_FLG_ROBOBOLSOPROTEGIDO, 
				isnull (SEG_FLG_ROBOTECNOLOGIAPROTEGIDA,0) SEG_FLG_ROBOTECNOLOGIAPROTEGIDA, 
				isnull (SEG_FLG_ROBOCONTENIDOPROTEGIDO,0) SEG_FLG_ROBOCONTENIDOPROTEGIDO, 
				isnull (SEG_FLG_MASCOTAS,0)  SEG_FLG_MASCOTAS, 
				isnull (SEG_FLG_HOGAR,0) SEG_FLG_HOGAR,
				isnull (SEG_FLG_OTROS,0) SEG_FLG_OTROS, 
				isnull (SEG_FLG_HOGAR_EBOOK,0) SEG_FLG_HOGAR_EBOOK , 
				isnull (SEG_CNT_TOTAL,0) SEG_CNT_TOTAL,	
				isnull (COR_FLG_EMERGENCIAS,0)COR_FLG_EMERGENCIAS,
				isnull (COR_FLG_GERDANA,0)COR_FLG_GERDANA,
				isnull (COR_FLG_KINESIOLOGIA,0)COR_FLG_KINESIOLOGIA,
				isnull (COR_FLG_ODONTOLOGIA,0)COR_FLG_ODONTOLOGIA,
				isnull (COR_FLG_OFTALMOLOGIA,0) COR_FLG_OFTALMOLOGIA,
				isnull (COR_FLG_MULTIASISTENCIA,0) COR_FLG_MULTIASISTENCIA,
				isnull (COR_FLG_OTROS,0)COR_FLG_OTROS,
				FECHACARGA, FECHAACTUALIZACION
				FROM #STA_DCL_PERSONA;

				PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
			END
		ELSE
			BEGIN
			PRINT 'ERROR! Proceso interrumpido.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END

		---------------------------------------------------------------------------------------  
		-- Carga final de datos duplicados a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva [Auxiliar].[CLIENTES_DUPLICADOS]';
	
		INSERT INTO [Auxiliar].[CLIENTES_DUPLICADOS]
		(per_fec_carga, per_id_pais, per_id_tipo_doc, per_nro_documento, per_cuit_cuil, per_flg_titular, per_flg_activo, per_id_banca,
		per_id_sucursal, desc_segmento, 
		per_fecha_nacimiento, per_razon_social, per_antiguedad, per_edad, pqp_tit_ppal_id_tipo, pqp_tit_ppal_tipo, per_sexo, per_estado_civil, per_tipo_persona, 
		dop_provincia, dop_localidad, dop_calle, dop_numero, dop_departamento, dop_codigo_postal, mail_1, mail_2, mail_3, mail_4, mail_5, mail_fuente_1, 
		mail_fuente_2, mail_fuente_3, mail_fuente_4, mail_fuente_5, fechaactualizacion)
		SELECT
		dp.per_fec_carga, --Fecha de carga
		dp.per_id_pais, --Pais del documento
		dp.per_id_tipo_doc, --Tipo de documento
		dp.per_nro_documento, --NÃºmero de documento
		dp.per_cuit_cuil, --NÃºmero de CUIT/CUIL
		dp.per_flg_titular, --Titular
		dp.per_flg_activo, --Activo
		ISNULL(dp.per_id_banca,0), --ID Banca
		dp.per_id_sucursal, --ID sucursal cliente
		dp.desc_segmento, --Segmento DW
		dp.per_fecha_nacimiento, --Fecha de nacimiento
		dp.per_nombre as per_razon_social, --Nombre y apellido
		ISNULL(dp.per_antiguedad,0), --AntigÃ¼edad
		dp.per_edad, --Edad
		dp.pqp_tit_ppal_id_tipo, --NÃºmero de paquete principal
		dp.pqp_tit_ppal_tipo, --DescripciÃ³n de paquete principal
		CAST(LTRIM(RTRIM(dp.per_sexo)) AS CHAR(1)) as per_sexo, --Sexo
		dp.per_estado_civil, --Estado civil
		dp.per_tipo_persona, --Tipo de persona
		mc.dop_provincia, --Provincia
		mc.dop_localidad, --Localidad
		mc.dop_calle, --Calle de domicilio
		mc.dop_numero, --Numero de domicilio
		mc.dop_departamento, --Piso/departamento
		mc.dop_codigo_postal, --Codigo postal
		LTRIM(RTRIM(me.per_mail)) as mail_1, --Email 1
		LTRIM(RTRIM(me.per_mail_2)) as mail_2, --Email 2
		LTRIM(RTRIM(me.per_mail_3)) as mail_3, --Email 3
		LTRIM(RTRIM(me.per_mail_4)) as mail_4, --Email 4
		LTRIM(RTRIM(me.per_mail_5)) as mail_5, --Email 5
		LTRIM(RTRIM(me.per_origen)) as mail_fuente_1, --Fuente de email 1
		LTRIM(RTRIM(me.per_origen_2)) as mail_fuente_2, --Fuente de email 2
		LTRIM(RTRIM(me.per_origen_3)) as mail_fuente_3, --Fuente de email 3
		LTRIM(RTRIM(me.per_origen_4)) as mail_fuente_4, --Fuente de email 4
		LTRIM(RTRIM(me.per_origen_5)) as mail_fuente_5, --Fuente de email 5
		GETDATE() as fechaactualizacion
		FROM (
			SELECT
			dp.per_fec_carga, dp.per_nro_documento, dp.per_id_tipo_doc, dp.per_id_pais, dp.per_cuit_cuil, dp.per_flg_titular, dp.per_flg_activo, dp.per_id_banca,
			dp.desc_segmento, dp.per_fecha_nacimiento, dp.per_nombre, dp.per_antiguedad, dp.per_edad, dp.pqp_tit_ppal_id_tipo, dp.pqp_tit_ppal_tipo, dp.per_sexo,
			dp.per_estado_civil, dp.per_id_sucursal, dp.per_tipo_persona
			FROM [sta].[sta_dcl_persona] dp
			INNER JOIN #clientes_dup cdp
			ON dp.per_id_pais = cdp.per_id_pais AND dp.per_id_tipo_doc = cdp.per_id_tipo_doc AND dp.per_nro_documento = cdp.per_nro_documento
		) dp
		LEFT JOIN [sta].[sta_mcl_clientes] mc
		ON dp.per_id_pais = mc.per_id_pais AND dp.per_id_tipo_doc = mc.per_id_tipo_doc AND dp.per_nro_documento = mc.per_nro_documento
		LEFT JOIN [sta].[sta_dcl_maestro_emails_bm] me
		ON dp.per_id_pais = me.per_id_pais AND dp.per_id_tipo_doc = me.per_id_tipo_doc AND dp.per_nro_documento = me.per_nro_documento
		ORDER BY dp.per_fec_carga, dp.per_id_pais, dp.per_id_tipo_doc, CAST(dp.per_nro_documento AS BIGINT);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
	
		DROP TABLE #dcl_persona_ddp;
		DROP TABLE #mcl_clientes_ddp;
		DROP TABLE #maestro_emails_tmp;
		DROP TABLE #tmp_telefonos;
		DROP TABLE #STA_DCL_PERSONA;
		DROP TABLE #flags_clientes;
		DROP TABLE #clientes_dup;
		DROP TABLE #dhb_usuarios;
		DROP TABLE #rci_jubilados;
		DROP TABLE #mcl_indicadores;
		DROP TABLE #crm_cuenta_cliente;
		DROP TABLE #dcl_segmentacion;
		DROP TABLE #SEGUROS_CLIENTES;
		DROP TABLE #CORDIAL_TENENCIAS;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END
GO
/****** Object:  StoredProcedure [DataMart].[LDR_DIM_PROSPECTOS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_DIM_PROSPECTOS] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	
	DECLARE @Fecha_hasta DATE;

	SET @Tabla_origen = 'sta_dcl_prospectos_bm';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'DIM_PROSPECTOS';
	SET @Esquema_destino = 'DataMart';
	SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8)));

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);
	
	-------------------CARGA LOG INICIO--------------  
	DECLARE @nivel SMALLINT, @Error VARCHAR(1000);

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Utilizando la fecha de filtrado: ' + CAST(@hasta AS CHAR(8));
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		ELSE BEGIN
			TRUNCATE TABLE [DataMart].[DIM_PROSPECTOS];
		END;
		
		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #tmp_prospectos
		(
			prs_cuit_cuil [varchar](12) NOT NULL,
			per_razon_social [varchar](255) NULL,
			per_nro_lote [integer] NOT NULL,
			per_proveedor_origen [varchar](32) NULL,
			per_tipo_consulta [varchar](32) NULL,
			per_fec_carga_lote [date] NULL,
			per_cch_bcra_cant_ult_12_meses [integer] NULL,
			max_moraBanco12m [integer] NOT NULL,
			flg_deudaPolCredEmpBCRA12m [tinyint] NOT NULL,
			flg_indeseables_Bantotal [tinyint] NOT NULL,
			flg_no_admitidos [tinyint] NOT NULL,
			flg_ent_liq_bcra [tinyint] NOT NULL,
			flg_incidenciaPrestamos_Bantotal [tinyint] NOT NULL,
			flg_incidenciaPrestamos_SIOC [tinyint] NOT NULL,
			flg_activo [tinyint] NOT NULL,
			per_tel_caract_1 [varchar](10) NULL,
			per_tel_nro_1 [varchar](25) NULL,
			per_tel_caract_2 [varchar](10) NULL,
			per_tel_nro_2 [varchar](25) NULL,
			per_tel_caract_3 [varchar](10) NULL,
			per_tel_nro_3 [varchar](25) NULL,
			per_tel_caract_4 [varchar](10) NULL,
			per_tel_nro_4 [varchar](25) NULL,
			per_tel_caract_5 [varchar](10) NULL,
			per_tel_nro_5 [varchar](25) NULL,
			per_tel_alt_caract_1 [varchar](10) NULL,
			per_tel_alt_nro_1 [varchar](25) NULL,
			per_tel_alt_caract_2 [varchar](10) NULL,
			per_tel_alt_nro_2 [varchar](25) NULL,
			per_tel_alt_caract_3 [varchar](10) NULL,
			per_tel_alt_nro_3 [varchar](25) NULL,
			per_tel_alt_caract_4 [varchar](10) NULL,
			per_tel_alt_nro_4 [varchar](25) NULL,
			per_tel_alt_caract_5 [varchar](10) NULL,
			per_tel_alt_nro_5 [varchar](25) NULL,
			per_tel_1_flg_no_llame [tinyint] NOT NULL,
			per_tel_2_flg_no_llame [tinyint] NOT NULL,
			per_tel_3_flg_no_llame [tinyint] NOT NULL,
			per_tel_4_flg_no_llame [tinyint] NOT NULL,
			per_tel_5_flg_no_llame [tinyint] NOT NULL,
			per_tel_alt_1_flg_no_llame [tinyint] NOT NULL,
			per_tel_alt_2_flg_no_llame [tinyint] NOT NULL,
			per_tel_alt_3_flg_no_llame [tinyint] NOT NULL,
			per_tel_alt_4_flg_no_llame [tinyint] NOT NULL,
			per_tel_alt_5_flg_no_llame [tinyint] NOT NULL,
			per_cod_act_1 [integer] NULL,
			per_inhabilitados [tinyint] NULL,
			per_fuente_jcial_dem [integer] NULL,
			per_fuente_jcial_conc_quieb [integer] NULL,
			per_fuente_jcial_ped_quieb [integer] NULL,
			per_oficio_jcial_cant_embargos [integer] NULL,
			per_oficio_jcial_cant_pend [integer] NULL,
			per_flg_jubilado [varchar](3) NULL,
			per_deudores_prev [varchar](3) NULL,
			per_fallecido [varchar](3) NULL,
			per_nosis_score [integer] NULL,
			per_nosis_calificacion [varchar](20) NULL,
			per_estado_iva [varchar](20) NULL,
			per_estado_gcias [varchar](20) NULL,
			per_cat_autonomo [varchar](100) NULL,
			per_cat_monotributo [varchar](1) NULL,
			per_cam_cod_rechazo [integer] NOT NULL,
			per_id_pais [smallint] NULL,
			per_id_tipo_doc [smallint] NULL,
			per_nro_documento [varchar](12) NULL,
			per_id_tipo_persona [smallint] NULL,
			per_tipo_persona [varchar](50) NULL,
			per_tipo_persona_crm [integer] NULL,
			per_id_suc [smallint] NULL,
			per_sucursal [varchar](100) NULL,
			Per_sucursal_crm [varchar](36) NULL,
			per_id_region_suc [smallint] NULL,
			per_region_suc [varchar](50) NULL,
			per_dom_calle_norm [varchar](100) NULL,
			per_dom_altura_norm [integer] NULL,
			per_dom_localidad_norm [varchar](100) NULL,
			per_localidad_crm [varchar](200) NULL,
			per_localidad_crm_id [varchar](200) NULL,
			per_dom_provincia_norm [varchar](100) NULL,
			per_provincia_crm_id [varchar](36) NULL,
			per_pais_crm_id [varchar](36) NULL,
			per_dom_cod_posta_norm [varchar](20) NULL,
			per_segmento [varchar](50) NULL,
			per_segmento_crm_id [varchar](36) NULL,
			per_id_cuenta_cliente_crm [varchar](36) NULL,
			per_equipo_crm [varchar](36) NULL,
			lead_id_crm [varchar](36) NULL
		);

		CREATE TABLE #flag_mora_banco
		(
			[prs_cuit_cuil] VARCHAR (12) NOT NULL,
			[pvc_mora] INTEGER NOT NULL,
			CONSTRAINT [TMP_MR_BANCO] PRIMARY KEY CLUSTERED ([prs_cuit_cuil] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_mora_banco (prs_cuit_cuil, pvc_mora)
		SELECT DISTINCT DP.per_cuit_cuil as prs_cuit_cuil, pvc_mora
		FROM [DataMart].[DIM_CLIENTES] DP
		INNER JOIN (
			SELECT per_id_tipo_doc, LTRIM(RTRIM(per_nro_documento)) as per_nro_documento, COALESCE(MAX(pvc_mora), 0) as pvc_mora
			FROM [sta].[sta_mri_prevision_prsdeu]
			WHERE cta_fec_carga = (SELECT MAX(cta_fec_carga) FROM [sta].[sta_mri_prevision_prsdeu])
			GROUP BY per_id_tipo_doc, per_nro_documento
		) PRD
		ON (DP.per_id_tipo_doc = PRD.per_id_tipo_doc AND DP.per_nro_documento = PRD.per_nro_documento)
		WHERE PRD.pvc_mora <> 0 AND LTRIM(RTRIM(DP.per_cuit_cuil)) <> '0';

		CREATE TABLE #flag_deuda_polcred
		(
			[prs_cuit_cuil] VARCHAR (12) NOT NULL,
			CONSTRAINT [TMP_DEUDA_POLCRED] PRIMARY KEY CLUSTERED ([prs_cuit_cuil] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_deuda_polcred (prs_cuit_cuil)
		SELECT DISTINCT prs_cuit_cuil
		FROM (
			SELECT per_cuit_cuil as prs_cuit_cuil,
			CASE
			WHEN situacion = 2 AND (mto_prestamos + mto_gtias_otorgadas + mto_participaciones + mtos_otros_conceptos) > 3 THEN 1
			WHEN situacion = 3 AND (mto_prestamos + mto_gtias_otorgadas + mto_participaciones + mtos_otros_conceptos) > 3 THEN 1
			WHEN situacion >= 4 THEN 1 ELSE 0 END as flg_deudaPolCredEmpBCRA12m
			FROM [sta].[sta_msg_riesgo_bcra]
		) SQ
		WHERE flg_deudaPolCredEmpBCRA12m = 1;

		CREATE TABLE #flag_indeseables
		(
			[per_nro_documento] VARCHAR (12) NOT NULL,
			CONSTRAINT [TMP_IND_BANTOTAL] PRIMARY KEY CLUSTERED ([per_nro_documento] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_indeseables (per_nro_documento)
		SELECT DISTINCT LTRIM(RTRIM(per_nro_documento))
		FROM [sta].[sta_dcl_inhab_cambios]
		WHERE per_fec_carga = @Fecha_hasta;

		CREATE TABLE #flag_no_admitidos
		(
			[per_nro_documento] VARCHAR(12) NOT NULL,
			[prs_cuit_cuil] NUMERIC(15) NOT NULL,
			CONSTRAINT [TMP_NO_ADM] PRIMARY KEY CLUSTERED ([prs_cuit_cuil], [per_nro_documento] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_no_admitidos (prs_cuit_cuil, per_nro_documento)
		SELECT DISTINCT per_cuit_cuil, per_nro_documento
		FROM [sta].[sta_dcl_no_admitidos]
		WHERE estado = 'A' AND (fec_vigencia = 99990101 OR fec_vigencia >= CAST(CONVERT(CHAR(8), GETDATE(), 112) AS INTEGER));

		CREATE TABLE #flag_inc_pre_sioc
		(
			[prs_cuit_cuil] VARCHAR(12) NOT NULL,
			CONSTRAINT [TMP_INCPRE_SIOC] PRIMARY KEY CLUSTERED ([prs_cuit_cuil] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_inc_pre_sioc (prs_cuit_cuil)
		SELECT DISTINCT DP.per_cuit_cuil as prs_cuit_cuil
		FROM [DataMart].[DIM_CLIENTES] DP
		INNER JOIN (
			SELECT per_id_pais, per_id_tipo_doc, per_nro_documento
			FROM [sta].[sta_dpp_prestamo_consumo]
			WHERE fecha_carga = @Fecha_hasta
			AND pre_linea IN ('300', '310', '320', 'WDD300', '330', 'IRSFIDE', 'IRSJUB', 'IRSPRE', 'IRSSIAP', 'IRSTCR', 'IRSTQLO',
			'IRTEJU', 'IREJUB', 'IRESIAP', 'IPXCODE')
		) PC
		ON DP.per_id_pais = PC.per_id_pais AND DP.per_id_tipo_doc = PC.per_id_tipo_doc AND DP.per_nro_documento = PC.per_nro_documento;

		CREATE TABLE #flag_inc_pre_bantotal
		(
			[prs_cuit_cuil] VARCHAR(12) NOT NULL,
			CONSTRAINT [TMP_INCPRE_BANTOTAL] PRIMARY KEY CLUSTERED ([prs_cuit_cuil] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flag_inc_pre_bantotal (prs_cuit_cuil)
		SELECT DISTINCT DP.per_cuit_cuil as prs_cuit_cuil
		FROM [DataMart].[DIM_CLIENTES] DP
		INNER JOIN (
			SELECT per_id_pais, per_id_tipo_doc, per_nro_documento
			FROM [sta].[sta_dpp_prestamo]
			WHERE cta_fec_carga = @Fecha_hasta
			AND ope_id_modulo IN (33, 34, 106)
			OR (ope_id_modulo = 103 AND ope_id_tipo_operacion IN(71, 72, 171, 172))
			OR (ope_id_modulo = 30 AND ope_id_tipo_operacion IN(171, 172))
		) PC
		ON DP.per_id_pais = PC.per_id_pais AND DP.per_id_tipo_doc = PC.per_id_tipo_doc AND DP.per_nro_documento = PC.per_nro_documento;

		CREATE TABLE #entidades_liquidadas ([prs_cuit_cuil] VARCHAR(12) NOT NULL);
			
		INSERT INTO #entidades_liquidadas (prs_cuit_cuil)
		SELECT DISTINCT CLI.PER_CUIT_CUIL as prs_cuit_cuil
		FROM [sta].[sta_msg_ent_liq_bcra] LB
		INNER JOIN [DataMart].[DIM_CLIENTES] CLI
		ON LB.per_id_pais = CLI.PER_ID_PAIS AND LB.per_id_tipo_doc = CLI.PER_ID_TIPO_DOC AND LB.per_nro_documento = CLI.PER_NRO_DOCUMENTO;

		CREATE TABLE #flg_activo
		(
			[prs_cuit_cuil] VARCHAR(12) NOT NULL,
			CONSTRAINT [TMP_ACTIVO] PRIMARY KEY CLUSTERED ([prs_cuit_cuil] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		INSERT INTO #flg_activo (prs_cuit_cuil)
		SELECT DISTINCT DP.per_cuit_cuil as prs_cuit_cuil
		FROM [DataMart].[DIM_CLIENTES] DP
		INNER JOIN [sta].[sta_dcl_prospectos_bm] PR
		ON DP.per_cuit_cuil = PR.per_cuit_cuil
		WHERE DP.PER_FLG_ACTIVO = 1;

		CREATE TABLE #persona_crm
		(
			[valor_atributo] INTEGER NULL,
			[valor] NVARCHAR(4000) NULL
		);

		INSERT INTO #persona_crm (valor, valor_atributo)
		SELECT valor, valor_atributo
		FROM [sta].[sta_crm_in_atributo]
		WHERE tipo_codigo_objeto = 1 AND lang_id = 3082 AND nombre_atributo = 'bsv_tipopersona';

		CREATE TABLE #localidades
		(
			[cod_localidad] NVARCHAR(100) NULL,
			[localidades_id] VARCHAR(36) NOT NULL,
			[provincia_id] VARCHAR(36) NULL,
			[pais_crm_id] VARCHAR(36) NULL
		);

		INSERT INTO #localidades (cod_localidad, localidades_id, provincia_id, pais_crm_id)
		SELECT cod_localidad, localidades_id, provincia_id, pais_crm_id
		FROM [sta].[sta_crm_in_localidad]
		WHERE cod_state = 0 AND cod_status = 1;

		CREATE TABLE #sucursal_crm
		(
			[cod_sucursal_cs] [integer] NULL,
			[unidad_negocio_id] [varchar](36) NOT NULL
		);

		INSERT INTO #sucursal_crm (cod_sucursal_cs, unidad_negocio_id)
		SELECT CAST(cod_sucursal_cs AS INTEGER) as cod_sucursal_cs, unidad_negocio_id
		FROM [sta].[sta_crm_unidad_negocio]
		WHERE flg_deshabilitado = 0;

		CREATE TABLE #equipo_crm
		(
			[cod_sucursal_cs] [integer] NOT NULL,
			[equipoId] [varchar](36) NOT NULL
		);

		INSERT INTO #equipo_crm (cod_sucursal_cs, equipoId)
		SELECT DISTINCT SUC.cod_sucursal_cs, EQ.equipoId
		FROM #sucursal_crm SUC
		INNER JOIN [sta].[sta_crm_in_equipo] EQ ON (SUC.unidad_negocio_id = EQ.uni_negocio_id)
		WHERE SUC.cod_sucursal_cs IS NOT NULL;

		CREATE TABLE #flg_cliente_crm
		(
			[prs_cuit_cuil] [varchar](12) NOT NULL,
			[per_nro_lote] [integer] NOT NULL,
			[id_cuenta_cliente_crm] [varchar](36) NOT NULL
		);

		INSERT INTO #flg_cliente_crm (prs_cuit_cuil, per_nro_lote, id_cuenta_cliente_crm)
		SELECT DISTINCT DP.per_cuit_cuil as prs_cuit_cuil, PR.per_nro_lote, DP.id_cuenta_cliente_crm
		FROM [DataMart].[DIM_CLIENTES] DP
		INNER JOIN [sta].[sta_dcl_prospectos_bm] PR
		ON DP.per_cuit_cuil = PR.per_cuit_cuil
		WHERE DP.id_cuenta_cliente_crm IS NOT NULL;

		CREATE TABLE #segmento_crm
		(
			[prs_cuit_cuil] [varchar](12) NOT NULL,
			[per_nro_lote] [integer] NOT NULL,
			[per_segmento] [varchar](50) NULL,
			[per_segmento_crm_id] [varchar](36) NULL
		);

		INSERT INTO #segmento_crm (prs_cuit_cuil, per_nro_lote, per_segmento, per_segmento_crm_id)
		SELECT SQ.per_cuit_cuil, SQ.per_nro_lote, SQ.segmento, SG.segmento_crm_id
		FROM (
			SELECT PB.per_cuit_cuil, PB.per_nro_lote,
			CASE
			WHEN SC.segmento IS NULL AND PB.per_tipo_persona = 'JURIDICA' THEN 'E&P PJ'
			WHEN PB.per_tipo_persona = 'FISICA' AND PB.per_cat_autonomo IS NULL THEN 'Renta Masiva'
			WHEN PB.per_tipo_persona = 'FISICA' AND PB.per_cat_autonomo IS NOT NULL THEN 'E&P PF'
			ELSE SC.segmento END as segmento
			FROM [sta].[sta_dcl_prospectos_bm] PB
			LEFT JOIN [sta].[sta_segmento_calif] SC ON (PB.per_nivel_socio_economico = SC.per_nivel_socio_economico)
		) SQ
		LEFT JOIN (
			SELECT segmento_crm_id, desc_segmento as segmento
			FROM [sta].[sta_crm_in_segmento]
			WHERE cod_state = 0 AND cod_status = 1
		) SG
		ON (SQ.segmento = SG.segmento);

		CREATE TABLE #lead_crm
		(
			[per_nro_documento] [varchar](20) NULL,
			[per_id_pais] [smallint] NULL,
			[per_id_tipo_doc] [smallint] NULL,
			[lead_id] [varchar](50) NOT NULL
		);

		INSERT INTO #lead_crm (per_id_tipo_doc, per_nro_documento, per_id_pais, lead_id) 
		SELECT LD.per_id_tipo_doc, LD.per_nro_documento, CONVERT(SMALLINT, PA.pais_id) as per_id_pais, LD.lead_id
		FROM [sta].[sta_crm_in_lead] LD
		INNER JOIN [sta].[sta_crm_in_pais] PA ON (LD.per_id_pais = PA.pais_crm_id);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;
				
		INSERT INTO #tmp_prospectos
		(PRS_CUIT_CUIL, PER_RAZON_SOCIAL, PER_NRO_LOTE, PER_PROVEEDOR_ORIGEN, PER_TIPO_CONSULTA, PER_FEC_CARGA_LOTE, PER_CCH_BCRA_CANT_ULT_12_MESES, 
		MAX_MORABANCO12M, FLG_DEUDAPOLCREDEMPBCRA12M, FLG_INDESEABLES_BANTOTAL, FLG_NO_ADMITIDOS, FLG_ENT_LIQ_BCRA, FLG_INCIDENCIAPRESTAMOS_BANTOTAL, 
		FLG_INCIDENCIAPRESTAMOS_SIOC, FLG_ACTIVO,
		PER_TEL_CARACT_1, PER_TEL_NRO_1, PER_TEL_CARACT_2, PER_TEL_NRO_2, PER_TEL_CARACT_3, PER_TEL_NRO_3, 
		PER_TEL_CARACT_4, PER_TEL_NRO_4, PER_TEL_CARACT_5, PER_TEL_NRO_5,
		PER_TEL_ALT_CARACT_1, PER_TEL_ALT_NRO_1, PER_TEL_ALT_CARACT_2, PER_TEL_ALT_NRO_2, 
		PER_TEL_ALT_CARACT_3, PER_TEL_ALT_NRO_3, PER_TEL_ALT_CARACT_4, PER_TEL_ALT_NRO_4,
		PER_TEL_ALT_CARACT_5, PER_TEL_ALT_NRO_5, PER_TEL_1_FLG_NO_LLAME, 
		PER_TEL_2_FLG_NO_LLAME, PER_TEL_3_FLG_NO_LLAME, PER_TEL_4_FLG_NO_LLAME, PER_TEL_5_FLG_NO_LLAME, PER_TEL_ALT_1_FLG_NO_LLAME, 
		PER_TEL_ALT_2_FLG_NO_LLAME, PER_TEL_ALT_3_FLG_NO_LLAME, PER_TEL_ALT_4_FLG_NO_LLAME, PER_TEL_ALT_5_FLG_NO_LLAME, PER_COD_ACT_1, PER_INHABILITADOS, 
		PER_FUENTE_JCIAL_DEM, PER_FUENTE_JCIAL_CONC_QUIEB, PER_FUENTE_JCIAL_PED_QUIEB, PER_OFICIO_JCIAL_CANT_EMBARGOS, PER_OFICIO_JCIAL_CANT_PEND, 
		PER_FLG_JUBILADO, PER_DEUDORES_PREV, PER_FALLECIDO, PER_NOSIS_SCORE, PER_NOSIS_CALIFICACION, PER_ESTADO_IVA, PER_ESTADO_GCIAS, PER_CAT_AUTONOMO, 
		PER_CAT_MONOTRIBUTO, PER_CAM_COD_RECHAZO, PER_ID_PAIS, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PER_ID_TIPO_PERSONA, PER_TIPO_PERSONA, 
		PER_TIPO_PERSONA_CRM, PER_ID_SUC, PER_SUCURSAL, PER_SUCURSAL_CRM, PER_ID_REGION_SUC, PER_REGION_SUC, PER_DOM_CALLE_NORM, PER_DOM_ALTURA_NORM, 
		PER_DOM_LOCALIDAD_NORM, PER_LOCALIDAD_CRM, PER_LOCALIDAD_CRM_ID, PER_DOM_PROVINCIA_NORM, PER_PROVINCIA_CRM_ID, PER_PAIS_CRM_ID, 
		PER_DOM_COD_POSTA_NORM, PER_SEGMENTO, PER_SEGMENTO_CRM_ID, PER_ID_CUENTA_CLIENTE_CRM, PER_EQUIPO_CRM, LEAD_ID_CRM)
		SELECT DISTINCT
		PP.per_cuit_cuil as prs_cuit_cuil,
		PP.per_razon_social,
		PP.per_nro_lote,
		PP.per_proveedor_origen,
		PP.per_tipo_consulta,
		PP.per_fec_carga_lote,
		PP.per_cch_bcra_cant_ult_12_meses,
		COALESCE(MB.pvc_mora, 0) as max_moraBanco12m,
		CASE WHEN PL.prs_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flg_deudaPolCredEmpBCRA12m,
		CASE WHEN FI.per_nro_documento IS NOT NULL THEN 1 ELSE 0 END as flg_indeseables_Bantotal,
		CASE WHEN NACC.prs_cuit_cuil IS NOT NULL THEN 1 WHEN NADC.per_nro_documento IS NOT NULL THEN 1 ELSE 0 END as flg_no_admitidos,
		CASE WHEN EL.prs_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flg_ent_liq_bcra,
		CASE WHEN FPB.prs_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flg_incidenciaPrestamos_Bantotal,
		CASE WHEN FPS.prs_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flg_incidenciaPrestamos_SIOC,
		CASE WHEN FA.prs_cuit_cuil IS NOT NULL THEN 1 ELSE 0 END as flg_activo,
		PP.per_tel_caract_1,
		PP.per_tel_nro_1,
		PP.per_tel_caract_2,
		PP.per_tel_nro_2,
		PP.per_tel_caract_3,
		PP.per_tel_nro_3,
		PP.per_tel_caract_4,
		PP.per_tel_nro_4,
		PP.per_tel_caract_5,
		PP.per_tel_nro_5,
		PP.per_tel_alt_caract_1,
		PP.per_tel_alt_nro_1,
		PP.per_tel_alt_caract_2,
		PP.per_tel_alt_nro_2,
		PP.per_tel_alt_caract_3,
		PP.per_tel_alt_nro_3,
		PP.per_tel_alt_caract_4,
		PP.per_tel_alt_nro_4,
		PP.per_tel_alt_caract_5,
		PP.per_tel_alt_nro_5,
		PP.per_tel_1_flg_no_llame,
		PP.per_tel_2_flg_no_llame,
		PP.per_tel_3_flg_no_llame,
		PP.per_tel_4_flg_no_llame,
		PP.per_tel_5_flg_no_llame,
		PP.per_tel_alt_1_flg_no_llame,
		PP.per_tel_alt_2_flg_no_llame,
		PP.per_tel_alt_3_flg_no_llame,
		PP.per_tel_alt_4_flg_no_llame,
		PP.per_tel_alt_5_flg_no_llame,
		PP.per_cod_act_1,
		PP.per_inhabilitados,
		PP.per_fuente_jcial_dem,
		PP.per_fuente_jcial_conc_quieb,
		PP.per_fuente_jcial_ped_quieb,
		PP.per_oficio_jcial_cant_embargos,
		PP.per_oficio_jcial_cant_pend,
		PP.per_flg_jubilado,
		PP.per_deudores_prev,
		PP.per_fallecido,
		PP.per_nosis_score,
		PP.per_nosis_calif as per_nosis_calificacion,
		PP.per_estado_iva,
		PP.per_estado_gcias,
		PP.per_cat_autonomo,
		PP.per_cat_monotributo,
		PP.per_cam_cod_rechazo,
		PP.per_id_pais,
		PP.per_id_tipo_doc,
		PP.per_nro_documento,
		PP.per_id_tipo_persona,
		PP.per_tipo_persona,
		PC.valor_atributo as per_tipo_persona_crm,
		PP.per_id_sucursal,
		PP.per_sucursal,
		SC.unidad_negocio_id as per_sucursal_crm,
		PP.per_id_region  as per_id_region_suc,
		PP.per_region as per_region_suc,
		PP.per_dom_calle_norm,
		PP.per_dom_altura_norm,
		PP.per_dom_localidad_norm,
		PP.per_localidad_crm,
		LOC.localidades_id as per_localidad_id_crm,
		PP.per_dom_provincia_norm,
		LOC.provincia_id as per_provincia_crm_id,
		LOC.pais_crm_id as per_pais_crm_id,
		PP.per_dom_cod_postal_norm,
		SG.per_segmento,
		SG.per_segmento_crm_id,
		CLI.id_cuenta_cliente_crm,
		EQ.equipoId as per_equipo_crm,
		LD.lead_id as lead_id_crm
		FROM [sta].[sta_dcl_prospectos_bm] PP
		LEFT JOIN #flag_mora_banco MB ON (PP.per_cuit_cuil = MB.prs_cuit_cuil)
		LEFT JOIN #flag_deuda_polcred PL ON (PP.per_cuit_cuil = PL.prs_cuit_cuil)
		LEFT JOIN #flag_indeseables FI ON (PP.per_cuit_cuil = FI.per_nro_documento)
		LEFT JOIN #flag_no_admitidos NACC ON (PP.per_cuit_cuil = NACC.prs_cuit_cuil)
		LEFT JOIN #flag_no_admitidos NADC ON (PP.per_nro_documento = NADC.per_nro_documento)
		LEFT JOIN #flag_inc_pre_sioc FPS ON (PP.per_cuit_cuil = FPS.prs_cuit_cuil)
		LEFT JOIN #flag_inc_pre_bantotal FPB ON (PP.per_cuit_cuil = FPB.prs_cuit_cuil)
		LEFT JOIN #flg_activo FA ON (PP.per_cuit_cuil = FA.prs_cuit_cuil)
		LEFT JOIN #persona_crm PC ON (PP.per_tipo_persona = PC.valor)
		LEFT JOIN #sucursal_crm SC ON (PP.per_id_sucursal = SC.cod_sucursal_cs)
		LEFT JOIN #localidades LOC ON (PP.per_localidad_id_crm = LOC.cod_localidad)
		LEFT JOIN #flg_cliente_crm CLI ON (PP.per_cuit_cuil = CLI.prs_cuit_cuil AND PP.per_nro_lote = CLI.per_nro_lote)
		LEFT JOIN #segmento_crm SG ON (PP.per_cuit_cuil = SG.prs_cuit_cuil AND PP.per_nro_lote = SG.per_nro_lote)
		LEFT JOIN #equipo_crm EQ ON (PP.per_id_sucursal = EQ.cod_sucursal_cs)
		LEFT JOIN #entidades_liquidadas EL ON (PP.per_cuit_cuil = EL.prs_cuit_cuil)
		LEFT JOIN #lead_crm LD ON (PP.per_id_tipo_doc = LD.per_id_tipo_doc AND PP.per_nro_documento = LD.per_nro_documento AND PP.per_id_pais = LD.per_id_pais);
	
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;
	
		INSERT INTO [DataMart].[DIM_PROSPECTOS]
		(PRS_CUIT_CUIL, PER_RAZON_SOCIAL, PER_NRO_LOTE, PER_PROVEEDOR_ORIGEN, PER_TIPO_CONSULTA, PER_FEC_CARGA_LOTE, PER_CCH_BCRA_CANT_ULT_12_MESES, 
		MAX_MORABANCO12M, FLG_DEUDAPOLCREDEMPBCRA12M, FLG_INDESEABLES_BANTOTAL, FLG_NO_ADMITIDOS, FLG_ENT_LIQ_BCRA, FLG_INCIDENCIAPRESTAMOS_BANTOTAL, 
		FLG_INCIDENCIAPRESTAMOS_SIOC, FLG_ACTIVO, PER_TEL_CARACT_1, PER_TEL_NRO_1, PER_TEL_CARACT_2, PER_TEL_NRO_2, PER_TEL_CARACT_3, PER_TEL_NRO_3, 
		PER_TEL_CARACT_4, PER_TEL_NRO_4, PER_TEL_CARACT_5, PER_TEL_NRO_5, PER_TEL_ALT_CARACT_1, PER_TEL_ALT_NRO_1, PER_TEL_ALT_CARACT_2, PER_TEL_ALT_NRO_2, 
		PER_TEL_ALT_CARACT_3, PER_TEL_ALT_NRO_3, PER_TEL_ALT_CARACT_4, PER_TEL_ALT_NRO_4, PER_TEL_ALT_CARACT_5, PER_TEL_ALT_NRO_5, PER_TEL_1_FLG_NO_LLAME, 
		PER_TEL_2_FLG_NO_LLAME, PER_TEL_3_FLG_NO_LLAME, PER_TEL_4_FLG_NO_LLAME, PER_TEL_5_FLG_NO_LLAME, PER_TEL_ALT_1_FLG_NO_LLAME, 
		PER_TEL_ALT_2_FLG_NO_LLAME, PER_TEL_ALT_3_FLG_NO_LLAME, PER_TEL_ALT_4_FLG_NO_LLAME, PER_TEL_ALT_5_FLG_NO_LLAME, PER_COD_ACT_1, PER_INHABILITADOS, 
		PER_FUENTE_JCIAL_DEM, PER_FUENTE_JCIAL_CONC_QUIEB, PER_FUENTE_JCIAL_PED_QUIEB, PER_OFICIO_JCIAL_CANT_EMBARGOS, PER_OFICIO_JCIAL_CANT_PEND, 
		PER_FLG_JUBILADO, PER_DEUDORES_PREV, PER_FALLECIDO, PER_NOSIS_SCORE, PER_NOSIS_CALIFICACION, PER_ESTADO_IVA, PER_ESTADO_GCIAS, PER_CAT_AUTONOMO, 
		PER_CAT_MONOTRIBUTO, PER_CAM_COD_RECHAZO, PER_ID_PAIS, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PER_ID_TIPO_PERSONA, PER_TIPO_PERSONA, 
		PER_TIPO_PERSONA_CRM, PER_ID_SUC, PER_SUCURSAL, PER_SUCURSAL_CRM, PER_ID_REGION_SUC, PER_REGION_SUC, PER_DOM_CALLE_NORM, PER_DOM_ALTURA_NORM, 
		PER_DOM_LOCALIDAD_NORM, PER_LOCALIDAD_CRM, PER_LOCALIDAD_CRM_ID, PER_DOM_PROVINCIA_NORM, PER_PROVINCIA_CRM_ID, PER_PAIS_CRM_ID, 
		PER_DOM_COD_POSTA_NORM, PER_SEGMENTO, PER_SEGMENTO_CRM_ID, PER_ID_CUENTA_CLIENTE_CRM, PER_EQUIPO_CRM, LEAD_ID_CRM, FECHACARGA, FECHAACTUALIZACION)
		SELECT
		PRS_CUIT_CUIL, PER_RAZON_SOCIAL, PER_NRO_LOTE, PER_PROVEEDOR_ORIGEN, PER_TIPO_CONSULTA, PER_FEC_CARGA_LOTE, PER_CCH_BCRA_CANT_ULT_12_MESES, 
		MAX_MORABANCO12M, FLG_DEUDAPOLCREDEMPBCRA12M, FLG_INDESEABLES_BANTOTAL, FLG_NO_ADMITIDOS, FLG_ENT_LIQ_BCRA, FLG_INCIDENCIAPRESTAMOS_BANTOTAL, 
		FLG_INCIDENCIAPRESTAMOS_SIOC, FLG_ACTIVO, PER_TEL_CARACT_1, PER_TEL_NRO_1, PER_TEL_CARACT_2, PER_TEL_NRO_2, PER_TEL_CARACT_3, PER_TEL_NRO_3, 
		PER_TEL_CARACT_4, PER_TEL_NRO_4, PER_TEL_CARACT_5, PER_TEL_NRO_5, PER_TEL_ALT_CARACT_1, PER_TEL_ALT_NRO_1, PER_TEL_ALT_CARACT_2, PER_TEL_ALT_NRO_2, 
		PER_TEL_ALT_CARACT_3, PER_TEL_ALT_NRO_3, PER_TEL_ALT_CARACT_4, PER_TEL_ALT_NRO_4, PER_TEL_ALT_CARACT_5, PER_TEL_ALT_NRO_5, PER_TEL_1_FLG_NO_LLAME, 
		PER_TEL_2_FLG_NO_LLAME, PER_TEL_3_FLG_NO_LLAME, PER_TEL_4_FLG_NO_LLAME, PER_TEL_5_FLG_NO_LLAME, PER_TEL_ALT_1_FLG_NO_LLAME, 
		PER_TEL_ALT_2_FLG_NO_LLAME, PER_TEL_ALT_3_FLG_NO_LLAME, PER_TEL_ALT_4_FLG_NO_LLAME, PER_TEL_ALT_5_FLG_NO_LLAME, PER_COD_ACT_1, PER_INHABILITADOS, 
		PER_FUENTE_JCIAL_DEM, PER_FUENTE_JCIAL_CONC_QUIEB, PER_FUENTE_JCIAL_PED_QUIEB, PER_OFICIO_JCIAL_CANT_EMBARGOS, PER_OFICIO_JCIAL_CANT_PEND, 
		PER_FLG_JUBILADO, PER_DEUDORES_PREV, PER_FALLECIDO, PER_NOSIS_SCORE, PER_NOSIS_CALIFICACION, PER_ESTADO_IVA, PER_ESTADO_GCIAS, PER_CAT_AUTONOMO, 
		PER_CAT_MONOTRIBUTO, PER_CAM_COD_RECHAZO, PER_ID_PAIS, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PER_ID_TIPO_PERSONA, PER_TIPO_PERSONA, 
		PER_TIPO_PERSONA_CRM, PER_ID_SUC, PER_SUCURSAL, PER_SUCURSAL_CRM, PER_ID_REGION_SUC, PER_REGION_SUC, PER_DOM_CALLE_NORM, PER_DOM_ALTURA_NORM, 
		PER_DOM_LOCALIDAD_NORM, PER_LOCALIDAD_CRM, PER_LOCALIDAD_CRM_ID, PER_DOM_PROVINCIA_NORM, PER_PROVINCIA_CRM_ID, PER_PAIS_CRM_ID, 
		PER_DOM_COD_POSTA_NORM, PER_SEGMENTO, PER_SEGMENTO_CRM_ID, PER_ID_CUENTA_CLIENTE_CRM, PER_EQUIPO_CRM, LEAD_ID_CRM,
		GETDATE() AS FECHACARGA, GETDATE() AS FECHAACTUALIZACION
		FROM #tmp_prospectos;

		DROP TABLE #tmp_prospectos;
		DROP TABLE #flag_mora_banco;
		DROP TABLE #flag_deuda_polcred;
		DROP TABLE #flag_indeseables;
		DROP TABLE #flag_no_admitidos;
		DROP TABLE #flag_inc_pre_sioc;
		DROP TABLE #flag_inc_pre_bantotal;
		DROP TABLE #entidades_liquidadas;
		DROP TABLE #flg_activo;
		DROP TABLE #persona_crm;
		DROP TABLE #localidades;
		DROP TABLE #sucursal_crm;
		DROP TABLE #equipo_crm;
		DROP TABLE #flg_cliente_crm;
		DROP TABLE #segmento_crm;
		DROP TABLE #lead_crm;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_DIM_REFERIDOS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_DIM_REFERIDOS] AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	
	--DECLARE @Fecha_hasta DATE;
	
	SET @Tabla_origen = 'sta_api_campaign_referidos';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'DIM_REFERIDOS';
	SET @Esquema_destino = 'DataMart';
	--SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8))); --VER VALORES DE LOS PARAMETROS
	
	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);
	
	-------------------CARGA LOG INICIO--------------  
	DECLARE @nivel SMALLINT, @Error VARCHAR(1000);

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de Novedades API Referidos: ' + @Destino + '.';
		---------------------------------------------------------------------------------------  
		-- Novedades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACantNov INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @v_query NVARCHAR(256);
		DECLARE @v_fec_ult_proceso DATETIME;
		DECLARE @v_fec_proceso DATETIME;
		DECLARE @v_cant_delete INT;

		--SET @Novedades = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen + ' WHERE fec_creacion_origen >= (select	max (fec_creacion_origen) from --DataMart.DIM_REFERIDOS where isnull(flg_notificacion_autogestion,' + '''N''' ') = ' + '''N''' + ')';
		SET @v_query = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen + ' WHERE fec_proceso_campania IS NULL';
		EXECUTE sp_executesql @v_query, N'@Cantidad int output', @Cantidad = @STACantNov OUTPUT;
		
		SET @v_fec_ult_proceso = ISNULL((SELECT MAX(fec_proceso_campania) FROM sta.sta_api_campaign_referidos WHERE fec_proceso_campania IS NOT NULL),DATEADD(DAY, -60, GETDATE()));
		SET @v_fec_proceso = getdate();

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACantNov = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' sin novedades para procesar.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		
		INSERT INTO DataMart.DIM_REFERIDOS
		(ID_REFERIDO,COD_REFERIDO,COD_PERSONA, PER_ID_TIPO_DOC,PER_NRO_DOCUMENTO,PER_ID_PAIS,PER_CUIT_CUIL,PER_APELLIDO,PER_NOMBRE,PER_SEXO,MAIL,TEL_NUMERO_TELEFONO,COD_PERSONA_REFERENTE,PER_ID_TIPO_DOC_REFERENTE,PER_NRO_DOCUMENTO_REFERENTE,PER_ID_PAIS_REFERENTE,PER_APELLIDO_REFERENTE,PER_NOMBRE_REFERENTE,FEC_CREACION_ORIGEN,FEC_ENVIO_CAMPANIA,FLG_NOTIFICACION_AUTOGESTION,FECHACARGA,FECHAACTUALIZACION)
		SELECT	CONVERT(VARCHAR(18),((REPLICATE('0',3-LEN(LTRIM(RTRIM(CONVERT(CHAR,cod_pais)))))+LTRIM(RTRIM(CONVERT(CHAR,cod_pais))))+(REPLICATE('0',3-LEN(        LTRIM(RTRIM(CONVERT(CHAR,cod_tipo_doc)))))+LTRIM(RTRIM(CONVERT(CHAR,cod_tipo_doc))))+(REPLICATE('0',12-LEN(LTRIM(RTRIM(nro_documento))))+LTRIM        (RTRIM(nro_documento)))))id_referido,
				id_referido cod_referidos,
				id_persona cod_persona,
				cod_tipo_doc,
				nro_documento,
				cod_pais,
				cuil,
				apellido,
				nombre,
				genero,
				email,
				telefono,
				id_persona_referente cod_persona_referente,
				cod_tipo_doc_referente,
				nro_documento_referente,
				cod_pais_referente,
				apellido_referente,
				nombre_referente,
				fec_creacion_origen,
				null fec_envio_campania,
				'N' flg_notificacion_autogestion,
				fec_creacion,
				--fec_proceso_campania,
				getdate() fechaactualizacion
		FROM	sta.sta_api_campaign_referidos
		WHERE	0=0
		AND		fec_creacion_origen BETWEEN @v_fec_ult_proceso AND @v_fec_proceso
		AND		fec_proceso_campania IS NULL
		;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'PROCESO DE CARGA DIM_REFERIDOS'
		PRINT 'Se procesaro/n: ' + CONVERT(VARCHAR, @STACantNov) + ' nueva/s novedad/es para enviar notificacion/es';
		PRINT '--------------------------------------------------------------------------------------------';
		
		--UPDATE a la STA REFERIDOS indicando que registros fueron llevados al DM
		UPDATE 	sta.sta_api_campaign_referidos
		SET		fec_proceso_campania = @v_fec_proceso
		WHERE	0=0
		AND		fec_proceso_campania IS NULL
		AND		fec_creacion_origen BETWEEN @v_fec_ult_proceso AND @v_fec_proceso;
		
		--DELETE en la STA REFERIDOS de los dias superiores a 7 al proceso del dia corriente
		DELETE	sta.sta_api_campaign_referidos
		WHERE 	0=0
		AND		fec_creacion_origen <= DATEADD(DAY, -7, @v_fec_proceso);

		SET @v_cant_delete = @@rowcount;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'PROCESO DE DEPURACION STAGE'
		PRINT 'Se depuraron: ' + CONVERT(VARCHAR,@v_cant_delete) + ' registros en la tabla stage';
		PRINT '--------------------------------------------------------------------------------------------';
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DE PROCESO - Carga de Novedades API Referidos'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END
GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_BANELCO]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_BANELCO] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	DECLARE @Fecha_hasta DATE;

	SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8)));
	SET @Tabla_origen = 'sta_dtd_banelco';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'FCT_BANELCO';
	SET @Esquema_destino = 'DataMart';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @FecIni DATETIME, @FecFin DATETIME, @nivel SMALLINT, @Error VARCHAR(1000);
	SELECT @FecIni = GETDATE(), @nivel = 3;

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			SET @FecFin = GETDATE();
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			EXEC(@Truncar);
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #mtd_trans_electron
		(
			[txe_nro_tarjeta] VARCHAR(20) NOT NULL PRIMARY KEY,
			[txe_fecha_mov] DATE NOT NULL,
			[txe_meses_ult_compra] INTEGER NOT NULL
		);

		CREATE TABLE #mtd_trans_banelco
		(
			[txb_numero_tarjeta] VARCHAR(20) NOT NULL PRIMARY KEY,
			[txb_fecha_ult_trans] DATE NOT NULL,
			[txb_meses_ult_extraccion] INTEGER NOT NULL
		);

		CREATE TABLE #estado_delivery
		(
			[ban_numero_tarjeta] VARCHAR(20) NOT NULL PRIMARY KEY,
			[estado_final] VARCHAR (100) NULL,
			[fecha_estado] DATE NULL,
			[sucursal_delivery] SMALLINT NULL,
		);

		CREATE TABLE #tarjeta_ultimo_uso
		(
			[nro_tarjeta] VARCHAR(20) NOT NULL PRIMARY KEY,
			[tar_fec_ult_uso] DATE NULL
		)

		CREATE TABLE #dtd_banelco
		(
			[id_cliente] VARCHAR(18) NOT NULL,
			[cta_id_empresa] TINYINT NOT NULL,
			[cta_numero] INTEGER NOT NULL,
			[ope_id_modulo] SMALLINT NOT NULL,
			[ope_id_moneda] SMALLINT NOT NULL,
			[ope_id_papel] SMALLINT NOT NULL,
			[ope_id_sucursal] SMALLINT NOT NULL,
			[ope_operacion] INTEGER NOT NULL,
			[ope_sub_operacion] INTEGER NOT NULL,
			[ope_id_tipo_operacion] SMALLINT NOT NULL,
			[ban_numero_tarjeta] VARCHAR(20) NOT NULL,
			[ope_id_sucursal_asociada] SMALLINT NULL,
			[ban_id_estado] TINYINT NOT NULL,
			[ban_estado] VARCHAR (50) NULL,
			[ban_fecha_alta] DATE NULL,
			[ban_fecha_estado_delivery] DATE NULL,
			[ban_estado_delivery] VARCHAR(100) NULL,
			[ban_fecha_venci] DATE NULL,
			[ban_meses_ult_extraccion] INTEGER NULL,
			[ban_fecha_ult_extraccion] DATE NULL,
			[ban_meses_ult_compra] INTEGER NULL,
			[ban_fecha_ult_compra] DATE NULL,
			[tar_fec_ult_uso] DATE NULL,
			[id_sucursal_delivery] SMALLINT NULL,
			[fechacarga] DATE NOT NULL,
			[fechaactualizacion] DATETIME NOT NULL,
			CONSTRAINT [TMP_DTD_BANELCO] PRIMARY KEY CLUSTERED
			([cta_id_empresa], [cta_numero], [ope_id_modulo], [ope_id_moneda], [ope_id_papel], [ope_operacion],
			[ope_sub_operacion], [ope_id_tipo_operacion])
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		CREATE NONCLUSTERED INDEX [IDX_TMP_NUMERO_TARJETA] ON #dtd_banelco
		([ban_numero_tarjeta] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;

		--Transacciones de compra en los ultimos 24 meses
		INSERT INTO #mtd_trans_electron (txe_nro_tarjeta, txe_fecha_mov, txe_meses_ult_compra)
		SELECT txe_nro_tarjeta, txe_fecha_mov, DATEDIFF(MONTH, txe_fecha_mov, GETDATE()) as txe_meses_ult_compra
		FROM (
			SELECT txe_nro_tarjeta, MAX(txe_fecha_mov) as txe_fecha_mov
			FROM [sta].[sta_mtd_trans_electron]
			WHERE cta_fec_carga = @Fecha_hasta
			GROUP BY txe_nro_tarjeta
		) SQ;

		--Transacciones de debito en los ultimos 24 meses
		INSERT INTO #mtd_trans_banelco (txb_numero_tarjeta, txb_fecha_ult_trans, txb_meses_ult_extraccion)
		SELECT txb_numero_tarjeta, txb_fecha_ult_trans, DATEDIFF(MONTH, txb_fecha_ult_trans, GETDATE()) as txb_meses_ult_extraccion
		FROM (
			SELECT txb_numero_tarjeta, MAX(txb_fecha_ult_trans) as txb_fecha_ult_trans
			FROM [sta].[sta_mtd_trans_banelco]
			WHERE txb_extracc_pes_cantidad > 0
			AND cta_fec_carga = @Fecha_hasta
			GROUP BY txb_numero_tarjeta
		) SQ;

		--Estado y fecha de entrega de la tarjeta de debito
		INSERT INTO #estado_delivery (ban_numero_tarjeta, estado_final, fecha_estado, sucursal_delivery)
		SELECT ban_numero_tarjeta, estado_final, fecha_estado, sucursal_delivery
		FROM [sta].[sta_dcl_estado_plasticos_bm]
		WHERE ban_numero_tarjeta IS NOT NULL AND per_fec_carga = @Fecha_hasta;

		--Ultima fecha de uso de la tarjeta de debito
		INSERT INTO #tarjeta_ultimo_uso (nro_tarjeta, tar_fec_ult_uso)
		SELECT nro_tarjeta, max(tar_fec_ult_uso) as tar_fec_ult_uso
		FROM [sta].[sta_dtd_banelco_padron]
		WHERE tar_fec_ult_uso IS NOT NULL
		AND fec_carga = @Fecha_hasta
		GROUP BY nro_tarjeta;
	
		--Transacciones generales de debito
		INSERT INTO #dtd_banelco
		(id_cliente, cta_id_empresa, cta_numero, ope_id_modulo, ope_id_moneda, ope_id_papel, ope_id_sucursal, ope_operacion, ope_sub_operacion,
		ope_id_tipo_operacion, ban_numero_tarjeta, ope_id_sucursal_asociada, ban_id_estado, ban_estado, ban_fecha_alta, ban_fecha_estado_delivery,
		ban_estado_delivery, ban_fecha_venci, ban_meses_ult_extraccion, ban_fecha_ult_extraccion, ban_meses_ult_compra, ban_fecha_ult_compra,
		tar_fec_ult_uso, id_sucursal_delivery, fechacarga, fechaactualizacion)
		SELECT
		DB.id_cliente, --Agregada por PK
		DB.cta_id_empresa, --Agregada por PK
		DB.cta_numero, --Nro Cuenta TD
		DB.ope_id_modulo, --Agregada por PK
		DB.ope_id_moneda, --Agregada por PK
		DB.ope_id_papel, --Agregada por PK
		DB.ope_id_sucursal, --Sucursal TD
		DB.ope_operacion, --Agregada por PK
		DB.ope_sub_operacion, --Agregada por PK
		DB.ope_id_tipo_operacion, --Agregada por PK
		LTRIM(RTRIM(DB.ban_numero_tarjeta)) as ban_numero_tarjeta, --Nro TD
		DB.ope_id_sucursal_asociada, --Sucursal TD
		DB.ban_id_estado, --Estado TD ID
		DB.ban_estado, --Estado TD descripcion
		DB.ban_fecha_alta, --Fecha Alta TD
		ED.fecha_estado as ban_fecha_estado_delivery, --Fecha Estado Final Delivery TD
		ED.estado_final as ban_estado_delivery, --Estado Final Delivery TD
		DB.ban_fecha_venci, --Fecha Vencimiento TD
		COALESCE(TB.txb_meses_ult_extraccion, 99999) as ban_meses_ult_extraccion, --Meses desde Ultima Extraccion 24 Meses Tarjeta de Debito
		TB.txb_fecha_ult_trans as ban_fecha_ult_extraccion, --Fecha Ultima Extraccion 24 Meses Tarjeta de Debito
		COALESCE(TE.txe_meses_ult_compra, 99999) as ban_meses_ult_compra, --Fecha Ultima Compra 24 Meses
		TE.txe_fecha_mov as ban_fecha_ult_compra, --Meses desde Ultima Compra 24 Meses
		BP.tar_fec_ult_uso, --Fecha Ultimo Uso TD
		ED.sucursal_delivery as id_sucursal_delivery, --Id sucursal Delivery TD
		DB.cta_fec_carga as fechacarga,
		GETDATE() as fechaactualizacion
		FROM [sta].[sta_dtd_banelco] DB
		LEFT JOIN #mtd_trans_electron TE
		ON DB.ban_numero_tarjeta = TE.txe_nro_tarjeta
		LEFT JOIN #mtd_trans_banelco TB
		ON DB.ban_numero_tarjeta = TB.txb_numero_tarjeta
		LEFT JOIN #estado_delivery ED
		ON LTRIM(RTRIM(DB.ban_numero_tarjeta)) = ED.ban_numero_tarjeta
		LEFT JOIN #tarjeta_ultimo_uso BP
		ON DB.ban_numero_tarjeta = BP.nro_tarjeta
		WHERE DB.ban_id_estado <> 7
		AND DB.cta_fec_carga = @Fecha_hasta;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO [DataMart].[FCT_BANELCO]
		(ID_CLIENTE, CTA_ID_EMPRESA, CTA_NUMERO, OPE_ID_MODULO, OPE_ID_MONEDA, OPE_ID_PAPEL, OPE_ID_SUCURSAL, OPE_OPERACION, OPE_SUB_OPERACION, 
		OPE_ID_TIPO_OPERACION, BAN_NUMERO_TARJETA, OPE_ID_SUCURSAL_ASOCIADA, BAN_ID_ESTADO, BAN_ESTADO, BAN_FECHA_ALTA, BAN_FECHA_ESTADO_DELIVERY, 
		BAN_ESTADO_DELIVERY, BAN_FECHA_VENCI, BAN_MESES_ULT_EXTRACCION, BAN_FECHA_ULT_EXTRACCION, BAN_MESES_ULT_COMPRA, BAN_FECHA_ULT_COMPRA,
		TAR_FEC_ULT_USO, ID_SUCURSAL_DELIVERY, FECHACARGA, FECHAACTUALIZACION)
		SELECT id_cliente, cta_id_empresa, cta_numero, ope_id_modulo, ope_id_moneda, ope_id_papel, ope_id_sucursal, ope_operacion, ope_sub_operacion,
		ope_id_tipo_operacion, ban_numero_tarjeta, ope_id_sucursal_asociada, ban_id_estado, ban_estado, ban_fecha_alta, ban_fecha_estado_delivery,
		ban_estado_delivery, ban_fecha_venci, ban_meses_ult_extraccion, ban_fecha_ult_extraccion, ban_meses_ult_compra, ban_fecha_ult_compra,
		tar_fec_ult_uso, id_sucursal_delivery, fechacarga, fechaactualizacion
		FROM #dtd_banelco;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		
		DROP TABLE #mtd_trans_electron;
		DROP TABLE #mtd_trans_banelco;
		DROP TABLE #estado_delivery;
		DROP TABLE #dtd_banelco;
		DROP TABLE #tarjeta_ultimo_uso;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------CARGA LOG FIN-----------------
		SET @FecFin = GETDATE();
		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @FecFin = GETDATE(), @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_LOAD_RESPONSES]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_LOAD_RESPONSES] AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	DECLARE @Nombre_archivo VARCHAR(128);
	DECLARE @Directorio VARCHAR(300);
	DECLARE @Cantidad_respuestas INTEGER;
	DECLARE @Actualizaciones INTEGER;
	DECLARE @Novedades INTEGER;
	DECLARE @Error VARCHAR(1000);

	SET @Tabla_origen = 'sta_load_responses';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'CI_RESPONSE_HISTORY_CLIENTE';
	SET @Esquema_destino = 'CDM';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);
	SET @Nombre_archivo = (SELECT TOP 1 archivo FROM [sta].[sta_load_responses]);
	SET @Directorio = (SELECT TOP 1 directorio FROM [sta].[sta_load_responses]);

	-------------------CARGA LOG INICIO--------------  
	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #temporal_respuestas
		(
			[cell_package_sk] [numeric](15, 0) NOT NULL,
			[treatment_sk] [numeric](15, 0) NOT NULL,
			[treatment_hash_val] [varchar](32) NOT NULL,
			[response_sk] [numeric](15, 0) NOT NULL,
			[id_cliente] [varchar](18) NOT NULL,
			[response_dttm] [datetime] NOT NULL,
			[response_dt] [date] NULL,
			[response_channel_cd] [varchar](3) NULL,
			[inferred_response_flg] [char](1) NULL,
			[response_value_amt] [numeric](14, 2) NULL,
			[external_response_info_id1] [varchar](32) NULL,
			[external_response_info_id2] [varchar](32) NULL,
			[response_tracking_cd] [varchar](19) NULL,
			[processed_dttm] [datetime] NULL,
			CONSTRAINT [TMP_RESPUESTAS] PRIMARY KEY CLUSTERED (
			[cell_package_sk] ASC, [treatment_sk] ASC, [treatment_hash_val] ASC, [response_sk] ASC, [id_cliente] ASC, [response_dttm] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		);
	
		--Carga previa de respuestas
		INSERT INTO #temporal_respuestas
		(cell_package_sk, treatment_sk, treatment_hash_val, response_sk, id_cliente, response_dttm, response_channel_cd, inferred_response_flg,
		response_value_amt, response_dt, external_response_info_id1, external_response_info_id2, response_tracking_cd, processed_dttm)
		SELECT
		CH.CELL_PACKAGE_SK, PXT.TREATMENT_SK, DTA.TREATMENT_HASH_VAL, RXC.RESPONSE_SK, CH.ID_CLIENTE, RESP.RESPONSE_DTTM,
		RCR.RESPONSE_CHANNEL_CD, RESP.INFERRED_RESPONSE_FLG, RESP.RESPONSE_VALUE_AMT, RESP.RESPONSE_DT, 
		RESP.EXTERNAL_RESPONSE_INFO_ID1, RESP.EXTERNAL_RESPONSE_INFO_ID2, CH.RESPONSE_TRACKING_CD, GETDATE() AS PROCESSED_DTTM
		FROM [CDM].[CI_CONTACT_HISTORY_CLIENTE] CH
		INNER JOIN [CDM].[CI_CELL_PACKAGE] CP
		ON CH.CELL_PACKAGE_SK = CP.CELL_PACKAGE_SK
		INNER JOIN [CDM].[CI_RESPONSE_X_CELL_PACKAGE] RXC
		ON CP.CELL_PACKAGE_SK = RXC.CELL_PACKAGE_SK
		INNER JOIN [CDM].[CI_RESPONSE_CHANNEL_RESPONSE] RCR
		ON RXC.RESPONSE_SK = RCR.RESPONSE_SK
		LEFT JOIN [CDM].[CI_PACKAGE_X_TREATMENT] PXT
		ON CP.CELL_PACKAGE_SK = PXT.CONTRIBUTING_CELL_PACKAGE_SK AND CH.PACKAGE_HASH_VAL = PXT.PACKAGE_HASH_VAL
		LEFT JOIN [CDM].[CI_DYNAMIC_TREATMENT_ATTRIBUTE] DTA
		ON CP.CELL_PACKAGE_SK = DTA.CELL_PACKAGE_SK AND CH.PACKAGE_HASH_VAL = DTA.PACKAGE_HASH_VAL
		INNER JOIN [sta].[sta_load_responses] RESP
		ON CP.RESPONSE_TRACKING_CD = RESP.ID_CAMPAIGN AND CH.ID_CLIENTE = RESP.id_cliente
		AND RESP.TIPO_GESTION = RCR.RESPONSE_CHANNEL_RESPONSE_CD
		WHERE CP.DELETED_FLG = 'N';

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Actualizacion/insercion de tabla definitiva ' + @Destino;

		--Conteo de datos coincidentes (para reprocesos)
		SET @Actualizaciones = ISNULL((
			SELECT COUNT(*)
			FROM [CDM].[CI_RESPONSE_HISTORY_CLIENTE] RH
			INNER JOIN #temporal_respuestas TR
			ON TR.id_cliente = RH.ID_CLIENTE AND TR.cell_package_sk = RH.CELL_PACKAGE_SK AND TR.response_dttm = RH.RESPONSE_DTTM
			AND TR.response_sk = RH.RESPONSE_SK), 0);
		
		--Conteo de novedades
		SET @Novedades = ISNULL((
			SELECT COUNT(*)
			FROM [CDM].[CI_RESPONSE_HISTORY_CLIENTE] RH
			LEFT JOIN #temporal_respuestas TR
			ON TR.id_cliente = RH.ID_CLIENTE AND TR.cell_package_sk = RH.CELL_PACKAGE_SK AND TR.response_dttm = RH.RESPONSE_DTTM
			AND TR.response_sk = RH.RESPONSE_SK
			WHERE RH.ID_CLIENTE IS NULL AND RH.CELL_PACKAGE_SK IS NULL AND RH.RESPONSE_DTTM IS NULL AND RH.RESPONSE_SK IS NULL), 0);

		MERGE INTO [CDM].[CI_RESPONSE_HISTORY_CLIENTE] RH
		USING #temporal_respuestas TR
		ON TR.id_cliente = RH.ID_CLIENTE AND TR.cell_package_sk = RH.CELL_PACKAGE_SK AND TR.response_dttm = RH.RESPONSE_DTTM
		AND TR.response_sk = RH.RESPONSE_SK
		WHEN MATCHED THEN UPDATE
		SET TREATMENT_SK = TR.treatment_sk, TREATMENT_HASH_VAL = TR.treatment_hash_val, RESPONSE_DT = TR.response_dt,
		RESPONSE_CHANNEL_CD = TR.response_channel_cd, INFERRED_RESPONSE_FLG = TR.inferred_response_flg, RESPONSE_VALUE_AMT = TR.response_value_amt,
		EXTERNAL_RESPONSE_INFO_ID1 = TR.external_response_info_id1, EXTERNAL_RESPONSE_INFO_ID2 = TR.external_response_info_id2,
		RESPONSE_TRACKING_CD = TR.response_tracking_cd, PROCESSED_DTTM = TR.processed_dttm
		WHEN NOT MATCHED THEN INSERT
		VALUES (TR.cell_package_sk, TR.treatment_sk, TR.treatment_hash_val, TR.response_sk, TR.id_cliente, TR.response_dttm, TR.response_dt,
		TR.response_channel_cd, TR.inferred_response_flg, TR.response_value_amt, TR.external_response_info_id1, TR.external_response_info_id2, 
		TR.response_tracking_cd, TR.processed_dttm);

		SET @Cantidad_respuestas = ISNULL((SELECT COUNT(*) FROM #temporal_respuestas), 0);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Novedades: ' + CONVERT(VARCHAR, @Novedades);
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Actualizaciones: ' + CONVERT(VARCHAR, @Actualizaciones);
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		
		DROP TABLE #temporal_respuestas;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Actualizando estado en [Auxiliar].[LOG_FILE_LOAD]';

		UPDATE [Auxiliar].[LOG_FILE_LOAD]
		SET Respuestas_cargadas = @Cantidad_respuestas, estado = 0
		WHERE directorio = @Directorio and archivo = @Nombre_archivo
		AND fecha_carga = (SELECT MAX(fecha_carga) FROM [Auxiliar].[LOG_FILE_LOAD]);
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		-------------------------------------------------  
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
		
		UPDATE [Auxiliar].[LOG_FILE_LOAD]
		SET estado = 7
		WHERE directorio = @Directorio AND archivo = @Nombre_archivo
		AND fecha_carga = (SELECT MAX(fecha_carga) FROM [Auxiliar].[LOG_FILE_LOAD]);

		RAISERROR ('Error', 16, 1);

	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_OFERTASPIC]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_OFERTASPIC] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(50);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(82);
	DECLARE @Destino VARCHAR(65);
	DECLARE @Error VARCHAR(1000);
	DECLARE @Fecha_hasta DATE;
	
	SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8)));
	SET @Tabla_origen = 'sta_dcl_calificacion_masiva_semaforos_canal';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'FCT_OFERTASPIC';
	SET @Esquema_destino = 'DataMart';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			EXEC(@Truncar);
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #ofertas_pic
		(
			[ID_CLIENTE] VARCHAR(18) NOT NULL,
			[PER_LOTE] SMALLINT NOT NULL,
			[PER_CANAL] INTEGER NOT NULL,
			[PAQ_COD_SELECCIONADO_APROB] NUMERIC (18,0) NULL,
			[PP_CFTNA_12M] NUMERIC (18,2) NULL,
			[PP_CFTEA_12M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_12M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_12M] NUMERIC (18,2) NULL,
			[PP_CUOTA_12M] NUMERIC (18,2) NULL,
			[PP_TASA_12M] NUMERIC (12,5) NULL,
			[PP_CAPITAL_12M] NUMERIC (18,2) NULL,
			[PP_CFTNA_18M] NUMERIC (18,2) NULL,
			[PP_CFTEA_18M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_18M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_18M] NUMERIC (18,2) NULL,
			[PP_CUOTA_18M] NUMERIC (18,2) NULL,
			[PP_TASA_18M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_18M] NUMERIC (18,2) NULL,
			[PP_CFTNA_24M] NUMERIC(18,2) NULL,
			[PP_CFTEA_24M] NUMERIC(18,5) NULL,
			[PP_DISPONIBLE_24M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_24M] NUMERIC (18,2) NULL,
			[PP_CUOTA_24M] NUMERIC (18,2) NULL,
			[PP_TASA_24M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_24M] NUMERIC (18,2) NULL,
			[PP_CFTNA_36M] NUMERIC (18,2) NULL,
			[PP_CFTEA_36M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_36M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_36M] NUMERIC (18,2) NULL,
			[PP_CUOTA_36M] NUMERIC (18,2) NULL,
			[PP_TASA_36M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_36M] NUMERIC (18,2) NULL,
			[PP_CFTNA_48M] NUMERIC (18,2) NULL,
			[PP_CFTEA_48M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_48M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_48M] NUMERIC (18,2) NULL,
			[PP_CUOTA_48M] NUMERIC (18,2) NULL,
			[PP_TASA_48M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_48M] NUMERIC (18,2) NULL,
			[PP_CFTNA_60M] NUMERIC (18,2) NULL,
			[PP_CFTEA_60M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_60M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_60M] NUMERIC (18,2) NULL,
			[PP_CUOTA_60M] NUMERIC (18,2) NULL,
			[PP_TASA_60M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_60M] NUMERIC (18,2) NULL,
			[PP_CFTNA_72M] NUMERIC (18,2) NULL,
			[PP_CFTEA_72M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_72M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_72M] NUMERIC (18,2) NULL,
			[PP_CUOTA_72M] NUMERIC (18,2) NULL,
			[PP_TASA_72M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_72M] NUMERIC (18,2) NULL,
			[PP_CFTNA_84M] NUMERIC (18,2) NULL,
			[PP_CFTEA_84M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_84M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_84M] NUMERIC (18,2) NULL,
			[PP_CUOTA_84M] NUMERIC (18,2) NULL,
			[PP_TASA_84M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_84M] NUMERIC (18,2) NULL,
			[PP_CFTNA_96M] NUMERIC (18,2) NULL,
			[PP_CFTEA_96M] NUMERIC (18,5) NULL,
			[PP_DISPONIBLE_96M] NUMERIC (18,2) NULL,
			[PP_DESEMBOLSO_96M] NUMERIC (18,2) NULL,
			[PP_CUOTA_96M] NUMERIC (18,2) NULL,
			[PP_TASA_96M] NUMERIC (18,5) NULL,
			[PP_CAPITAL_96M] NUMERIC (18,2) NULL,
			[TCC_LIMITE_VISA] NUMERIC(18,2) NULL,
			[TCC_DESCRIPCION_VISA] VARCHAR(50) NULL,
			[TCT_VISA_ACTUAL] NUMERIC(18,2) NULL,
			[TCT_OFERTA_VISA] NUMERIC(18,2) NULL,
			[TCC_LIMITE_MASTER] NUMERIC(18,2) NULL,
			[TCC_DESCRIPCION_MASTER] VARCHAR(50) NULL,
			[TCT_MASTER_ACTUAL] NUMERIC(18,2) NULL,
			[TCT_OFERTA_MASTER] NUMERIC(18,2) NULL,
			[FECHACARGA] DATETIME NOT NULL,
			[FECHAACTUALIZACION] DATETIME NOT NULL,
			CONSTRAINT [PK_FCT_OFERTASPIC] PRIMARY KEY CLUSTERED
			([ID_CLIENTE] ASC, [PER_LOTE] ASC, [PER_CANAL] ASC)
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
			ON [PRIMARY]
		);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;

		INSERT INTO #ofertas_pic
		(ID_CLIENTE, PER_LOTE, PER_CANAL, PAQ_COD_SELECCIONADO_APROB, PP_CFTNA_12M, PP_CFTEA_12M, PP_DISPONIBLE_12M, PP_DESEMBOLSO_12M, PP_CUOTA_12M, 
		PP_TASA_12M, PP_CAPITAL_12M, PP_CFTNA_18M, PP_CFTEA_18M, PP_DISPONIBLE_18M, PP_DESEMBOLSO_18M, PP_CUOTA_18M, PP_TASA_18M, PP_CAPITAL_18M, 
		PP_CFTNA_24M, PP_CFTEA_24M, PP_DISPONIBLE_24M, PP_DESEMBOLSO_24M, PP_CUOTA_24M, PP_TASA_24M, PP_CAPITAL_24M, PP_CFTNA_36M, PP_CFTEA_36M, 
		PP_DISPONIBLE_36M, PP_DESEMBOLSO_36M, PP_CUOTA_36M, PP_TASA_36M, PP_CAPITAL_36M, PP_CFTNA_48M, PP_CFTEA_48M, PP_DISPONIBLE_48M, PP_DESEMBOLSO_48M, 
		PP_CUOTA_48M, PP_TASA_48M, PP_CAPITAL_48M, PP_CFTNA_60M, PP_CFTEA_60M, PP_DISPONIBLE_60M, PP_DESEMBOLSO_60M, PP_CUOTA_60M, PP_TASA_60M, 
		PP_CAPITAL_60M, PP_CFTNA_72M, PP_CFTEA_72M, PP_DISPONIBLE_72M, PP_DESEMBOLSO_72M, PP_CUOTA_72M, PP_TASA_72M, PP_CAPITAL_72M, PP_CFTNA_84M, 
		PP_CFTEA_84M, PP_DISPONIBLE_84M, PP_DESEMBOLSO_84M, PP_CUOTA_84M, PP_TASA_84M, PP_CAPITAL_84M, PP_CFTNA_96M, PP_CFTEA_96M, PP_DISPONIBLE_96M, 
		PP_DESEMBOLSO_96M, PP_CUOTA_96M, PP_TASA_96M, PP_CAPITAL_96M, TCC_LIMITE_VISA, TCC_DESCRIPCION_VISA, TCT_VISA_ACTUAL, TCT_OFERTA_VISA, 
		TCC_LIMITE_MASTER, TCC_DESCRIPCION_MASTER, TCT_MASTER_ACTUAL, TCT_OFERTA_MASTER, FECHACARGA, FECHAACTUALIZACION)
		SELECT
		PIC.id_cliente, --Identificador de cliente
		PIC.per_lote, --Lote Oferta
		PIC.per_canal, --Canal Oferta - Canal al que corresponde la oferta de PIC (1 es presencial y 3 No presencial)
		PIC.paq_cod_seleccionado_aprob, --Paquete Oferta
		PIC.pp_cftna_12m, --Préstamo Cftna 12 Meses Oferta
		PIC.pp_cftea_12m, --Préstamo Cftea 12 Meses Oferta
		PIC.pp_disponible_12m, --Préstamo Disponible 12 Meses Oferta
		PIC.pp_desembolso_12m, --Préstamo Desembolso 12 Meses Oferta
		PIC.pp_cuota_12m, --Préstamo cuota 12 Meses Oferta
		PIC.pp_tasa_12m, --Prestamo tasa 12 Meses Oferta
		PIC.pp_capital_12m, --Prestamo capital 12 Meses Oferta
		PIC.pp_cftna_18m, --Préstamo Cftna 18 Meses Oferta
		PIC.pp_cftea_18m, --Préstamo Cftea 18 Meses Oferta
		PIC.pp_disponible_18m, --Préstamo Disponible 18 Meses Oferta
		PIC.pp_desembolso_18m, --Préstamo Desembolso 18 Meses Oferta
		PIC.pp_cuota_18m, --Préstamo cuota 18 Meses Oferta
		PIC.pp_tasa_18m, --Prestamo tasa 18 Meses Oferta
		PIC.pp_capital_18m, --Prestamo capital 18 Meses Oferta
		PIC.pp_cftna_24m, --Préstamo Cftna 24 Meses Oferta
		PIC.pp_cftea_24m, --Préstamo Cftea 24 Meses Oferta
		PIC.pp_disponible_24m, --Préstamo Disponible 24 Meses Oferta
		PIC.pp_desembolso_24m, --Préstamo Desembolso 24 Meses Oferta
		PIC.pp_cuota_24m, --Préstamo cuota 24 Meses Oferta
		PIC.pp_tasa_24m, --Prestamo tasa 24 Meses Oferta
		PIC.pp_capital_24m, --Prestamo capital 24 Meses Oferta
		PIC.pp_cftna_36m, --Préstamo Cftna 36 Meses Oferta
		PIC.pp_cftea_36m, --Préstamo Cftea 36 Meses Oferta
		PIC.pp_disponible_36m, --Préstamo Disponible 36 Meses Oferta
		PIC.pp_desembolso_36m, --Préstamo Desembolso 36 Meses Oferta
		PIC.pp_cuota_36m, --Préstamo cuota 36 Meses Oferta
		PIC.pp_tasa_36m, --Prestamo tasa 36 Meses Oferta
		PIC.pp_capital_36m, --Prestamo capital 36 Meses Oferta
		PIC.pp_cftna_48m, --Préstamo Cftna 48 Meses Oferta
		PIC.pp_cftea_48m, --Préstamo Cftea 48 Meses Oferta
		PIC.pp_disponible_48m, --Préstamo Disponible 48 Meses Oferta
		PIC.pp_desembolso_48m, --Préstamo Desembolso 48 Meses Oferta
		PIC.pp_cuota_48m, --Préstamo cuota 48 Meses Oferta
		PIC.pp_tasa_48m, --Prestamo tasa 48 Meses Oferta
		PIC.pp_capital_48m, --Prestamo capital 48 Meses Oferta
		PIC.pp_cftna_60m, --Préstamo Cftna 60 Meses Oferta
		PIC.pp_cftea_60m, --Préstamo Cftea 60 Meses Oferta
		PIC.pp_disponible_60m, --Préstamo Disponible 60 Meses Oferta
		PIC.pp_desembolso_60m, --Préstamo Desembolso 60 Meses Oferta
		PIC.pp_cuota_60m, --Préstamo cuota 60 Meses Oferta
		PIC.pp_tasa_60m, --Prestamo tasa 60 Meses Oferta
		PIC.pp_capital_60m, --Prestamo capital 60 Meses Oferta
		PIC.pp_cftna_72m, --Préstamo Cftna 72 Meses Oferta
		PIC.pp_cftea_72m, --Préstamo Cftea 72 Meses Oferta
		PIC.pp_disponible_72m, --Préstamo Disponible 72 Meses Oferta
		PIC.pp_desembolso_72m, --Préstamo Desembolso 72 Meses Oferta
		PIC.pp_cuota_72m, --Préstamo cuota 72 Meses Oferta
		PIC.pp_tasa_72m, --Prestamo tasa 72 Meses Oferta
		PIC.pp_capital_72m, --Prestamo capital 72 Meses Oferta
		PIC.pp_cftna_84m, --Préstamo Cftna 84 Meses Oferta
		PIC.pp_cftea_84m, --Préstamo Cftea 84 Meses Oferta
		PIC.pp_disponible_84m, --Préstamo Disponible 84 Meses Oferta
		PIC.pp_desembolso_84m, --Préstamo Desembolso 84 Meses Oferta
		PIC.pp_cuota_84m, --Préstamo cuota 84 Meses Oferta
		PIC.pp_tasa_84m, --Prestamo tasa 84 Meses Oferta
		PIC.pp_capital_84m, --Prestamo capital 84 Meses Oferta
		PIC.pp_cftna_96m, --Préstamo Cftna 96 Meses Oferta
		PIC.pp_cftea_96m, --Préstamo Cftea 96 Meses Oferta
		PIC.pp_disponible_96m, --Préstamo Disponible 96 Meses Oferta
		PIC.pp_desembolso_96m, --Préstamo Desembolso 96 Meses Oferta
		PIC.pp_cuota_96m, --Préstamo cuota 96 Meses Oferta
		PIC.pp_tasa_96m, --Prestamo tasa 96 Meses Oferta
		PIC.pp_capital_96m, --Prestamo capital 96 Meses Oferta
		PIC.tcc_limite_visa, --Limite Nuevo Visa Oferta
		PIC.tcc_descripcion_visa, --Producto Visa Oferta
		PIC.tct_visa_actual, --Limite Visa Actual
		CASE WHEN (PIC.tcc_limite_visa - PIC.tct_visa_actual) > 0 THEN 0 ELSE (PIC.tcc_limite_visa - PIC.tct_visa_actual) END AS tct_oferta_visa, --Oferta Visa
		PIC.tcc_limite_master, --Limite Nuevo Master Oferta
		PIC.tcc_descripcion_master, --Producto Master Oferta
		PIC.tct_master_actual, --Limite master Actual
		CASE WHEN (PIC.tcc_limite_master - PIC.tct_master_actual) > 0 THEN 0 ELSE (PIC.tcc_limite_master - PIC.tct_master_actual) END AS tct_oferta_master, --Oferta Master
		PIC.per_fec_carga, --Fecha de carga
		GETDATE() as fecha_actualizacion
		FROM [sta].[sta_dcl_calificacion_masiva_semaforos_canal] PIC
		WHERE PIC.per_fec_carga = @Fecha_hasta
		ORDER BY PIC.id_cliente;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO [DataMart].[FCT_OFERTASPIC]
		(ID_CLIENTE, PER_LOTE, PER_CANAL, PAQ_COD_SELECCIONADO_APROB, PP_CFTNA_12M, PP_CFTEA_12M, PP_DISPONIBLE_12M, PP_DESEMBOLSO_12M, PP_CUOTA_12M, 
		PP_TASA_12M, PP_CAPITAL_12M, PP_CFTNA_18M, PP_CFTEA_18M, PP_DISPONIBLE_18M, PP_DESEMBOLSO_18M, PP_CUOTA_18M, PP_TASA_18M, PP_CAPITAL_18M, 
		PP_CFTNA_24M, PP_CFTEA_24M, PP_DISPONIBLE_24M, PP_DESEMBOLSO_24M, PP_CUOTA_24M, PP_TASA_24M, PP_CAPITAL_24M, PP_CFTNA_36M, PP_CFTEA_36M, 
		PP_DISPONIBLE_36M, PP_DESEMBOLSO_36M, PP_CUOTA_36M, PP_TASA_36M, PP_CAPITAL_36M, PP_CFTNA_48M, PP_CFTEA_48M, PP_DISPONIBLE_48M, PP_DESEMBOLSO_48M, 
		PP_CUOTA_48M, PP_TASA_48M, PP_CAPITAL_48M, PP_CFTNA_60M, PP_CFTEA_60M, PP_DISPONIBLE_60M, PP_DESEMBOLSO_60M, PP_CUOTA_60M, PP_TASA_60M, 
		PP_CAPITAL_60M, PP_CFTNA_72M, PP_CFTEA_72M, PP_DISPONIBLE_72M, PP_DESEMBOLSO_72M, PP_CUOTA_72M, PP_TASA_72M, PP_CAPITAL_72M, PP_CFTNA_84M, 
		PP_CFTEA_84M, PP_DISPONIBLE_84M, PP_DESEMBOLSO_84M, PP_CUOTA_84M, PP_TASA_84M, PP_CAPITAL_84M, PP_CFTNA_96M, PP_CFTEA_96M, PP_DISPONIBLE_96M, 
		PP_DESEMBOLSO_96M, PP_CUOTA_96M, PP_TASA_96M, PP_CAPITAL_96M, TCC_LIMITE_VISA, TCC_DESCRIPCION_VISA, TCT_VISA_ACTUAL, TCT_OFERTA_VISA, 
		TCC_LIMITE_MASTER, TCC_DESCRIPCION_MASTER, TCT_MASTER_ACTUAL, TCT_OFERTA_MASTER, FECHACARGA, FECHAACTUALIZACION)
		SELECT ID_CLIENTE, PER_LOTE, PER_CANAL, PAQ_COD_SELECCIONADO_APROB, PP_CFTNA_12M, PP_CFTEA_12M, PP_DISPONIBLE_12M, PP_DESEMBOLSO_12M, PP_CUOTA_12M, 
		PP_TASA_12M, PP_CAPITAL_12M, PP_CFTNA_18M, PP_CFTEA_18M, PP_DISPONIBLE_18M, PP_DESEMBOLSO_18M, PP_CUOTA_18M, PP_TASA_18M, PP_CAPITAL_18M, 
		PP_CFTNA_24M, PP_CFTEA_24M, PP_DISPONIBLE_24M, PP_DESEMBOLSO_24M, PP_CUOTA_24M, PP_TASA_24M, PP_CAPITAL_24M, PP_CFTNA_36M, PP_CFTEA_36M, 
		PP_DISPONIBLE_36M, PP_DESEMBOLSO_36M, PP_CUOTA_36M, PP_TASA_36M, PP_CAPITAL_36M, PP_CFTNA_48M, PP_CFTEA_48M, PP_DISPONIBLE_48M, PP_DESEMBOLSO_48M, 
		PP_CUOTA_48M, PP_TASA_48M, PP_CAPITAL_48M, PP_CFTNA_60M, PP_CFTEA_60M, PP_DISPONIBLE_60M, PP_DESEMBOLSO_60M, PP_CUOTA_60M, PP_TASA_60M, 
		PP_CAPITAL_60M, PP_CFTNA_72M, PP_CFTEA_72M, PP_DISPONIBLE_72M, PP_DESEMBOLSO_72M, PP_CUOTA_72M, PP_TASA_72M, PP_CAPITAL_72M, PP_CFTNA_84M, 
		PP_CFTEA_84M, PP_DISPONIBLE_84M, PP_DESEMBOLSO_84M, PP_CUOTA_84M, PP_TASA_84M, PP_CAPITAL_84M, PP_CFTNA_96M, PP_CFTEA_96M, PP_DISPONIBLE_96M, 
		PP_DESEMBOLSO_96M, PP_CUOTA_96M, PP_TASA_96M, PP_CAPITAL_96M, TCC_LIMITE_VISA, TCC_DESCRIPCION_VISA, TCT_VISA_ACTUAL, TCT_OFERTA_VISA, 
		TCC_LIMITE_MASTER, TCC_DESCRIPCION_MASTER, TCT_MASTER_ACTUAL, TCT_OFERTA_MASTER, FECHACARGA, FECHAACTUALIZACION
		FROM #ofertas_pic;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		
		DROP TABLE #ofertas_pic;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Error;
		PRINT '############################################################################################';
	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_PLAZO_FIJO]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_PLAZO_FIJO] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);

	SET @Tabla_origen = 'sta_dpf_plazo_fijo';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'FCT_PLAZO_FIJO';
	SET @Esquema_destino = 'DataMart';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @FecIni DATETIME, @FecFin DATETIME, @nivel SMALLINT, @Error VARCHAR(1000);
	SELECT @FecIni = GETDATE(), @nivel = 3;

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		IF @desde = 0 OR @hasta = 0 PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		ELSE
		BEGIN
			PRINT ' Carga de Parametros: ';
			PRINT ' Fecha desde: ' + CONVERT(VARCHAR, @desde);  
			PRINT ' Fecha hasta: ' + CONVERT(VARCHAR, @hasta);  
			PRINT ' ELIMINACION DE REGISTROS: ' + CONVERT(VARCHAR, GETDATE(), 114);
		END;
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		
		--Aplica el filtro de fecha
		IF NOT @desde = 0 AND NOT @hasta = 0 SET @Validacion = @Validacion + ' WHERE cta_fec_carga BETWEEN CAST(' + CAST(@desde AS VARCHAR) + ' AS VARCHAR) AND CAST(' + CAST(@hasta AS VARCHAR) + ' AS VARCHAR)';
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			SET @FecFin = GETDATE();
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			EXEC(@Truncar);
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO DataMart.FCT_PLAZO_FIJO
			(ID_CLIENTE, CTA_NUMERO, OPE_OPERACION, OPE_ID_MONEDA, OPE_DESCRIPCION_MONEDA, PFI_FECHA_VENCI, PFI_FECHA_ALTA, PFI_MONTO_DEPOSITADO, 
			PFI_MONTO_PAGO, PFI_TASA, PFI_PLAZO, PFI_PLAZO_RESIDUAL, PFI_FLG_RENOV_AUTO, PFI_ID_ESTADO, PFI_ESTADO, FECHACARGA, FECHAACTUALIZACION)
		SELECT 
			ID_CLIENTE,
			CTA_NUMERO,
			OPE_OPERACION,
			OPE_ID_MONEDA,
			CONCAT(OPE_ID_MONEDA,' - ', TRIM(M.desc_mon_moneda)) AS OPE_DESCRIPCION_MONEDA, 
			--
			CASE
				WHEN ISDATE(PFI_FECHA_VENCI) = 1 THEN CONVERT(DATE, CONVERT(varchar,PFI_FECHA_VENCI))
				WHEN ISDATE(PFI_FECHA_VENCI) = 0 THEN NULL
			END AS PFI_FECHA_VENCI,
			--
			CASE
				WHEN ISDATE(PFI_FECHA_ALTA) = 1 THEN CONVERT(DATE, CONVERT(varchar,PFI_FECHA_ALTA))
				WHEN ISDATE(PFI_FECHA_ALTA) = 0 THEN CONVERT(DATE, '19000101')
				ELSE CONVERT(DATE, '19000101')
			END AS PFI_FECHA_ALTA,
			--
			PFI_MONTO_DEPOSITADO,
			PFI_MONTO_PAGO,
			PFI_TASA, 
			PFI_PLAZO,
			PFI_PLAZO_RESIDUAL,
			CASE WHEN PFI_FLG_RENOV_AUTO = 0 THEN 'NO' 
				ELSE 'SI' 
			END AS PFI_FLG_RENOV_AUTO,
			PFI_ID_ESTADO,
			CONCAT(PFI_ID_ESTADO,' - ',TRIM(PFI_ESTADO)) AS PFI_ESTADO,
			CONVERT(DATETIME, cta_fec_carga) as fechacarga,
			GETDATE() as fechaactualizacion
		FROM sta.sta_dpf_plazo_fijo AS PF
			LEFT JOIN sta.sta_lk_mon_moneda AS M 
				ON M.id_mon_moneda = PF.ope_id_moneda
		WHERE	ope_operacion <> 0
		and		id_cliente <> '000000000000000000';

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------CARGA LOG FIN-----------------
		SET @FecFin = GETDATE();
		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @FecFin = GETDATE(), @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END;
GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_SEGUROS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_SEGUROS] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);

	SET @Tabla_origen = 'sta_mse_padron_seguros';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'FCT_SEGUROS';
	SET @Esquema_destino = 'DataMart';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @FecIni DATETIME, @FecFin DATETIME, @nivel SMALLINT, @Error VARCHAR(1000);
	SELECT @FecIni = GETDATE(), @nivel = 3;

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		IF @desde = 0 OR @hasta = 0 PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		ELSE
		BEGIN
			PRINT ' Carga de Parametros: ';
			PRINT ' Fecha desde: ' + CONVERT(VARCHAR, @desde);  
			PRINT ' Fecha hasta: ' + CONVERT(VARCHAR, @hasta);  
			PRINT ' ELIMINACION DE REGISTROS: ' + CONVERT(VARCHAR, GETDATE(), 114);
		END;
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		
		--Aplica el filtro de fecha
		IF NOT @desde = 0 AND NOT @hasta = 0 SET @Validacion = @Validacion + ' WHERE cta_fec_carga BETWEEN CAST(' + CAST(@desde AS VARCHAR) + ' AS VARCHAR) AND CAST(' + CAST(@hasta AS VARCHAR) + ' AS VARCHAR)';
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			SET @FecFin = GETDATE();
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			EXEC(@Truncar);
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;


		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;
		CREATE TABLE #FCT_SEGUROS
		(
			ID_CLIENTE VARCHAR(18) NOT NULL,
			PER_ID_PAIS SMALLINT NOT NULL, 
			PER_ID_TIPO_DOC SMALLINT NOT NULL, 
			PER_NRO_DOCUMENTO VARCHAR(12) NOT NULL, 
			PZA_ESTADO TINYINT NULL, 
			PRO_DESCRIPCION VARCHAR(100) NULL, 
			TPR_DESCRIPCION VARCHAR(40) NULL, 
			BAJA_ACEPTADA VARCHAR(2) NULL, 
			COD_MOTIVO_BAJA INT NULL, 
			DESC_MOTIVO_BAJA VARCHAR(100) NULL, 
			FEC_INF_BAJA DATETIME NULL, 
			FEC_PROC_BAJA DATETIME NULL, 
			FEC_ULTIMA_MOD_BAJA DATETIME NULL, 
			PZA_FECALTA DATETIME NULL, 
			PZA_NROSOL INT NOT NULL, 
			FECHACARGA DATETIME NOT NULL,
			FECHAACTUALIZACION DATETIME NOT NULL DEFAULT GETDATE()
		);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;

		INSERT INTO #FCT_SEGUROS
		(
		ID_CLIENTE, 
		PER_ID_PAIS, 
		PER_ID_TIPO_DOC, 
		PER_NRO_DOCUMENTO, 
		PZA_ESTADO, 
		PRO_DESCRIPCION, 
		TPR_DESCRIPCION, 
		BAJA_ACEPTADA, 
		COD_MOTIVO_BAJA, 
		DESC_MOTIVO_BAJA, 
		FEC_INF_BAJA, 
		FEC_PROC_BAJA, 
		FEC_ULTIMA_MOD_BAJA, 
		PZA_FECALTA, 
		PZA_NROSOL, 
		FECHACARGA
		)
		SELECT distinct 
			   ID_CLIENTE, PER_ID_PAIS, PER_ID_TIPO_DOC, PER_NRO_DOCUMENTO, PZA_ESTADO, PRO_DESCRIPCION, 
			   TPR_DESCRIPCION, BAJA_ACEPTADA, COD_MOTIVO_BAJA, DESC_MOTIVO_BAJA, FEC_INF_BAJA, FEC_PROC_BAJA, 
			   FEC_ULTIMA_MOD_BAJA, PZA_FECALTA, PZA_NROSOL, CTA_FEC_CARGA
		  FROM [sta].[sta_mse_padron_seguros] DP
		ORDER BY DP.id_cliente
		;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO DataMart.FCT_SEGUROS
		(ID_CLIENTE, 
		PER_ID_PAIS, 
		PER_ID_TIPO_DOC, 
		PER_NRO_DOCUMENTO, 
		PZA_ESTADO, 
		PRO_DESCRIPCION, 
		TPR_DESCRIPCION, 
		BAJA_ACEPTADA, 
		COD_MOTIVO_BAJA, 
		DESC_MOTIVO_BAJA, 
		FEC_INF_BAJA, 
		FEC_PROC_BAJA, 
		FEC_ULTIMA_MOD_BAJA, 
		PZA_FECALTA, 
		PZA_NROSOL, 
		FECHACARGA
		)
		SELECT ID_CLIENTE, 
		PER_ID_PAIS, 
		PER_ID_TIPO_DOC, 
		PER_NRO_DOCUMENTO, 
		PZA_ESTADO, 
		PRO_DESCRIPCION, 
		TPR_DESCRIPCION, 
		BAJA_ACEPTADA, 
		COD_MOTIVO_BAJA, 
		DESC_MOTIVO_BAJA, 
		FEC_INF_BAJA, 
		FEC_PROC_BAJA, 
		FEC_ULTIMA_MOD_BAJA, 
		PZA_FECALTA, 
		PZA_NROSOL, 
		FECHACARGA
		FROM #FCT_SEGUROS;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		DROP TABLE #FCT_SEGUROS;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------CARGA LOG FIN-----------------
		SET @FecFin = GETDATE();
		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @FecFin = GETDATE(), @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_FCT_TARJETASCREDITO]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_FCT_TARJETASCREDITO] @desde INT = 0, @hasta INT = 0, @Peri CHAR(1) = 'D' AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	DECLARE @Fecha_hasta DATE;
	
	SET @Fecha_hasta = CONVERT(DATE, CAST(@hasta AS CHAR(8)));
	SET @Tabla_origen = 'sta_dtc_tarjeta_credito';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'FCT_TARJETASCREDITO';
	SET @Esquema_destino = 'DataMart';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);

	-------------------CARGA LOG INICIO--------------  
	DECLARE @FecIni DATETIME, @FecFin DATETIME, @nivel SMALLINT, @Error VARCHAR(1000);
	SELECT @FecIni = GETDATE(), @nivel = 3;

	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			SET @FecFin = GETDATE();
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;
		--Si la tabla origen no esta vacia, se trunca la tabla destino
		ELSE
		BEGIN
			DECLARE @Truncar VARCHAR(128);
			SET @Truncar = 'TRUNCATE TABLE ' + @Destino + ';';
			EXEC(@Truncar);
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + @Origen + ' - Cantidad en el origen: ' + CAST(@STACant as VARCHAR);
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'CREACION DE TABLA TEMPORAL: #' + @Tabla_destino;

		CREATE TABLE #tcc_cliente_marca
		(
			[id_cliente] VARCHAR(18) NOT NULL,
			[tct_numero_tarjeta] VARCHAR(20) NOT NULL,
			[tcc_elegida_marca] TINYINT NOT NULL,
			[tcc_elegida_cliente] TINYINT NOT NULL,
			CONSTRAINT [TMP_TCC_MARCA_PK] PRIMARY KEY CLUSTERED ([id_cliente], [tct_numero_tarjeta])
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		);

		CREATE TABLE #estado_plasticos
		(
			[id_cliente] VARCHAR(18) NOT NULL,
			[tct_numero_tarjeta] VARCHAR(20) NOT NULL,
			[estado_final] VARCHAR (100) NULL,
			[sucursal_delivery] SMALLINT NULL,
			[fecha_estado] DATE NULL
			CONSTRAINT [TMP_PLASTICOS_PK] PRIMARY KEY CLUSTERED ([id_cliente], [tct_numero_tarjeta])
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		);

		CREATE NONCLUSTERED INDEX [IDX_TMP_PLASTICOS_PK] ON #estado_plasticos
		([id_cliente] ASC, [tct_numero_tarjeta] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		INSERT INTO #estado_plasticos (id_cliente, tct_numero_tarjeta, estado_final, fecha_estado, sucursal_delivery)
		SELECT DISTINCT id_cliente, tct_numero_tarjeta, estado_final, fecha_estado, sucursal_delivery
		FROM [sta].[sta_dcl_estado_plasticos_bm]
		WHERE per_fec_carga = (SELECT MAX(per_fec_carga) FROM [sta].[sta_dcl_estado_plasticos_bm])
		AND tct_numero_tarjeta IS NOT NULL;

		INSERT INTO #tcc_cliente_marca (id_cliente, tct_numero_tarjeta, tcc_elegida_marca, tcc_elegida_cliente)
		SELECT id_cliente, tct_numero_tarjeta,
		CASE WHEN ROW_NUMBER() OVER (PARTITION BY id_cliente, tcc_id_marca ORDER BY tcc_limite_compra DESC, Saldo_final DESC) > 1 THEN 0 ELSE 1 END as Orden_marca,
		CASE WHEN ROW_NUMBER() OVER (PARTITION BY id_cliente ORDER BY tcc_id_marca DESC) > 1 THEN 0 ELSE 1 END as Orden_cliente
		FROM ( 
		SELECT
			TC.id_cliente, TC.tct_numero_tarjeta, TC.tcc_id_marca, TC.tcc_limite_compra,
			EP.estado_final, TC.tcs_pes_saldo + TC.tcs_monto_compras_pes + TC.tcs_monto_cobranza_peri_pes AS Saldo_final
			FROM [sta].[sta_dtc_tarjeta_credito] TC
			LEFT JOIN #estado_plasticos EP
			ON TC.tct_numero_tarjeta = EP.tct_numero_tarjeta AND TC.id_cliente = EP.id_cliente
			WHERE TC.tcc_id_tipo <> 2 AND TC.tct_flg_titular = 1
			AND TC.tcc_id_estado = 1 AND TC.tct_id_estado = 1
			AND ((TC.tcs_pes_saldo + TC.tcs_monto_compras_pes + TC.tcs_monto_cobranza_peri_pes > 100) OR EP.estado_final = 'Entregada')
			AND TC.cta_fec_carga = @Fecha_hasta
		) SQ
		ORDER BY id_cliente, tct_numero_tarjeta;

		CREATE TABLE #sta_tarjeta_credito
		(
			[ID_CLIENTE] VARCHAR(18) NOT NULL,
			[CTA_ID_EMPRESA] TINYINT NOT NULL,
			[CTA_NUMERO] INTEGER NOT NULL,
			[OPE_ID_MODULO] SMALLINT NOT NULL,
			[OPE_ID_MONEDA] SMALLINT NOT NULL,
			[OPE_ID_PAPEL] SMALLINT NOT NULL,
			[OPE_ID_SUCURSAL] INTEGER NOT NULL,
			[OPE_OPERACION] INTEGER NOT NULL,
			[OPE_SUB_OPERACION] INTEGER NOT NULL,
			[OPE_ID_TIPO_OPERACION] SMALLINT NOT NULL,
			[TCT_NUMERO_TARJETA] VARCHAR(20) NOT NULL,
			[TCC_ID_TIPO] SMALLINT NOT NULL,
			[TCC_ID_MARCA] TINYINT NOT NULL,
			[TCC_MARCA] VARCHAR(50) NOT NULL,
			[TCC_ID_ESTADO] TINYINT NOT NULL,
			[TCT_ID_ESTADO] TINYINT NOT NULL,
			[TCT_FLG_TITULAR] TINYINT NOT NULL,
			[TCC_FECHA_VENCI] DATE NOT NULL,
			[TCC_LIMITE_COMPRA] NUMERIC(18,2) NOT NULL,
			[TCS_PES_SALDO] NUMERIC(18,2) NOT NULL,
			[TCS_MONTO_COMPRAS_PES] NUMERIC(18,2) NOT NULL,
			[TCX_FEC_ULT_COMPRA_PES] DATE NULL,
			[TCX_FEC_ULT_COMPRA_DOL] DATE NULL,
			[TCX_FEC_ULT_COMPRA] INTEGER NOT NULL,
			[TCS_MONTO_COBRANZA_PERI_PES] NUMERIC(18,2) NOT NULL,
			[TCT_ESTADO_DELIVERY] VARCHAR(100) NOT NULL,
			[TCC_FLG_ELEGIDA_CLIENTE_MARCA] TINYINT NOT NULL,
			[TCC_FLG_ELEGIDA_CLIENTE] TINYINT NOT NULL,
			[TCT_FECHA_ESTADO_DELIVERY] DATE NULL,
			[ID_SUCURSAL_DELIVERY] SMALLINT NULL,
			[TCC_ID_PRODUCTO] SMALLINT NULL,
			[TCC_PRODUCTO] VARCHAR(50) NULL,
			[TCC_COD_GRUPO_AFINIDAD] VARCHAR(15) NULL,
			[TCC_GRUPO_AFINIDAD] VARCHAR(50) NULL,
			[FECHACARGA] DATETIME NOT NULL,
			[FECHAACTUALIZACION] DATETIME NOT NULL,
			CONSTRAINT [TMP_FCT_TC_PK] PRIMARY KEY CLUSTERED
			([CTA_ID_EMPRESA], [CTA_NUMERO], [OPE_ID_MODULO], [OPE_ID_MONEDA], [OPE_ID_PAPEL], [OPE_ID_SUCURSAL],
			[OPE_OPERACION], [OPE_SUB_OPERACION], [OPE_ID_TIPO_OPERACION])
			WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		);

		CREATE NONCLUSTERED INDEX [IDX_FCT_TC] ON #sta_tarjeta_credito ([ID_CLIENTE] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'TRANSFORMACION DE NOVEDADES A #' + @Tabla_destino;

		INSERT INTO #sta_tarjeta_credito
		(ID_CLIENTE, CTA_ID_EMPRESA, CTA_NUMERO, OPE_ID_MODULO, OPE_ID_MONEDA, OPE_ID_PAPEL, OPE_ID_SUCURSAL, OPE_OPERACION, OPE_SUB_OPERACION, 
		OPE_ID_TIPO_OPERACION, TCT_NUMERO_TARJETA, TCC_ID_TIPO, TCC_ID_MARCA, TCC_MARCA, TCC_ID_ESTADO, TCT_ID_ESTADO, TCT_FLG_TITULAR,
		TCC_FECHA_VENCI, TCC_LIMITE_COMPRA, TCS_PES_SALDO, TCS_MONTO_COMPRAS_PES, TCX_FEC_ULT_COMPRA_PES, TCX_FEC_ULT_COMPRA_DOL, TCX_FEC_ULT_COMPRA,
		TCS_MONTO_COBRANZA_PERI_PES, TCT_ESTADO_DELIVERY, TCC_FLG_ELEGIDA_CLIENTE_MARCA, TCC_FLG_ELEGIDA_CLIENTE, TCT_FECHA_ESTADO_DELIVERY, 
		ID_SUCURSAL_DELIVERY, TCC_ID_PRODUCTO, TCC_PRODUCTO, TCC_COD_GRUPO_AFINIDAD, TCC_GRUPO_AFINIDAD, FECHACARGA, FECHAACTUALIZACION)
		SELECT
		TC.id_cliente, --Identificador de cliente
		TC.cta_id_empresa, --Utilizada como parte de la PK
		TC.cta_numero, --Nro Cuenta TC
		TC.ope_id_modulo, --Utilizada como parte de la PK
		TC.ope_id_moneda, --Utilizada como parte de la PK
		TC.ope_id_papel, --Utilizada como parte de la PK
		TC.ope_id_sucursal, --Sucursal TC
		TC.ope_operacion, --Utilizada como parte de la PK
		TC.ope_sub_operacion, --Utilizada como parte de la PK
		TC.ope_id_tipo_operacion, --Utilizada como parte de la PK
		TC.tct_numero_tarjeta, --Numero TC
		TC.tcc_id_tipo, --Tipo TC
		TC.tcc_id_marca, --Marca TC
		TC.tcc_marca, --Descripcion de marca de TC
		TC.tcc_id_estado, --Estado Cuenta TC
		TC.tct_id_estado, --Estado TC
		TC.tct_flg_titular, --Flag Titular TC
		TC.tcc_fecha_venci, --Fecha Vencimiento TC
		TC.tcc_limite_compra, --Limite TC
		TC.tcs_pes_saldo, --Saldo TC Pesos
		TC.tcs_monto_compras_pes, --Compras TC Pesos
		TC.tcx_fec_ult_compra_pes, --Ultima transaccion pesos
		TC.tcx_fec_ult_compra_dol, --Ultima transaccion dolares
		CASE
		WHEN TC.tcx_fec_ult_compra_dol IS NULL AND TC.tcx_fec_ult_compra_pes IS NULL THEN 99999
		WHEN COALESCE(TC.tcx_fec_ult_compra_pes, CONVERT(DATE, '19900101')) >= COALESCE(TC.tcx_fec_ult_compra_dol, CONVERT(DATE, '19900101')) THEN DATEDIFF(MONTH, TC.tcx_fec_ult_compra_pes, GETDATE())
		WHEN COALESCE(TC.tcx_fec_ult_compra_dol, CONVERT(DATE, '19900101')) > COALESCE(TC.tcx_fec_ult_compra_pes, CONVERT(DATE, '19900101')) THEN DATEDIFF(MONTH, TC.tcx_fec_ult_compra_dol, GETDATE())
		ELSE 99999 END as tcx_fec_ult_compra, --Meses Ultima Actividad TC
		TC.tcs_monto_cobranza_peri_pes, --Cobranza TC Pesos
		COALESCE(EP.estado_final, 'Sin datos') as tct_estado_delivery, --Estado Delivery TC
		COALESCE(ECM.tcc_elegida_marca, 0) as tcc_flg_elegida_cliente_marca, --TC Elegida Por Marca
		COALESCE(ECM.tcc_elegida_cliente, 0) as tcc_flg_elegida_cliente, --TC Elegida Por cliente
		EP.fecha_estado as TCT_FECHA_ESTADO_DELIVERY, --Fecha Estado Delivery TC: Adicion del Sprint 4
		EP.sucursal_delivery as ID_SUCURSAL_DELIVERY, --Id Sucursal Delivery TC: Adicion del Sprint 4
		TC.tcc_id_producto, --Tarjeta Producto ID (Id del "color" de la tarjeta): Adicion del Sprint 5
		TC.tcc_producto, --Tarjeta Producto Desc (Id del "color" de la tarjeta): Adicion del Sprint 5
		TC.tcc_cod_grupo_afinidad, --Codigo Grupo Afinidad: Adicion del Sprint 5
		TC.tcc_grupo_afinidad, --Grupo Afinidad: Adicion del Sprint 5
		cta_fec_carga as fechacarga, GETDATE() as FechaActualizacion
		FROM [sta].[sta_dtc_tarjeta_credito] TC
		LEFT JOIN #estado_plasticos EP
		ON TC.id_cliente = EP.id_cliente AND TC.tct_numero_tarjeta = EP.tct_numero_tarjeta
		LEFT JOIN #tcc_cliente_marca ECM
		ON TC.id_cliente = ECM.id_cliente AND TC.tct_numero_tarjeta = ECM.tct_numero_tarjeta
		WHERE TC.tcc_id_estado <> 4 AND TC.tct_id_estado <> 4
		AND TC.cta_fec_carga = @Fecha_hasta
		ORDER BY TC.id_cliente;
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		INSERT INTO [DataMart].[FCT_TARJETASCREDITO]
		(ID_CLIENTE, CTA_ID_EMPRESA, CTA_NUMERO, OPE_ID_MODULO, OPE_ID_MONEDA, OPE_ID_PAPEL, OPE_ID_SUCURSAL, OPE_OPERACION, OPE_SUB_OPERACION, 
		OPE_ID_TIPO_OPERACION, TCT_NUMERO_TARJETA, TCC_ID_TIPO, TCC_ID_MARCA, TCC_MARCA, TCC_ID_ESTADO, TCT_ID_ESTADO, TCT_FLG_TITULAR,
		TCC_FECHA_VENCI, TCC_LIMITE_COMPRA, TCS_PES_SALDO, TCS_MONTO_COMPRAS_PES, TCX_FEC_ULT_COMPRA_PES, TCX_FEC_ULT_COMPRA_DOL, TCX_FEC_ULT_COMPRA,
		TCS_MONTO_COBRANZA_PERI_PES, TCT_ESTADO_DELIVERY, TCC_FLG_ELEGIDA_CLIENTE_MARCA, TCC_FLG_ELEGIDA_CLIENTE, TCT_FECHA_ESTADO_DELIVERY,
		ID_SUCURSAL_DELIVERY, TCC_ID_PRODUCTO, TCC_PRODUCTO, TCC_COD_GRUPO_AFINIDAD, TCC_GRUPO_AFINIDAD, FECHACARGA, FECHAACTUALIZACION)
		SELECT ID_CLIENTE, CTA_ID_EMPRESA, CTA_NUMERO, OPE_ID_MODULO, OPE_ID_MONEDA, OPE_ID_PAPEL, OPE_ID_SUCURSAL, OPE_OPERACION, OPE_SUB_OPERACION, 
		OPE_ID_TIPO_OPERACION, TCT_NUMERO_TARJETA, TCC_ID_TIPO, TCC_ID_MARCA, TCC_MARCA, TCC_ID_ESTADO, TCT_ID_ESTADO, TCT_FLG_TITULAR,
		TCC_FECHA_VENCI, TCC_LIMITE_COMPRA, TCS_PES_SALDO, TCS_MONTO_COMPRAS_PES, TCX_FEC_ULT_COMPRA_PES, TCX_FEC_ULT_COMPRA_DOL, TCX_FEC_ULT_COMPRA,
		TCS_MONTO_COBRANZA_PERI_PES, TCT_ESTADO_DELIVERY, TCC_FLG_ELEGIDA_CLIENTE_MARCA, TCC_FLG_ELEGIDA_CLIENTE, TCT_FECHA_ESTADO_DELIVERY,
		ID_SUCURSAL_DELIVERY, TCC_ID_PRODUCTO, TCC_PRODUCTO, TCC_COD_GRUPO_AFINIDAD, TCC_GRUPO_AFINIDAD, FECHACARGA, FECHAACTUALIZACION
		FROM #sta_tarjeta_credito;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		
		DROP TABLE #tcc_cliente_marca;
		DROP TABLE #sta_tarjeta_credito;
		DROP TABLE #estado_plasticos;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		-------------------CARGA LOG FIN-----------------
		SET @FecFin = GETDATE();
		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		SELECT @FecFin = GETDATE(), @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		-------------------------------------------------  
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
	END CATCH;
END

GO
/****** Object:  StoredProcedure [DataMart].[LDR_HISTORICO_RESPUESTAS]    Script Date: 27/7/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DataMart].[LDR_HISTORICO_RESPUESTAS] AS
BEGIN

	DECLARE @Tabla_origen VARCHAR(32);
	DECLARE @Esquema_origen VARCHAR(32);
	DECLARE @Tabla_destino VARCHAR(32);
	DECLARE @Esquema_destino VARCHAR(32);
	DECLARE @Origen VARCHAR(65);
	DECLARE @Destino VARCHAR(65);
	DECLARE @Nombre_archivo VARCHAR(128);
	DECLARE @Directorio VARCHAR(300);
	DECLARE @Cantidad_registros INTEGER;
	DECLARE @Novedades INTEGER;
	DECLARE @Actualizaciones INTEGER;
	DECLARE @Error VARCHAR(1000);

	SET @Tabla_origen = 'sta_historico_respuestas';
	SET @Esquema_origen = 'sta';
	SET @Tabla_destino = 'HISTORICO_RESPUESTAS';
	SET @Esquema_destino = 'Auxiliar';

	SET @Origen = UPPER(@Esquema_origen) + '.' + UPPER(@Tabla_origen);
	SET @Destino = UPPER(@Esquema_destino) + '.' + UPPER(@Tabla_destino);
	SET @Nombre_archivo = (SELECT TOP 1 archivo FROM [sta].[sta_historico_respuestas]);
	SET @Directorio = (SELECT TOP 1 directorio FROM [sta].[sta_historico_respuestas]);

	-------------------CARGA LOG INICIO--------------  
	BEGIN TRY  
		SET NOCOUNT ON;

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'INICIO DE PROCESO - Carga de datos: ' + @Destino + '.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'No aplica la validacion de fechas para este proceso';
		---------------------------------------------------------------------------------------  
		-- Validacion de cantidades 
		---------------------------------------------------------------------------------------  

		DECLARE @STACant INTEGER;
		DECLARE @Filtro VARCHAR(55);
		DECLARE @Validacion NVARCHAR(256);

		SET @Validacion = 'SELECT @Cantidad=COUNT(*) FROM ' + @Origen;
		EXECUTE sp_executesql @Validacion, N'@Cantidad int output', @Cantidad = @STACant OUTPUT;

		--Si la tabla origen esta vacia, finaliza el proceso ya que no hay registros para transportar
		IF @STACant = 0
		BEGIN
			PRINT 'Tabla ' + @Origen + ' vacia.';
			PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO - ' + CONVERT(VARCHAR, GETDATE(), 114);
			RETURN 0;
		END;

		---------------------------------------------------------------------------------------  
		-- Transformacion de datos del origen al temporal
		---------------------------------------------------------------------------------------  
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Proceso de UPSERT del Historico de Respuestas: #' + @Tabla_destino;

		--Genero tabla temporal para controlar posibles duplicados (del registro completo) recibidos directamente en el archivo de devoluciones.
		IF OBJECT_ID('tempdb..#sta_historico_respuestas') IS NOT NULL BEGIN DROP TABLE #sta_historico_respuestas END
		SELECT
			ID_CLIENTE, ID_TIPO_DOCUMENTO, NRO_DOCUMENTO, ID_CAMPANIA, TELEFONO, TELEFONO_ERRONEO, DIA_CONTACTO_INICIO, DIA_CONTACTO_FIN,
			TIPO_DE_GESTION, GESTION, MOTIVO_GESTION, GESTION_DE_CIERRE, MULTIPLE_OFERTA, PRODUCTO, MAX(OBSERVACIONES) OBSERVACIONES, CODIGO_OPERADOR,
			NOMBRE_OPERADOR, TELEFONO_ENRIQUECIDO, MAIL_ENRIQUECIDO, CELULAR_ENRIQUECIDO, CANAL, SHOT, CUIL, CAMPANIA, MAIL, ESTADO_MAIL,
			ID_PAIS_DOC, DIRECTORIO, ARCHIVO, MAX(FECHA_CARGA) FECHA_CARGA, MAX(FECHA_ACTUALIZACION) FECHA_ACTUALIZACION
		INTO #sta_historico_respuestas
		FROM [sta].[sta_historico_respuestas]
		GROUP BY
			ID_CLIENTE, ID_TIPO_DOCUMENTO, NRO_DOCUMENTO, ID_CAMPANIA, TELEFONO, TELEFONO_ERRONEO, DIA_CONTACTO_INICIO, DIA_CONTACTO_FIN,
			TIPO_DE_GESTION, GESTION, MOTIVO_GESTION, GESTION_DE_CIERRE, MULTIPLE_OFERTA, PRODUCTO, CODIGO_OPERADOR,
			NOMBRE_OPERADOR, TELEFONO_ENRIQUECIDO, MAIL_ENRIQUECIDO, CELULAR_ENRIQUECIDO, CANAL, SHOT, CUIL, CAMPANIA, MAIL, ESTADO_MAIL,
			ID_PAIS_DOC, DIRECTORIO, ARCHIVO;

		--Conteo de datos coincidentes (para reprocesos)
		SET @Actualizaciones = ISNULL((
			SELECT COUNT(*)
			FROM [Auxiliar].[HISTORICO_RESPUESTAS] HR
			INNER JOIN #sta_historico_respuestas SH
			ON		SH.ID_CLIENTE = HR.ID_CLIENTE AND SH.ID_CAMPANIA = HR.ID_CAMPANIA
				AND SH.DIA_CONTACTO_INICIO = HR.DIA_CONTACTO_INICIO AND SH.DIA_CONTACTO_FIN = HR.DIA_CONTACTO_FIN
				AND SH.TIPO_DE_GESTION = HR.TIPO_DE_GESTION AND SH.GESTION = HR.GESTION AND SH.PRODUCTO = HR.PRODUCTO
			), 0);
		
		--Conteo de novedades
		SET @Novedades = ISNULL((
			SELECT COUNT(*)
			FROM #sta_historico_respuestas SH
			LEFT JOIN [Auxiliar].[HISTORICO_RESPUESTAS] HR
			ON		SH.ID_CLIENTE = HR.ID_CLIENTE AND SH.ID_CAMPANIA = HR.ID_CAMPANIA
				AND SH.DIA_CONTACTO_INICIO = HR.DIA_CONTACTO_INICIO AND SH.DIA_CONTACTO_FIN = HR.DIA_CONTACTO_FIN
				AND SH.TIPO_DE_GESTION = HR.TIPO_DE_GESTION AND SH.GESTION = HR.GESTION AND SH.PRODUCTO = HR.PRODUCTO
			WHERE HR.ID_CLIENTE IS NULL AND HR.ID_CAMPANIA IS NULL AND HR.DIA_CONTACTO_FIN IS NULL AND HR.TIPO_DE_GESTION IS NULL
			), 0);
		
		--Sentencia de UPDATE/INSERT del Historico de Respuestas
		MERGE INTO [Auxiliar].[HISTORICO_RESPUESTAS] HR
		USING #sta_historico_respuestas SH
		ON		SH.ID_CLIENTE = HR.ID_CLIENTE AND SH.ID_CAMPANIA = HR.ID_CAMPANIA
			AND SH.DIA_CONTACTO_INICIO = HR.DIA_CONTACTO_INICIO AND SH.DIA_CONTACTO_FIN = HR.DIA_CONTACTO_FIN
			AND SH.TIPO_DE_GESTION = HR.TIPO_DE_GESTION AND SH.GESTION = HR.GESTION AND SH.PRODUCTO = HR.PRODUCTO
		WHEN MATCHED THEN UPDATE
		SET TELEFONO = SH.telefono, TELEFONO_ERRONEO = SH.telefono_erroneo,
		MOTIVO_GESTION = SH.motivo_gestion, GESTION_DE_CIERRE = SH.gestion_de_cierre, MULTIPLE_OFERTA = SH.multiple_oferta,
		OBSERVACIONES = SH.observaciones, CODIGO_OPERADOR = SH.codigo_operador, NOMBRE_OPERADOR = SH.nombre_operador,
		TELEFONO_ENRIQUECIDO = SH.telefono_enriquecido, MAIL_ENRIQUECIDO = SH.mail_enriquecido, CELULAR_ENRIQUECIDO = SH.celular_enriquecido,
		CANAL = SH.canal, SHOT = SH.shot, CUIL = SH.cuil, CAMPANIA = SH.campania, MAIL = SH.mail, ESTADO_MAIL = SH.estado_mail, DIRECTORIO = SH.directorio,
		ARCHIVO = SH.archivo, FECHA_CARGA = SH.fecha_carga, FECHA_ACTUALIZACION = GETDATE()
		WHEN NOT MATCHED THEN INSERT
		(ID_CLIENTE, ID_TIPO_DOCUMENTO, NRO_DOCUMENTO, ID_CAMPANIA, TELEFONO, TELEFONO_ERRONEO, DIA_CONTACTO_INICIO, DIA_CONTACTO_FIN, TIPO_DE_GESTION, 
		GESTION, MOTIVO_GESTION, GESTION_DE_CIERRE, MULTIPLE_OFERTA, PRODUCTO, OBSERVACIONES, CODIGO_OPERADOR, NOMBRE_OPERADOR, TELEFONO_ENRIQUECIDO, 
		MAIL_ENRIQUECIDO, CELULAR_ENRIQUECIDO, CANAL, SHOT, CUIL, CAMPANIA, MAIL, ESTADO_MAIL, ID_PAIS_DOC, DIRECTORIO, ARCHIVO, FECHA_CARGA, 
		FECHA_ACTUALIZACION)
		VALUES (id_cliente, id_tipo_documento, nro_documento, id_campania, telefono, telefono_erroneo, dia_contacto_inicio, 
		dia_contacto_fin, tipo_de_gestion, gestion, motivo_gestion, gestion_de_cierre, multiple_oferta, producto, observaciones, 
		codigo_operador, nombre_operador, telefono_enriquecido, mail_enriquecido, celular_enriquecido, canal, shot, cuil, 
		campania, mail, estado_mail, id_pais_doc, directorio, archivo, fecha_carga, NULL);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';

		---------------------------------------------------------------------------------------  
		-- Carga final de datos a tabla fisica
		---------------------------------------------------------------------------------------
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Carga de tabla definitiva ' + @Destino;

		SET @Cantidad_registros = ISNULL((SELECT COUNT(*) FROM #sta_historico_respuestas), 0);

		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Novedades: ' + CONVERT(VARCHAR, @Novedades);
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Actualizaciones: ' + CONVERT(VARCHAR, @Actualizaciones);
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Finalizado: ' + CONVERT(VARCHAR, @@rowcount) + ' registros cargados.';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'Actualizando estado en [Auxiliar].[LOG_FILE_LOAD]';

		UPDATE [Auxiliar].[LOG_FILE_LOAD]
		SET registros_cargados = @Cantidad_registros, estado = 4
		WHERE directorio = @Directorio and archivo = @Nombre_archivo
		AND fecha_carga = (SELECT MAX(fecha_carga) FROM [Auxiliar].[LOG_FILE_LOAD] WHERE directorio = @Directorio and archivo = @Nombre_archivo);
		
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + 'FIN DEL PROCESO'
		PRINT '--------------------------------------------------------------------------------------------';

		SELECT 0 AS RESULTADO;

		-------------------------------------------------
	END TRY
	BEGIN CATCH
		-------------------CARGA LOG ERROR---------------
		-------------------------------------------------  
		SELECT @Error = 'Nro:' + CONVERT(VARCHAR,ERROR_NUMBER()) + ' - ' + ERROR_MESSAGE();
		PRINT '############################################################################################';
		PRINT CAST(CONVERT(VARCHAR, GETDATE(), 20) AS VARCHAR(19)) + ' - ' + '!!!! PROCESO FINALIZADO CON ERROR !!!!'
		PRINT @Error;
		PRINT '############################################################################################';
		
		UPDATE [Auxiliar].[LOG_FILE_LOAD]
		SET estado = 5
		WHERE directorio = @Directorio AND archivo = @Nombre_archivo
		AND fecha_carga = (SELECT MAX(fecha_carga) FROM [Auxiliar].[LOG_FILE_LOAD]);

		IF ERROR_NUMBER() = 8672
		BEGIN;
			SELECT 5 AS RESULTADO;
		END;

		--RAISERROR ('Error', 16, 1);

	END CATCH;
END
GO
