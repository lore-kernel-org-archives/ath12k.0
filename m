Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0E3C47079
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWZKpJbDokdXRLtGCvzio3SCBPXi+ue9xkp/Nnw87Nc=; b=C8IgmiFbip4YE6dfHlC7hOT1Oi
	cDm+MQFM0LTh64VqZcfuExV9OifUhclqJcgoJdevbf9n67SBpE6QAprk1U+arCmr7fZeBjta1uaAd
	74MdytHfern2cAcuhL1MesKVcxLl/M3GvbL0rtTKMOIm3omz/6SOU7zsuDnhv72hY+G2F7lIFJdp8
	KJ/7puimloG7Et1JnSIFcLCAIKtE74RZd3nOZO9ClL7S4R7KD+7M4EY5J8Enl8HA2C3cldo3Pg/Gu
	mTTD46dK4Of+ljnjHdcAjrID6XmVr8cAc1aozG33CeZ/m15cW7kCmFZgjlJc5uz7Vdpj6vkWP3f38
	NCOiGilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKut1-009uEi-1G
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 06:37:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKusy-009uDj-1N
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 06:37:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4035wS5T032470;
	Wed, 3 Jan 2024 06:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=TWZKpJbDokdXRLtGCvzio3SCBPXi+ue9xkp/Nnw87Nc=; b=al
	sYZBoz82T0iNfnmjxSz8tCFynidQpi0hxawEhv6Jii+TdKpeYTJj77mf3Mp8+jg6
	ZsYYeUNdukAkyrOdGVissBGbdEOAxvXLXsj2ePHi5KWrBTaqMEmO+ttoPx+JJJ+0
	XLb3I+62Q+Ug7ND7iBJVxzR3BX2y6DQOXojxVv3WAp4qnz+7AtLTQipNPCbloriP
	wOAtlW6hYjyM3HLMgAumd1pk+eK8CG7bpqO67khoqU1Qm40n0agO+s4lyb8glW7a
	zTgWYfiNVfC3pwzb27B5Je1Lkmq2W8DEKeTuVadvu+M+IANSkTFT5ygDhnLOdjEI
	S/FxNV/5GyHCaKXzHbig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcbnb2sjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 06:37:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4036bo35023447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 06:37:50 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 22:37:48 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 01/10] wifi: ath12k: Refactor mac callback of config
Date: Wed, 3 Jan 2024 12:07:22 +0530
Message-ID: <20240103063731.3356060-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tjSAjBWNIfecD36k9vYchHawGfDeOgmg
X-Proofpoint-GUID: tjSAjBWNIfecD36k9vYchHawGfDeOgmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=688 mlxscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_223752_577116_0793C9BF 
X-CRM114-Status: GOOD (  12.78  )
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

To support single wiphy abstraction, introduce link/radio specific helper
function in the mac80211 callback config(). This way, the callback can be
extended to handle multiple link/radio in the future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88cec54c6c2e..7b02a107ab38 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -1083,9 +1083,9 @@ static int ath12k_mac_monitor_stop(struct ath12k *ar)
 	return ret;
 }
 
-static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
+static int ath12k_mac_config(struct ath12k *ar, u32 changed)
 {
-	struct ath12k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_conf *conf = &hw->conf;
 	int ret = 0;
 
@@ -1122,6 +1122,19 @@ static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
+static int ath12k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
+{
+	struct ath12k *ar = hw->priv;
+	int ret;
+
+	ret = ath12k_mac_config(ar, changed);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to update config pdev idx %d: %d\n",
+			    ar->pdev_idx, ret);
+
+	return ret;
+}
+
 static int ath12k_mac_setup_bcn_tmpl(struct ath12k_vif *arvif)
 {
 	struct ath12k *ar = arvif->ar;
-- 
2.34.1


