Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5D5E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 04:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UY6X7nkp8jWjFm8K8tGQImgrpWXRnTm+7Dq63GDIDeI=; b=NigkYW4uWGEYlZG5GhoKk7p/PM
	vb9y4xFg/ZLYg+cAcWvohnkmj/GccaSc+GpWEyly8YV6mDjz4oJOEi6q/W9nxnN28XZGJlslFmIp2
	QuOT8exrt7wJMlDxbDZhvf+hGxARZELvwvEkKLQUDY+AUgy6x2VpYsHCXXF7HXl4sdRskU9yJ+KxI
	RoszSyjtsAqcT6GsQBqsSN5+hxp6xa6b+xBVOAOYLj7ttsQJeAn7tAUJpvtwsljmik0CR4nkkbBfE
	C7s9PSRwjMjud+bPBsI5u9UTaGm1hEIntOxEQMTEc3uKJFlmydkCuQn5CdD5Liq6lZ7idUKyXB49l
	ffBZcxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7T-0000000Ahn9-0w6s
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 04:26:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVk7Q-0000000Ahl6-2PBR
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 04:26:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HMXHH014713;
	Thu, 9 Jan 2025 04:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY6X7nkp8jWjFm8K8tGQImgrpWXRnTm+7Dq63GDIDeI=; b=opF205J3LGSNqE/8
	dQ5YwCDK/eNDPUowQvxlgNON6nPSjkvpMr4mUPEHA0lDthOaxl9MWDUdxsKEl2x5
	nE3d8okWgdbpXKvUDsoAdsPi6dCOk7sYY6qTykcVVHCn1CIoOaeS4+eiI41zHnbJ
	wEzLsPZhKfRazIdWk2t8dd/5ZJOWEu/AnBU6mdSzDiyRs04fj3MG7KOkOW145HVD
	Id9IUsveh1A+keGGwtt8e2SJPGtuCvg+to/v00S4d2iJal5dI/dFA8PCllYS5RzU
	3t3GBMQX4KrcMEpAIjaWqAGcczUd6WdneadEd3xzocKmnLSFtCAcIUG71Jnf8Ky0
	PdhuJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wq51bex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:26:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5094Q0Mf028629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 04:26:00 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 20:25:57 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Thu, 9 Jan 2025 09:55:34 +0530
Subject: [PATCH 06/10] wifi: ath12k: fix
 ath12k_core_pre_reconfigure_recovery() with grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-fix_reboot_issues_with_hw_grouping-v1-6-fb39ec03451e@quicinc.com>
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<quic_kvalo@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oA7SBU3TTHazBUZYRWlrm0-t5qIq9gN0
X-Proofpoint-ORIG-GUID: oA7SBU3TTHazBUZYRWlrm0-t5qIq9gN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_202604_773305_3778BA63 
X-CRM114-Status: GOOD (  14.66  )
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

Currently, ath12k_core_pre_reconfigure_recovery() reconfigures all radios
within the same group. During grouping and driver going for a recovery,
this function is called as many times as there are devices in the group.
Consequently, it performs the same reconfiguration multiple times, which
is unnecessary.

To prevent this, add a check to continue if the action has already been
taken.

To simplify the management of various flags, the reason for hardware queues
being stopped is used as a check instead of introducing a new flag.

While at it, also add missing wiphy locks. Wiphy lock is required since
ath12k_mac_drain_tx() which is called by
ath12k_core_pre_reconfigure_recovery() needs this lock to be held by the
caller.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 72e6e3a0cf7be03b20b7421866c479dfcb8038ff..5700fc661ac380b6c01d0571595d27fb1ab7c8c5 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1279,6 +1279,18 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 		if (!ah || ah->state == ATH12K_HW_STATE_OFF)
 			continue;
 
+		wiphy_lock(ah->hw->wiphy);
+
+		/* If queue 0 is stopped, it is safe to assume that all
+		 * other queues are stopped by driver via
+		 * ieee80211_stop_queues() below. This means, there is
+		 * no need to stop it again and hence continue
+		 */
+		if (ieee80211_queue_stopped(ah->hw, 0)) {
+			wiphy_unlock(ah->hw->wiphy);
+			continue;
+		}
+
 		ieee80211_stop_queues(ah->hw);
 
 		for (j = 0; j < ah->num_radio; j++) {
@@ -1301,6 +1313,8 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			idr_destroy(&ar->txmgmt_idr);
 			wake_up(&ar->txmgmt_empty_waitq);
 		}
+
+		wiphy_unlock(ah->hw->wiphy);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);

-- 
2.34.1


