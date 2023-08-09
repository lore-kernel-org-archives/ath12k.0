Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D2BEB64DD
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QgxSJeZH55PYCepk0Uk0ErGcJiqD+KJ5g9uTp1jS+mc=; b=2PRQviyZtDaz90
	ileVU+oY3og4puh5rc4VWZw92ZaC5zATpfWbpZoUDc7gQUvG54m1uKHt0GUNTlLrUvftRlgsw3WhZ
	2xGsfitqhsbtcAXo9ulYsd9l+88lExezjvOp3Lwjn9RGkW4qiRiPZdV5LLOMTyX5FSb65lMDrwZ+z
	rf7J5zE55uX7bGPDDGMccGOJBrdz7XsvV4RZrRzciUK1KtzOKXQsPAA70jo/3rNBlpH+gikiOp1EQ
	0h4kMiOwhp+hpSPUgA6zmFfa/u95KORtAUbeoEGIXovIe2EU1YEk8i6Euw6ph+mo75OYLhnlLm474
	4YTyQc2ITWEEP6J9M1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeNd-004LWQ-36
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 08:17:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeNb-004LVt-0t
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 08:17:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3795EQfS002770;
	Wed, 9 Aug 2023 08:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=skbwDMDqqr5VTm8bALGCL65/3FA3cP5JeYLwlqDvKek=;
 b=UDASSuekBPq1h1k3fmLJPG0YFuKDFjgpiWl0Wn8l0nq8xx1R7dzocj1ffKA2dzxBPHeF
 GVEIFkhRpSxAdoR4PCPUbfp1yPyPgjdINOIZsFtKaVRuAEut2+EEGtLiQx/GEuAVU0N7
 saoHTYbqJ82AEg4VCRGQ510vZJAS3Zh5zS47Dz6YqIu1iSouJ9gjyMQVI6CbxDZf3eTm
 TWp17BnZbqteC7frB7oKcosNzhd+SVfpRJr6Mk2bSGbgzB66mRibZJBS71JJrRYkIyty
 dr3OFqC8d2NemQzlKEM0pnYQBLZG9L3mZFyksCqggIgx9zDlJwgK1NemvtqUfUqOXSp5 4g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbp17j4w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 08:17:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3798HELa000654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 08:17:14 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 9 Aug 2023 01:17:13 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] wifi: ath12k: add check max message length while scanning with extraie
Date: Wed, 9 Aug 2023 04:16:57 -0400
Message-ID: <20230809081657.13858-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KijvAQ0kwBQaqVmTRufge_tCGO2kwhBx
X-Proofpoint-GUID: KijvAQ0kwBQaqVmTRufge_tCGO2kwhBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_06,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=947 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_011719_433289_656CEBAE 
X-CRM114-Status: GOOD (  15.38  )
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

Currently the extraie length is directly used to allocate skb buffer. When
the length of skb is greater than the max message length which firmware
supports, error will happen in firmware side.

Hence add check for the skb length and drop extraie when overflow and
print a message.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: seperate to another patch per johannes.

 drivers/net/wireless/ath/ath12k/wmi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 9ed33e2d6da0..e964d6003ea9 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2240,12 +2240,6 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	if (arg->num_bssid)
 		len += sizeof(*bssid) * arg->num_bssid;
 
-	len += TLV_HDR_SIZE;
-	if (arg->extraie.len)
-		extraie_len_with_pad =
-			roundup(arg->extraie.len, sizeof(u32));
-	len += extraie_len_with_pad;
-
 	if (arg->num_hint_bssid)
 		len += TLV_HDR_SIZE +
 		       arg->num_hint_bssid * sizeof(*hint_bssid);
@@ -2254,6 +2248,18 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 		len += TLV_HDR_SIZE +
 		       arg->num_hint_s_ssid * sizeof(*s_ssid);
 
+	len += TLV_HDR_SIZE;
+	if (arg->extraie.len)
+		extraie_len_with_pad =
+			roundup(arg->extraie.len, sizeof(u32));
+	if (extraie_len_with_pad <= (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len)) {
+		len += extraie_len_with_pad;
+	} else {
+		ath12k_warn(ar->ab, "discard large size %d bytes extraie for scan start\n",
+			    arg->extraie.len);
+		extraie_len_with_pad = 0;
+	}
+
 	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
 	if (!skb)
 		return -ENOMEM;
@@ -2343,7 +2349,7 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
 	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, len);
 	ptr += TLV_HDR_SIZE;
 
-	if (arg->extraie.len)
+	if (extraie_len_with_pad)
 		memcpy(ptr, arg->extraie.ptr,
 		       arg->extraie.len);
 

base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
