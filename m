Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1FAC83F15
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZDTJguCe/XWfjFRURZs/SN8M25FTIbla1FHgJC/SJg=; b=EqewXP3vwDg3Gc
	pUhq15PttvcOoPlTl9d5VqfiCiC6UYz65MXLlCk0DMZonB4LGB45tFpFdZPpEorN9viov5n1CxooY
	/DDKf12wZhw5nXAyBL3v1WMcDs5YkaGl/97TU4CnF+DA1n3fuzNgPHHOyCEssG1aWVL9NMRsO/zyc
	gkFj2UIYb83CYzaKItV+p38Pdl7mL6y8WdFFRqVQrMwmDna1Q2dJuUKZgr8dReZE9iUFhHXwGNUdK
	CIievcaWrOX976tWgv3BOgtg/eTllrFThgQHb217uGX+h9+SK4sXiZnXmCSq6gFiTWXT2jE9OVjw1
	kC0f1Co2o2x0330gh4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR9C-00E4r5-0w
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 19:46:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR99-00E4qh-0y
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 19:46:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UGdJop010523;
	Wed, 30 Aug 2023 19:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=V3ZqCuKCyuAfBLwifHHJpScX9Qr85Utyh9yk4Xoaefg=;
 b=XlSY4Dd13BQhntBpS/sz2vkp+UhYLv/qw0hYBm7UNx2RXSl9QW3KmQ3mCI73RjOTErAL
 1uL9f85/TZR7Yri/bR4VuhxSvmswZMbIz5+ZDHQJa9sEaWz85WUGsk0EuAqTvgTCW0L5
 HHyOh75PH4eLVugogduNQKE9LFfdPPT81yucXxyIgQqWwkyOWXufnN+wZhfzvtL7aF0N
 FEco8TzV3JmriDD63a2Qy3jufQgo4Y8ES47cTIuUI80JEEsLejELzM8J1iRcrcSg5iBw
 PkDbTJ6aB3Y0RIJh7zrRWTa7dR4AFFxpA+Kly04QYJX4ayK5dNlUGOl2msAvuKNhnScc wA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sswbv1pbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 19:46:32 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37UJkJtm012562;
	Wed, 30 Aug 2023 19:46:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 3sqafmkk3b-1;
	Wed, 30 Aug 2023 19:46:19 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37UJkJLa012557;
	Wed, 30 Aug 2023 19:46:19 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-sidhanta-lv.qualcomm.com [10.47.205.116])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 37UJkJwY012555;
	Wed, 30 Aug 2023 19:46:19 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 4194996)
	id 0A376500193; Wed, 30 Aug 2023 12:46:19 -0700 (PDT)
From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sidhanta Sahu <quic_sidhanta@quicinc.com>
Subject: [PATCH] wifi: ath12k: Set default beacon mode to burst mode
Date: Wed, 30 Aug 2023 12:46:17 -0700
Message-Id: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U7ow81VEntAqphrPZhwIAXCyqbGXebUy
X-Proofpoint-GUID: U7ow81VEntAqphrPZhwIAXCyqbGXebUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxlogscore=854 adultscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_124635_509328_42E9FB5A 
X-CRM114-Status: GOOD (  14.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, firmware does not like when beacon mode is set as staggered
mode for more than one beaconing vifs. Beacon mode for multiple
beaconing (transmitted) vifs are expected to be in burst mode. So set
beacon mode to burst mode by default.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1bb9802ef569..b16cbc3c906d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2314,7 +2314,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON) {
 		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
-		param_value = WMI_BEACON_STAGGERED_MODE;
+		param_value = WMI_BEACON_BURST_MODE;
 		ret = ath12k_wmi_pdev_set_param(ar, param_id,
 						param_value, ar->pdev->pdev_id);
 		if (ret)
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
