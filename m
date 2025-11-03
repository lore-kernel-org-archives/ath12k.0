Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9699ACCFA07
	for <ath12k@archiver.kernel.org>; Mon,  3 Nov 2025 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSUEvV6mPmqUfvH0mSUV0SmE2RQ2jwwbXjVDRq+mqFE=; b=fb63dQAYfAiJ8l6cMGc3qaTE3s
	aociB2a4DTmPN5cN4invge/PJPD1jA/3ZiWIqMP0WrEdzt9v3npwnl49UMevnQAQUpLHARW1EdEVb
	H9p5rxFqdj3boQaHro4BhPhshuE0tBuR6xE1UU2BKdURBs3mwpdN2vdAoSmtcLTwGwW0CaLaX9y3U
	qAwqC5pHkGiEFGPCRJ9zggwAgWJB+uR9AABtuEyun24hUiQyWnpbTSqsNmyXWby4q4tPEBjv7W3P6
	SDt/KK4WuGqgVFQj2u9yEap2XCr3tfn0DLian9/iujhYr/yEMbrI9QSWrPvEQjrw+DPX12tWggAYw
	n04c8VNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsd9-00000009idJ-1Whu;
	Mon, 03 Nov 2025 11:21:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsd6-00000009ibG-1ocS
	for ath12k@lists.infradead.org;
	Mon, 03 Nov 2025 11:21:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38f1341252201;
	Mon, 3 Nov 2025 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSUEvV6mPmqUfvH0mSUV0SmE2RQ2jwwbXjVDRq+mqFE=; b=RYBnr5p0NU9eV5NL
	4M79NOwsvy41rNxLTyiYJEEYpoW56ZsV2REO4UJGePQzsBFWPffqtrPVymG1AGJd
	MRvgpfFMOf4i4TR8gQs/3+Y8n3Zy4b9daF2dbbgGbsOjM4Hm9/l7VoiISH0pWwCr
	BXMpI6fXI8BHGJFQWN5w2uRYS5/64KViDByZDLbxadsQlEgES0/II107/HLE0jXy
	wRkC6UbNld0CKOlr9ChsGyO5PJ47BKmipv4gvNk7l3uwoj14K6rsqx1dW12fo4ow
	n8oYzJ2UAP3penIJmHj0qLdLKIuDo2wMV1C/cJftziGvVFFh1bNmch6UA7mu5Jv7
	ozvV2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm4bfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 11:21:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A3BLg12022620
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Nov 2025 11:21:42 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 3 Nov 2025 03:21:41 -0800
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 04/12] wifi: ath12k: Add helper to free DP link peer
Date: Mon, 3 Nov 2025 16:51:03 +0530
Message-ID: <20251103112111.2260639-5-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNCBTYWx0ZWRfXy60+LuLQWTgp
 J4584YlEOR8e0Rf+jMxhvWvsPMfnwc7BJzPJANpD7PjTjYZHTJJMTDWkPrke897wksLbdWFqtUk
 lngpXeCwEhwwQmjtII70OuXA6s9VyJRoIpcw2LvD8Ia1UWk1sLtzpLv1QPvmS5rif9Kplbzga4w
 S8u7TQdVcgelJOAVHck/xk3H6Siu9EYyydysBHT9XDcXo2gpdW8O2nxyB7Zm5pxPHjRVfqn2iIo
 zOPgqlbbY9h86lPG7jOLB/OrkRYkpXB4sc43RitllnSdeQQtwa0Qb4w0Xo803TmBu7yOMdA4LLc
 fptVa8Z4nOzEq8piZoLT42dNOOARAv19nsni+24oxZOeVEmS4rulX8tp2JU4yp7HWI5hkaV7lMs
 57iKB00P7sEDbopQsLwXwjBqvFEoyw==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=69089047 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=v1CYW2hzUu0g5-OBRqgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ie-HPXjAoPtcPkSbndVN0NKrJuW7sxpS
X-Proofpoint-ORIG-GUID: Ie-HPXjAoPtcPkSbndVN0NKrJuW7sxpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032144_479793_31DDCC20 
X-CRM114-Status: GOOD (  11.80  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Introduce ath12k_dp_link_peer_free() to wrap cleanup steps required before
freeing a DP link peer. This avoids code duplication and ensures consistent
teardown across multiple call flows.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 13 +++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h |  1 +
 drivers/net/wireless/ath/ath12k/mac.c     |  9 ++-------
 drivers/net/wireless/ath/ath12k/peer.c    |  5 +----
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 8961c4635ed0..0ad01f7414cd 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -9,6 +9,14 @@
 #include "debug.h"
 #include "debugfs.h"
 
+void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer)
+{
+	list_del(&peer->list);
+
+	kfree(peer->peer_stats.rx_stats);
+	kfree(peer);
+}
+
 struct ath12k_dp_link_peer *
 ath12k_dp_link_peer_find_by_vdev_and_addr(struct ath12k_dp *dp,
 					  int vdev_id, const u8 *addr)
@@ -140,10 +148,7 @@ void ath12k_dp_link_peer_unmap_event(struct ath12k_base *ab, u16 peer_id)
 	ath12k_dbg(ab, ATH12K_DBG_DP_HTT, "htt peer unmap vdev %d peer %pM id %d\n",
 		   peer->vdev_id, peer->addr, peer_id);
 
-	list_del(&peer->list);
-
-	kfree(peer->peer_stats.rx_stats);
-	kfree(peer);
+	ath12k_dp_link_peer_free(peer);
 	wake_up(&ab->peer_mapping_wq);
 
 exit:
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index f9be27d86545..20294ff09513 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -178,4 +178,5 @@ struct ath12k_dp_peer *ath12k_dp_peer_find_by_peerid(struct ath12k_pdev_dp *dp_p
 						     u16 peer_id);
 struct ath12k_dp_link_peer *
 ath12k_dp_link_peer_find_by_peerid(struct ath12k_pdev_dp *dp_pdev, u16 peer_id);
+void ath12k_dp_link_peer_free(struct ath12k_dp_link_peer *peer);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4972367dd1ba..c40c55344e64 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1213,10 +1213,7 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 	synchronize_rcu();
 
 	list_for_each_entry_safe(peer, tmp, &peers, list) {
-		list_del(&peer->list);
-
-		kfree(peer->peer_stats.rx_stats);
-		kfree(peer);
+		ath12k_dp_link_peer_free(peer);
 	}
 
 	ar->num_peers = 0;
@@ -6377,10 +6374,8 @@ static void ath12k_mac_station_post_remove(struct ath12k *ar,
 		ath12k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
 			    vif->addr, arvif->vdev_id);
 		peer->sta = NULL;
-		list_del(&peer->list);
 
-		kfree(peer->peer_stats.rx_stats);
-		kfree(peer);
+		ath12k_dp_link_peer_free(peer);
 		ar->num_peers--;
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 9c100ecea798..c2fb5bbd6cea 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -50,10 +50,7 @@ void ath12k_peer_cleanup(struct ath12k *ar, u32 vdev_id)
 		ath12k_warn(ab, "removing stale peer %pM from vdev_id %d\n",
 			    peer->addr, vdev_id);
 
-		list_del(&peer->list);
-
-		kfree(peer->peer_stats.rx_stats);
-		kfree(peer);
+		ath12k_dp_link_peer_free(peer);
 		ar->num_peers--;
 	}
 
-- 
2.34.1


