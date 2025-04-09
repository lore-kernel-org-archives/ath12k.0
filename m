Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F1C36010
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZfNp9/5BVM5+PAuNHdGYmp/rTl5YlyBbXMm9ePdBas=; b=hzRKDRib7x189ny1v/fiPvQWU8
	HGLspZNTEaE1cxw5/bqTUi3jYAxvDpxc2Jpcf94ywZnDDT8OgShe9flxgwFLSVNZT6isnQFgliNTt
	cPgq27SQ3njgyH+R0+yw6ic2+JsiWCSqKbMLVl40/RUOrLoSz8pyg+ztS475V6mhet+2Rvjz4HdV4
	ba7PxSEKYxSerLxLSa3q7+kYJStVK46CTMey3LMMfgLSkrnYQctNIxrLA3N3jxHE8KWO3OlTeiIGA
	FDFdJd5bxQopcadL5wYNurxYdHW+Roq5jkZU5bpQYK+N8XFC4Utz5/fZPrzxhZcwPgqEadXrmHjx7
	HlfWCjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9u-00000005vOl-43k0
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 02:27:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2L9r-00000005vMs-2rcC
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 02:27:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYumA029085;
	Wed, 9 Apr 2025 02:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZfNp9/5BVM5+PAuNHdGYmp/rTl5YlyBbXMm9ePdBas=; b=dnNFLZVFYmEIwPDe
	ylb+umNutffzj7ZoET33q42rdNlb1xzDxlrplNl7EF8AGpKpU6bKu1Vdv3aG6IrM
	zTbZwvX7vR7BFiEGE/4dC3Vb99f+UL72PlsKrh25S55nA1drFzdsg2D8j/uEAuTI
	WllMdzzxuww1x8hb82m1wPJ5MV2NWVB/t6RU59phuBfcFD8ErF5kJ4p3phmT+3cA
	vZMdWWz9p8Bw+Nyeye2ZdpLObGORM6DAoE7SZCOQPTxdw8xZiXi0T/VR0kg5L9Na
	IayUsLMozzHVjsoqX72AGkKFiYsZ2olv+8VQiCHiVZLfmLfgkzn2NL5ewmsZK9Ws
	J2TFqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm9qnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 02:27:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5392RGbv015402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 02:27:16 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 19:27:15 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 9 Apr 2025 10:26:36 +0800
Subject: [PATCH ath-next v2 3/9] wifi: ath12k: support MLO as well if
 single_chip_mlo_support flag is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250409-ath12k-wcn7850-mlo-support-v2-3-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JycNwMgmR4guArFMcHberelBEMyeUYJ3
X-Proofpoint-ORIG-GUID: JycNwMgmR4guArFMcHberelBEMyeUYJ3
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f5db05 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-1g4LLEghsqRnekGNmIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=701 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192719_730487_ED44D735 
X-CRM114-Status: GOOD (  16.13  )
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

Currently firmware MLO capability is validated via firmware IE, however
WCN7850 firmware does not support this method but instead advertises
MLO by single_chip_mlo_support bit in QMI phy capability message.

Change to consider single_chip_mlo_support bit as well for MLO capability
validation.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 21 ++++++++++-----------
 drivers/net/wireless/ath/ath12k/core.h |  3 +++
 drivers/net/wireless/ath/ath12k/qmi.c  |  6 +++++-
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d8c9b666598540783e6abe3927ab4524d0a6fcbd..d2f92eed6971c6c35ee2f0e644c51fce3d073e30 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1959,20 +1959,18 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 
 	lockdep_assert_held(&ag->mutex);
 
-	/* If more than one devices are grouped, then inter MLO
-	 * functionality can work still independent of whether internally
-	 * each device supports single_chip_mlo or not.
-	 * Only when there is one device, then disable for WCN chipsets
-	 * till the required driver implementation is in place.
-	 */
 	if (ag->num_devices == 1) {
 		ab = ag->ab[0];
-
-		/* WCN chipsets does not advertise in firmware features
-		 * hence skip checking
-		 */
-		if (ab->hw_params->def_num_link)
+		/* QCN9274 firmware uses firmware IE for MLO advertisement */
+		if (ab->fw.fw_features_valid) {
+			ag->mlo_capable =
+				ath12k_fw_feature_supported(ab, ATH12K_FW_FEATURE_MLO);
 			return;
+		}
+
+		/* while WCN7850 firmware uses QMI single_chip_mlo_support bit */
+		ag->mlo_capable = ab->single_chip_mlo_support;
+		return;
 	}
 
 	ag->mlo_capable = true;
@@ -2092,6 +2090,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->dev = dev;
 	ab->hif.bus = bus;
 	ab->qmi.num_radios = U8_MAX;
+	ab->single_chip_mlo_support = false;
 
 	/* Device index used to identify the devices in a group.
 	 *
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index eebfb20cb089db0ce126ecf7f658bb15861d38c0..fa8c3f9ab7a92f17f83b3378bc00aa884bc6bdcf 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1123,6 +1123,9 @@ struct ath12k_base {
 	enum ath12k_firmware_mode fw_mode;
 	struct ath12k_ftm_event_obj ftm_event_obj;
 
+	/* Denote whether MLO is possible within the device */
+	bool single_chip_mlo_support;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7df6c6eebed6855ab42519610962d2b21825d9ec..9d360ea3ba973d6d8231a08780b19a66aef20178 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2268,6 +2268,9 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		goto out;
 	}
 
+	if (resp.single_chip_mlo_support_valid && resp.single_chip_mlo_support)
+		ab->single_chip_mlo_support = true;
+
 	if (!resp.num_phy_valid) {
 		ret = -ENODATA;
 		goto out;
@@ -2276,7 +2279,8 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 	ab->qmi.num_radios = resp.num_phy;
 
 	ath12k_dbg(ab, ATH12K_DBG_QMI,
-		   "phy capability resp valid %d num_phy %d valid %d board_id %d\n",
+		   "phy capability resp valid %d single_chip_mlo_support %d valid %d num_phy %d valid %d board_id %d\n",
+		   resp.single_chip_mlo_support_valid, resp.single_chip_mlo_support,
 		   resp.num_phy_valid, resp.num_phy,
 		   resp.board_id_valid, resp.board_id);
 

-- 
2.25.1


