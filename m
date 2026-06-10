Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E76CD8CB2
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 05:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hifyL0NPApEWe3nDZ2vyo0AZsxUVkJD6kcoqizNAelo=; b=xL6jPT12Jh+pGdJdMB5aAsI6b6
	o4k9q1pf8UK6pyBVEnrLLszw+KQOdmPy7oKzLQgDA+nOxcYYl86jLSKZuWiXhKR1ZLyq9ODREgxG+
	jYRB9LBaLlHjHGJ+0Ja5CdxhSXRvAX8Z8cB2vEoYyBfWBW6hjqCE3Yst5Ysvti4ZbK5pjO13u6ZJL
	+JhU+E9Z3tljfZWhgJs9IVltM5grp8husguhMf7Or7fgy0KHo3TpL9GC+Hg7zVTAYeCgxV/bmVRV9
	7k6T2OawHGFuwCKtWIkoOm7TFulJREqLCKp+NfMiUVeUB6Wf8yUw4aAA6O4q+DUknVdizQhsTEEKF
	Dukg5CLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ5-00000006pS1-2Z6R;
	Wed, 10 Jun 2026 05:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBZ3-00000006pRQ-3Gl3
	for ath12k@lists.infradead.org;
	Wed, 10 Jun 2026 05:33:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2egWB4061505
	for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 05:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hifyL0NPApEWe3nDZ2vyo0AZsxUVkJD6kco
	qizNAelo=; b=CStx/ZPTGW2m7Fn6SqMF1JTVPm5CWk4MiodRvcpjr3mTZgfq1fE
	FLPPY9tuW/T/zQTgbWpuLbln12h/mdk5y7VJTuDZFxQQkiDC7ox73GNIoKf49AAF
	uFsTkCvHXkCN1Nu4zV9qsrihwBts0p04ZGxWi//OZ22CdzN+x2v/Es6WpBbXlAYx
	NBzOFX0gqrbPqPvU6/UA4FwxG8IL/Q6ukPgZCmv7yq0jx50Ya3OUh92A7rfvbrhu
	2N3A+wYR3onsor1ZH/m8/iuqhXtr+VCcqRICX1AGVH0kJdLRez6e6w+l9/YuWIlb
	pkWxsENA2ZvreEDfWWuklhTlpNONiaPaRHg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2gtst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 05:33:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3074797dfa9so9106723eec.1
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781069600; x=1781674400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hifyL0NPApEWe3nDZ2vyo0AZsxUVkJD6kcoqizNAelo=;
        b=TdklUZzIo6bOM0CqA+MNQ4whYThdiKvMhJ5ax8XmoUsNXTp7g90wgxebIwoJGeLA17
         Pxx7SKQp9fRM3rPqIMjTLuQXlku42N9zh3dP7le5O6ouebhg/iLTK9qaMcDWiJUchfWh
         9wXKlUFP6fq8sZrdvh/BMJqYLuH7KI/VJhUooGI/NF4pMhgdBQOiTx+zPbARIs04SHYS
         jieKD5CMg5/tLN6cWj5u6IZyuXlYwU+t9G6GyrCMrh7C7SHYYd2v/JUGdfyL9C/ztkyo
         BBHdN1txpPSVMiqhYvPO1acuaFh8W3OMRtPEer3E0k7N18sBlsoD1b0k0ZsI8bDhdrOq
         RMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781069600; x=1781674400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hifyL0NPApEWe3nDZ2vyo0AZsxUVkJD6kcoqizNAelo=;
        b=dSRSdN0Tqrk5etjWRO6aBSQfdrdaMvY8EwpmRnBu0LfhsUeE0H4nqaDvDNvYhn8BnP
         rMOGZSSn82t3dZFRT/KCYPBjCtwkTawJ+Tet26APAUIAG87+rMBgsUSqwOLaWFlUqrtR
         /tFtNf5FJPDfcS4H8jscYq6PTofeZ0jIuHlQVEEX8GW9bhgMuqZuPU//rkmHmlYCPIsi
         zNxmKnFHaiKLBbZsSgGxu+4cTjNgZdMlo6S6wlL4XNpOfC/I6YxIhmy3mz6DDbqh/IvN
         Bc8wrKgIG0lX/clNYkTItZ0CA4KgymRUoQeXI6j6UckJi8FT2qlnEpHZ/SW+uEsEju72
         pL5Q==
X-Gm-Message-State: AOJu0Yxzwj0vYTeA5f3fW7LJ3QqlSO/tcdx6KvkXgVmdxbrol+cCTjyx
	yLwqKPzmxnsskX5vWaJwwt3gj1Qwq4dr9SYuRBlKkO7Gk7wZ6dbreOGMo4/YkRi6J2d9eHXV/Gk
	s8DXlZAVLN+RDuh6WeY5U6Tz2SI2Njt6O/5YicLje8q+44ucQ57DarH6Sp1jvisEFE6GkV7Kw
X-Gm-Gg: Acq92OFbVUqF5lmPAbp5On3qq8EeW/o0muPApocKg7NtWiWK8NvomLB6KGc3vSOb1SE
	XKQwIYiP8b1AhaQJjOISRUYCxMA2kIdrY5tjIYJf8CX+AeOmOi7uLWVmAWtacDO8EN4v6yPxyKS
	lDs0id294f3KX/vc3JO0Mhptx9+8VjEQOoXrpYqCj8BC4qDp2MhdVEkS2e1BJ7yvg2PbdUSNH81
	cVkyxua02RYikIQ1zzBLTHcVGXydkrTjAemrIJlWv3SoNUt1C2l4AmwBJq+EW23cg7NUef26MFy
	fi71G/1oDDq/Cizmd5tCJJm0GdAO6DL7I3L927MdpEBvd0tNmoZYXI/rGnbR3WJaPE1fuMPAS4h
	V0ettnetfnggpPULoAdDeymrWpgyWtIzMsmLLy15BmRa+qYI+478CY/0ZE0/AzX3TmsfgCYDhlg
	MVQNYqptSuGJs=
X-Received: by 2002:a05:7022:98e:b0:12d:bab2:f213 with SMTP id a92af1059eb24-138066fbf9bmr12003004c88.21.1781069600166;
        Tue, 09 Jun 2026 22:33:20 -0700 (PDT)
X-Received: by 2002:a05:7022:98e:b0:12d:bab2:f213 with SMTP id a92af1059eb24-138066fbf9bmr12002973c88.21.1781069599497;
        Tue, 09 Jun 2026 22:33:19 -0700 (PDT)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm17579127c88.6.2026.06.09.22.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:33:18 -0700 (PDT)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-current] wifi: ath12k: Fix low MLO RX throughput on WCN7850
Date: Tue,  9 Jun 2026 22:33:15 -0700
Message-ID: <20260610053315.2249912-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a28f721 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OyfRQutId-_NmcKVfq4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MCBTYWx0ZWRfX5ZfnXwxzv/wt
 4jOVUxqs0Xv8NQjUjFdyY+NZVe6WksKYQAYzbstlQShMSKArtbIz21Z7Hu1yCymPq+hraaJfzOA
 iAchgPsY76zJyX+rVzQ+cg8sE5slW0d9dlOS2LdhpB+kcmSNKvzABin6gU31SxaHL7PHpDX9RZZ
 2Upn5muhh6KfP9zHo0yDUpCdBIwxniwvZPYLr7N7CaxBrpgVOYAO8Ymw6OqPkYE8EENhGr7T9mH
 andfLrL8Io/pU/3xJpZHSZTAz5ZDINpw05shHjvG8vDT/3wg7a+KQZTupEIKMW4YtqzIHsyYCoD
 foMYZgwethtFkJ8Y12I5798OsZzaK2mKprhtJPYX08tOKK1BUiQxyr5Po/dTtROmDgeM2HRuhaQ
 3VIQph03hKjjL0clvsnL00f/4CvvLemGTxGeG1CqTDnL+SXOR5mdjIdynOXzeqawUaauQrlVGdG
 KB6gBpGvb8Z1HJDjRGA==
X-Proofpoint-ORIG-GUID: BUlxoIOzzg9b9zir_NT7hO_PhNM5Bm9k
X-Proofpoint-GUID: BUlxoIOzzg9b9zir_NT7hO_PhNM5Bm9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_223321_830343_37BC1A9B 
X-CRM114-Status: GOOD (  23.71  )
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

Commit [1] introduced a regression causing severely degraded MLO RX
throughput on WCN7850.

On WCN7850, there is only a single ar instance, but MLO uses two
link IDs. ath12k_dp_peer->hw_links[] is indexed using ar->hw_link_id,
which causes both MLO link IDs to be stored at the same index.

As a result, an incorrect link ID is assigned to MSDUs in
ath12k_dp_rx_deliver_msdu(), leading to severe MLO RX throughput loss.

Different chipsets identify the per-MSDU link differently:

  - On QCN9274 / IPQ5332, the host owns multiple ar instances and the
    per-MSDU hw_link_id from the RX descriptor maps cleanly through
    dp_peer->hw_links[hw_link_id] to the IEEE link_id.

  - On single-ar chipsets like WCN7850 / QCC2072, there is only one ar
    instance for both MLO links, so dp_peer->hw_links[] has just one
    valid slot and cannot be used to distinguish the two links. To
    resolve the link, walk dp_peer->link_peers[] and match by
    rxcb->peer_id, which on the link_peer side identifies the link
    peer for the MSDU.

Add a new hw_op set_rx_link_id() so each chipset resolves the link
on the RX fast path using whatever signal it actually has, and let
the op itself decide whether to populate rx_status::link_valid and
rx_status::link_id:

  QCN9274 / IPQ5332 : always derive link_id from
                      dp_peer->hw_links[rxcb->hw_link_id] and set
                      link_valid.
  WCN7850 / QCC2072 : walk the link_peers[] of dp_peer to find the
                      link_peer whose peer_id matches rxcb->peer_id,
                      and set link_valid only when a match is found.
                      Otherwise leave link_valid clear so that
                      mac80211 can fall back to its own link
                      resolution path (via addr2 / deflink).

For WCN7850 / QCC2072, walking dp_peer->link_peers[] is bounded by
the number of links actually populated, so introduce a link_peers_map
bitmap (unsigned long) in struct ath12k_dp_peer that tracks populated
slots and use for_each_set_bit() to iterate. Non-MLO clients hit one
slot, current MLO clients hit two; the full ATH12K_NUM_MAX_LINKS
array is never scanned. The bitmap is maintained with WRITE_ONCE() on
the write side (under dp_hw->peer_lock) paired with READ_ONCE() on
both the lockless RX read side and the write-side RMW for KCSAN
correctness.

Also guard the dp_peer dereference in ath12k_mac_peer_cleanup_all()
with a NULL check, since peer->dp_peer can be NULL for self-peers or
peers not yet fully assigned, the pre-existing rcu_assign_pointer()
call there had the same latent issue.

This restores the correct link ID on WCN7850 without changing the
QCN9274 / IPQ5332 data path, which keeps its O(1) hw_links[]
indexing.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 11157e0910fd ("wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths") # [1]
Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     |  4 +++
 drivers/net/wireless/ath/ath12k/dp_peer.h     |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  7 ++--
 drivers/net/wireless/ath/ath12k/hw.h          | 16 +++++++++
 drivers/net/wireless/ath/ath12k/mac.c         | 10 ++++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 33 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 ++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  3 ++
 8 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index a1100782d45e..f57f1483c3e4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -570,6 +570,8 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], peer);
+	WRITE_ONCE(dp_peer->link_peers_map,
+		   READ_ONCE(dp_peer->link_peers_map) | BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], dp_peer);
 
@@ -632,6 +634,8 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
+	WRITE_ONCE(dp_peer->link_peers_map,
+		   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index 113b8040010f..d4d2ff16e836 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -140,6 +140,7 @@ struct ath12k_dp_peer {
 
 	/* Info used in MMIC verification of * RX fragments */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
+	unsigned long link_peers_map;
 	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
 	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index b108ccd0f637..b5dba7c0155f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1344,10 +1344,9 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	pubsta = peer ? peer->sta : NULL;
 
-	if (pubsta && pubsta->valid_links) {
-		status->link_valid = 1;
-		status->link_id = peer->hw_links[rxcb->hw_link_id];
-	}
+	status->link_valid = 0;
+	if (pubsta && pubsta->valid_links)
+		ath12k_hw_set_rx_link_id(dp->hw_params, peer, rxcb, status);
 
 	ath12k_dbg(dp->ab, ATH12K_DBG_DATA,
 		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s%s%s%s rate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index a9888e0521a1..da75d19ae1a0 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -13,6 +13,10 @@
 #include "wmi.h"
 #include "hal.h"
 
+struct ath12k_dp_peer;
+struct ath12k_skb_rxcb;
+struct ieee80211_rx_status;
+
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
@@ -224,6 +228,9 @@ struct ath12k_hw_ops {
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
+	void (*set_rx_link_id)(struct ath12k_dp_peer *dp_peer,
+			       struct ath12k_skb_rxcb *rxcb,
+			       struct ieee80211_rx_status *status);
 };
 
 static inline
@@ -254,6 +261,15 @@ static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
 	return 0;
 }
 
+static inline void ath12k_hw_set_rx_link_id(const struct ath12k_hw_params *hw,
+					    struct ath12k_dp_peer *dp_peer,
+					    struct ath12k_skb_rxcb *rxcb,
+					    struct ieee80211_rx_status *status)
+{
+	if (hw->hw_ops->set_rx_link_id)
+		hw->hw_ops->set_rx_link_id(dp_peer, rxcb, status);
+}
+
 struct ath12k_fw_ie {
 	__le32 id;
 	__le32 len;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index df2334f3bad6..a7377bc7308b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1234,9 +1234,13 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 		/* cleanup dp peer */
 		spin_lock_bh(&dp_hw->peer_lock);
 		dp_peer = peer->dp_peer;
-		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
-		rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		if (dp_peer) {
+			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
+			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
+			WRITE_ONCE(dp_peer->link_peers_map,
+				   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
+			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		}
 		spin_unlock_bh(&dp_hw->peer_lock);
 
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 945680b3ebdf..2801a38cd1e7 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -5,6 +5,7 @@
  */
 
 #include "dp_rx.h"
+#include "../dp_peer.h"
 #include "../dp_tx.h"
 #include "../peer.h"
 #include "hal_qcn9274.h"
@@ -2240,3 +2241,35 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 
 	return tlv_tag == HAL_RX_MPDU_START;
 }
+
+void
+ath12k_wifi7_dp_rx_set_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
+				       struct ath12k_skb_rxcb *rxcb,
+				       struct ieee80211_rx_status *status)
+{
+	status->link_valid = 1;
+	status->link_id = dp_peer->hw_links[rxcb->hw_link_id];
+}
+
+void
+ath12k_wifi7_dp_rx_set_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
+				       struct ath12k_skb_rxcb *rxcb,
+				       struct ieee80211_rx_status *status)
+{
+	struct ath12k_dp_link_peer *link_peer;
+	unsigned long links_map;
+	int i;
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
+			 "ath12k set rx link id called without rcu lock");
+
+	links_map = READ_ONCE(dp_peer->link_peers_map);
+	for_each_set_bit(i, &links_map, ATH12K_NUM_MAX_LINKS) {
+		link_peer = rcu_dereference(dp_peer->link_peers[i]);
+		if (link_peer && link_peer->peer_id == rxcb->peer_id) {
+			status->link_valid = 1;
+			status->link_id = link_peer->link_id;
+			return;
+		}
+	}
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index 8aa79faf567f..1d3a4788a2dd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -57,4 +57,10 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 				  struct hal_rx_desc *rx_desc);
 int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 					  struct ath12k_dp_rx_tid_rxq *rx_tid);
+void ath12k_wifi7_dp_rx_set_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
+					    struct ath12k_skb_rxcb *rxcb,
+					    struct ieee80211_rx_status *status);
+void ath12k_wifi7_dp_rx_set_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
+					    struct ath12k_skb_rxcb *rxcb,
+					    struct ieee80211_rx_status *status);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index cb3185850439..f687eb69ea8d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -158,6 +158,7 @@ static const struct ath12k_hw_ops qcn9274_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_qcn9274,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_qcn9274,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_qcn9274,
+	.set_rx_link_id = ath12k_wifi7_dp_rx_set_link_id_qcn9274,
 };
 
 static const struct ath12k_hw_ops wcn7850_ops = {
@@ -168,6 +169,7 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
+	.set_rx_link_id = ath12k_wifi7_dp_rx_set_link_id_wcn7850,
 };
 
 static const struct ath12k_hw_ops qcc2072_ops = {
@@ -178,6 +180,7 @@ static const struct ath12k_hw_ops qcc2072_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
+	.set_rx_link_id = ath12k_wifi7_dp_rx_set_link_id_wcn7850,
 };
 
 #define ATH12K_TX_RING_MASK_0 0x1

-- 
base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784

