Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA0AE95A97
	for <ath12k@archiver.kernel.org>; Mon,  9 Oct 2023 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmtvAkMjqGxDmAIm64vW/qhPcH82pKuDFxyvqLpyqbk=; b=J6l8lIJjrYqPP/
	oYYhu7tkRuncdrEGoXwtEDfuUC1RCfYup9clNqllNh3ZlffzXDhXNtnZP3v8rU25KHAVN3kkwAGfX
	qXtju+ajHLo4It4J1z/2YcCBjO1hDY0wQDtweMB61vOOC85QWVM5S3Gg8q6EhQzc5ESD9UXPxxooN
	STWptIgV8byawOFPWGMgAoF9+h/xX/WXea9gPF4FK1dAm5EXeB7cYMUCweTsvR7j/qUh/NpXm8zW5
	kZ22UuiaZ28Tef9mj7Y2KxV2OXzFAsg5eRWc0PS+QwPpsB36RitxdDZgEEdGEMkk8oSHxqmSeFkII
	XuzJmWsu0pIPfbxCgEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm9d-00A2dN-0y
	for ath12k@archiver.kernel.org;
	Mon, 09 Oct 2023 09:02:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm9Z-00A2bg-2l
	for ath12k@lists.infradead.org;
	Mon, 09 Oct 2023 09:02:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3997eaEZ002413;
	Mon, 9 Oct 2023 09:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=sF3y9eN1vsHkalo67GzD4r2rDpDnuQx2Luq8x0kxOvs=;
 b=RdrVK/vtUYy4yBktJfIm5VIOpb2xl0bgIuyJxJLAXWhhpIHNHth3oIfGv67VkXSBzGkt
 BjDnBDMp0NMJtXs4f4itpLwrVSMEBZXhBwnjVX7ks0cq3BsO7B9/80dspNIarkasFcxT
 rI8XQpnJdMouosFUCewQWOeDxgwzqO4eTVl6LGwlOaoa83qyXsgJY5qXIVMGkTGdJK8p
 a0FzCSbaxIwR8kDDkRrTdoKaFVEXx/m/CliMNOBvXSQROdmqzeFzHoNVK7q2DQ4hY6XN
 IDeB2uhb+itlPZcuYtW4sHrL4UMk305tyc7wJh3/RRVpgJJuU9U+gHR1NNU8ijSoAJcH ng== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh3u9y8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 09:02:13 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39992DEm006087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 09:02:13 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 9 Oct 2023 02:02:11 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v5 4/4] wifi: ath12k: add set band edge channel power for WCN7850
Date: Mon, 9 Oct 2023 05:01:49 -0400
Message-ID: <20231009090149.247211-5-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009090149.247211-1-quic_lingbok@quicinc.com>
References: <20231009090149.247211-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ugfinKQqZ1Zj7EI3nNsGfwvUkjMGpVCx
X-Proofpoint-ORIG-GUID: ugfinKQqZ1Zj7EI3nNsGfwvUkjMGpVCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_07,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_020217_900657_3E0D1CFA 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, ath12k does not have the ability to set band edge channel power
for WCN7850. In order to support this, ath12k gets band edge channel power
table in ath12k_acpi_dsm_get_data() function and sets pdev_id and
param_type_id, then finally sends these data and
WMI_PDEV_SET_BIOS_INTERFACE_CMDID to firmware to set band edge channel
power.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v5:
1.rebase to the latest tag

v4:
1.revise commit log using imperative voice

v3:
1.remove unnecessary cpu_to_le32()
2.adjust the order of the macros

v2:
no change

 drivers/net/wireless/ath/ath12k/acpi.c | 29 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h |  5 ++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 40 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  3 ++
 5 files changed, 78 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index a9931e17bd17..389b900df170 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -82,6 +82,16 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 			memcpy(&ab->acdata->cca_data, obj->buffer.pointer,
 			       obj->buffer.length);
 			break;
+		case ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE:
+			if (obj->buffer.length != ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE) {
+				ath12k_err(ab, "Invalid BAND EDGE data size %d\n",
+					   obj->buffer.length);
+				ret = -EINVAL;
+				goto out;
+			}
+			memcpy(&ab->acdata->band_edge_power, obj->buffer.pointer,
+			       obj->buffer.length);
+			break;
 		}
 	} else {
 		ath12k_err(ab,
@@ -311,6 +321,25 @@ int ath12k_get_acpi_all_data(struct ath12k_base *ab)
 		}
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acdata, ATH12K_ACPI_FUNC_BIT_BAND_EDGE_CHAN_POWER)) {
+		ret = ath12k_acpi_dsm_get_data(ab,
+					       ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE);
+		if (ret) {
+			ath12k_err(ab, "failed to get band edge channel power %d\n", ret);
+			goto err_free_acdata;
+		}
+
+		if (ab->acdata->band_edge_power[0] == ATH12K_ACPI_BAND_EDGE_VERSION &&
+		    ab->acdata->band_edge_power[1] == ATH12K_ACPI_BAND_EDGE_ENABLE_FLAG) {
+			ret = ath12k_wmi_pdev_set_band_edge_power(ab,
+								  ab->acdata->band_edge_power);
+			if (ret) {
+				ath12k_err(ab, "set band edge channel power failed %d\n", ret);
+				goto err_free_acdata;
+			}
+		}
+	}
+
 	status = acpi_install_notify_handler(ACPI_HANDLE(ab->dev),
 					     ACPI_DEVICE_NOTIFY,
 					     acpi_dsm_notify, ab);
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 1f05a68e490b..27f28fc13600 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -14,12 +14,14 @@
 #define ATH12K_ACPI_DSM_FUNC_INDEX_CCA			6
 #define ATH12K_ACPI_DSM_FUNC_INDEX_TAS_CFG		8
 #define ATH12K_ACPI_DSM_FUNC_INDEX_TAS_DATA		9
+#define ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE		10
 
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
 #define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
 #define ATH12K_ACPI_FUNC_BIT_TAS_CFG			BIT(7)
 #define ATH12K_ACPI_FUNC_BIT_TAS_DATA			BIT(8)
+#define ATH12K_ACPI_FUNC_BIT_BAND_EDGE_CHAN_POWER	BIT(9)
 
 #define ATH12K_ACPI_NOTIFY_EVENT			0x86
 #define ATH12K_ACPI_FUNC_BIT_VALID(_acdata, _func)	((((_acdata)->func_bit) & (_func)) != 0)
@@ -30,6 +32,8 @@
 #define ATH12K_ACPI_POWER_LIMIT_ENABLE_FLAG	0x1
 #define ATH12K_ACPI_CCA_THR_VERSION		0x1
 #define ATH12K_ACPI_CCA_THR_ENABLE_FLAG		0x1
+#define ATH12K_ACPI_BAND_EDGE_VERSION		0x1
+#define ATH12K_ACPI_BAND_EDGE_ENABLE_FLAG	0x1
 
 #define ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET	1
 #define ATH12K_ACPI_DBS_BACKOFF_DATA_OFFSET	2
@@ -41,6 +45,7 @@
 #define ATH12K_ACPI_CCA_THR_OFFSET_LEN		36
 
 #define ATH12K_ACPI_DSM_TAS_DATA_SIZE			69
+#define ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE		100
 #define ATH12K_ACPI_DSM_TAS_CFG_SIZE			108
 
 #define ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE (ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET + \
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b663577c2b9..350cff3c30e3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -803,6 +803,7 @@ struct ath12k_base {
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
 		u8 geo_offset_data[ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE];
 		u8 cca_data[ATH12K_ACPI_DSM_CCA_DATA_SIZE];
+		u8 band_edge_power[ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE];
 	} *acdata;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index b2fbd285ab4d..942ed486b2b5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7184,3 +7184,43 @@ int ath12k_wmi_pdev_set_cca_thr_table_param(struct ath12k_base *ab,
 	}
 	return ret;
 }
+
+int ath12k_wmi_pdev_set_band_edge_power(struct ath12k_base *ab,
+					const u8 *pchan_table)
+{
+	struct ath12k_wmi_base *wmi_ab = &ab->wmi_ab;
+	struct wmi_pdev_set_bios_interface_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	int ret;
+	u8 *buf_ptr;
+	u32 len, len_aligned;
+
+	len_aligned = roundup(ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE, sizeof(u32));
+	len = sizeof(*cmd) + TLV_HDR_SIZE + len_aligned;
+
+	skb = ath12k_wmi_alloc_skb(wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_set_bios_interface_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD_PARAMS,
+						 sizeof(*cmd));
+	cmd->pdev_id = cpu_to_le32(WMI_PDEV_ID_SOC);
+	cmd->param_type_id = cpu_to_le32(WMI_BIOS_PARAM_TYPE_BANDEDGE_CTL_POWER);
+	cmd->length = cpu_to_le32(ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE);
+
+	buf_ptr = skb->data + sizeof(*cmd);
+	tlv = (struct wmi_tlv *)buf_ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, len_aligned);
+	buf_ptr += TLV_HDR_SIZE;
+	memcpy(buf_ptr, pchan_table, ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE);
+
+	ret = ath12k_wmi_cmd_send(&wmi_ab->wmi[0], skb, WMI_PDEV_SET_BIOS_INTERFACE_CMDID);
+	if (ret) {
+		ath12k_warn(ab, "failed to send WMI_PDEV_SET_BIOS_INTERFACE_CMDID %d\n", ret);
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5a3d7962b8cb..314044b0e003 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4811,6 +4811,7 @@ enum bios_param_type {
 	WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE	=	0,
 	WMI_BIOS_PARAM_TAS_CONFIG_TYPE		=	1,
 	WMI_BIOS_PARAM_TAS_DATA_TYPE		=	2,
+	WMI_BIOS_PARAM_TYPE_BANDEDGE_CTL_POWER	=	3,
 	WMI_BIOS_PARAM_TYPE_MAX,
 };
 
@@ -4983,4 +4984,6 @@ int ath12k_wmi_pdev_set_bios_geo_table_param(struct ath12k_base *ab,
 					     u8 *pgeo_table);
 int ath12k_wmi_pdev_set_cca_thr_table_param(struct ath12k_base *ab,
 					    u8 *pcca_table);
+int ath12k_wmi_pdev_set_band_edge_power(struct ath12k_base *ab,
+					const u8 *pchan_table);
 #endif
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
