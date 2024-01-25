Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DA6C47422
	for <ath12k@archiver.kernel.org>; Thu, 25 Jan 2024 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ks6Iax1tA8eDScykeIVZcNkgq/56DU0tTG3QuDRsi3I=; b=RgJxOqhrSlnCs3zBBjUOLjKdPD
	OU+mOFrJDkKKugEWfrgAKKF8Z9ooMEFVOweIqT1Dw6JAQbzgqLwVMnf9wxry1GqxWDYIYF5eJb33b
	hGQQyBgWk4XI1g4ulGO4jVR0/j06X1T8dpa/zYCzijSHkWiq2JJdpQUhoLhgM5jf4zJpuFEu2HZiv
	twpCB+O9ENjaAw6xyV0saRwS8DA0ttNpURdPUk1RARjNBXo1KABqM0UuKz12eKvz9oE7q/tF3P0KS
	lTR5czBu/5RQtvzKr1p8GG9Fp4rMH40NTUrtXJ0S7B73fFYZ7fR2F7+zhas4ERFK0nzsmBOY0v7pJ
	3hWMwkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1vk-00000000ffM-0hSK
	for ath12k@archiver.kernel.org;
	Thu, 25 Jan 2024 15:46:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1vg-00000000fcP-38Uy
	for ath12k@lists.infradead.org;
	Thu, 25 Jan 2024 15:46:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PFMQ1c012220;
	Thu, 25 Jan 2024 15:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Ks6Iax1
	tA8eDScykeIVZcNkgq/56DU0tTG3QuDRsi3I=; b=O1k3K4k0i7Sa91909fRuJwn
	pVBJ/nhSRzbmz4YdegDE8bnD978U/i0WMPmZVeu7+xZP0pcm/rWWKoyKScXY9vmI
	rDEKtHVJZ8dLcicKy1kNwbWrTlKJogCWE8NqNKCPYWJb7HD+pR5xmJ8H27g4kiox
	DbE7kpW0UIraHWgHUhgkZbdpIupRPXu3XO1U9emZIUGiGqDqjPIncfmUXInPVBT7
	kS/maMccBRjmoD+7GDFjRSCvUhJcfpeFdYt1RR8FnW1ks1kYp8JcJaJOGowX7+Gu
	xIIAYDQbrwrrSXZliu/8MN/9E9FFRveW8GfpMfXBw7P//iOubsDvpaBg5jaUBww=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufwx9qse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 15:46:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PFkAFN027323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 15:46:10 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 07:46:08 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: refactor the rfkill worker
Date: Thu, 25 Jan 2024 21:15:55 +0530
Message-ID: <20240125154555.3169706-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mR6nFt28bMaJvQANtX2zVh10--HCA8py
X-Proofpoint-ORIG-GUID: mR6nFt28bMaJvQANtX2zVh10--HCA8py
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_09,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxlogscore=782 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_074612_856498_3B8B52FC 
X-CRM114-Status: GOOD (  13.36  )
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

Currently, the rfkill worker handler access mac80211 HW from the radio/link
structure. This is will be incorrect for single wiphy model, as they will
hold multiple link/radio structures. To fix this, access mac80211 HW based
on the number of hardware in the SoC/chip. This approach makes the rfkill
worker handler compatible with both multi wiphy and single wiphy models.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 1baad3302157..f27a6ec3a394 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -879,21 +879,29 @@ static void ath12k_rfkill_work(struct work_struct *work)
 {
 	struct ath12k_base *ab = container_of(work, struct ath12k_base, rfkill_work);
 	struct ath12k *ar;
+	struct ath12k_hw *ah;
 	struct ieee80211_hw *hw;
 	bool rfkill_radio_on;
-	int i;
+	int i, j;
 
 	spin_lock_bh(&ab->base_lock);
 	rfkill_radio_on = ab->rfkill_radio_on;
 	spin_unlock_bh(&ab->base_lock);
 
-	for (i = 0; i < ab->num_radios; i++) {
-		ar = ab->pdevs[i].ar;
-		if (!ar)
+	for (i = 0; i < ab->num_hw; i++) {
+		ah = ab->ah[i];
+		if (!ah)
 			continue;
 
-		hw = ath12k_ar_to_hw(ar);
-		ath12k_mac_rfkill_enable_radio(ar, rfkill_radio_on);
+		for (j = 0; j < ah->num_radio; j++) {
+			ar = &ah->radio[j];
+			if (!ar)
+				continue;
+
+			ath12k_mac_rfkill_enable_radio(ar, rfkill_radio_on);
+		}
+
+		hw = ah->hw;
 		wiphy_rfkill_set_hw_state(hw->wiphy, !rfkill_radio_on);
 	}
 }

base-commit: 64d1dfa649b8d8f2980f95dbded4bcb6210ad073
-- 
2.34.1


