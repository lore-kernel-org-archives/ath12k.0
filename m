Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EB3CD4F50
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLjqw6FfBNC3kuKuW+BgZ49dqvDK5rZy7V6Yh+gTADE=; b=UgCKaSeJupKrtcpDCZ11GAU6CJ
	p/t6yIw1GKYwLBq58gv/og+yZT/AKTTSnInjpDB1gjn1Ez+KnbxxFs1Zp++4fbIxzSsXSj9LUnFzZ
	9ZP82V2+S9KsX2UWWYGJY6sLw1SQCC9VjcWgQSFkpZzlEdqeAJJr+Bc+YaLGRJwsRf3hfiBI8wMt3
	+cdbWgH/KPZmuo1tRp1iDq4fmmMvK8EyugzrsOpjAEMyolOgIvboCuzcYZFrVPrC7710uLtn9J0Ur
	BNGMzA04Uk0QGvaZIo6tqy1LfckktxdYt2s3aZ+yBV8IARfBlO/O7PcUelAAosbEWSugQ9/HC+EKl
	EkYt2K0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm4JM-00000006y4f-0gRe
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 04:41:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm489-00000006w3k-3wyC
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 04:30:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4851889A015575;
	Thu, 5 Sep 2024 04:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iLjqw6FfBNC3kuKuW+BgZ49dqvDK5rZy7V6
	Yh+gTADE=; b=B27AVMejFJ0DXxwiGjToXwCuRetgRkCyMbdx71pEHIsB7UE+cni
	Qmd1+9i9zPVGYg7cVpKvmHu5+VqjTf5OBfloaRgcqFXZpQdQwx9vrOu6uhPhHxb4
	1o2QnWKCPZrFDY1JLsbzepqWGN8LgH3O+nz4ZNwoSO8zWtYAadmxYduhipi87Tpq
	11YsjD6Nkh+VjRmSnLdsF8QXaxbgkCZ+N04gOxR81jK1c/LadTNglF5pmNIVmqZZ
	6zATrGiVcCxS404OUu10D0QkRgNi2w8/ViSWab6XxrgP3CEtF4gdd8fjTtk6DdL6
	11lmEWF0D9Q5lM/XsHA11VnNXN2pCnYpk3g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69evy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 04:29:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4854TuL4029891;
	Thu, 5 Sep 2024 04:29:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41bv8mhndg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 04:29:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4854TtsY029882;
	Thu, 5 Sep 2024 04:29:55 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4854TtBd029881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 04:29:55 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id EEBB84114A; Thu,  5 Sep 2024 09:59:54 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH] wifi: ath12k: Skip Rx TID cleanup for self peer
Date: Thu,  5 Sep 2024 09:58:51 +0530
Message-Id: <20240905042851.2282306-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MC0SKehR3U0oh5qxYhjRklMpB7Ic3mMj
X-Proofpoint-ORIG-GUID: MC0SKehR3U0oh5qxYhjRklMpB7Ic3mMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_03,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=836 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_213002_607268_BCBFBBF2 
X-CRM114-Status: GOOD (  11.07  )
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

During peer create, dp setup for the peer is done where Rx TID is
updated for all the TIDs. Peer object for self peer will not go through
dp setup.

When core halts, dp cleanup is done for all the peers. While cleanup,
rx_tid::ab is accessed which causes below stack trace for self peer.

WARNING: CPU: 6 PID: 12297 at drivers/net/wireless/ath/ath12k/dp_rx.c:851
Call Trace:
__warn+0x7b/0x1a0
ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
report_bug+0x10b/0x200
handle_bug+0x3f/0x70
exc_invalid_op+0x13/0x60
asm_exc_invalid_op+0x16/0x20
ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
ath12k_dp_rx_frags_cleanup+0xca/0xe0 [ath12k]
ath12k_dp_rx_peer_tid_cleanup+0x39/0xa0 [ath12k]
ath12k_mac_peer_cleanup_all+0x61/0x100 [ath12k]
ath12k_core_halt+0x3b/0x100 [ath12k]
ath12k_core_reset+0x494/0x4c0 [ath12k]

sta object in peer will be updated when remote peer is created. Hence
use peer::sta to detect the self peer and skip the cleanup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8106297f0bc1..3949bef1db3c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -917,7 +917,9 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
-		ath12k_dp_rx_peer_tid_cleanup(ar, peer);
+		/* Skip Rx TID cleanup for self peer */
+		if (peer->sta)
+			ath12k_dp_rx_peer_tid_cleanup(ar, peer);
 		list_del(&peer->list);
 		kfree(peer);
 	}
-- 
2.17.1


