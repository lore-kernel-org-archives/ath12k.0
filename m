Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E789C47077
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhjN5vgS5tAzPN+Ji/o+3RZBLi5pvCp43QR1Ii0yfFQ=; b=lvPjNsjkivKuqjKcGJ58+e+Kov
	dwNi4SsU2+TJaY5i7WDCxgOVLzHrm2zpMEJJVkUcvk9le+btgBUr0EtWhyWzGwdjDpT+Pcb4OebBp
	KjUBNmX+wKLEDkYcF3DCM0g1U5ugVA3yrR1lhvBuPTdY9EL9+ZjPs/tlPRjg9pkeEuFUk3xrQCa9j
	J0uUFrsLcklKdENi30Oo0n1nQmlvFHLERsiF9N6kXO9YEmWWZ5jv5tTmmLqjVbug2a/qMM69ReeI+
	+wRXrCtIdin7J/L5W4ls/i3UwJgOIlje9S9F8LpJ9R/TSHUAWPGP9WAbI9QpLOhyzLfR6YWkz5i0g
	2VC3+8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKutB-009uJQ-3A
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 06:38:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKut9-009uI2-36
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 06:38:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40343EGY030643;
	Wed, 3 Jan 2024 06:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=fhjN5vgS5tAzPN+Ji/o+3RZBLi5pvCp43QR1Ii0yfFQ=; b=Kf
	ZGCRSIiq0ExTKheG1dqGIrwk5JzfcV7wG33K+MEQL+1s8Blvk3zhjEykO+3U9v8q
	gsim0Y8+QpAMl9dySXAzhBb6Dpi54S5sA8TmAYGweqjqBMHw5flW2IeUHGRrDh/E
	qBw4wVlM3u6UdPVVIR7SqV/L/QCF6aR0EsNV8QKrGBufaiYMV+QIjXrO8dyRfxe2
	GJhQr1XIiXJjg8BwgCdtrMCZ16T5TnlB2DIfqTPcm2cru5rMlcoKTqi8jwoptIh4
	emIiokLxUTFmS6LBpXoOYjAq9CKeMxCihQhuPvEa2jAv2F6CQTzQODSXjh/uzO4q
	S8OY+vvNRoVDp2R+oukw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcgkuab36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 06:38:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4036c2Gu017799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 06:38:02 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 22:38:00 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 07/10] wifi: ath12k: Refactor mac callback of configure filter
Date: Wed, 3 Jan 2024 12:07:28 +0530
Message-ID: <20240103063731.3356060-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LP6eedxWnSwXBAWfQ6rx07jW1gW1keUa
X-Proofpoint-ORIG-GUID: LP6eedxWnSwXBAWfQ6rx07jW1gW1keUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=729
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_223804_113444_0C299D99 
X-CRM114-Status: GOOD (  11.06  )
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

To support single wiphy abstraction, introduce link/radio specific helper
function in the mac80211 callback configure_filter(). This way, the
callback can be extended to handle multiple link/radio in the future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 ++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5c7b747addda..1566b43029cd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5831,19 +5831,15 @@ static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	FIF_PROBE_REQ |				\
 	FIF_FCSFAIL)
 
-static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
-					   unsigned int changed_flags,
-					   unsigned int *total_flags,
-					   u64 multicast)
+static void ath12k_mac_configure_filter(struct ath12k *ar,
+					unsigned int total_flags)
 {
-	struct ath12k *ar = hw->priv;
 	bool reset_flag;
 	int ret;
 
-	mutex_lock(&ar->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
 
-	*total_flags &= SUPPORTED_FILTERS;
-	ar->filter_flags = *total_flags;
+	ar->filter_flags = total_flags;
 
 	/* For monitor mode */
 	reset_flag = !(ar->filter_flags & FIF_BCN_PRBRESP_PROMISC);
@@ -5858,9 +5854,23 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 		ath12k_warn(ar->ab,
 			    "fail to set monitor filter: %d\n", ret);
 	}
+
 	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
 		   "total_flags:0x%x, reset_flag:%d\n",
-		   *total_flags, reset_flag);
+		   total_flags, reset_flag);
+}
+
+static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
+					   unsigned int changed_flags,
+					   unsigned int *total_flags,
+					   u64 multicast)
+{
+	struct ath12k *ar = hw->priv;
+
+	mutex_lock(&ar->conf_mutex);
+
+	*total_flags &= SUPPORTED_FILTERS;
+	ath12k_mac_configure_filter(ar, *total_flags);
 
 	mutex_unlock(&ar->conf_mutex);
 }
-- 
2.34.1


