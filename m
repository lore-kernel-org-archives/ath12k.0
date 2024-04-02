Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5685CD1284
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QM3TW/fjiuQ1ShVfHv4u63kETVk73i4HMowuZTZofK0=; b=DKNVduCdJSATggCJLF0GFgzrtT
	ia0xkGybk5ugw77iFRZr5iuMjj+31BuW/Itt9QSQA5VAq1uYEBx4scLAshKmA4P4yS73eVvKJYoMo
	NZnoMGmNgvS31oGR7bA0ZYOMiHXzTfiaWtS5pLmis60Yegef4+Bx5E2pWjxzkaf6Y+/2oNrCuj4ll
	3mlAOqHSdCNRfgRxGJ39ucGH+ggY39A02BQuweFI4g/Ss5MvQzV32D2t7bWmm68mPQeS/jUZWIreR
	W9O0x7Kub7oUDquHvRQ5nr6Xrmf43lQgelXzFCMlQc9WqHqE6XtZCv/WSeia/W7R2s3COAir07nM2
	pzcrDbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrmSz-0000000D0Gj-26VQ
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 22:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrlKJ-0000000Coh9-2A1F
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 21:05:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432KYYBO012476;
	Tue, 2 Apr 2024 21:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=QM3TW/fjiuQ1ShVfHv4u63kETVk73i4HMowuZTZofK0=; b=dw
	Jp+tCWPzmlvgdGkMrrTLIovxtofGyMNNMLql10r3GFMe4pq5YZMgIIjsD3xtCLuS
	Z6yQ/9OR17aclX1UJFR6Akahe/AGl/TqHpCf0SVWz004WWwvu2uX+9ELljbXf9CB
	OLK0aug5ghmIqCjy6xVawUd/5Be0J+dja2S+EelRrv8MCbu5LACltw3K2zt0gjtb
	HgTs0Xj0qGIFeQbvX3We211azAJvGAYxD2FKa6dOUitxUwJOZcMsolcNSlU8ji5l
	StAlzOxvrLRa1weZGm3A3wxQgCdylUsrEo2D81FulKsVUYvGxuwA7XAZw6vu5Vp7
	ej/8XU+gNXJ3BBFnyOow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8huwhbtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 21:05:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432L5nZG000711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 21:05:49 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 14:05:49 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 3/9] wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
Date: Tue, 2 Apr 2024 14:05:32 -0700
Message-ID: <20240402210538.7308-4-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240402210538.7308-1-quic_alokad@quicinc.com>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JfAaVkXg3RED-PeyifHj-5UT5WsDPWYc
X-Proofpoint-ORIG-GUID: JfAaVkXg3RED-PeyifHj-5UT5WsDPWYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxlogscore=792 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_140551_626392_09E69F14 
X-CRM114-Status: GOOD (  11.64  )
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

Rename trans_bssid to tx_vdev_bssid to make it similar to vdev_bssid.

Rename profile_num to nontx_profile_cnt, and profile_idx to
nontx_profile_idx which make it clear that these configurations
correspond to nontransmitted MBSSID profiles.

These members are currently unused in the driver.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 29e4aa2710c1..adc72c0f2862 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2745,9 +2745,9 @@ struct wmi_vdev_up_cmd {
 	__le32 vdev_id;
 	__le32 vdev_assoc_id;
 	struct ath12k_wmi_mac_addr_params vdev_bssid;
-	struct ath12k_wmi_mac_addr_params trans_bssid;
-	__le32 profile_idx;
-	__le32 profile_num;
+	struct ath12k_wmi_mac_addr_params tx_vdev_bssid;
+	__le32 nontx_profile_idx;
+	__le32 nontx_profile_cnt;
 } __packed;
 
 struct wmi_vdev_stop_cmd {
-- 
2.39.0


