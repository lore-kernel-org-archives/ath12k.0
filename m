Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7EEC4828D
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgPu1IGPSkoodtjXL+roS8cawxMXT5/Ei4a544A4YAU=; b=OaWhZGPnxsm6ju2OGX2mkz4XyH
	nUvReT9G2U2TS+njUStK7UtHBvsfQe3DgyetxM/ev+QLSVJ5hkwc23m0Fha0xxhObKdbitNP02fA1
	fjcwPpdAwWN5hh2GSXuthy/eaRk306UO4bk5RIgGlRNgMQHJnYdzCIqQYTJXUFZXXnTnP/3ae9t05
	LMpzaiioYgJCXnjGFUdhUXEmXnDSLTb9IgDktpAg2TQn+I7SE/enhaZoiVQEb8bVGpBmUz9sQJ/i7
	5Y/XIAktKkj2ovvJeGraFJzsiCcuCyt0a+NjzdBTb0JGmFjQ9HZ2k6yjrDz9rLx6XTRdYWl6bXIlP
	zTmfL5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIj2-0000000736x-3gKe
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 10:30:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeH-00000006g7Y-3AQz
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tgPu1IGPSkoodtjXL+roS8cawxMXT5/Ei4a544A4YAU=; b=UfY1YOEq/0uGFKmD4t1tOuzuBg
	QLgxA882mSLhbWjz+WInD+/jiz4Zpn1UHNq9ggcy1ufvavnhBosbs0bS92fvVhF+flAqt/lULq6Lw
	z0QsJFGh0gp9H6Dbp/G8TZfZW0EfhW8OLfOv2kj2dT0L0lnZonzNWFlAq1ys9x1uWxo5AnIVaZm5L
	/dnZG9cTCB+9Fh2bAWAjx3SDe9hRDgX12tiOkEuu8JejIQFWDgjWJ7CC/okhOfTfzJ75i1upUcLYu
	Yr6CsEO4Ts+sZ94AJ4sRGBQ+UbZXJRs8O4Sr8oNmU1BfKClc1vQpqO3BXMHBBvEnhi71w9PhcdcA2
	Jk8FyeVw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeC-0000000CQw2-42v5
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:21:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4165Kelg002526;
	Tue, 6 Feb 2024 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=tgPu1IGPSkoodtjXL+roS8cawxMXT5/Ei4a544A4YAU=; b=h/
	sqaowpSSYOZEb6mGqUm0FJyvslBpTR+LqLdnunVSmwY9AeEBIjN/dlMZ3mxTAAmu
	ca6t1GGehk5A4RlEBDa3g0yzFcka+TP+og15pU9W3qGiw6qnDH8IuAPogmj8qBig
	1CjKXM/ZulDbHe5n+7weYatXdJVQ0vrMcc4n9BJQTwtjMzzWV0tY9kUSNxYS2ZAy
	sfXk9lt1r35ZOhuX1Ksyk2BbqQCWMYp+8DeKn/XMbfI1sy5CI9sy17ocJihJYL/3
	YFXEx5hNMo77y77jTBKco5lpkMUAZ2T9kez6hthbI3pIGMkyvDKQOlSi4PUkrFes
	9SAbRoLi7OM6528rdntw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3cafrpra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:21:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169Lg1h017216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:21:42 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:40 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v2 03/12] wifi: ath12k: modify ath12k mac start/stop ops for single wiphy
Date: Tue, 6 Feb 2024 14:49:45 +0530
Message-ID: <20240206091954.4144454-4-quic_ramess@quicinc.com>
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
X-Proofpoint-ORIG-GUID: crDhHytIWFKiUn6xuG9P6V8Wi33NGtfQ
X-Proofpoint-GUID: crDhHytIWFKiUn6xuG9P6V8Wi33NGtfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=762 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092145_568198_57AB43C0 
X-CRM114-Status: GOOD (  16.39  )
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

When mac80211 does drv start/stop, apply the state change
for all the radios within the wiphy in ath12k.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 57 +++++++++++++++++++++------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c58f753d4a10..ef952e8e4086 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -243,6 +243,7 @@ static const u32 ath12k_smps_map[] = {
 
 static int ath12k_start_vdev_delay(struct ath12k *ar,
 				   struct ath12k_vif *arvif);
+static void ath12k_mac_stop(struct ath12k *ar);
 
 static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 {
@@ -5256,15 +5257,31 @@ static int ath12k_mac_start(struct ath12k *ar)
 	return ret;
 }
 
+static void ath12k_drain_tx(struct ath12k_hw *ah)
+{
+	int i;
+	struct ath12k *ar;
+
+	ar = ah->radio;
+
+	for (i = 0; i < ah->num_radio; i++) {
+		ath12k_mac_drain_tx(ar);
+		ar++;
+	}
+}
+
 static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
-	struct ath12k_base *ab = ar->ab;
-	int ret;
+	struct ath12k *ar;
+	struct ath12k_base *ab;
+	int ret = 0;
+	int i;
 
-	ath12k_mac_drain_tx(ar);
+	ath12k_drain_tx(ah);
 
+	ar = ah->radio;
+	ab = ar->ab;
 	mutex_lock(&ah->conf_mutex);
 
 	switch (ah->state) {
@@ -5285,14 +5302,26 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	ret = ath12k_mac_start(ar);
-	if (ret) {
-		ah->state = ATH12K_HW_STATE_OFF;
-
-		ath12k_err(ab, "fail to start mac operations in pdev idx %d ret %d\n",
-			   ar->pdev_idx, ret);
+	for (i = 0; i < ah->num_radio; i++) {
+		ret = ath12k_mac_start(ar);
+		if (ret) {
+			ah->state = ATH12K_HW_STATE_OFF;
+			ath12k_err(ab, "fail to start mac operations in pdev idx %d ret %d\n",
+				   ar->pdev_idx, ret);
+			goto fail_start;
+		}
+		ar++;
+		ab = ar->ab;
 	}
 
+	mutex_unlock(&ah->conf_mutex);
+
+	return 0;
+fail_start:
+	for (; i > 0; i--) {
+		ar--;
+		ath12k_mac_stop(ar);
+	}
 err:
 	mutex_unlock(&ah->conf_mutex);
 
@@ -5395,13 +5424,17 @@ static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
+	int i;
 
-	ath12k_mac_drain_tx(ar);
+	ath12k_drain_tx(ah);
 
 	mutex_lock(&ah->conf_mutex);
 
 	ah->state = ATH12K_HW_STATE_OFF;
-	ath12k_mac_stop(ar);
+	for (i = 0; i < ah->num_radio; i++) {
+		ath12k_mac_stop(ar);
+		ar++;
+	}
 
 	mutex_unlock(&ah->conf_mutex);
 }
-- 
2.25.1


