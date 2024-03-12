Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C279C54E66
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMtgGTXV36aVwnH5bQZ6aegQHKRDge1F8hNfJoSoY2E=; b=jmLz79pzCkJnxSz5MG0zcVcPoS
	8Xxu7ldkv1mjwXzCRfojAcq061Z2B92Bgqv08upCPcpN6+ls7Qt0HgxO3/7hn1Ik6iHiEsELdIQ4e
	/9FagXhd7w0Gv84cBOYu2VvZ5yiVihWBALoA8XGZcI7X7AERIL/xLFRvCOSrjY5+TCOi5+hGoqx4b
	uBSsZQfl1huEaYzSaLiZeQ+quy/JU4klTAjpFrbx3AhemFe7Gf7gIbyWZDoWgjabOlRFPL3zJGCBq
	zaunLcYO7wTLysk1ok3bTR8OkRGkpwhn4jIoQuzWdGUBdyAc+bHRfL+UHSch7oSZ8X3x3RO5CLlWg
	wfv4glcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3k-0000000514c-3sjt
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 09:04:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjy3g-0000000510d-1zzx
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 09:04:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C8qbdm029011;
	Tue, 12 Mar 2024 09:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=DMtgGTXV36aVwnH5bQZ6aegQHKRDge1F8hNfJoSoY2E=; b=oK
	NBx3/7rZ7xvhAERRlktA1vd7xGrdKN5A0Juo8BGMKUSaKNalVPa6X2O/GBp6Nl2i
	ICu9DqtHTPbLZoQqLxQFnhrtK2VFQZgJQKE7vRauXx/o2Pm+DS4930a/fauLXt/l
	EYyo+cFezU9hiNfE7hRmh4zQj+CM8UFNt6vRJ2FIvOp50aDBXKjHklqtgW28qfY4
	dToDewbMSyv4QnV/vkV/Q8meFWFXWmDaxDJ3XX7Em0lXpbIIHp27t3TV0N0N5JS0
	3nbdvyeQUrKFfe8baDmspUlQ0a9h6bHtOX+g9dTSspSG6a7TOTWMuo8lv+YavMHW
	lrTGnFhXpuf/oWhSiKSw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtfwn0fg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C94QZC026939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:04:26 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 02:04:24 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v3 03/12] wifi: ath12k: modify ath12k mac start/stop ops for single wiphy
Date: Tue, 12 Mar 2024 14:33:42 +0530
Message-ID: <20240312090351.1620218-4-quic_ramess@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0Oskqlw2txzVOOrlmfoHYz_CszHvWhtf
X-Proofpoint-GUID: 0Oskqlw2txzVOOrlmfoHYz_CszHvWhtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_06,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=811 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403120068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_020428_932201_1348C703 
X-CRM114-Status: GOOD (  14.06  )
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
 drivers/net/wireless/ath/ath12k/mac.c | 43 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 0f33f5615170..4afaba3ba934 100644
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
+	for_each_ar(i, ah, ar)
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
+	for_each_ar(i, ah, ar) {
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
+		ar = ath12k_ah_to_ar(ah, i);
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
+	for_each_ar(i, ah, ar)
+		ath12k_mac_stop(ar);
 }
 
 static u8
-- 
2.25.1


