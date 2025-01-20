Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28FAC0218D
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9QdDK1AK18MRHUkD8EvpMdCBeC6RRqMfFIoRyGVuLM=; b=rTxF0bKJv8j/PejkTME8CLWnPq
	oxh0/G7kOxA41NkZxJH7wAlMpFxDq4y5YXT2XMGWphsEjxpRLZoEzaEgA6teM9+qybg+UkZmnwbY2
	K1qbrYN51+ml5hBd1vzx/uAz3wbmOlqy4gwswR0HyWKRhBdwSY6lJpavsrqzDp3DwAnZj32ptWNzn
	wkrB1PFw9eIxaUWYxbUEq/oWmodIKfKSZXkoiehLfdLKrrm8vBooWAuZl1iQ/jyevo5CaRiq6qKUA
	ON8o/HpyG9H3tmAnhd/ZCpAAoZvj1dBwJ380QOoTZ2B8MvT6Fn/qS23zCcACrB0K1hnEk1M4U2t+s
	/3uDYgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoYr-00000005GPy-32pc
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 09:59:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoOy-00000005Eck-3p44
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 09:49:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6di7A005217;
	Mon, 20 Jan 2025 09:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9QdDK1AK18MRHUkD8EvpMdCBeC6RRqMfFIoRyGVuLM=; b=TZqCQkSXkCechvNx
	oZAe+8/Ni9FP/RICedB+9QYJCvcPDNDcj+oKQtom5hbKhSf5v6Yyk2YgzQDdub8m
	+EpJuGi/3Ibw8HNPqNKdZ38tyRMNbJsSkNBmuuV44oGVhODpIBFhXeLVuq0SJZgl
	qktfyaTOCX41arkCd4HOcDpub3Sx/G1ZMuZGacmVgMp0Jo+Nic1Frq/pjG5OxJVs
	z1prk317X7UrMlCe/gsPLRK4eAhgqrZRncAxNpAHGBSiRJ8fu6bPEvXcfkDwxj8K
	WT0e77snhSci/VNLsHi8IVDAUosiaxaiPOeIbVehmQFHKCki3Y9GHsuDbUOz2GMF
	9PVpbQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hdu8etq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:48:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K9mwO1007791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:48:58 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 01:48:55 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Mon, 20 Jan 2025 15:18:27 +0530
Subject: [PATCH v2 07/10] wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250120-fix_reboot_issues_with_hw_grouping-v2-7-b7d073bb2a22@quicinc.com>
References: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
In-Reply-To: <20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com>
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
X-Proofpoint-GUID: Y5jAOW13n43ZiLtJ9iom5Fx8ZM7A9Pzn
X-Proofpoint-ORIG-GUID: Y5jAOW13n43ZiLtJ9iom5Fx8ZM7A9Pzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=957
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501200081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_014900_970137_29F1F142 
X-CRM114-Status: GOOD (  14.50  )
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

Commit a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
ath12k_mac_register()") relocated the setting of the ATH12K_FLAG_REGISTERED
flag to the ath12k_mac_register() function. However, this function only
accesses the first device (ab) via ag->ab[0], resulting in the flag being
set only for the first device in the group. Similarly,
ath12k_mac_unregister() only unsets the flag for the first device. The flag
should actually be set for all devices in the group to avoid issues during
recovery.

Hence, move setting and clearing of this flag in the function
ath12k_core_hw_group_start() and ath12k_core_hw_group_stop() respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Fixes: a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()")
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 548af77ba892928c3e73fd7c917ad344b35e6883..f645f1fb24dcb3f0aabc537cd9ac08e6d4bef95b 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -920,6 +920,9 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 		ab = ag->ab[i];
 		if (!ab)
 			continue;
+
+		clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ath12k_core_device_cleanup(ab);
 	}
 
@@ -1025,6 +1028,8 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 		mutex_lock(&ab->core_lock);
 
+		set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ret = ath12k_core_pdev_create(ab);
 		if (ret) {
 			ath12k_err(ab, "failed to create pdev core %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2d062b5904a8ef3f945c5111d979d5616901280c..2f13d3b80dfeb8ea81474bac229c52189de67225 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11244,7 +11244,6 @@ void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag)
 
 int ath12k_mac_register(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 	int ret;
@@ -11257,8 +11256,6 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 			goto err;
 	}
 
-	set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	return 0;
 
 err:
@@ -11275,12 +11272,9 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 
 void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 
-	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	for (i = ag->num_hw - 1; i >= 0; i--) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)

-- 
2.34.1


