Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA1EB8FBE
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gB1gFxmS/rBGhdd+LZDPGrYwBReOI7lRN9MCo8YVCBk=; b=FTVLFTtY7/uHrl
	7qk71/CBOoslI7AAn+QA5/NmqDB1pe5Qy4YaU0ye1swru7srEjdceb5fL6BzXCSm5i8D9k86UAK64
	2Knhe1tU7NDvr+snR7LiOc6iIfRolnOsNxo6pGqwPsW1Klv63bBWvECXCJLGscAq59HarzQn84yoR
	Vr87WgGelmko3U0f4jx+Vd4OCuT91j4WTO64kwVPoFbM3mkRyCvnd44/d8c3OcuSeqE8oEiK6KK1H
	0yqZ7Acpng6XB/NTopDw2e7UA23GjOCOgWJREt69PGEp0SEEpYvhIuY/nAWfgpH7GM/E874BodPPt
	Kl0NFQZiJ8twxpM3fGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrl9-009UlR-1q
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 12:35:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrl8-009Ujd-21
	for ath12k@bombadil.infradead.org;
	Wed, 06 Sep 2023 12:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YVPRPOdu3tH+yozwjV0uBbfyZfy5tsCn9RLC7imbHTQ=; b=jCA/jDXKwXRXO8pucXwnlfFNLH
	AiM6+LApTsHE4WIxgWRx4ocWu6Xaozohyb+vMvShqEHyBzSdwYyinCmmo2Of5c3uj72rAhKU+K1yc
	t74RoRO3HqyF0yxnyxuVvnKHjlgcIuEzh3vY/Jz4GJvsE0kt5SIxPqP/ZMmScaknnvzfm1gRnhCbY
	/zKFqfXtDNF3br3D5l0jkmbQ/X8y/G8wEBtelS9pnduxClP7OJkUIXEaQl8ZJwrDPkulQxS636J7H
	MNDul1s5KJjodYOhv5z/WIDmDebkMFpCTAyepkgJLT7flWLkV6N+OeOInr/pGs1M1eVCqRbIszpIo
	yVMXVnRg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrky-0016bF-2x
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 12:35:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386BCobT015907;
	Wed, 6 Sep 2023 12:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=YVPRPOdu3tH+yozwjV0uBbfyZfy5tsCn9RLC7imbHTQ=;
 b=f+KCFxMxOvH2w1DqTZib2jlLhizeFni7bT2kx6F9/CdNm0JHW2C86KrCuXLG215XZoZL
 irBizYRZuQRO5hH7crXXZ/3nQmkbELAVYZ9EHA+0ZxCBz+vtKshPaSK5za2xpIpvbytO
 Sg0L3O2ZIT7pAL9b+FYB3jvC6q7WQnEzxVToayqJuWo7IsQDhOG5oFNsmk6lBnrAOR/p
 LEb7dROIkIwRS0hhiFyuF7kFFPi0iNfOK1v2VAuD8LygE0uQg9L11nseMEOXCpoac/a4
 7NbAgdRBwK0JpBNQcPTVFVR+D0vh8vj+N/6UdVFP5fmxdcnMz4tS5kelSaaKY1ub16Tq cw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxgk2sd47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 12:35:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386CZe71015188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 12:35:40 GMT
Received: from lingbok-HP-EliteBook-8460p.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 05:35:38 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 4/4] wifi: ath12k: add band edge channel power for WCN7850
Date: Wed, 6 Sep 2023 20:35:20 +0800
Message-ID: <20230906123520.184726-5-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906123520.184726-1-quic_lingbok@quicinc.com>
References: <20230906123520.184726-1-quic_lingbok@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CaZy_P7A-2z6zfwxqsx9KF1X1zEsvTHc
X-Proofpoint-ORIG-GUID: CaZy_P7A-2z6zfwxqsx9KF1X1zEsvTHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_05,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=970 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_133542_934701_5F47A8B8 
X-CRM114-Status: GOOD (  21.11  )
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

ath12k need to retrieve band edge channel power table by invoking ACPI _DSM
method, then pass the table to firmware.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
v2:
1.no change

 drivers/net/wireless/ath/ath12k/acpi.c | 29 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h |  6 +++-
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c  | 41 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  |  3 ++
 5 files changed, 79 insertions(+), 1 deletion(-)

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
index 60d674fdeb41..258007bcda5f 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -14,18 +14,21 @@
 #define ATH12K_ACPI_DSM_FUNC_INDEX_BIOS_SAR		4
 #define ATH12K_ACPI_DSM_FUNC_INDEX_GEO_OFFSET		5
 #define ATH12K_ACPI_DSM_FUNC_INDEX_CCA			6
+#define ATH12K_ACPI_DSM_FUNC_INDEX_BAND_EDGE		10
 
 #define ATH12K_ACPI_DSM_TAS_CFG_SIZE			108
 #define ATH12K_ACPI_DSM_TAS_DATA_SIZE			69
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE		34
 #define ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE		19
 #define ATH12K_ACPI_DSM_CCA_DATA_SIZE			41
+#define ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE		100
 
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
 #define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
 #define ATH12K_ACPI_FUNC_BIT_TAS_CFG			BIT(7)
 #define ATH12K_ACPI_FUNC_BIT_TAS_DATA			BIT(8)
+#define ATH12K_ACPI_FUNC_BIT_BAND_EDGE_CHAN_POWER	BIT(9)
 
 #define ATH12K_ACPI_NOTIFY_EVENT			0x86
 #define ATH12K_ACPI_FUNC_BIT_VALID(_acdata, _func)	((((_acdata)->func_bit) & (_func)) != 0)
@@ -44,7 +47,8 @@
 #define ATH12K_ACPI_CCA_THR_ENABLE_FLAG		0x1
 #define ATH12K_ACPI_CCA_THR_OFFSET_LEN		36
 #define ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET	5
-
+#define ATH12K_ACPI_BAND_EDGE_VERSION		0x1
+#define ATH12K_ACPI_BAND_EDGE_ENABLE_FLAG	0x1
 
 int ath12k_get_acpi_all_data(struct ath12k_base *ab);
 void acpi_dsm_notify(acpi_handle handle, u32 event, void *data);
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d57e2013b0fe..d06c3984aef9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -781,6 +781,7 @@ struct ath12k_base {
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
 		u8 geo_offset_data[ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE];
 		u8 cca_data[ATH12K_ACPI_DSM_CCA_DATA_SIZE];
+		u8 band_edge_power[ATH12K_ACPI_DSM_BAND_EDGE_DATA_SIZE];
 	} *acdata;
 
 	/* must be last */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d97849b028d6..244acfaa875d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7135,3 +7135,44 @@ int ath12k_wmi_pdev_set_cca_thr_table_param(struct ath12k_base *ab,
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
+	cmd->tlv_header =
+		cpu_to_le32(ath12k_wmi_tlv_cmd_hdr(WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD_PARAMS,
+						   sizeof(*cmd)));
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
index 7607cd7ab699..73d790d405cd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4808,6 +4808,7 @@ enum bios_param_type {
 	WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE	=	0,
 	WMI_BIOS_PARAM_TAS_CONFIG_TYPE		=	1,
 	WMI_BIOS_PARAM_TAS_DATA_TYPE		=	2,
+	WMI_BIOS_PARAM_TYPE_BANDEDGE_CTL_POWER	=	3,
 	WMI_BIOS_PARAM_TYPE_MAX,
 };
 
@@ -4955,4 +4956,6 @@ int ath12k_wmi_pdev_set_bios_geo_table_param(struct ath12k_base *ab,
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
