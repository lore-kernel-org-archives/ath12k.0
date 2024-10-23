Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0389D2E00D
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 02:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1q3hbeEBrFTRdwCTh5/Oi9TjNG3wPlYxPJBQAnQcp4=; b=TTr07pIeBwg/0NhqMZ6LxYZwyx
	/1Vlalw47Fxrr68RqpXb6CaEAaPVX5jg6BjOJEGGZU4WGCWuC7S9RAZO/MQCoHp1p+X+Jhvcyj27f
	ie1mBYq1aNDlbDoHsbSFQEtPG0ZCq/UFLn8vJILiFQ+vDN9eqRp41u0LMuw8okefAW7+S2oV5C/D7
	sfu/rZ5IYS7HXic5sSHY5UYEooeM0JUsRJoaRKeJsfqFAxwNqTFWncE6ylzhBDVmiiIyOhcJSeE2K
	gB+Lpcluo2e+v4DyOMHivx4ZnL2NO69Rsb7HESFjEJpF9xqu6rMPS2jMAc1hNTIAs6yEBdbG/zkPP
	5aqp7Kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3RQF-0000000CkS7-0isQ
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 02:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ROy-0000000CkAy-0ms2
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 02:47:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLa3E2025435;
	Wed, 23 Oct 2024 02:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1q3hbeEBrFTRdwCTh5/Oi9TjNG3wPlYxPJBQAnQcp4=; b=SpRbPj1rV8fP50Yl
	RBwDVbVhLqSwe0MJ1BjtFpMyi2S1dosDUPAe3vh6I2bkB4WQuvblDto1J7lgQ/VS
	X3u1pQfRxztLH2O7gFs6wQ55K3kz66wc/D9yFwRsbAgRiqOMs8rLufz2vlF+7a7R
	D5jTBnyhWiWvdxO/GiRDoin5z0MuxZp7v1b/WSwp8p2fUsMsVYoDWvG443GhUvlO
	eP74/91gTxmUDsLkxuQ2q1MKt/Nul2yCvd3SexSeYtLsPcYfpI3YJHwPbedRlZLY
	LVlvxgW00bf46xkWcV9oh3H6emV2mxeLvR9Lmf6raiTJ84acmSyo5ewIJT+uxObW
	twWXDg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em408kpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N2lAFn009179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:11 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 19:47:09 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v3 4/4] wifi: ath12k: Add support for reading variant from ACPI to download board data file
Date: Wed, 23 Oct 2024 10:45:51 +0800
Message-ID: <20241023024551.18966-5-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023024551.18966-1-quic_lingbok@quicinc.com>
References: <20241023024551.18966-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k4TNWsAiJuTJsuLwZ-Xpxprd6nIyezww
X-Proofpoint-GUID: k4TNWsAiJuTJsuLwZ-Xpxprd6nIyezww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_194712_262353_130EEFDE 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, ath12k does not support reading variant from ACPI board data
filename extension for downloading board data file.

To address this issue, obtain the string of the ACPI data filename
extension and use it as part of the string to search for the board data
file from board-2.bin.

This patch will not affect QCN9274, because only WCN7850 supports ACPI.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v3:
no change

v2:
1.support functions for cases where CONFIG_ACPI is disabled

 drivers/net/wireless/ath/ath12k/acpi.c | 45 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h | 12 +++++++
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 +++
 4 files changed, 63 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index 9dfe6c261c02..8234359e26e5 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -37,6 +37,24 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 			ab->acpi.bit_flag = obj->integer.value;
 			break;
 		}
+	} else if (obj->type == ACPI_TYPE_STRING) {
+		switch (func) {
+		case ATH12K_ACPI_DSM_FUNC_BDF_EXT:
+			if (obj->string.length <= ATH12K_ACPI_BDF_ANCHOR_STRING_LEN ||
+			    obj->string.length > ATH12K_ACPI_BDF_MAX_LEN ||
+			    memcmp(obj->string.pointer, ATH12K_ACPI_BDF_ANCHOR_STRING,
+				   ATH12K_ACPI_BDF_ANCHOR_STRING_LEN)) {
+				ath12k_warn(ab, "invalid ACPI DSM BDF size: %d\n",
+					    obj->string.length);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			memcpy(ab->acpi.bdf_string, obj->string.pointer,
+			       obj->buffer.length);
+
+			break;
+		}
 	} else if (obj->type == ACPI_TYPE_BUFFER) {
 		switch (func) {
 		case ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS:
@@ -341,6 +359,8 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 	ab->acpi.acpi_bios_sar_enable = false;
 	ab->acpi.acpi_cca_enable = false;
 	ab->acpi.acpi_band_edge_enable = false;
+	ab->acpi.acpi_enable_bdf = false;
+	ab->acpi.bdf_string[0] = '\0';
 
 	if (!ab->hw_params->acpi_guid)
 		/* not supported with this hardware */
@@ -368,6 +388,16 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 			ab->acpi.acpi_disable_rfkill = true;
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_BDF_EXT)) {
+		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_BDF_EXT);
+		if (ret || ab->acpi.bdf_string[0] == '\0') {
+			ath12k_warn(ab, "failed to get ACPI BDF EXT: %d\n", ret);
+			return ret;
+		}
+
+		ab->acpi.acpi_enable_bdf = true;
+	}
+
 	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_TAS_CFG)) {
 		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_TAS_CFG);
 		if (ret) {
@@ -452,6 +482,21 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 	return 0;
 }
 
+int ath12k_acpi_check_bdf_variant_name(struct ath12k_base *ab)
+{
+	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
+
+	if (!ab->acpi.acpi_enable_bdf)
+		return -ENODATA;
+
+	if (strscpy(ab->qmi.target.bdf_ext, ab->acpi.bdf_string + 4, max_len) < 0)
+		ath12k_dbg(ab, ATH12K_DBG_BOOT,
+			   "acpi bdf variant longer than the buffer (variant: %s)\n",
+			   ab->acpi.bdf_string);
+
+	return 0;
+}
+
 void ath12k_acpi_stop(struct ath12k_base *ab)
 {
 	if (!ab->acpi.started)
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 0ea022a58daa..de2abd5f988f 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -10,6 +10,7 @@
 
 #define ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS	0
 #define ATH12K_ACPI_DSM_FUNC_DISABLE_FLAG	2
+#define ATH12K_ACPI_DSM_FUNC_BDF_EXT		3
 #define ATH12K_ACPI_DSM_FUNC_BIOS_SAR		4
 #define ATH12K_ACPI_DSM_FUNC_GEO_OFFSET		5
 #define ATH12K_ACPI_DSM_FUNC_INDEX_CCA		6
@@ -18,6 +19,7 @@
 #define ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE		10
 
 #define ATH12K_ACPI_FUNC_BIT_DISABLE_FLAG		BIT(1)
+#define ATH12K_ACPI_FUNC_BIT_BDF_EXT			BIT(2)
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
 #define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
@@ -57,6 +59,10 @@
 #define ATH12K_ACPI_DSM_DISABLE_11BE_BIT	BIT(0)
 #define ATH12K_ACPI_DSM_DISABLE_RFKILL_BIT	BIT(2)
 
+#define ATH12K_ACPI_BDF_ANCHOR_STRING_LEN	3
+#define ATH12K_ACPI_BDF_ANCHOR_STRING		"BDF"
+#define ATH12K_ACPI_BDF_MAX_LEN			100
+
 #define ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE (ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET + \
 					      ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN)
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE (ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET + \
@@ -71,6 +77,7 @@ void ath12k_acpi_stop(struct ath12k_base *ab);
 bool ath12k_acpi_rfkill_disabled(struct ath12k_base *ab);
 bool ath12k_acpi_11be_disabled(struct ath12k_base *ab);
 void ath12k_acpi_set_dsm_func(struct ath12k_base *ab);
+int ath12k_acpi_check_bdf_variant_name(struct ath12k_base *ab);
 
 #else
 
@@ -97,6 +104,11 @@ static inline void ath12k_acpi_set_dsm_func(struct ath12k_base *ab)
 {
 }
 
+static inline int ath12k_acpi_check_bdf_variant_name(struct ath12k_base *ab)
+{
+	return 0;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /* ATH12K_ACPI_H */
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ae730241e8fb..e8a7314fafce 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -977,7 +977,9 @@ struct ath12k_base {
 		bool acpi_disable_rfkill;
 		bool acpi_cca_enable;
 		bool acpi_band_edge_enable;
+		bool acpi_enable_bdf;
 		u32 bit_flag;
+		char bdf_string[ATH12K_ACPI_BDF_MAX_LEN];
 		u8 tas_cfg[ATH12K_ACPI_DSM_TAS_CFG_SIZE];
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 6e5ec4ed533f..c789a3e5d566 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2532,6 +2532,10 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 		/* ACPI is optional so continue in case of an error */
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", r);
 
+	r = ath12k_acpi_check_bdf_variant_name(ab);
+	if (r)
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "ACPI bdf variant name not set.\n");
+
 out:
 	return ret;
 }
-- 
2.34.1


