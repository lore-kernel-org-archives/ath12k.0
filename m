Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE38AD2E00C
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 02:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSI0qQWo9HJXGK7+I30tHq1+LPKdGMnbi3s7oOvkVFc=; b=e4wI/4K8B56wFo4n6g14RfbEUu
	WdjkdjSNrtJwdVDMKL4zGHZQUwd9y2vr00hpEhc8f1/uWr4ukZ+7iRndUDRqSp1oqoDMGZkMrWPWf
	eacaVWXlaWWWx+3BYVeJ6ReGZFFzxbDob6UztZnDhMiqkS9eZOb0dw3GVRWIpdh3ZTMLKRhzJAKJn
	yXCiAomp5w2FrQfeC14/HfN9+3r5oqaAIAxE/vhfjdNNa9VG+tEXVjtfC98cVnYIf1F2y1i0bezMZ
	voedI1DhrkGHAtguQsQh5xHCKfQU2SZpTLbi1SbXzHc/M1Rsh/aN03oHP36JE3sY/k+EL4lwSjhqz
	YBrHRPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3RQE-0000000CkRl-2XPj
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 02:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ROw-0000000CkAU-2WJI
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 02:47:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaEo7016692;
	Wed, 23 Oct 2024 02:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSI0qQWo9HJXGK7+I30tHq1+LPKdGMnbi3s7oOvkVFc=; b=MMvDL6RQG+EvUw52
	8368Sp4kYdXHaJsy4orVXs/WaNCpSeD56b7/WQVPE00TCgoraj0b+0vSC8halnr5
	iTBemiaH0XPdSVMmAJqauJocb1MKkaNJaiJWfiTzBi/BoyrtN13vwdffYVoFgBAM
	JxlRt+hrywhVMURbJESv5IgaboZbGRFwfviYaHardABsdcuYH3r3VNwUBCq6qG8r
	pYRcei7gi9yTyfNuFiz8Vgq/IIuGklouzxA6iRRLRFiGwU+cRDAuk4KWtkWcVa9N
	UQ7Pzl0o+YupJSrZmxLKko/zmYI/vGjkfIkW5WCp3d0ieP07DchvlzNWnBbbin7D
	jmozWw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xgkg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:10 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N2l9VM019236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:47:09 GMT
Received: from lingbok-Birman-PHX.lan (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 19:47:08 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v3 3/4] wifi: ath12k: Adjust the timing to access ACPI table
Date: Wed, 23 Oct 2024 10:45:50 +0800
Message-ID: <20241023024551.18966-4-quic_lingbok@quicinc.com>
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
X-Proofpoint-GUID: fB6NQ_JW864yhi8gFpJjiXG575tAuwnl
X-Proofpoint-ORIG-GUID: fB6NQ_JW864yhi8gFpJjiXG575tAuwnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_194710_730513_B27E565E 
X-CRM114-Status: GOOD (  17.40  )
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

Currently, the timing for accessing the ACPI table is inappropriate.

Due to special ACPI requirements, the ACPI table must be obtained before
downloading the board data file. Therefore, adjust the timing for accessing
the ACPI table accordingly.

This patch will not affect QCN9274, because only WCN7850 supports ACPI.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v3:
no change

v2:
no change

 drivers/net/wireless/ath/ath12k/acpi.c | 98 ++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/acpi.h |  5 ++
 drivers/net/wireless/ath/ath12k/core.c |  5 +-
 drivers/net/wireless/ath/ath12k/core.h |  2 +
 drivers/net/wireless/ath/ath12k/qmi.c  |  5 ++
 5 files changed, 72 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index 0e9ce13e6919..9dfe6c261c02 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -278,15 +278,69 @@ bool ath12k_acpi_11be_disabled(struct ath12k_base *ab)
 	return ab->acpi.acpi_disable_11be;
 }
 
+void ath12k_acpi_set_dsm_func(struct ath12k_base *ab)
+{
+	int ret;
+	u8 *buf;
+
+	if (!ab->hw_params->acpi_guid)
+		/* not supported with this hardware */
+		return;
+
+	if (ab->acpi.acpi_tas_enable) {
+		ret = ath12k_acpi_set_tas_params(ab);
+		if (ret) {
+			ath12k_warn(ab, "failed to send ACPI TAS parameters: %d\n", ret);
+			return;
+		}
+	}
+
+	if (ab->acpi.acpi_bios_sar_enable) {
+		ret = ath12k_acpi_set_bios_sar_params(ab);
+		if (ret) {
+			ath12k_warn(ab, "failed to send ACPI BIOS SAR: %d\n", ret);
+			return;
+		}
+	}
+
+	if (ab->acpi.acpi_cca_enable) {
+		buf = ab->acpi.cca_data + ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET;
+		ret = ath12k_wmi_set_bios_cmd(ab,
+					      WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE,
+					      buf,
+					      ATH12K_ACPI_CCA_THR_OFFSET_LEN);
+		if (ret) {
+			ath12k_warn(ab, "failed to set ACPI DSM CCA threshold: %d\n",
+				    ret);
+			return;
+		}
+	}
+
+	if (ab->acpi.acpi_band_edge_enable) {
+		ret = ath12k_wmi_set_bios_cmd(ab,
+					      WMI_BIOS_PARAM_TYPE_BANDEDGE,
+					      ab->acpi.band_edge_power,
+					      sizeof(ab->acpi.band_edge_power));
+		if (ret) {
+			ath12k_warn(ab,
+				    "failed to set ACPI DSM band edge channel power: %d\n",
+				    ret);
+			return;
+		}
+	}
+}
+
 int ath12k_acpi_start(struct ath12k_base *ab)
 {
 	acpi_status status;
-	u8 *buf;
 	int ret;
 
 	ab->acpi.acpi_tas_enable = false;
 	ab->acpi.acpi_disable_11be = false;
 	ab->acpi.acpi_disable_rfkill = false;
+	ab->acpi.acpi_bios_sar_enable = false;
+	ab->acpi.acpi_cca_enable = false;
+	ab->acpi.acpi_band_edge_enable = false;
 
 	if (!ab->hw_params->acpi_guid)
 		/* not supported with this hardware */
@@ -357,20 +411,6 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 			ab->acpi.acpi_bios_sar_enable = true;
 	}
 
-	if (ab->acpi.acpi_tas_enable) {
-		ret = ath12k_acpi_set_tas_params(ab);
-		if (ret) {
-			ath12k_warn(ab, "failed to send ACPI parameters: %d\n", ret);
-			return ret;
-		}
-	}
-
-	if (ab->acpi.acpi_bios_sar_enable) {
-		ret = ath12k_acpi_set_bios_sar_params(ab);
-		if (ret)
-			return ret;
-	}
-
 	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_CCA)) {
 		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_INDEX_CCA);
 		if (ret) {
@@ -381,18 +421,8 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 
 		if (ab->acpi.cca_data[0] == ATH12K_ACPI_CCA_THR_VERSION &&
 		    ab->acpi.cca_data[ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET] ==
-		    ATH12K_ACPI_CCA_THR_ENABLE_FLAG) {
-			buf = ab->acpi.cca_data + ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET;
-			ret = ath12k_wmi_set_bios_cmd(ab,
-						      WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE,
-						      buf,
-						      ATH12K_ACPI_CCA_THR_OFFSET_LEN);
-			if (ret) {
-				ath12k_warn(ab, "failed to set ACPI DSM CCA threshold: %d\n",
-					    ret);
-				return ret;
-			}
-		}
+		    ATH12K_ACPI_CCA_THR_ENABLE_FLAG)
+			ab->acpi.acpi_cca_enable = true;
 	}
 
 	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi,
@@ -405,18 +435,8 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 		}
 
 		if (ab->acpi.band_edge_power[0] == ATH12K_ACPI_BAND_EDGE_VERSION &&
-		    ab->acpi.band_edge_power[1] == ATH12K_ACPI_BAND_EDGE_ENABLE_FLAG) {
-			ret = ath12k_wmi_set_bios_cmd(ab,
-						      WMI_BIOS_PARAM_TYPE_BANDEDGE,
-						      ab->acpi.band_edge_power,
-						      sizeof(ab->acpi.band_edge_power));
-			if (ret) {
-				ath12k_warn(ab,
-					    "failed to set ACPI DSM band edge channel power: %d\n",
-					    ret);
-				return ret;
-			}
-		}
+		    ab->acpi.band_edge_power[1] == ATH12K_ACPI_BAND_EDGE_ENABLE_FLAG)
+			ab->acpi.acpi_band_edge_enable = true;
 	}
 
 	status = acpi_install_notify_handler(ACPI_HANDLE(ab->dev),
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 67e0b429af30..0ea022a58daa 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -70,6 +70,7 @@ int ath12k_acpi_start(struct ath12k_base *ab);
 void ath12k_acpi_stop(struct ath12k_base *ab);
 bool ath12k_acpi_rfkill_disabled(struct ath12k_base *ab);
 bool ath12k_acpi_11be_disabled(struct ath12k_base *ab);
+void ath12k_acpi_set_dsm_func(struct ath12k_base *ab);
 
 #else
 
@@ -92,6 +93,10 @@ static inline bool ath12k_acpi_11be_disabled(struct ath12k_base *ab)
 	return false;
 }
 
+static inline void ath12k_acpi_set_dsm_func(struct ath12k_base *ab)
+{
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /* ATH12K_ACPI_H */
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 3629457650f3..177db7c11a0b 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -842,10 +842,7 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		goto err_reo_cleanup;
 	}
 
-	ret = ath12k_acpi_start(ab);
-	if (ret)
-		/* ACPI is optional so continue in case of an error */
-		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
+	ath12k_acpi_set_dsm_func(ab);
 
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 1348768ffe71..ae730241e8fb 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -975,6 +975,8 @@ struct ath12k_base {
 		bool acpi_bios_sar_enable;
 		bool acpi_disable_11be;
 		bool acpi_disable_rfkill;
+		bool acpi_cca_enable;
+		bool acpi_band_edge_enable;
 		u32 bit_flag;
 		u8 tas_cfg[ATH12K_ACPI_DSM_TAS_CFG_SIZE];
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b93ce9f87f61..6e5ec4ed533f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2527,6 +2527,11 @@ static int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
 	if (r)
 		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
 
+	r = ath12k_acpi_start(ab);
+	if (r)
+		/* ACPI is optional so continue in case of an error */
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", r);
+
 out:
 	return ret;
 }
-- 
2.34.1


