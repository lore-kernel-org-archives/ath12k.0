Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E0FC54E60
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEEWyQPfS/z2ZZ2PTbBEE5MObLNZHiNkQZkre89czW4=; b=K2VkfZTBLiDk15eQo8QqTEqgJh
	NjivlNHwrk0A/ZgUudrDk9FKJe613n8JFwou7WHNACNOrBmIAzZEIbR5QJcCaVn0AC2znqyOucFf2
	j7OoLJ1i91JxTfsYwWY7troN5Z7n9IasSLo4emClNYXe4/cdxRpRng5FgUrMZFFh3Yi3AG1rKbhhc
	atsWj2OE5ygMEgfYS4lLfg2raQbCt9BagBIx8zAW2xjMUEYaxVVHha8kQzsc4kAgY3H+8EytQFKhP
	w/EPcDiYlOEA7a2yYe6QMLfj7iS30cWFHsfa0+3cwl3Bz3Uw08IUq0/+lOqJBTRgNhxC2fYmIOozb
	1Ydg3eKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2cD-00000005zpO-1d6E
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 13:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk2c9-00000005zls-2r7g
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 13:56:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CBIGcV003254;
	Tue, 12 Mar 2024 13:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=UEEWyQPfS/z2ZZ2PTbBEE5MObLNZHiNkQZkre89czW4=; b=Ft
	0ws+CTNKcbSCpGnqo1la0KRpMRk+KcXKoOIgU3ks2NursksEsU80aRgA/hwwqPHg
	OB5I8EOxkiulHeK7U/ZDz3OZ/QLKuo262tFhGKgPBjiCV9pGgDslmWF31JiUY/Xw
	bo1VNoIk0Xmvf5CRs528E2uLQuUYgVY3kdTDz74zX3ynUEyigLW3UZ62FDUEe+cd
	lSbdMskAL8YdKvAlI65CBpgJphYJxoX34hb5xqUquZ5TP02BRmP7fqXl7KEIyPyr
	VyaKCrmoJsFzeDBPn1SAJQw1pVKgru83qWvRUuwb5aWdmAxx8EGA4ztDcM20yHVW
	uIMQKeA2Wdv0Mqnb/PuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtckh1ehv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 13:56:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CDuJWi010714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 13:56:19 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 06:56:18 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v4 02/12] wifi: ath12k: Modify add and remove chanctx ops for single wiphy support
Date: Tue, 12 Mar 2024 19:25:47 +0530
Message-ID: <20240312135557.1778379-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312135557.1778379-1-quic_ramess@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FsI4jjfQLi23HJtOiEMFMWeoR89C--80
X-Proofpoint-GUID: FsI4jjfQLi23HJtOiEMFMWeoR89C--80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=788
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_065621_802892_4230CB61 
X-CRM114-Status: GOOD (  15.71  )
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


