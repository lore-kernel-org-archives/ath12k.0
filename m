Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119CFC369A2
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9ZoQApU079gfuCpL8POne989ySw2O06qxhLZ48Kb0M=; b=4pBF3QGK5bwtLuv6YiTXI7Edy5
	XZVgEtmayNvyGPpj4lfwKJxagnMszatKW5y777+rjRZ09Xj6UvYwEWrOLKkoqGuI6Ep7GfTvcsuzs
	lAcfdbY+BZbo+nT0WPDbXivHAaxfTiGE0yr1dPwGSILjSYH1XtbCRD4jcxU3Pccu+TWX145O+dOgN
	MfHZUDjkYPI1A8xcZyljVFGTXC5JuP6EKD9kyLxyN8cT+tGi09Es2t9arvohHDekuvcG4/pBf6pVU
	UK3HZnst1H74ygiGWnG2e1XrKqs5eA4VlyTQlHmcnpXySSD/KbWA2bq0E5ELis6duLl+G15LJQmpM
	zvPoz87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u388K-0000000CllK-3M2x
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 06:45:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37g4-0000000ChFy-1G2Q
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:15:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4Fmp2018718;
	Fri, 11 Apr 2025 06:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9ZoQApU079gfuCpL8POne989ySw2O06qxhLZ48Kb0M=; b=hGJCrM9Mpe5waU3W
	nZZIjrVEh1b0ujyS0CDF4mh5ihyrGM437yvHOisv8hZIR7EUvEv+CMkmCJ1O3kA0
	poYMAJ0AB4APTqYpVNKWcb/zqJ/IbmN+xOgkCnUqHamkXKQD74978kjAYRR8BlsO
	4+6wjv4xCejz7C81JL+EhX3G6chh6gCxIeR84al+PBUgCKPe8uzQ/2j6WYbTmpn/
	6mVhOUSYW4M4KRGC+qVIYoJBaSjspAdVv5QJUCAtF/9+y1paoUHg6YqQyyVSOIgE
	QkI2ggOpf9hKy3vRCZbGu4TO2BRa5t00+vkVspRE4O63K/vDwCTVV6OXghhciRUU
	LpJiJg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgsj2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:15:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B6Fk5L014005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 06:15:46 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 23:15:44 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: correctly handle mcast packets for clients
Date: Fri, 11 Apr 2025 11:45:23 +0530
Message-ID: <20250411061523.859387-3-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411061523.859387-1-quic_sarishar@quicinc.com>
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8b393 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=-3Xz3DnQPR30XhPCzLgA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DRm42iw7yWlZ0hPhthSH2J7dBhrMGPC6
X-Proofpoint-GUID: DRm42iw7yWlZ0hPhthSH2J7dBhrMGPC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=853 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_231548_460770_5E2AFDFC 
X-CRM114-Status: GOOD (  14.46  )
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

Currently, RX is_mcbc bit is set for packest send from client as
destination address (DA) is multicast/broadcast address, but packets
are actually unicast as receiver address (RA) is not multicast address.
Hence, packets are not handled properly due to this is_mcbc bit.

Therefore, reset the is_mcbc bit if interface type is AP.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath12k/peer.c  | 5 ++++-
 drivers/net/wireless/ath/ath12k/peer.h  | 3 ++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index cffff66c5ec4..308d9656b57e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2269,6 +2269,11 @@ static void ath12k_dp_rx_h_mpdu(struct ath12k *ar,
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu);
 	if (peer) {
+		/* resetting mcbc bit because mcbc packets are unicast
+		 * packets only for AP as STA sends unicast packets.
+		 */
+		rxcb->is_mcbc = rxcb->is_mcbc && !peer->ucast_ra_only;
+
 		if (rxcb->is_mcbc)
 			enctype = peer->sec_type_grp;
 		else
diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index 792cca8a3fb1..ec7236bbccc0 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -383,6 +383,9 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
 		arvif->ast_idx = peer->hw_peer_id;
 	}
 
+	if (vif->type == NL80211_IFTYPE_AP)
+		peer->ucast_ra_only = true;
+
 	if (sta) {
 		ahsta = ath12k_sta_to_ahsta(sta);
 		arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
diff --git a/drivers/net/wireless/ath/ath12k/peer.h b/drivers/net/wireless/ath/ath12k/peer.h
index 5870ee11a8c7..f3a5e054d2b5 100644
--- a/drivers/net/wireless/ath/ath12k/peer.h
+++ b/drivers/net/wireless/ath/ath12k/peer.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH12K_PEER_H
@@ -62,6 +62,7 @@ struct ath12k_peer {
 
 	/* for reference to ath12k_link_sta */
 	u8 link_id;
+	bool ucast_ra_only;
 };
 
 struct ath12k_ml_peer {
-- 
2.34.1


