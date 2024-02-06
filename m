Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1247AC48297
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28cuVq00o/JMlfn7ktM0K873EkZPm5LlSZpvsIteBQg=; b=k+gK1z+39hDR8tDUp/YQa0aTUH
	nFGDoDAH2T2iJoyyOnejI4mpvQj4RZZE99OyobQ4KF0wgt3DQKIv5aXGA+6+RTTw9Nx5P/G/AmrtO
	4H2a1OwRrlNzQtBU+t3h4hDGw/2bGa8g1akSurMAlZ+wNN5P7HcY9F6bxpsLFqeZ3Rmv/3rIuWXPp
	6cAYQtZWl5Q+OwH+3qp1BQTvYjnzGHwR+a9Une5MlWQSa+ap/GateDo9qa7nh2FKAwKrYCxulbQkr
	vJKg6fXWT4Vz1xGnQqdtDBpap5ganUKq6pdSqX5eXBkiKNT17EZZv+ekwH4NeYaipntjx6VfpaKNR
	C/rocYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJtZ-00000007OSW-3DjX
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 11:45:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeU-00000006gCm-3Rxa
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=28cuVq00o/JMlfn7ktM0K873EkZPm5LlSZpvsIteBQg=; b=PctlxlY9ALrBIGx3ZjUo8u8uV2
	64NKJPf9fII6ZJcYiNqS53ps3ZyOFGlZ0u87XiYZ/9kNtPZBn172XB0KMgPySUN/CoyXQtR0cWbSu
	kYWYtSIG/W8wR++DqVrCyZLYDp0z3MO/HIplMJulD/BGBmgc097bf+kKDgsMHw2YDlamr7FHKRHf1
	flcdQK9yWiCQauuL56+CPghkl73KR6DcAknn7MR+6CBtt9ILB6hlRzcyQhtN3ILUyMTdvPf44oMt1
	bJs2mdijE4DSZnTGPAy3WbmduDdLiPHN8wBbdgxB9bjr1fyaAtbAq8wVyozIthecQjTTFCAXE3cLx
	8QtdNyxQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeQ-0000000CQyq-43eZ
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:22:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4169FaEx013622;
	Tue, 6 Feb 2024 09:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=28cuVq00o/JMlfn7ktM0K873EkZPm5LlSZpvsIteBQg=; b=Z/
	bjqh74xeULgNmcyOAS8otBzJcVTdf4v9cM55pj56xKl6mVB4N/YKhdczlWso7UvO
	LAz6OBotvomoke5lzgMPXwEN8WI3xg//30FpAQJLBDUF2DBZwZ9HEdB0gNl4N2ru
	ZRRxqZwHIvQurVYMZhewF1LkW3PR+1//GTHd0jeDSFxkzJ1Jz2/OtHIJ0AKtvcA6
	IlIkxGP0CJN7bAQgf+f+aIQkp2I8cMRJd+cBQvmPakW89nSIEGgfDXxGy+fTC2Df
	6d9pULupoGKg5qsoZ4fuEfOXjt+2ZzlUc2FtkF61Ve38d7hKifjJV0Jx76nnPofV
	abu2Rzz11K1D4cPldFqQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3hyvg0a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:21:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169LtsA021325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:21:55 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:53 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v2 09/12] wifi: ath12k: modify regulatory support for single wiphy architecture
Date: Tue, 6 Feb 2024 14:49:51 +0530
Message-ID: <20240206091954.4144454-10-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206091954.4144454-1-quic_ramess@quicinc.com>
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3SYhprtr12fmTSRIQ4T8CadBRO7ioOo2
X-Proofpoint-GUID: 3SYhprtr12fmTSRIQ4T8CadBRO7ioOo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092159_517119_F3DF03BA 
X-CRM114-Status: GOOD (  24.10  )
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

With all the radios being combined and registered as a single
mac80211 hw/wiphy, separate regd built from firmware rules need
not be updated to cfg80211. Rather we can pick one of the regd
built from the rules to update to cfg80211 for the whole
registered device. We prefer 6 GHz pdev based rules since it has
the rules for all bands. If the hw doesn't support 6 GHz, then update
rules from one of the pdevs.

Also, when regulatory notification is received, update to all the
underlying radios/ar so that it becomes aware of the change and as
well us it updates its local regd with the new country rules. Later
pick the appropriate pdev's regd(6 GHz if available) and apply to
cfg80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 +
 drivers/net/wireless/ath/ath12k/mac.c  |  2 +
 drivers/net/wireless/ath/ath12k/reg.c  | 58 ++++++++++++++++++++++----
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d41f8e5915f6..01232679795c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -632,6 +632,8 @@ struct ath12k_hw {
 
 	u8 num_radio;
 
+	bool regd_updated;
+	bool use_6ghz_regd;
 	/* Keep last */
 	struct ath12k radio[] __aligned(sizeof(void *));
 };
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 631b24c6e435..617dd55e7d4e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7829,6 +7829,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
 	void *channels;
 	u32 phy_id;
+	struct ath12k_hw *ah = ar->ah;
 
 	BUILD_BUG_ON((ARRAY_SIZE(ath12k_2ghz_channels) +
 		      ARRAY_SIZE(ath12k_5ghz_channels) +
@@ -7881,6 +7882,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
 						  reg_cap->high_5ghz_chan);
+			ah->use_6ghz_regd = true;
 		}
 
 		if (reg_cap->low_5ghz_chan < ATH12K_MIN_6G_FREQ) {
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index e44723d9d0b2..1df8a2bfcddd 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -50,7 +50,7 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	struct ath12k_wmi_init_country_arg arg;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
-	int ret;
+	int ret, i;
 
 	ath12k_dbg(ar->ab, ATH12K_DBG_REG,
 		   "Regulatory Notification received for %s\n", wiphy_name(wiphy));
@@ -85,10 +85,17 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	memcpy(&arg.cc_info.alpha2, request->alpha2, 2);
 	arg.cc_info.alpha2[2] = 0;
 
-	ret = ath12k_wmi_send_init_country_cmd(ar, &arg);
-	if (ret)
-		ath12k_warn(ar->ab,
-			    "INIT Country code set to fw failed : %d\n", ret);
+	/* Allow fresh updates to wiphy regd */
+	ah->regd_updated = false;
+
+	/* Send the reg change request to all the radios */
+	for (i = 0; i < ah->num_radio; i++) {
+		ret = ath12k_wmi_send_init_country_cmd(ar, &arg);
+		if (ret)
+			ath12k_warn(ar->ab,
+				    "INIT Country code set to fw failed : %d\n", ret);
+		ar++;
+	}
 }
 
 int ath12k_reg_update_chan_list(struct ath12k *ar)
@@ -205,8 +212,29 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 	struct ieee80211_regdomain *regd, *regd_copy = NULL;
 	int ret, regd_len, pdev_id;
 	struct ath12k_base *ab;
+	int i;
 
 	ab = ar->ab;
+
+	/* If one of the radios within ah has already updated the regd for
+	 * the wiphy, then avoid setting regd again
+	 */
+	if (ah->regd_updated)
+		return 0;
+
+	/* firmware provides reg rules which are similar for 2 GHz and 5 GHz
+	 * pdev but 6 GHz pdev has superset of all rules including rules for
+	 * all bands, we prefer 6 GHz pdev's rules to be used for setup of
+	 * the wiphy regd.
+	 * If 6 GHz pdev was part of the ath12k_hw, wait for the 6 GHz pdev,
+	 * else pick the first pdev which calls this function and use its
+	 * regd to update global hw regd.
+	 * The regd_updated flag set at the end will not allow any further
+	 * updates.
+	 */
+	if (ah->use_6ghz_regd && !ar->supports_6ghz)
+		return 0;
+
 	pdev_id = ar->pdev_idx;
 
 	spin_lock_bh(&ab->base_lock);
@@ -259,10 +287,22 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
 	if (ret)
 		goto err;
 
-	if (ah->state == ATH12K_HW_STATE_ON) {
-		ret = ath12k_reg_update_chan_list(ar);
-		if (ret)
-			goto err;
+	ah->regd_updated = true;
+
+	/* Apply the new regd to all the radios, this is expected to be received only once
+	 * since we check for ah->regd_updated and allow here only once
+	 */
+	ar = ah->radio;
+	ab = ar->ab;
+
+	for (i = 0; i < ah->num_radio; i++) {
+		if (ah->state == ATH12K_HW_STATE_ON) {
+			ret = ath12k_reg_update_chan_list(ar);
+			if (ret)
+				goto err;
+		}
+		ar++;
+		ab = ar->ab;
 	}
 
 	return 0;
-- 
2.25.1


