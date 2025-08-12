Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B193CCA0EE4
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKcIHSKMUSpzmJKHTeXlxxEDBuDdgdxW9YpGdm3bZM4=; b=frX+jBnSLKFXq+3JBqguHvfT6B
	lpkO8mHpOz9wQsknAhF+BpFMWOfZGNvFVyU3DaNAFj3oaNUZzFTyuBDRh7WFie9skBGIctx6jLviD
	i45m2J8i/u03K9HpJWjocs6sNFuyAOictCAuxYWsKLxdYmkcUEQfF42szh2siUU9+gvvdOEyP9kEu
	7kh/92qmUCI7vCx1zb7laCnNjIH16X6CQudGp50WVxRawsV2ti7LgHzvBsPFhO9/A1FvpgXh1MqX4
	jsRiQINPpgo1xjpIrTdawM72nMEwreaaoBOznfKTGf6XWQ7Vh41TlB7XyO4wnRDJLLsjJkC+mY/zk
	s39iffsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluft-0000000Bqc0-1w4Z;
	Tue, 12 Aug 2025 19:28:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYF-0000000BWUd-0fYj
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvh80021060;
	Tue, 12 Aug 2025 17:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKcIHSKMUSpzmJKHTeXlxxEDBuDdgdxW9YpGdm3bZM4=; b=B/iQonuK+Uqfb74Q
	fy1uRHt08mEkKPAXmRI8bNUAG0Owv8CVaRt6FCN7iRGtEMcUY6kN7m+ylFfDoWk+
	tGOr8eK9fqsQ/TuL3VL9e4i7Z2luGKq6heMkCOvL17e2mSyrCQRSmCeoYVN6srKA
	oK3V1oEU6Y9g0cn1UgyYkyDHL9Uz3SQ8MB0k0Jkelg/znusWndvPBkSBTqUhdWt3
	UBI5R1XR+E1T+USMngj/V00AbaudbZZl6e4AQzY9MkitJEwuORElaYvBC2Zj3s4J
	Y27EY2k6AA+FhkajzMLfYZyz0c4kpZOJN7Mf2vQTu9Je4ifNVXwCtlQPjyNXlujg
	YQzs3A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6mtv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:42 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCgmT010559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:42 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:41 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Date: Tue, 12 Aug 2025 22:39:32 +0530
Subject: [PATCH ath12k-ng 06/13] wifi: ath12k: Rename ahb_hif_ops to
 reflect generic usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-ath12k-mod-v1-6-8c9b0eb9335d@quicinc.com>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX93Qs/87tBbOE
 BMaN5UioDk9rf1ds8n0oPKnhhyIm4jgvshnLk/AVst68Ole8zOQscSrlrdG46mAwZ8GVVp34ZsM
 BgszoC0MFNk6tbZ3W08exfVbY+iBVr+hqCBpUXQFvRz1UQrr69e9yBoz2FRxOYtqTPb3hmtk1YL
 53950S8bXVHSTbzcx+i+K2H9qQe9YGBvY2JOArYkNxh41PloKirRkGsMmZ+DA/Qayh82MCSeQ/K
 MTin4csFad8CT6O94PsjbIZgkDmuPqybHXJ79XeY2Qp007npBDMqhGufJwrtMbTaa0c58xNHU+d
 uWnNAs8+lCkuggBjjGr+W0ROsRwpfl2NQnKmQR/60wsr9bUjPdKxH8s12iiHkj9ioi/rvfhiuuo
 GFik6jqj
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689b760a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=9IPlZk3tFBeDqHISyp4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Zyvh4s5inGV__sLz0lysiwlIlhO9ltN4
X-Proofpoint-ORIG-GUID: Zyvh4s5inGV__sLz0lysiwlIlhO9ltN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101243_210583_8D580F39 
X-CRM114-Status: GOOD (  12.16  )
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

Rename ahb_hif_ops structure to remove the IPQ5322 qualifier and reflect
its generic applicability across multiple targets. Clarify its role as a
container for common HIF callbacks.

This renaming is part of a broader effort to modularize the codebase
by separating common logic from device-specific implementations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kiran Venkatappa <quic_kiranv@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3b983f4e3268c6fbf1546bda6677d2bf2d985d86..f512854e82e4f32328dc49eac2472027c7369dfd 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -698,7 +698,7 @@ static int ath12k_ahb_map_service_to_pipe(struct ath12k_base *ab, u16 service_id
 	return 0;
 }
 
-static const struct ath12k_hif_ops ath12k_ahb_hif_ops_ipq5332 = {
+static const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
 	.start = ath12k_ahb_start,
 	.stop = ath12k_ahb_stop,
 	.read32 = ath12k_ahb_read32,
@@ -1011,7 +1011,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 	hw_rev = (enum ath12k_hw_rev)(kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 	switch (hw_rev) {
 	case ATH12K_HW_IPQ5332_HW10:
-		hif_ops = &ath12k_ahb_hif_ops_ipq5332;
+		hif_ops = &ath12k_ahb_hif_ops;
 		userpd_id = ATH12K_IPQ5332_USERPD_ID;
 		break;
 	default:

-- 
2.34.1


