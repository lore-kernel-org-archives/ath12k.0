Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4D5C25B7C
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 04:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhKvaLf+cz/0/SwEWuvLpjy1RgvayoIRI+//7DEZS38=; b=wDTMOtd4QMDc065Hzu18ZOP7z7
	9BFYr9aQjSn7jVx9UPJCe5d/hAi22ct15hKYag4QD+WYQaCXYy4eF8HT3hYXROloadsJVu1rgtoKd
	UIoxGwryzj6MTa+tu9PpVwWKH1W0ba+iZLSvhxlLNLG3E4DCUdnaDfTT3Gjb8iAP2ZgbB0clhWwH+
	N6EFGWjDsnPDrb+R/7+/Xbm8alQRpsWJx0ISIbSf6bXl0qFo82xfiOXYYBlaxZ7/maNI2mFINyz2a
	ddZHnnquAoHN2UoamBUnx7+881TlBD5W8anxWE05KgL/9CoQ/GnRouPbjXaIel4P58VSAOojPDd+W
	zSa4L6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy6-00000002mni-1RTP
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 04:31:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCAy2-00000002mmX-13uE
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 04:31:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SMGtQu010169;
	Wed, 29 May 2024 04:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhKvaLf+cz/0/SwEWuvLpjy1RgvayoIRI+//7DEZS38=; b=lOh7WaxDC8EHfqZ1
	R9qmDZBohZaAQloMSnqy+msV4uDD7CVOzO5IW5R0Y2qRD2zvXoo5OFqWOHmaofZm
	rbG/mJGfWRxAmdOLMdFVUWqfeFomHHjffEQ/qykcNkyM1n9FHNLKTv8KtR30C2IG
	0J+mae7BbYs/95vHpeFsV8JnEQejSE2/v3/6aSTx/dyqA19YIh9cJNyNJsN2jfhZ
	dPppCJ6JWf55RMlI8JFp/jWPLMtDbZD86QdyOhf+1arjzMuUvuAQY8Qad34R2Kuy
	hB4QlpUBKS1UMfOZ2Ox5IcLZs/lCn4gNXv+CMce26MuDMbgZ62zUE5dKmFoR4R6l
	PkBV4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2myx5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T4VCY4030593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 04:31:12 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 21:31:10 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<quic_adisi@quicinc.com>
Subject: [PATCH 3/3] wifi: ath12k: handle symlink cleanup for per pdev debugfs dentry
Date: Wed, 29 May 2024 10:00:43 +0530
Message-ID: <20240529043043.2488031-4-quic_adisi@quicinc.com>
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
X-Proofpoint-GUID: ozb3t9v81kMWpiU6DGDLSf_sJauKa4gP
X-Proofpoint-ORIG-GUID: ozb3t9v81kMWpiU6DGDLSf_sJauKa4gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_213114_426050_14B2BB71 
X-CRM114-Status: GOOD (  14.37  )
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

Whenever per pdev debugfs directory is created, a symlink to it is also
placed in ieee80211/phy* directory. During clean up of per pdev debugfs,
this symlink also needs to be cleaned up.

Add changes to clean up the symlink whenever the per pdev debugfs is
removed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h    | 1 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 7d20b09c52e6..87cb3fde68c2 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -473,6 +473,7 @@ struct ath12k_fw_stats {
 
 struct ath12k_debug {
 	struct dentry *debugfs_pdev;
+	struct dentry *debugfs_pdev_symlink;
 };
 
 struct ath12k_per_peer_tx_stats {
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 3b464cd40da6..751a9b04386a 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -80,7 +80,9 @@ void ath12k_debugfs_register(struct ath12k *ar)
 
 	/* Create a symlink under ieee80211/phy* */
 	scnprintf(buf, sizeof(buf), "../../ath12k/%pd2", ar->debug.debugfs_pdev);
-	debugfs_create_symlink("ath12k", hw->wiphy->debugfsdir, buf);
+	ar->debug.debugfs_pdev_symlink = debugfs_create_symlink("ath12k",
+								hw->wiphy->debugfsdir,
+								buf);
 
 	if (ar->mac.sbands[NL80211_BAND_5GHZ].channels) {
 		debugfs_create_file("dfs_simulate_radar", 0200,
@@ -94,7 +96,9 @@ void ath12k_debugfs_unregister(struct ath12k *ar)
 	if (!ar->debug.debugfs_pdev)
 		return;
 
-	/* TODO: Remove symlink under ieee80211/phy* */
+	/* Remove symlink under ieee80211/phy* */
+	debugfs_remove(ar->debug.debugfs_pdev_symlink);
 	debugfs_remove_recursive(ar->debug.debugfs_pdev);
+	ar->debug.debugfs_pdev_symlink = NULL;
 	ar->debug.debugfs_pdev = NULL;
 }
-- 
2.34.1


