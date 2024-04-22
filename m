Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BDAC4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 03:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Zj4np9Gk1uNo0GfoYQ5nrhvELsEfL6tG8quWvDhzOs=; b=d/9q1YmLa5q9oCGVibr7/kQI0z
	Oe6La7Os+S4vigypUALNF+wIBwoTN0y0XxVrSNTiyP8XJ2tUGBnqSFcl9p7tJJNzu/CKyLirV6vLC
	+HVeoi1DSd8cKzFnqYs5Gm4Nlxvj8IKL8Gs+dHL9tpvGF53Om7oBAhm+8Qg28eKjJvTK6Cg9nclqK
	bdP0Ea+XALq2y0d6I1lCKpLKprO4g09TG7r2EzRwVPDcHlkGNyponoSuArnpTJKlRclRkBwTDmdN0
	f+Na9IhVpZav0UTy8fibLEKlH3ISMNMYBz2c7UgvD+JRlHWMojfb5zDVNlSLdXzdVFfgCgl1Nz3o9
	l+al843A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykOm-0000000BrN6-1qpR
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 03:31:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykOj-0000000BrLR-3D9J
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 03:31:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M2fojY014427;
	Mon, 22 Apr 2024 03:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+Zj4np9Gk1uNo0GfoYQ5nrhvELsEfL6tG8quWvDhzOs=; b=Df
	OmrCMgFnAFfmSSyHRZHSysATiSuLTbrtX+45r1vSPMXJurqiqboBB1YoVI1Cnml2
	s2yKknkUZetRUvZb5n/g/IFRK4E6EO5Df3KwQ+VLOQIpdbdZwItmSto6Aqwyu5i3
	IleSZ3e678ZzFwFIpgpF9d1Uj6xOpdcpZJBF4mb3NfiUzaStoWQMphdHZA4fUkMV
	rsZJon/32+VVzkZjlVAYoWnGunqRGelQR2TN3hFv9GJDDcLpTKJmCujWK/drcv63
	tnBa6qVKOCys6OFzi/TuGBrymFpZv+nFrY/+WfOsEq2EOG9vtX8ik67ZzT+eiECm
	SlB2Lspo/9U0IIUVX0zQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xmxq4s6x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 03:31:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43M3VFpi002520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 03:31:15 GMT
Received: from lingbok.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 21 Apr 2024 20:31:14 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v10 3/4] wifi: ath12k: ACPI CCA threshold support
Date: Mon, 22 Apr 2024 11:30:52 +0800
Message-ID: <20240422033054.979-4-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20240422033054.979-1-quic_lingbok@quicinc.com>
References: <20240422033054.979-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FUEXMFoxQGOfYliJqbf661g1o1we6-kj
X-Proofpoint-ORIG-GUID: FUEXMFoxQGOfYliJqbf661g1o1we6-kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-21_22,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_203117_965536_5C874B29 
X-CRM114-Status: GOOD (  15.78  )
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

Currently, ath12k does not have the ability to adjust Clear Channel Assessment
(CCA) threshold values to meet the regulatory requirements. Get the values from
ACPI and send them to the firmware using ath12k_wmi_set_bios_cmd() function.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/acpi.c | 37 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h |  8 ++++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
 4 files changed, 47 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index 177babc50f25..4af80dd13535 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -79,6 +79,18 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 			memcpy(&ab->acpi.geo_offset_data, obj->buffer.pointer,
 			       obj->buffer.length);
 
+			break;
+		case ATH12K_ACPI_DSM_FUNC_INDEX_CCA:
+			if (obj->buffer.length != ATH12K_ACPI_DSM_CCA_DATA_SIZE) {
+				ath12k_warn(ab, "invalid ACPI DSM CCA data size: %d\n",
+					    obj->buffer.length);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			memcpy(&ab->acpi.cca_data, obj->buffer.pointer,
+			       obj->buffer.length);
+
 			break;
 		}
 	} else {
@@ -226,6 +238,7 @@ static int ath12k_acpi_set_tas_params(struct ath12k_base *ab)
 int ath12k_acpi_start(struct ath12k_base *ab)
 {
 	acpi_status status;
+	u8 *buf;
 	int ret;
 
 	if (!ab->hw_params->acpi_guid)
@@ -297,6 +310,30 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 			return ret;
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_CCA)) {
+		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_INDEX_CCA);
+		if (ret) {
+			ath12k_warn(ab, "failed to get ACPI DSM CCA threshold configuration: %d\n",
+				    ret);
+			return ret;
+		}
+
+		if (ab->acpi.cca_data[0] == ATH12K_ACPI_CCA_THR_VERSION &&
+		    ab->acpi.cca_data[ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET] ==
+		    ATH12K_ACPI_CCA_THR_ENABLE_FLAG) {
+			buf = ab->acpi.cca_data + ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET;
+			ret = ath12k_wmi_set_bios_cmd(ab,
+						      WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE,
+						      buf,
+						      ATH12K_ACPI_CCA_THR_OFFSET_LEN);
+			if (ret) {
+				ath12k_warn(ab, "failed to set ACPI DSM CCA threshold: %d\n",
+					    ret);
+				return ret;
+			}
+		}
+	}
+
 	status = acpi_install_notify_handler(ACPI_HANDLE(ab->dev),
 					     ACPI_DEVICE_NOTIFY,
 					     ath12k_acpi_dsm_notify, ab);
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 7ade8b3f640d..0879865fd861 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -11,11 +11,13 @@
 #define ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS	0
 #define ATH12K_ACPI_DSM_FUNC_BIOS_SAR		4
 #define ATH12K_ACPI_DSM_FUNC_GEO_OFFSET		5
+#define ATH12K_ACPI_DSM_FUNC_INDEX_CCA		6
 #define ATH12K_ACPI_DSM_FUNC_TAS_CFG		8
 #define ATH12K_ACPI_DSM_FUNC_TAS_DATA		9
 
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
+#define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
 #define ATH12K_ACPI_FUNC_BIT_TAS_CFG			BIT(7)
 #define ATH12K_ACPI_FUNC_BIT_TAS_DATA			BIT(8)
 
@@ -26,13 +28,17 @@
 #define ATH12K_ACPI_TAS_DATA_ENABLE		0x1
 #define ATH12K_ACPI_POWER_LIMIT_VERSION		0x1
 #define ATH12K_ACPI_POWER_LIMIT_ENABLE_FLAG	0x1
+#define ATH12K_ACPI_CCA_THR_VERSION		0x1
+#define ATH12K_ACPI_CCA_THR_ENABLE_FLAG		0x1
 
 #define ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET	1
 #define ATH12K_ACPI_DBS_BACKOFF_DATA_OFFSET	2
+#define ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET	5
 #define ATH12K_ACPI_BIOS_SAR_DBS_BACKOFF_LEN	10
 #define ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET	12
 #define ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN	18
 #define ATH12K_ACPI_BIOS_SAR_TABLE_LEN		22
+#define ATH12K_ACPI_CCA_THR_OFFSET_LEN		36
 
 #define ATH12K_ACPI_DSM_TAS_DATA_SIZE			69
 #define ATH12K_ACPI_DSM_TAS_CFG_SIZE			108
@@ -41,6 +47,8 @@
 					      ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN)
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE (ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET + \
 					    ATH12K_ACPI_BIOS_SAR_TABLE_LEN)
+#define ATH12K_ACPI_DSM_CCA_DATA_SIZE (ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET + \
+				       ATH12K_ACPI_CCA_THR_OFFSET_LEN)
 
 #ifdef CONFIG_ACPI
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index dac4a6cd60f1..0e33cf783f62 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -913,6 +913,7 @@ struct ath12k_base {
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
 		u8 geo_offset_data[ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE];
+		u8 cca_data[ATH12K_ACPI_DSM_CCA_DATA_SIZE];
 	} acpi;
 
 #endif /* CONFIG_ACPI */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8ace566f7eb5..6db15a0a4735 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4805,6 +4805,7 @@ struct wmi_pdev_set_bios_interface_cmd {
 } __packed;
 
 enum wmi_bios_param_type {
+	WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE	= 0,
 	WMI_BIOS_PARAM_TAS_CONFIG_TYPE		= 1,
 	WMI_BIOS_PARAM_TAS_DATA_TYPE		= 2,
 	WMI_BIOS_PARAM_TYPE_MAX,
-- 
2.34.1


