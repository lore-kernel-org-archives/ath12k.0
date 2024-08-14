Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9789CC52D7B
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eKkORUW4pAsjU0mHkTjGGGwEjGUBj3lRsvZQp8N/zU=; b=MT0O6wu8tuDrEIG0Oy8XaxgD69
	YCpKTkzmP6HBFD8m6s9O9CFbcsa5aIRoI3mrBfTfPLwcHqK6IvFrUlYY5XsgypCTuiORZzjUk0cM0
	A11QPpnYoNF8ZHM/tO1L+gB4u0INKi9aaIWL203WPuE/S50th2tTtn2mTEv7DKYy8fz6R+v5i82yw
	9Dxu+tWlLaoFHS7tPYipqjDIqFoOg+as8VYysimwn7HDvGSXhqz4Qt54eFLnyqEEpsdE3C1NvF7H5
	VcdFpGAN5+s/6h8QZtYjJ9yZW81FYuyvOo9M3N4vVpmsIL9VCYAqIp40I7pgv0fY3WvU5PZu4oQDi
	BoPIsjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBL5-00000006ceY-1Eft
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 10:34:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBL2-00000006cdL-2boy
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 10:34:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFmMo006123;
	Wed, 14 Aug 2024 10:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eKkORUW4pAsjU0mHkTjGGGwEjGUBj3lRsvZQp8N/zU=; b=PUWJ1dPy+2lavMrZ
	ynytoR3k29u//VOhz/cLvSb7MLzqLPuYClEgSMIKLbh7PXHkodrt7J6DGAJQOpIh
	Y3OFrMvtaHk83tfpTHHPsyD1aWd+dloJ3XQmltev7zatNYvyB0VcsrRtaaONqp7N
	3RMRnl7XI3kWxvN2VZM0zPsQ7iU8j3aKImv3PoPwoXZWOFaZjdEkgnp78jO5gWia
	+RQihSxEnnUaXOGE8dDfrmK/gUHn0SOZmEpHES7AlcRfrmdHwke3xDDP3RjbPxqt
	TO1d8yALVunIMDr2E488grTsyQNuez04RgSj2QFqyLjnVghUVZzJnvSatvVm8Gs+
	8U055A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40yxwv4te1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:34:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EAYfTC002528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:34:41 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 03:34:40 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: Introduce iface combination cleanup helper
Date: Wed, 14 Aug 2024 16:04:21 +0530
Message-ID: <20240814103423.3980958-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
References: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GhJJJWkqAUC7Wf-epzJ0gAWjGFS7F5Vq
X-Proofpoint-ORIG-GUID: GhJJJWkqAUC7Wf-epzJ0gAWjGFS7F5Vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=796 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_033444_823031_5F43AB2F 
X-CRM114-Status: GOOD (  12.43  )
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

Introduce a cleanup helper function to avoid redundant code for iface
combination cleanup. Remove the cleanup code from
ath12k_mac_hw_unregister() and ath12k_mac_hw_register() and replace it
with new cleanup helper function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a3248d977532..69f50c1a52d6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8865,6 +8865,14 @@ static bool ath12k_mac_is_iface_mode_enable(struct ath12k_hw *ah,
 	return is_enable;
 }
 
+static void ath12k_mac_cleanup_iface_combinations(struct ath12k_hw *ah)
+{
+	struct wiphy *wiphy = ah->hw->wiphy;
+
+	kfree(wiphy->iface_combinations[0].limits);
+	kfree(wiphy->iface_combinations);
+}
+
 static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 {
 	struct wiphy *wiphy = ah->hw->wiphy;
@@ -8993,7 +9001,6 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 {
 	struct ieee80211_hw *hw = ah->hw;
-	struct wiphy *wiphy = hw->wiphy;
 	struct ath12k *ar;
 	int i;
 
@@ -9007,8 +9014,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 	for_each_ar(ah, ar, i)
 		ath12k_mac_cleanup_unregister(ar);
 
-	kfree(wiphy->iface_combinations[0].limits);
-	kfree(wiphy->iface_combinations);
+	ath12k_mac_cleanup_iface_combinations(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -9238,13 +9244,13 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	ret = ath12k_wow_init(ar);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to init wow: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_cleanup_if_combs;
 	}
 
 	ret = ieee80211_register_hw(hw);
 	if (ret) {
 		ath12k_err(ab, "ieee80211 registration failed: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_cleanup_if_combs;
 	}
 
 	if (is_monitor_disable)
@@ -9274,9 +9280,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	ieee80211_unregister_hw(hw);
 
-err_free_if_combs:
-	kfree(wiphy->iface_combinations[0].limits);
-	kfree(wiphy->iface_combinations);
+err_cleanup_if_combs:
+	ath12k_mac_cleanup_iface_combinations(ah);
 
 err_complete_cleanup_unregister:
 	i = ah->num_radio;
-- 
2.34.1


