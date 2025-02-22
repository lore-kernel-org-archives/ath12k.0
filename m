Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4256C021B6
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Cjymd7RFlnL3KaUcfMo+UlqcDBxY71O3yF4xGP22bU=; b=Xc9H5rXjsvSsjaJsDDZFSQDudj
	OXhPn0l+R5y9GMeRkcK7TciRKUn4P7rQ3rM35N8rYPc99r8gMgX/I/RPfGbYTxdfNQtDckrKdtPrG
	b9ZZRDkLglZ7Yvv3I9haLFbpBwpj/kkG/ZJPx31tMtw00oUl0C0plpjapxQUTESM3lnkaNQiXzTMH
	eNYyPcxmjRz6hT/kcjKttkGYUL9Lp9aTOuUPkLwdu7mYTmLIsgszqH5g2OBlB410BLp9Aljt+pGhE
	HAE6iYkwVmxnHCiLqhH0apoI940Cex0ISn0Hdad8zY6da8sei3AflNIZLmqXjIG+rKmDCA1KUW/V1
	xc2QWniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrIT-00000008FyA-1q7i
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 15:20:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrIQ-00000008Fw6-40fj
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 15:20:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51MDCxcC022441;
	Sat, 22 Feb 2025 15:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Cjymd7RFlnL3KaUcfMo+UlqcDBxY71O3yF4xGP22bU=; b=b4mXAIEoFaLqNb4K
	r2Ska5Xx/RkpC4xmcyyAlVItqKdNf8ldLbFDOnCHEova2d/olN9Iw2b9dY59+hLb
	lbti0Rz1TjxgAT5xd7M8fCtjAglX3NUtAJqHDmfbWFk1NyHf0YGM/OKocnBsvkMI
	8GUuwqzUJT7kATjk2ICgsXI5knnDgkUfwe8HDVPNc1DQ4Qg8tN045GIVuLgPwUfq
	0ep228G/BKXyJBqd7Pj8EI/bq1CY1QC//94Q3Z/bjSjd6IzyHhYWY+u1L7ozvnUY
	DS/6bC3VrKMBc+BpEL4YncrziGhrKzc92JidzSdwl9QSIR7Qpjr+xhEsT0XSJeLl
	ai08LQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k60y5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 15:20:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51MFK1JR015524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 15:20:01 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 22 Feb 2025 07:19:59 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v8 8/9] wifi: ath12k: Refactor the monitor channel context procedure
Date: Sat, 22 Feb 2025 20:49:25 +0530
Message-ID: <20250222151926.379652-9-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250222151926.379652-1-quic_periyasa@quicinc.com>
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dReUvuxoacm71Zj4sp38OdRqcDlEKsvf
X-Proofpoint-GUID: dReUvuxoacm71Zj4sp38OdRqcDlEKsvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=783 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_072003_102645_8161A0EF 
X-CRM114-Status: GOOD (  12.84  )
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

Currently, the monitor start procedure use the iteration callback to pick
the last available channel definition in the mac80211 hardware. This
approach is incorrect for the single wiphy model, as it holds multiple
radio/link channel contexts within the same mac80211 hardware. To fix this,
change the iteration callback to pick the specific channel context for the
given radio/link. This approach makes the monitor start procedure
compatible with both multi wiphy and single wiphy models.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c0e50cc5c024..54af9cbbf7cb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1323,19 +1323,9 @@ static int ath12k_mac_monitor_vdev_delete(struct ath12k *ar)
 	return ret;
 }
 
-static void
-ath12k_mac_get_any_chandef_iter(struct ieee80211_hw *hw,
-				struct ieee80211_chanctx_conf *conf,
-				void *data)
-{
-	struct cfg80211_chan_def **def = data;
-
-	*def = &conf->def;
-}
-
 static int ath12k_mac_monitor_start(struct ath12k *ar)
 {
-	struct cfg80211_chan_def *chandef = NULL;
+	struct ath12k_mac_get_any_chanctx_conf_arg arg;
 	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -1343,13 +1333,16 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
 	if (ar->monitor_started)
 		return 0;
 
+	arg.ar = ar;
+	arg.chanctx_conf = NULL;
 	ieee80211_iter_chan_contexts_atomic(ath12k_ar_to_hw(ar),
-					    ath12k_mac_get_any_chandef_iter,
-					    &chandef);
-	if (!chandef)
+					    ath12k_mac_get_any_chanctx_conf_iter,
+					    &arg);
+	if (!arg.chanctx_conf)
 		return 0;
 
-	ret = ath12k_mac_monitor_vdev_start(ar, ar->monitor_vdev_id, chandef);
+	ret = ath12k_mac_monitor_vdev_start(ar, ar->monitor_vdev_id,
+					    &arg.chanctx_conf->def);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to start monitor vdev: %d\n", ret);
 		ath12k_mac_monitor_vdev_delete(ar);
-- 
2.34.1


