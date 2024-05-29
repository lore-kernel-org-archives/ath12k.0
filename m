Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C90EC27C44
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 04:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqV/OMrOhbJVxSfLWE6KiaAMCXjZncyUMWZDNF36pVU=; b=hJh1VYRcPZhbKqECBwi7TrvE5K
	wGHbO0G9Djvj7UKt8oa8gJRganYVThL+EczOs09D5nqQ3hPx/KamFbZbPyEA110QXryO1+bIxLU8t
	c4e7FLi8EWpSipnyD/apEltCIMTDq3Osui8aiReiHbAV2rm+ShYhJlvjQTQBakfDyX/LaScSua25I
	2Tfly6QbzRT3VHnRZX9O8c4m0vholWhcpafYcUD04ygN3jcZPqZ92nqoVjB9vJIMlqbmuuAGC+vlI
	K1eKN9Rh7BRnFRD5tJK1tpIyUSOZrRDvi/buWQSGE3YEBacW8lQj9WRUm/amQmj43iOQALalXTDao
	rjK/w1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy6-00000002mo0-2xu1
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 04:31:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy2-00000002mm1-3q0R
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 04:31:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SLlh1b030864;
	Wed, 29 May 2024 04:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqV/OMrOhbJVxSfLWE6KiaAMCXjZncyUMWZDNF36pVU=; b=ExYIU4NyygBgxL0m
	1q9hqnu7Whe4w3xloAbUlrSUR/sedl9eSvqiKDkxbZJdE1nqf+CFvAnY90+hTnNU
	NbNeyNVsFoC49BvHQ91Y/MQWtXCrHITfBXK7NXH+X/SisDtGH0cxMge46oF/CrNG
	DikA6+sofmDQKnX+2z38W0XUcQ2o7nEMZDkqdOb2ZztFzXxDyJ1gHIrkE+t3rFdt
	JXvT4DZTAsAOZfCwxsVCB2Q628T+j7jG6yUl1k3fTMuzI0gQnQVOnuoSZ9qVQbLn
	Xo27TbRKYKpObC2ksu055+l4m6rmrCvocv/dwPsbsKPkcOb17SboaUvplztJxhXu
	TPdQFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pr1u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T4V9s9010670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:09 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 21:31:08 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH 2/3] wifi: ath12k: unregister per pdev debugfs
Date: Wed, 29 May 2024 10:00:42 +0530
Message-ID: <20240529043043.2488031-3-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529043043.2488031-1-quic_adisi@quicinc.com>
References: <20240529043043.2488031-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lcm4Dvgl27ZMcn_LGpLw63P_lpesYe6j
X-Proofpoint-ORIG-GUID: lcm4Dvgl27ZMcn_LGpLw63P_lpesYe6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=992
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_213114_981684_0638D34D 
X-CRM114-Status: GOOD (  13.53  )
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

During normal de-initialization path or if any error happens while
registering the hardware, there is no support to unregister the per pdev
debugfs. Add support for the same.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h |  6 +++++-
 drivers/net/wireless/ath/ath12k/mac.c     |  7 ++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 8d8ba951093b..3b464cd40da6 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -88,3 +88,13 @@ void ath12k_debugfs_register(struct ath12k *ar)
 				    &fops_simulate_radar);
 	}
 }
+
+void ath12k_debugfs_unregister(struct ath12k *ar)
+{
+	if (!ar->debug.debugfs_pdev)
+		return;
+
+	/* TODO: Remove symlink under ieee80211/phy* */
+	debugfs_remove_recursive(ar->debug.debugfs_pdev);
+	ar->debug.debugfs_pdev = NULL;
+}
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
index a62f2a550b23..8d64ba03aa9a 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -11,7 +11,7 @@
 void ath12k_debugfs_soc_create(struct ath12k_base *ab);
 void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
 void ath12k_debugfs_register(struct ath12k *ar);
-
+void ath12k_debugfs_unregister(struct ath12k *ar);
 #else
 static inline void ath12k_debugfs_soc_create(struct ath12k_base *ab)
 {
@@ -25,6 +25,10 @@ static inline void ath12k_debugfs_register(struct ath12k *ar)
 {
 }
 
+static inline void ath12k_debugfs_unregister(struct ath12k *ar)
+{
+}
+
 #endif /* CONFIG_ATH12K_DEBUGFS */
 
 #endif /* _ATH12K_DEBUGFS_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index beec42d4ec24..381fee8ca748 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8836,8 +8836,10 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 	struct ath12k *ar;
 	int i;
 
-	for_each_ar(ah, ar, i)
+	for_each_ar(ah, ar, i) {
 		cancel_work_sync(&ar->regd_update_work);
+		ath12k_debugfs_unregister(ar);
+	}
 
 	ieee80211_unregister_hw(hw);
 
@@ -9084,6 +9086,9 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	return 0;
 
 err_unregister_hw:
+	for_each_ar(ah, ar, i)
+		ath12k_debugfs_unregister(ar);
+
 	ieee80211_unregister_hw(hw);
 
 err_free_if_combs:
-- 
2.34.1


