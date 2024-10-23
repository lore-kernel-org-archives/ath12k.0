Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE6AD2E00B
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 02:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL6IYeFWgaVV3W6xaqmJrMZz9KgPQlfAXZxly+CArCo=; b=1Kg1ljaiO+CxCyqk11i10i+7+4
	hzICPE7TSLIfE7PldbkcELx27h7xCIPu1u04EqqaexOoUsYwuPuc/8YbA1IVzDv2am77IjZrZNX/E
	s1CAra8TbpiS8u9FytW7jhAmESWvKvyC2i7ehrlnNu5/OVJkqnAGhLKS6Qd+PtnP2RhhRVa+NVVQR
	WcZogqUB9pxjV/bTd+FTUS2kZa9i2C/xn/lSgwm8LRHn9uOhJlY4q+Xjor60j9Zxcx4cWhUo00gIL
	9w7NSeHOyOZx47Eb8yw9WSGklnSmkUvV8V26wNB7p+wKAR4i38Qi2JKmQD1sYPrnVbP3fuEjt5mBr
	aBHuklyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3RQE-0000000CkRL-0eby
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 02:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ROv-0000000Ck9y-12vW
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 02:47:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLfH5u020080;
	Wed, 23 Oct 2024 02:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AL6IYeFWgaVV3W6xaqmJrMZz9KgPQlfAXZxly+CArCo=; b=pcuCH933FwLmN77C
	xZuXW5KT0NeS5wJJ/5vIqvKl2jPqy0JmVYxczR4ZFoliu6DIpW2UQjQokzWOgoii
	WKOPY2Sr40Vilnoazfo/IhEaCW0rV3CcBNKvfLCCfnU89H8wJXvDtCUVMcGtrFQm
	WdiMA19uQvM5ezaO867UUsMzxhz4rSp7f9empGd+XmPlbGZhIZn1h1jlOBe3DdHO
	LIseX+otsA9bOPINHjMkzONF94RQReNOjRB3HzLPyeSvxfC1v18Yfomkes00JN3/
	qGMlSjQ9yHztMuGYtOKlYLxpz/0Ynd1BfFOs0awj9PlM6f1NKOEad3njrpkxyWcS
	A8t57A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em668kh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N2l8Vo019222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:08 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 19:47:06 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v3 2/4] wifi: ath12k: Add Support for enabling or disabling specific features based on ACPI bitflag
Date: Wed, 23 Oct 2024 10:45:49 +0800
Message-ID: <20241023024551.18966-3-quic_lingbok@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JFPab4g83x0GmIlLj2hAcSyuY2Pc_wTs
X-Proofpoint-GUID: JFPab4g83x0GmIlLj2hAcSyuY2Pc_wTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_194709_403568_EE79ED5A 
X-CRM114-Status: GOOD (  20.81  )
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

Currently, ath12k does not support enable or disable specific features by
ACPI bitflag.

To address this issue, obtain the ACPI bitflag value and use it to
selectively enable or disable specific features.

This patch will not affect QCN9274, because only WCN7850 supports ACPI.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v3:
1.change some function name

v2:
1.support functions for cases where CONFIG_ACPI is disabled

 drivers/net/wireless/ath/ath12k/acpi.c | 41 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/acpi.h | 18 +++++++++++
 drivers/net/wireless/ath/ath12k/core.c |  3 ++
 drivers/net/wireless/ath/ath12k/core.h |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c  |  3 +-
 5 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index d83f7e58fb7a..0e9ce13e6919 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -29,7 +29,14 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 	}
 
 	if (obj->type == ACPI_TYPE_INTEGER) {
-		ab->acpi.func_bit = obj->integer.value;
+		switch (func) {
+		case ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS:
+			ab->acpi.func_bit = obj->integer.value;
+			break;
+		case ATH12K_ACPI_DSM_FUNC_DISABLE_FLAG:
+			ab->acpi.bit_flag = obj->integer.value;
+			break;
+		}
 	} else if (obj->type == ACPI_TYPE_BUFFER) {
 		switch (func) {
 		case ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS:
@@ -261,24 +268,52 @@ static int ath12k_acpi_set_tas_params(struct ath12k_base *ab)
 	return 0;
 }
 
+bool ath12k_acpi_rfkill_disabled(struct ath12k_base *ab)
+{
+	return ab->acpi.acpi_disable_rfkill;
+}
+
+bool ath12k_acpi_11be_disabled(struct ath12k_base *ab)
+{
+	return ab->acpi.acpi_disable_11be;
+}
+
 int ath12k_acpi_start(struct ath12k_base *ab)
 {
 	acpi_status status;
 	u8 *buf;
 	int ret;
 
+	ab->acpi.acpi_tas_enable = false;
+	ab->acpi.acpi_disable_11be = false;
+	ab->acpi.acpi_disable_rfkill = false;
+
 	if (!ab->hw_params->acpi_guid)
 		/* not supported with this hardware */
 		return 0;
 
-	ab->acpi.acpi_tas_enable = false;
-
 	ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS);
 	if (ret) {
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "failed to get ACPI DSM data: %d\n", ret);
 		return ret;
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_DISABLE_FLAG)) {
+		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_DISABLE_FLAG);
+		if (ret) {
+			ath12k_warn(ab, "failed to get ACPI DISABLE FLAG: %d\n", ret);
+			return ret;
+		}
+
+		if (ATH12K_ACPI_CHEK_BIT_VALID(ab->acpi,
+					       ATH12K_ACPI_DSM_DISABLE_11BE_BIT))
+			ab->acpi.acpi_disable_11be = true;
+
+		if (!ATH12K_ACPI_CHEK_BIT_VALID(ab->acpi,
+						ATH12K_ACPI_DSM_DISABLE_RFKILL_BIT))
+			ab->acpi.acpi_disable_rfkill = true;
+	}
+
 	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_TAS_CFG)) {
 		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_TAS_CFG);
 		if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 7ec7a2e72e40..67e0b429af30 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 
 #define ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS	0
+#define ATH12K_ACPI_DSM_FUNC_DISABLE_FLAG	2
 #define ATH12K_ACPI_DSM_FUNC_BIOS_SAR		4
 #define ATH12K_ACPI_DSM_FUNC_GEO_OFFSET		5
 #define ATH12K_ACPI_DSM_FUNC_INDEX_CCA		6
@@ -16,6 +17,7 @@
 #define ATH12K_ACPI_DSM_FUNC_TAS_DATA		9
 #define ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE		10
 
+#define ATH12K_ACPI_FUNC_BIT_DISABLE_FLAG		BIT(1)
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
 #define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
@@ -25,6 +27,7 @@
 
 #define ATH12K_ACPI_NOTIFY_EVENT			0x86
 #define ATH12K_ACPI_FUNC_BIT_VALID(_acdata, _func)	(((_acdata).func_bit) & (_func))
+#define ATH12K_ACPI_CHEK_BIT_VALID(_acdata, _func)	(((_acdata).bit_flag) & (_func))
 
 #define ATH12K_ACPI_TAS_DATA_VERSION		0x1
 #define ATH12K_ACPI_TAS_DATA_ENABLE		0x1
@@ -51,6 +54,9 @@
 #define ATH12K_ACPI_DSM_FUNC_MIN_BITMAP_SIZE	1
 #define ATH12K_ACPI_DSM_FUNC_MAX_BITMAP_SIZE	4
 
+#define ATH12K_ACPI_DSM_DISABLE_11BE_BIT	BIT(0)
+#define ATH12K_ACPI_DSM_DISABLE_RFKILL_BIT	BIT(2)
+
 #define ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE (ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET + \
 					      ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN)
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE (ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET + \
@@ -62,6 +68,8 @@
 
 int ath12k_acpi_start(struct ath12k_base *ab);
 void ath12k_acpi_stop(struct ath12k_base *ab);
+bool ath12k_acpi_rfkill_disabled(struct ath12k_base *ab);
+bool ath12k_acpi_11be_disabled(struct ath12k_base *ab);
 
 #else
 
@@ -74,6 +82,16 @@ static inline void ath12k_acpi_stop(struct ath12k_base *ab)
 {
 }
 
+static inline bool ath12k_acpi_rfkill_disabled(struct ath12k_base *ab)
+{
+	return false;
+}
+
+static inline bool ath12k_acpi_11be_disabled(struct ath12k_base *ab)
+{
+	return false;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /* ATH12K_ACPI_H */
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index c57322221e1d..3629457650f3 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -30,6 +30,9 @@ static int ath12k_core_rfkill_config(struct ath12k_base *ab)
 	if (!(ab->target_caps.sys_cap_info & WMI_SYS_CAP_INFO_RFKILL))
 		return 0;
 
+	if (ath12k_acpi_rfkill_disabled(ab))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		ar = ab->pdevs[i].ar;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 06b637ba8b8f..1348768ffe71 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -973,6 +973,9 @@ struct ath12k_base {
 		u32 func_bit;
 		bool acpi_tas_enable;
 		bool acpi_bios_sar_enable;
+		bool acpi_disable_11be;
+		bool acpi_disable_rfkill;
+		u32 bit_flag;
 		u8 tas_cfg[ATH12K_ACPI_DSM_TAS_CFG_SIZE];
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f5f96a8b1d61..c638c06a8c1f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5891,7 +5891,8 @@ static void ath12k_mac_copy_eht_cap(struct ath12k *ar,
 
 	memset(eht_cap, 0, sizeof(struct ieee80211_sta_eht_cap));
 
-	if (!(test_bit(WMI_TLV_SERVICE_11BE, ar->ab->wmi_ab.svc_map)))
+	if (!(test_bit(WMI_TLV_SERVICE_11BE, ar->ab->wmi_ab.svc_map)) ||
+	    ath12k_acpi_11be_disabled(ar->ab))
 		return;
 
 	eht_cap->has_eht = true;
-- 
2.34.1


