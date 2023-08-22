Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E3EE49AA
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDvdD2dI1D6qeYLOjh+1pkn5gj8KR+JXXMO//yW/AAM=; b=CXtisDNzmbQPXZ
	+aU60eRMYocEIynxQrwbePCAH1z6SI6ge8wy5phbZC7LYaLH7/PCMkF5eDsWxnSNijpEiznWd8chU
	nJYPc+oOdK2L8+4tf625LzUTq4WKJ02NJSY+q63XHn2DET7TmkVuPKQS7/A4GL+KL96SHwPo4AfCv
	WQvDPoKstpP+1BUf6GGEL1B632/RwDbztzCszCr2mbACV2+eJeqnq9EpDZoFQ3H6x9DvhUiM30Bvj
	L9/Ey3lINsTmi7QdEBmFY1OabEo2Dc3FB3XbgUiv8dnpKiuI6m7sfJPucLA3uw7ZZ3ERCKW+eRCZH
	ylfks8qeiv8X1wNjFqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSil-00GF7p-1F
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 14:51:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYSig-00GF5m-1q;
	Tue, 22 Aug 2023 14:51:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MCSfLl001448;
	Tue, 22 Aug 2023 14:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=5D+PB0ZbAeo8Gyavkbx9fNQpxl64Z0BmTiW2PI+8EBM=;
 b=HYpza8WyFlnRW5FYyND654Oud8mro59GY1f8eoGdQPrKXHRfzjXIqOtAsMx+TDLjsk8C
 MN4Gt4LLuoXKq75nMIc7EtV5F2f9VpjGUiw5iBFYLdtt/6fxXWvQYMt00R1y4tq9r+ln
 x/D72SCaPGMHDquOTRyYdsf7v7GvD4MPGLUTsXqWXiwDTsmp4h/nUUndfZ5O+y4BdIHG
 Cd1pj4Z2SHDh7MYGSRmTItYkagrZAcrFVX+GqqbaY7wSLXqirY85mF/Yc6pwuKjVHSkU
 KmOKCAoysENL3Uwsu6NZsdWM/NHmXd/zRwRg0lDgdZrZOxpqpIoIOff3Apkbrwn2kG/b Bw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smfjs9p86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 14:50:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MEopGm021375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 14:50:51 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 07:50:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 22 Aug 2023 07:50:48 -0700
Subject: [PATCH 1/3] wifi: ath10k: Fix a few spelling errors
MIME-Version: 1.0
Message-ID: <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
In-Reply-To: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZI3CklBJo_vDtzvz7xQOdp1UOP-iiIqJ
X-Proofpoint-GUID: ZI3CklBJo_vDtzvz7xQOdp1UOP-iiIqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_075058_762585_E4781AD7 
X-CRM114-Status: GOOD (  17.48  )
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

Fix a few issues flagged by 'codespell'.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/htt.h  | 4 ++--
 drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 drivers/net/wireless/ath/ath10k/wmi.h  | 8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index e0c9f45e7476..7b24297146e7 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -69,7 +69,7 @@ struct htt_ver_req {
  * The HTT tx descriptor is defined in two manners: by a struct with
  * bitfields, and by a series of [dword offset, bit mask, bit shift]
  * definitions.
- * The target should use the struct def, for simplicitly and clarity,
+ * The target should use the struct def, for simplicity and clarity,
  * but the host shall use the bit-mast + bit-shift defs, to be endian-
  * neutral.  Specifically, the host shall use the get/set macros built
  * around the mask + shift defs.
@@ -2086,7 +2086,7 @@ static inline bool ath10k_htt_rx_proc_rx_frag_ind(struct ath10k_htt *htt,
  * for correctly accessing rx descriptor data.
  */
 
-/* base struct used for abstracting the rx descritor representation */
+/* base struct used for abstracting the rx descriptor representation */
 struct htt_rx_desc {
 	union {
 		/* This field is filled on the host using the msdu buffer
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index a7f44f6335fb..57177890a463 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1636,7 +1636,7 @@ static int ath10k_pci_dump_memory_generic(struct ath10k *ar,
 						      buf,
 						      current_region->len);
 
-	/* No individiual memory sections defined so we can
+	/* No individual memory sections defined so we can
 	 * copy the entire memory region.
 	 */
 	ret = ath10k_pci_diag_read_mem(ar,
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 79e09c7a82b3..56fbcfb80bf8 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2389,7 +2389,7 @@ static int ath10k_sdio_dump_memory_generic(struct ath10k *ar,
 						      buf,
 						      current_region->len);
 
-	/* No individiual memory sections defined so we can
+	/* No individual memory sections defined so we can
 	 * copy the entire memory region.
 	 */
 	if (fast_dump)
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 6d04a66fe5e0..b112e8826093 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -3854,9 +3854,9 @@ enum wmi_pdev_param {
 	 * retransmitting frames.
 	 */
 	WMI_PDEV_PARAM_DYNAMIC_BW,
-	/* Non aggregrate/ 11g sw retry threshold.0-disable */
+	/* Non aggregate/ 11g sw retry threshold.0-disable */
 	WMI_PDEV_PARAM_NON_AGG_SW_RETRY_TH,
-	/* aggregrate sw retry threshold. 0-disable*/
+	/* aggregate sw retry threshold. 0-disable*/
 	WMI_PDEV_PARAM_AGG_SW_RETRY_TH,
 	/* Station kickout threshold (non of consecutive failures).0-disable */
 	WMI_PDEV_PARAM_STA_KICKOUT_TH,
@@ -3953,9 +3953,9 @@ enum wmi_10x_pdev_param {
 	WMI_10X_PDEV_PARAM_PROTECTION_MODE,
 	/* Dynamic bandwidth 0: disable 1: enable */
 	WMI_10X_PDEV_PARAM_DYNAMIC_BW,
-	/* Non aggregrate/ 11g sw retry threshold.0-disable */
+	/* Non aggregate/ 11g sw retry threshold.0-disable */
 	WMI_10X_PDEV_PARAM_NON_AGG_SW_RETRY_TH,
-	/* aggregrate sw retry threshold. 0-disable*/
+	/* aggregate sw retry threshold. 0-disable*/
 	WMI_10X_PDEV_PARAM_AGG_SW_RETRY_TH,
 	/* Station kickout threshold (non of consecutive failures).0-disable */
 	WMI_10X_PDEV_PARAM_STA_KICKOUT_TH,

-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
