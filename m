Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A915C54E66
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEEWyQPfS/z2ZZ2PTbBEE5MObLNZHiNkQZkre89czW4=; b=viwt7KKkHSnYdUgoxl24CS6Ffl
	FJ37tT/IQRvonzZRd/sE6HTl714CL+EzotL1qg0Zm4QFGoe3DXawJGaTzwwvajFG9Kb77s9RbTcfX
	i96vQ9bj6VCCp7y7u9aiMOtTD/3ROT3ogwofP4CuMU1x4DgMbafBT4JAVA3KppeLPgmpo6endLi7k
	xAUu9eYSdU6qEzLDXLwAlYw9qDb+hCB0eEUeJmah+nj6qvNZCxMYa86V2K4ccG0naHbwZPf60xel5
	9tV8PGWfJtiURD3XNn/eo0M0e0esZNFhArHxnA+/Ozfi2Z3IQC5NGaiIFbEH2KgvqTMwiVO/gZox4
	wb2546tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3x-000000051F5-2Eif
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 09:04:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3o-0000000516v-350m
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 09:04:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C6MQF4019737;
	Tue, 12 Mar 2024 09:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=UEEWyQPfS/z2ZZ2PTbBEE5MObLNZHiNkQZkre89czW4=; b=ps
	WKIhDsUMOyuTLgELFq6WpGeIMuLWvmS+s9FY/RRzmImUy9TTVjiY1oPXrBkdoptF
	2caM+3LCv+vJwbv8XkbeDLRDuXOwcMLCyE+ZQp9osB7Ql+0P3wbH4gPuMLFfJoke
	34EU1b1iqHl3VgN6Ig2LAaqH5QauJ8dS6hfsHAX4lXNn+x4FqLr38JJyGLDurBQd
	Eo5STQ7dP0aD3IiIYP9dSo92VYLzwihtC4tM7MVQUVjJ+KRodoaMQOl1hbQ5WnxL
	9NhjSycZah9M3fcoRHDSxsyfHIEl2H7QF6fxxd1giBwLlXys0C7ggsqp9vA0F212
	N+4m2grs2sugciJL1F7w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wthqfr9e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C94OWQ005651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:24 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 02:04:22 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v3 02/12] wifi: ath12k: Modify add and remove chanctx ops for single wiphy support
Date: Tue, 12 Mar 2024 14:33:41 +0530
Message-ID: <20240312090351.1620218-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312090351.1620218-1-quic_ramess@quicinc.com>
References: <20240312090351.1620218-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fFM-0kFaIpgflsmvgDYJ9n8MgN2aTaT5
X-Proofpoint-ORIG-GUID: fFM-0kFaIpgflsmvgDYJ9n8MgN2aTaT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 mlxlogscore=788 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_020437_138863_98C3C36A 
X-CRM114-Status: GOOD (  16.04  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Modify add and remove chanctx mac80211 ops to fetch the correct
radio(ar) based on channel context.

This change also introduces new helper function to fetch the
radio/ar based on channel context and ieee80211_chan which internally
uses the radio's low/high freq range.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 50 ++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index ff831faa4945..53bcf9416efd 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -598,6 +598,9 @@ struct ath12k {
 	bool monitor_vdev_created;
 	bool monitor_started;
 	int monitor_vdev_id;
+
+	u32 freq_low;
+	u32 freq_high;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ba69fdfa9133..0f33f5615170 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -613,6 +613,35 @@ struct ath12k *ath12k_mac_get_ar_by_pdev_id(struct ath12k_base *ab, u32 pdev_id)
 	return NULL;
 }
 
+static struct ath12k *ath12k_mac_get_ar_by_chan(struct ieee80211_hw *hw,
+						struct ieee80211_channel *channel)
+{
+	struct ath12k_hw *ah = hw->priv;
+	struct ath12k *ar;
+	int i;
+
+	ar = ah->radio;
+
+	if (ah->num_radio == 1)
+		return ar;
+
+	for_each_ar(i, ah, ar) {
+		if (channel->center_freq >= ar->freq_low &&
+		    channel->center_freq <= ar->freq_high)
+			return ar;
+	}
+	return NULL;
+}
+
+static struct ath12k *ath12k_get_ar_by_ctx(struct ieee80211_hw *hw,
+					   struct ieee80211_chanctx_conf *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	return ath12k_mac_get_ar_by_chan(hw, ctx->def.chan);
+}
+
 static void ath12k_pdev_caps_update(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -6229,11 +6258,13 @@ static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
 static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 				     struct ieee80211_chanctx_conf *ctx)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_ctx(hw, ctx);
+	if (!ar)
+		return -EINVAL;
+
 	ab = ar->ab;
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
@@ -6257,11 +6288,13 @@ static int ath12k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 static void ath12k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 					 struct ieee80211_chanctx_conf *ctx)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_ctx(hw, ctx);
+	if (!ar)
+		return;
+
 	ab = ar->ab;
 
 	ath12k_dbg(ab, ATH12K_DBG_MAC,
@@ -6637,11 +6670,13 @@ static void ath12k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 					 struct ieee80211_chanctx_conf *ctx,
 					 u32 changed)
 {
-	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
 	struct ath12k_base *ab;
 
-	ar = ath12k_ah_to_ar(ah, 0);
+	ar = ath12k_get_ar_by_ctx(hw, ctx);
+	if (!ar)
+		return;
+
 	ab = ar->ab;
 
 	mutex_lock(&ar->conf_mutex);
@@ -7643,6 +7678,9 @@ static void ath12k_mac_update_ch_list(struct ath12k *ar,
 		    band->channels[i].center_freq > freq_high)
 			band->channels[i].flags |= IEEE80211_CHAN_DISABLED;
 	}
+
+	ar->freq_low = freq_low;
+	ar->freq_high = freq_high;
 }
 
 static u32 ath12k_get_phy_id(struct ath12k *ar, u32 band)
-- 
2.25.1


