Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427EC02181
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEYgkb9Qg732j7w10Pb49tTKPCDnKesJTrWDo8DT4fQ=; b=ukeReEvM4wczxzaY4hv5uRSohN
	2Ss9N6AGTIYPg6t1SyHbyepMi7t043ogKziGoUlZx4F8jEiBU/lXjCg73LvT2+RW5FQABAKFqg7s7
	M77oQfngRq/LGLsyFd93SxNBjB/uh2JjB87SiaDJfprnqNiyR8OPUWP6sWO9qDr6rnkNDFmTHrERO
	nBKBFzP+nJ/oU9Qj7PgM4bLw5YBHJ2YzYy1A2D6E0rsdU9wiPTrg4FZmN7F10p0LfYci7k1n7WMEr
	clYlxzLYjy7WqJUdXXXaYOdtLor8OkhFU0wkOH1z3ZDwbJPOVJSto4U0i1xOLPPoviyH/YPC8nKoA
	wEmilt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFBW-00000004HYB-1BbL
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 07:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFBT-00000004HWn-3y6j
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 07:48:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNieht026061;
	Mon, 13 Jan 2025 07:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEYgkb9Qg732j7w10Pb49tTKPCDnKesJTrWDo8DT4fQ=; b=n3oM/KIkEyJE1ahs
	asZJYlRu6pCHaHD/0UoHpDzGlKSVZ/mcT8R7uWi5QjHENGB+EAjs/9j/1P760OFy
	OPd5PnHR7AErCHUR+hrMXmTt/LEEu892TmwnzDLYcMY+7j2NTw+pyVc9QmEhEujX
	Xi8VFISNfg7miM8ciaZkHCCyo6/OpbY6gYrW68YWdRKHkPnoaMtCrMhiOml9Q9ku
	UWtD7OtCWQBZJ1JWSlO2NgYv1VDsbYofWcCsjpJPmrQ0WWuJ29kpNnW2Vqy9J7ah
	s5lm5KYNLpz7OOxn12fnfhwitF2Hs2mTMFPYY71rfATjCoHWZ0oyrepA5k8DzP0k
	lG00Lg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bhg62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:48:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D7mQLH024111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 07:48:26 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 23:48:25 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v4 3/4] wifi: ath12k: Adjust the timing to access ACPI table
Date: Mon, 13 Jan 2025 15:48:09 +0800
Message-ID: <20250113074810.29729-4-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113074810.29729-1-quic_lingbok@quicinc.com>
References: <20250113074810.29729-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TOOKxB87OWdJASLfGHhQlzhpi5hjQbe_
X-Proofpoint-ORIG-GUID: TOOKxB87OWdJASLfGHhQlzhpi5hjQbe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_234827_989947_F87E323A 
X-CRM114-Status: GOOD (  17.55  )
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
v4:
1.rebase to 0c5fcd9069dd

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
index a3f3d0712722..fe6f051debda 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -278,15 +278,69 @@ bool ath12k_acpi_get_disable_11be(struct ath12k_base *ab)
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
index 4b154cfdbd39..7c18a3f60e3f 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -70,6 +70,7 @@ int ath12k_acpi_start(struct ath12k_base *ab);
 void ath12k_acpi_stop(struct ath12k_base *ab);
 bool ath12k_acpi_get_disable_rfkill(struct ath12k_base *ab);
 bool ath12k_acpi_get_disable_11be(struct ath12k_base *ab);
+void ath12k_acpi_set_dsm_func(struct ath12k_base *ab);
 
 #else
 
@@ -92,6 +93,10 @@ static inline bool ath12k_acpi_get_disable_11be(struct ath12k_base *ab)
 	return false;
 }
 
+static inline void ath12k_acpi_set_dsm_func(struct ath12k_base *ab)
+{
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif /* ATH12K_ACPI_H */
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 6c51c57778ec..de7fb84d69cd 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -839,10 +839,7 @@ static int ath12k_core_start(struct ath12k_base *ab,
 		goto err_reo_cleanup;
 	}
 
-	ret = ath12k_acpi_start(ab);
-	if (ret)
-		/* ACPI is optional so continue in case of an error */
-		ath12k_dbg(ab, ATH12K_DBG_BOOT, "acpi failed: %d\n", ret);
+	ath12k_acpi_set_dsm_func(ab);
 
 	if (!test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
 		/* Indicate the core start in the appropriate group */
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 41a934c13fe7..c11c8c03b357 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1040,6 +1040,8 @@ struct ath12k_base {
 		bool acpi_bios_sar_enable;
 		bool acpi_disable_11be;
 		bool acpi_disable_rfkill;
+		bool acpi_cca_enable;
+		bool acpi_band_edge_enable;
 		u32 bit_flag;
 		u8 tas_cfg[ATH12K_ACPI_DSM_TAS_CFG_SIZE];
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5c3563383fab..86d055c45ace 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2740,6 +2740,11 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
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


