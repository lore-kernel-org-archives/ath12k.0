Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BCAC83F26
	for <ath12k@archiver.kernel.org>; Thu, 24 Jul 2025 04:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x293Msh9UDQSVhuyx5pXKkWx65B9HMQhf7bvndfkyps=; b=NiFUUn8UahCXMDROXgAkksWSz8
	wbjVRZ64EIq3mXMzb2ISLrk85tnIO6R5Wan5OTo/PIxmVabuZM5kM5rG83itTy1ihxksbHrRs2tbT
	uy0xgj5DmhkxQi5GWilI1S4YgUz1UyMdgjH8kkPWw+KLeHSaPjigEA+NXrs15aL6Db5Lb/9Vbiyn5
	RZ3tr15JBhG2KpFbeUJAK5qpjAgBBMRcw5QOY6rGO4AhDZAn1uDfCII+HtN9//atp1O0xUGFkIKju
	omAuflYsQsuXAEOCB8aai6UTYfQ2v+dsskcK/X3DSzmOTfyHo2Jx6a2/XxgPhNUG+Vx3gplPWbIAc
	gkn2iUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uenDa-00000006R2q-10HD;
	Thu, 24 Jul 2025 04:06:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uenDV-00000006R0p-0gBX
	for ath12k@lists.infradead.org;
	Thu, 24 Jul 2025 04:06:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXO0p012701
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 04:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x293Msh9UDQSVhuyx5pXKkWx65B9HMQhf7b
	vndfkyps=; b=jFHYm5QUgEAN2PX1I6kdy8Du+pkjXpVncV9Amweqd83l/k6XoDL
	PPolZ6jia0CZw/8/sjiQqiCmA7ZD5t19BQq5wY0HwRqbYLP5tQaJAtLJ5WBe5RZk
	9LrNfydbY5y7+fsZxEuMOCKE8tdCWMxFYzTAgtkzSg5Wnnt+7NXA7vexMoT4618e
	UC32JisBEkIE8BhcHLmmM9rsadeoFKLJBcrR5oJ3RBDA8YRMdyUccUsDWtl6lEkc
	oa8VPD5OTkTABaWJveboDhBisS8QPvyOIu1N2twc+eZtYa03uHYTHbUeW8Bub2l/
	/wpof5JOZYAR9d7SMLtU9H78DL3WtvzolUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hwc1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 04:05:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3122368d82bso925934a91.0
        for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 21:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753329958; x=1753934758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x293Msh9UDQSVhuyx5pXKkWx65B9HMQhf7bvndfkyps=;
        b=N4PfMbZPu34Zb8dXzjJtTieUA19xzvmFKJiEJEH9dp+PM6s7MqwAWW+6CGHWRJNMxc
         x2BdjzYu0avv7PBV2b8EvFjLo43YaSQGBshypYuv2F246l9syPBZNYcdijpxLzPnW0ic
         777Qmoln/9sWXZzChA47O+YrWwgukp835ojToV06OUrLtMzA7NPAuSn8JXpvFZP5vuLT
         0cY/hMmd4VjijnE5B9QotDXSMo2fkQoSSwmUZU4//9y/5MEt0bD+2IDRm9BpsStK6Aha
         vClIAPRUYs+zmQtzjt+6h7YdR19gj6IQrKsTcTEydxrMwfOoaK4Raaw8gXj8h8bjyMu+
         RfYQ==
X-Gm-Message-State: AOJu0Yyt3nxIUx7rp4m5CerEoVDdJI69WeVhOY3o2QHUNEzyLC111OPW
	yqtlaAKrdxECXKL1XvGqXLdwCMTyEbxwMYfIlNPtUMIdnEMZAdq9r73OIkT/3APm/p+3lqziMLk
	5O5xN7QAx3AYbBnlbEc03d6/Ml4ZMg/pHiGX+ikB6eWitChAGVbMjmazhRSqf7KvDrhbCtPDV
X-Gm-Gg: ASbGnctKbQ6VK0E321Kw6Lq+fBpXvVMc6L0h4piiAZtTJiwMiP5DgKeDdN4Nqn4V/eG
	RM6Z+rRLTEFAGS9PMFeohomP3EaU80kCo4Hjkwb6uOPLXKyJVE81MFJR9oxWNPsCMYFeqOUYfeB
	Jr6g4lSfVNTevQy+CuH92KRfX22qBXX8aqd+UmildDOTRcXt/iHhj8x7pJWOwJgcdftf/qip75x
	iaK2vmEVcJZMyK3A/n+Tpjhs8vMVw6mSklKQjyXQQtVsR1O11JouZUR1ey4Hyw4tCqX4qoMEqFr
	/gTohAt8XNz3UwzWFrLf3Djfo9yHlI9txUZ771N312038BErYzmGif87Zw9UlQJuRKzZ+dRCv+F
	NoFuDibql2Me4+0nu4zuVveEypt+h9xM56RMQGBNkI9eMRTW/DpJdZg==
X-Received: by 2002:a17:90b:558e:b0:31e:3bac:96bc with SMTP id 98e67ed59e1d1-31e507e8344mr8169614a91.33.1753329958301;
        Wed, 23 Jul 2025 21:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7RRLQZ2EKFLTBH+I/O/BM5AMrbNye04wA8S432vnqf1FV08tg7cUWvY7jsYrtsuFxWpbNCA==
X-Received: by 2002:a17:90b:558e:b0:31e:3bac:96bc with SMTP id 98e67ed59e1d1-31e507e8344mr8169576a91.33.1753329957822;
        Wed, 23 Jul 2025 21:05:57 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e662c0383sm253847a91.24.2025.07.23.21.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 21:05:57 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()
Date: Thu, 24 Jul 2025 09:35:52 +0530
Message-Id: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6881b127 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=o0mWW05dekoEtN9qp9QA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAyMSBTYWx0ZWRfX4Qcj/OLYHahD
 P6KJMEUT0VWQMCQihcR4ZAWtQdsomBvh1Gvov8yGZ5eFb+s/XAAtQRXjo1yFr5oP79QHwoT4SO7
 MNMr/SRQ5+0UZk0UTrdjPoCObJy0zCsH9UdQ+Oo/6asicyiPbIX6EcnmNvy6ia8aDlXFxVqZ30u
 bP2k+4kMUdzo2aExmr3wBrtCHhbqtOm23DeiwUpzTWexsUSZYOu3sABL4iN+Dz25avNK+fsXYmU
 QYH3J9slZNXLpeeMmCnLdcAcPJXCX7ogbL4YCvhIZbQZlEKKxPcaolxSo0ieOrmHJjkH3xhsisy
 mzKgd9FP1XS4BRdt2LeicKdv9djJNdxhjP4cKzv9HtA9OG2PvfRV1yv/GCAg8IdjdLbMD7uewdP
 GiFsbonH1dD+rqpBLqi+dr1sgr0IkT6IztdQ8xA9Y92eMCqZGy6Lb9LbabqMwfXUshnJnpU7
X-Proofpoint-GUID: Dwr-zUtf8rDRmVseo5Rg2UGCSvEXu25p
X-Proofpoint-ORIG-GUID: Dwr-zUtf8rDRmVseo5Rg2UGCSvEXu25p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_210601_321281_57FE6CD4 
X-CRM114-Status: GOOD (  15.78  )
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

In ath12k_dp_mon_rx_deliver_msdu(), peer lookup fails because
rxcb->peer_id is not updated with a valid value. This is expected
in monitor mode, where RX frames bypass the regular RX
descriptor path that typically sets rxcb->peer_id.
As a result, the peer is NULL, and link_id and link_valid fields
in the RX status are not populated. This leads to a WARN_ON in
mac80211 when it receives data frame from an associated station
with invalid link_id.

Fix this potential issue by using ppduinfo->peer_id, which holds
the correct peer id for the received frame. This ensures that the
peer is correctly found and the associated link metadata is updated
accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: bd00cc7e8a4c ("wifi: ath12k: replace the usage of rx desc with rx_info")
Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index b408103fe9d4..73ba756b28a9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2244,6 +2244,7 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 
 static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *napi,
 					  struct sk_buff *msdu,
+					  const struct hal_rx_mon_ppdu_info *ppduinfo,
 					  struct ieee80211_rx_status *status,
 					  u8 decap)
 {
@@ -2257,7 +2258,6 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	struct ieee80211_sta *pubsta = NULL;
 	struct ath12k_peer *peer;
 	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(msdu);
-	struct ath12k_dp_rx_info rx_info;
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol_tkip = rxcb->is_eapol;
 
@@ -2271,8 +2271,7 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	}
 
 	spin_lock_bh(&ar->ab->base_lock);
-	rx_info.addr2_present = false;
-	peer = ath12k_dp_rx_h_find_peer(ar->ab, msdu, &rx_info);
+	peer = ath12k_peer_find_by_id(ar->ab, ppduinfo->peer_id);
 	if (peer && peer->sta) {
 		pubsta = peer->sta;
 		if (pubsta->valid_links) {
@@ -2365,7 +2364,7 @@ static int ath12k_dp_mon_rx_deliver(struct ath12k *ar,
 			decap = mon_mpdu->decap_format;
 
 		ath12k_dp_mon_update_radiotap(ar, ppduinfo, mon_skb, rxs);
-		ath12k_dp_mon_rx_deliver_msdu(ar, napi, mon_skb, rxs, decap);
+		ath12k_dp_mon_rx_deliver_msdu(ar, napi, mon_skb, ppduinfo, rxs, decap);
 		mon_skb = skb_next;
 	} while (mon_skb);
 	rxs->flag = 0;

base-commit: 708243c62efde8241e2c66e9c3f377658855149d
-- 
2.34.1


