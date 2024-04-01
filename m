Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F111ECD128D
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOvFbvbunUHIkvG45kRH7qRYCL2dxL/HNgVqr2lJcjA=; b=3i1bjuc/fgH9x5wJ4Z4J68qLFJ
	YcJKgqyiR4NiOqzgeeOm5K1HrdqPYxP+FbxFO56kooW3f9THUdMeVA5NXrtYf7eWIk1hXmKZNnsdw
	DJmpZpUnGDEx3q+5VzANC5LshMijFvNvC8BXt+K7aGX5aUXOoYjmib7mMokSM0EKClHuk8tGmylPY
	XPYHJ9chrpn2REUYbyzTJtkGjDlujaO/lHovLTXf1qI1P10Tf4CYLlSW2D++Eajf7boZ8O/W2A/pq
	gcXKBdytfY2JCiQ+zgbqWEwBvJCMPJtpOTp2UJc/zlsKu7iL31AryDhKXd5/xMRToZCaGWIrPZK7F
	+S/2+FVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrMxz-00000008dFZ-2wBw
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 19:05:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrMxu-00000008dDc-3XYx
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 19:05:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431J2F23020675;
	Mon, 1 Apr 2024 19:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=YOvFbvbunUHIkvG45kRH7qRYCL2dxL/HNgVqr2lJcjA=; b=PZ
	5KXmZpjkaIER62SKe9dAwReljkCPModhodPfXdcqnoCu9Hb8it5U9pQwMbwljYax
	Zc72q1O6+HWkGiLd2kivph5aDbGCGVoFqLLa/MB3U2VdW0dyB5JD29sRq9H4kXfQ
	r6kPGKH163+zxfR3ETkIWlFKwzRrm5p2aeYuokbZcj3gdh8x1OFvYQuEebQPjo9u
	n2bKDF+4e2N4AtqITFNVdMSD1tfAN4Lr1chGrMkH7qvue22qmS+FeoncdXYhqUwv
	CI++sFL+Hq6yvdZT96E/lQB0WLYnwwiqh8Hr4fHIY/qyZr3dksjAIIhxWe+eeqoz
	2uF7ugJb/jI/3otDmNkg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7qgw9ks9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 19:05:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431J55jt006845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 19:05:05 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 1 Apr 2024 12:05:02 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
Subject: [PATCH v6 03/12] wifi: ath12k: modify ath12k mac start/stop ops for single wiphy
Date: Tue, 2 Apr 2024 00:34:00 +0530
Message-ID: <20240401190409.2461819-4-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401190409.2461819-1-quic_ramess@quicinc.com>
References: <20240401190409.2461819-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: taVrTq5G1okxStmq455EHOQaxgxH0z0-
X-Proofpoint-GUID: taVrTq5G1okxStmq455EHOQaxgxH0z0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_13,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=830 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404010134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_120507_182089_0BE57557 
X-CRM114-Status: GOOD (  14.31  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 43 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0fce3e7e06a4..cbe83578b81d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -243,6 +243,7 @@ static const u32 ath12k_smps_map[] = {
 
 static int ath12k_start_vdev_delay(struct ath12k *ar,
 				   struct ath12k_vif *arvif);
+static void ath12k_mac_stop(struct ath12k *ar);
 
 static const char *ath12k_mac_phymode_str(enum wmi_phy_mode mode)
 {
@@ -5472,23 +5473,39 @@ static int ath12k_mac_start(struct ath12k *ar)
 	return ret;
 }
 
+static void ath12k_drain_tx(struct ath12k_hw *ah)
+{
+	struct ath12k *ar;
+	int i;
+
+	for_each_ar(ah, ar, i)
+		ath12k_mac_drain_tx(ar);
+}
+
 static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
-	struct ath12k_base *ab = ar->ab;
-	int ret;
+	struct ath12k *ar;
+	int ret, i;
 
-	ath12k_mac_drain_tx(ar);
+	ath12k_drain_tx(ah);
 
-	ret = ath12k_mac_start(ar);
-	if (ret) {
-		ath12k_err(ab, "fail to start mac operations in pdev idx %d ret %d\n",
-			   ar->pdev_idx, ret);
-		return ret;
+	for_each_ar(ah, ar, i) {
+		ret = ath12k_mac_start(ar);
+		if (ret) {
+			ath12k_err(ar->ab, "fail to start mac operations in pdev idx %d ret %d\n",
+				   ar->pdev_idx, ret);
+			goto fail_start;
+		}
 	}
 
 	return 0;
+fail_start:
+	for (; i > 0; i--) {
+		ar = ath12k_ah_to_ar(ah, i - 1);
+		ath12k_mac_stop(ar);
+	}
+	return ret;
 }
 
 int ath12k_mac_rfkill_config(struct ath12k *ar)
@@ -5584,11 +5601,13 @@ static void ath12k_mac_stop(struct ath12k *ar)
 static void ath12k_mac_op_stop(struct ieee80211_hw *hw)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
-	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
+	struct ath12k *ar;
+	int i;
 
-	ath12k_mac_drain_tx(ar);
+	ath12k_drain_tx(ah);
 
-	ath12k_mac_stop(ar);
+	for_each_ar(ah, ar, i)
+		ath12k_mac_stop(ar);
 }
 
 static u8
-- 
2.25.1


