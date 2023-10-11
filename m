Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEABCD98F3
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLp0ZKfodOpFzh5jIrrl5zyw9d4dP2Pkh3PNropSD1g=; b=wV641wU+LE4WQc
	dM2C+6O1zpPUdpjWCdIJgqOm1ocoJqz54wMzSOe95i7oRRNmsOCGedH+b81shhFZIsOh+IR/XIVcC
	0D/aRrtlCT+zFY/NnS0EseHblT1hgGrFvy4N6MWLg/Z8/IT4nxDoSxeGc1FL6EubCEJwz1Sco+X5r
	G2i6TXRWAs2fMjm/uar+efqRo8LCD67/EAc0yFb2N8aP6EZtlk9JKnt9gkDG/8ODf4YqLiJ2TDuq/
	szMxmC1oXu3kY7nYx/vXKjBheB5T9mbF1akfGA6/nhCHRkIGcabXJvtDkdm1Kt128IBB21YwOuTcY
	Vlngb/yQ590lmk/vPbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRKd-00EnY1-0z
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 05:00:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRKa-00EnWL-1q
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 05:00:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B50GQ8014841;
	Wed, 11 Oct 2023 05:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=V7iIEccUkCBDqQ74w+MlPFrvDEe2ZpdJvdenoi9WzPo=;
 b=lG7gX/xOp8GEvD/jzEbBO112QQtf/PmFqsMI/SdxslAow7CsV9EMbwsQa6pPBNrX/8s9
 X9YeqWrdlMXPOmxeTKqWIOaX0SQtoY2gYRU1Hsukr2obqmDsBgkLhcX74nVwPSwMugGK
 w7i+P3zE2+pOG2G9Jw45ScUAsuJ4/GNoli9vf27Yb3JBYnOZTk+3PihrXFUy+KCHmQ3H
 9w5E8u9q7pd2uo7VVjB61DQ4NM5sjQqf70qy9LsGwjckWo6qiXhzGVwGzb0oKJkHF0lo
 GrwAkjen6pjeEhdCRJ9AyvLqDamEKHeOF03PLYvDQTrUw6iH0y0g8F2d8YIaIPxV0stG 2g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tne0q0p86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:00:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39B50Nr7029781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:00:23 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 22:00:21 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v6 3/4] wifi: ath12k: add adjust configuration of CCA threshold value for WCN7850
Date: Wed, 11 Oct 2023 01:00:03 -0400
Message-ID: <20231011050004.423413-4-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011050004.423413-1-quic_lingbok@quicinc.com>
References: <20231011050004.423413-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iPj9dlT1VoTTTffPw5xRlHmGM335JYRn
X-Proofpoint-ORIG-GUID: iPj9dlT1VoTTTffPw5xRlHmGM335JYRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_01,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_220024_639115_B4F929CD 
X-CRM114-Status: GOOD (  22.18  )
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

Currently, ath12k does not have the ability to adjust CCA threshold values
to meet the regulatory requirements. In order to support this, ath12k gets
CCA threshold configuration in ath12k_acpi_dsm_get_data() function, then
sets pdev_id and param_type_id and finally sends these data to firmware to
implement the adjustment of the CCA threshold value.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v6:
1.no change

v5:
1.rebase to the latest tag

v4:
1.revise commit log using imperative voice

v3:
1.remove unnecessary cpu_to_le32()
2.adjust the order of the macros
3.apply jeff's advice

v2:
no change

 drivers/net/wireless/ath/ath12k/acpi.c | 30 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h |  8 ++++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 40 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  7 +++--
 5 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index a4faeae90a0b..ba29d2bbc076 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -72,6 +72,16 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 			memcpy(&ab->acdata->geo_offset_data, obj->buffer.pointer,
 			       obj->buffer.length);
 			break;
+		case ATH12K_ACPI_DSM_FUNC_INDEX_CCA:
+			if (obj->buffer.length != ATH12K_ACPI_DSM_CCA_DATA_SIZE) {
+				ath12k_err(ab, "Invalid CCA data size %d\n",
+					   obj->buffer.length);
+				ret = -EINVAL;
+				goto out;
+			}
+			memcpy(&ab->acdata->cca_data, obj->buffer.pointer,
+			       obj->buffer.length);
+			break;
 		}
 	} else {
 		ath12k_err(ab,
@@ -274,6 +284,26 @@ int ath12k_get_acpi_all_data(struct ath12k_base *ab)
 			goto err_free_acdata;
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acdata, ATH12K_ACPI_FUNC_BIT_CCA)) {
+		ret = ath12k_acpi_dsm_get_data(ab,
+					       ATH12K_ACPI_DSM_FUNC_INDEX_CCA);
+		if (ret) {
+			ath12k_err(ab, "failed to get cca threshold configuration %d\n", ret);
+			goto err_free_acdata;
+		}
+
+		if (ab->acdata->cca_data[0] == ATH12K_ACPI_CCA_THR_VERSION &&
+		    ab->acdata->cca_data[ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET] ==
+		    ATH12K_ACPI_CCA_THR_ENABLE_FLAG) {
+			ret = ath12k_wmi_pdev_set_cca_thr_table_param(ab,
+								      ab->acdata->cca_data);
+			if (ret) {
+				ath12k_err(ab, "set cca threshold failed %d\n", ret);
+				goto err_free_acdata;
+			}
+		}
+	}
+
 	status = acpi_install_notify_handler(ACPI_HANDLE(ab->dev),
 					     ACPI_DEVICE_NOTIFY,
 					     acpi_dsm_notify, ab);
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 2f930f0718da..1f05a68e490b 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -11,11 +11,13 @@
 #define ATH12K_ACPI_DSM_FUNC_INDEX_SUPPORT_FUNCS	0
 #define ATH12K_ACPI_DSM_FUNC_INDEX_BIOS_SAR             4
 #define ATH12K_ACPI_DSM_FUNC_INDEX_GEO_OFFSET           5
+#define ATH12K_ACPI_DSM_FUNC_INDEX_CCA			6
 #define ATH12K_ACPI_DSM_FUNC_INDEX_TAS_CFG		8
 #define ATH12K_ACPI_DSM_FUNC_INDEX_TAS_DATA		9
 
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
+#define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
 #define ATH12K_ACPI_FUNC_BIT_TAS_CFG			BIT(7)
 #define ATH12K_ACPI_FUNC_BIT_TAS_DATA			BIT(8)
 
@@ -26,13 +28,17 @@
 #define ATH12K_ACPI_TAS_DATA_ENABLE_FLAG	0x1
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
 
 int ath12k_get_acpi_all_data(struct ath12k_base *ab);
 void acpi_dsm_notify(acpi_handle handle, u32 event, void *data);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index e9823e063fb6..4b663577c2b9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -802,6 +802,7 @@ struct ath12k_base {
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
 		u8 geo_offset_data[ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE];
+		u8 cca_data[ATH12K_ACPI_DSM_CCA_DATA_SIZE];
 	} *acdata;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cea382ee6850..b2fbd285ab4d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7144,3 +7144,43 @@ int ath12k_wmi_pdev_set_bios_geo_table_param(struct ath12k_base *ab,
 
 	return ret;
 }
+
+int ath12k_wmi_pdev_set_cca_thr_table_param(struct ath12k_base *ab,
+					    u8 *pcca_table)
+{
+	struct ath12k_wmi_base *wmi_ab = &ab->wmi_ab;
+	struct wmi_pdev_set_bios_interface_cmd *cmd;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	int ret;
+	u8 *buf_ptr;
+	u32 len, cca_thr_len_aligned;
+	u8 *pcca_value = pcca_table + ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET;
+
+	cca_thr_len_aligned = roundup(ATH12K_ACPI_CCA_THR_OFFSET_LEN, sizeof(u32));
+	len = sizeof(*cmd) + TLV_HDR_SIZE + cca_thr_len_aligned;
+
+	skb = ath12k_wmi_alloc_skb(wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_set_bios_interface_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD_PARAMS,
+						 sizeof(*cmd));
+	cmd->pdev_id = cpu_to_le32(WMI_PDEV_ID_SOC);
+	cmd->param_type_id = cpu_to_le32(WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE);
+	cmd->length = ATH12K_ACPI_CCA_THR_OFFSET_LEN;
+
+	buf_ptr = skb->data + sizeof(*cmd);
+	tlv = (struct wmi_tlv *)buf_ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, cca_thr_len_aligned);
+	buf_ptr += TLV_HDR_SIZE;
+	memcpy(buf_ptr, pcca_value, ATH12K_ACPI_CCA_THR_OFFSET_LEN);
+
+	ret = ath12k_wmi_cmd_send(&wmi_ab->wmi[0], skb, WMI_PDEV_SET_BIOS_INTERFACE_CMDID);
+	if (ret) {
+		ath12k_warn(ab, "failed to send WMI_PDEV_SET_BIOS_INTERFACE_CMDID %d\n", ret);
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index fa10adfdae0f..5a3d7962b8cb 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4808,8 +4808,9 @@ struct wmi_pdev_set_bios_interface_cmd {
 } __packed;
 
 enum bios_param_type {
-	WMI_BIOS_PARAM_TAS_CONFIG_TYPE	=	1,
-	WMI_BIOS_PARAM_TAS_DATA_TYPE	=	2,
+	WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE	=	0,
+	WMI_BIOS_PARAM_TAS_CONFIG_TYPE		=	1,
+	WMI_BIOS_PARAM_TAS_DATA_TYPE		=	2,
 	WMI_BIOS_PARAM_TYPE_MAX,
 };
 
@@ -4980,4 +4981,6 @@ int ath12k_wmi_pdev_set_bios_sar_table_param(struct ath12k_base *ab,
 					     u8 *psar_table);
 int ath12k_wmi_pdev_set_bios_geo_table_param(struct ath12k_base *ab,
 					     u8 *pgeo_table);
+int ath12k_wmi_pdev_set_cca_thr_table_param(struct ath12k_base *ab,
+					    u8 *pcca_table);
 #endif
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
