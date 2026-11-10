Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861660A2625
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBOtcZfY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3hAzYoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3MWjtAt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=; b=QBOtcZfYZqLWhU
	Cw6nr6l58gx7m9APa8XjZScZ1GezKpChWLw9m4wc70nuAKgEVgrSnys2rWz8ibnyjAuZ/dF6wy8pJ
	YmdA5b0TXZJop2ZR1FiZgnNVtT9afJRxwvuj3vuM/kzCkUZG2lf5H72zSixNWovfxVHaDqjnyaSTK
	cJ+/4xmIjYdjIGHPKJNhtcUb494D3My+GKeBq29yUV0rLPhW3Let7J5CmYi67c5vgQdQot2QIdP23
	F+4aO2yT5SlQDv7cavM/viwIoIr4F5RRuF+BM0jx6eETDAIBi6PkH9gOgZMdL1sJ71Q/Va1kOH3yn
	QYy3d+rg7nf9vF2rstyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXi-00000002gN6-3FFP;
	Tue, 10 Nov 2026 06:41:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXT-00000002g5f-09M8
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:41:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6v41207762
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=; b=g3hAzYoBiT0GAg+1
	nvW8NbleCS1zta9gzEIvgFflH5ANaUd7Qj6XRgaz9vOZg1axIVC2TwTbiRoooIg0
	pCPbVg4Vzxu3GdSmWLkhW0DBj3s74dF5X0SLrWIWBh0buFKa8E5Jkcj1fFf0//LI
	H0eIK8KksKzbLVVszte7zj1XKOUbw8bnDKV5PYlIhJNEWZiaEf6zzb8z1r8bUQoH
	x8Kv7ZKUw+iQDNJdofFzL/5ur4uWs7iCEpHP2u0Xri5kRlTgDITtJh3mdPN3o9Av
	EWqT7y510JQzhmVm7dMxiAgvdrP4C3+b6tF2HVA37rINnra8PgVKRavXIPOyl/ez
	K9Fkgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhv2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:41:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so1593165a91.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292861; x=1794897661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=;
        b=G3MWjtAtyWISH7JvNn4Fex1P0Qv1ci9m/jC4P6g8QyUJ1M9dj932QLHqqT8lJ6PzWM
         fCHKaq3PbWDcsR6KyrmNanDEa5t1bKNXqR4MrtbpfSnPpAQnU04XKG65+MN9qRhjz5cR
         Z7hoB7hU/VjwwYKCdzHePudL5sTRJ4RQejCCaX/ysTBn5sShwVnK1cX51giPRiaK7fpT
         NmrKa48DSdxXzbJe9TZ63LIjCOOKe0kYTNOpwe+P2/7/XbNWkE0acM2MYMXG/5aH6Hvh
         +cc1YxyGcvLQZSXHXm/9tL6rH1oyplyl4uQS18J/PbkAT8+Z2fm4p6XnR6U4f7iuKm13
         IaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292861; x=1794897661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euxbIpi7LheQPZWwMeOFgUzKsMzlLTmjTVdZDf02W8I=;
        b=E/4NQz9Gi+tcMf2QP0XR1lWPe4G5kyaXEcWK9uhqSQIyw6dg1aMtuk+Hkij52Y7TBU
         eSQ5rNevzMuSJC8vikomhrhRl9poIMl5Y1r6aBY9GfBQMNVx/ajHegHeb20o07vGkou+
         GzFIEfzwWEl1mBkzrjHtfxP30grtq0beAFtQtKH0EwEaYIRebGOq6wsTtmPIg8zV/Tyz
         zyF57QuCjSWNB7mrS6b6UAjGLXD0EtJUTgB/1BEU6VwAbWA+DJBp61zFUeFRwa+F4szh
         FBLjcj3zxcCb5chMyDIduCH9pftnod1jmaYfOThpkNDr1LayzpgN77fw5X92zHWn5IEL
         H4pA==
X-Forwarded-Encrypted: i=1; AL+hErGIMZCsNmgg/dgkUnsI6NcrA2hN+O0LUQVswmGaIlWnyW7Xcc7wuqzgV/MpmEgeX6RnJJr/OAk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/b8zpD8HnhM6JuXc53DSIhpwZDjpzqSTX2h3S7HcMYn0W4njHg
	/LlBNmPu4XbKK1EH8FVr0tb0nWA3R9gsAPdTmLqpvOUEJabfE+Q7xT4TX0pYDH2tg3qaSps+ow7
	qtcRA/04gSV1uxqPfgOjD6rTLwcGZTrDhSNyf0TbRFzW+2EmdI7LKcWM5M1erZxaJ
X-Gm-Gg: AYBFou2eze45vw2c8Efi1wdQC8aeXBnZIoi86ewq/S5d9JVxQmglgdO2/8GE8YGGjMa
	x0PXi+Mcd1gl/mhwYHQPWGEPLT3VLVZtfePNz40eWbSkA9Ae7o3ycfXgTojrxK7ZV/ankYuSDUT
	rtSohgRb/a4EUEhmwwoppthapAJVHGFpjOR7gGuS6cvfXCqJru20XKIWsq3bn0TuPGzfwfxPZSw
	jpJOCuKQeG1f03ZaYjvyjr0bEcuo3SfndguvdG5CPODDHhrTPDyZ2+xXmwIcy4W9WEbRYcYr5pU
	J9eeTiiGVlWlFeS5Ilup8BVcyXpEBtK3DWw+V9zocLPakbqKbQeH6PriUMLHIzxNqTm3z7/ZcO8
	YccZcYR40Jyite4EkJXuoYvjSIJ8y+eLHYcO2keIyj+fGeqGH6H+1H2q0MPoudCto2W99TfC+bv
	vZ9JpqyKa+SsTr7txXJGUho27ZXOKMFw==
X-Received: by 2002:a17:90b:3b46:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b166b41b01mr2019338a91.2.1794292860578;
        Mon, 09 Nov 2026 22:41:00 -0800 (PST)
X-Received: by 2002:a17:90b:3b46:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b166b41b01mr2019322a91.2.1794292860077;
        Mon, 09 Nov 2026 22:41:00 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:59 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:32 +0800
Subject: [PATCH ath-next v5 11/11] wifi: ath12k: use link_id_map to resolve
 RX link id for all devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-11-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: uxai9nhm7CoZf-OoeTB5nhwLsNWOcop0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXzxqpt6iOQKsF
 mCQsjzuiHhra8n4NyzzvVh2BZqOWC03z96fKMHzOSqBm+7FGMRdp1hg/s20i77l6/d2rflYDow0
 rbylzTIfjXIPyyCQX1nrWoJLYI5UzOo=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bc7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KXmYhDJzFV-ZoC0c644A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: uxai9nhm7CoZf-OoeTB5nhwLsNWOcop0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX8+FhEzOI3x1J
 u3ny45NtSNH9A2IszEDmjz9PzS40qG8dX/Ar7vnT2PVC/KKqnRWxlW1Yyose/rh60mc8vq3jXqF
 WMtdAexjHA5M5KEDa5Vg7hcIAxh5W7vLgdVpXYkMUsHWIXUYDU9/RW5vu6u52CM455utpki28xP
 r/wWKBkWqPBBE7fSKVRJ3vyzkNx+4HwS360oyYzK04qMguR9rruoJwLIaF8gCscKI8qx7jmk/Mk
 nsOWbhkvmQHedewepHXIhGjbmN9qlJNNlYCREOqcK4nOVEBeTuLHEnyA2vQrd5V/bneerCrlIjU
 tIBtTxSGb0lTpJ2VrjOGTVwOEzlLsvMXo8/P8z1nazAbCvzUson94gAa+Fhgko6phATvYkHucLh
 Px2pPgyznmXAQ4njIIHO37AnkIUR81G0Ny5KOhVK0+lxRUakc4UkY+VJyNzYbjrYOBuwnIZtE9q
 vOcio+WqlWbutTktirw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224103_226139_0FC01E69 
X-CRM114-Status: GOOD (  18.77  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX throughput on
WCN7850") added a set_rx_link_id() op so that each device could resolve
the RX link id in its own way: QCN9274/IPQ5332 index
dp_peer->link_id_map[] with the hw_link_id, while WCN7850/QCC2072 walk
dp_peer->link_peers[] and match by peer_id, tracked with a link_peers_map
bitmap.

Now that ath12k_skb_rxcb::drv_link_id carries the driver link id for all
devices (the hw_link_id on QCN9274/IPQ5332 and the logical link id on
WCN7850/QCC2072) and ath12k_dp_peer::link_id_map maps it to the IEEE80211
link id, the RX path can resolve the link id uniformly.

Revert the set_rx_link_id() machinery and the link_peers_map bitmap, and
derive the link id directly from link_id_map[drv_link_id] in
ath12k_dp_rx_deliver_msdu() for all devices. The NULL dp_peer guard added
to ath12k_mac_peer_cleanup_all() is kept as it is an independent fix.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c     |  4 ----
 drivers/net/wireless/ath/ath12k/dp_peer.h     |  1 -
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  8 ++-----
 drivers/net/wireless/ath/ath12k/hw.h          | 18 ----------------
 drivers/net/wireless/ath/ath12k/mac.c         |  2 --
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 30 ---------------------------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |  6 ------
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  3 ---
 8 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 5acdfd18806e..4e753e6abe3a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -658,8 +658,6 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], peer);
-	WRITE_ONCE(dp_peer->link_peers_map,
-		   READ_ONCE(dp_peer->link_peers_map) | BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], dp_peer);
 
@@ -728,8 +726,6 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-	WRITE_ONCE(dp_peer->link_peers_map,
-		   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
 
 	rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index c2d060de88ea..2ac4c6c6d535 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -159,7 +159,6 @@ struct ath12k_dp_peer {
 
 	/* Info used in MMIC verification of * RX fragments */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
-	unsigned long link_peers_map;
 	struct ath12k_dp_link_peer __rcu *link_peers[ATH12K_NUM_MAX_LINKS];
 	struct ath12k_reoq_buf reoq_bufs[IEEE80211_NUM_TIDS + 1];
 	struct ath12k_dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index f11810c6e0d4..52838ade1b1d 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1370,13 +1370,9 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	if (pubsta) {
 		if (pubsta->valid_links) {
-			int link_id =
-				ath12k_hw_get_rx_link_id(dp->hw_params, peer,
-							 rxcb, status);
+			int link_id = peer->link_id_map[rxcb->drv_link_id];
 
-			if (link_id >= 0)
-				link_pubsta =
-					rcu_dereference(pubsta->link[link_id]);
+			link_pubsta = rcu_dereference(pubsta->link[link_id]);
 		} else {
 			link_pubsta = &pubsta->deflink;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 05902edbb59c..138e556ac679 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -13,10 +13,6 @@
 #include "wmi.h"
 #include "hal.h"
 
-struct ath12k_dp_peer;
-struct ath12k_skb_rxcb;
-struct ieee80211_rx_status;
-
 /* Target configuration defines */
 
 /* Num VDEVS per radio */
@@ -261,9 +257,6 @@ struct ath12k_hw_ops {
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
-	int (*get_rx_link_id)(struct ath12k_dp_peer *dp_peer,
-			      struct ath12k_skb_rxcb *rxcb,
-			      struct ieee80211_rx_status *status);
 };
 
 static inline
@@ -294,17 +287,6 @@ static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
 	return 0;
 }
 
-static inline int ath12k_hw_get_rx_link_id(const struct ath12k_hw_params *hw,
-					   struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status)
-{
-	if (hw->hw_ops->get_rx_link_id)
-		return hw->hw_ops->get_rx_link_id(dp_peer, rxcb, status);
-
-	return -1;
-}
-
 struct ath12k_fw_ie {
 	__le32 id;
 	__le32 len;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dbbcf524906e..ff2508a7be74 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1241,8 +1241,6 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 		if (dp_peer) {
 			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-			WRITE_ONCE(dp_peer->link_peers_map,
-				   READ_ONCE(dp_peer->link_peers_map) & ~BIT(peer->link_id));
 			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
 		}
 		spin_unlock_bh(&dp_hw->peer_lock);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4132578085cc..473887ed4bb1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -2374,33 +2374,3 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 
 	return tlv_tag == HAL_RX_MPDU_START;
 }
-
-int
-ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
-				       struct ath12k_skb_rxcb *rxcb,
-				       struct ieee80211_rx_status *status)
-{
-	return dp_peer->link_id_map[rxcb->drv_link_id];
-}
-
-int
-ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
-				       struct ath12k_skb_rxcb *rxcb,
-				       struct ieee80211_rx_status *status)
-{
-	struct ath12k_dp_link_peer *link_peer;
-	unsigned long links_map;
-	int i;
-
-	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
-			 "ath12k set rx link id called without rcu lock");
-
-	links_map = READ_ONCE(dp_peer->link_peers_map);
-	for_each_set_bit(i, &links_map, ATH12K_NUM_MAX_LINKS) {
-		link_peer = rcu_dereference(dp_peer->link_peers[i]);
-		if (link_peer && link_peer->peer_id == rxcb->peer_id)
-			return link_peer->link_id;
-	}
-
-	return -1;
-}
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
index 8a16fb3dd005..3da80da19ced 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
@@ -59,10 +59,4 @@ ath12k_wifi7_dp_rxdesc_mpdu_valid(struct ath12k_base *ab,
 				  struct hal_rx_desc *rx_desc);
 int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 					  struct ath12k_dp_rx_tid_rxq *rx_tid);
-int ath12k_wifi7_dp_rx_get_link_id_qcn9274(struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status);
-int ath12k_wifi7_dp_rx_get_link_id_wcn7850(struct ath12k_dp_peer *dp_peer,
-					   struct ath12k_skb_rxcb *rxcb,
-					   struct ieee80211_rx_status *status);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 76f40073e002..48a2f6da16ef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -159,7 +159,6 @@ static const struct ath12k_hw_ops qcn9274_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_qcn9274,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_qcn9274,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_qcn9274,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_qcn9274,
 };
 
 static const struct ath12k_hw_ops wcn7850_ops = {
@@ -170,7 +169,6 @@ static const struct ath12k_hw_ops wcn7850_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
 };
 
 static const struct ath12k_hw_ops qcc2072_ops = {
@@ -181,7 +179,6 @@ static const struct ath12k_hw_ops qcc2072_ops = {
 	.get_ring_selector = ath12k_wifi7_hw_get_ring_selector_wcn7850,
 	.dp_srng_is_tx_comp_ring = ath12k_wifi7_dp_srng_is_comp_ring_wcn7850,
 	.is_frame_link_agnostic = ath12k_wifi7_is_frame_link_agnostic_wcn7850,
-	.get_rx_link_id = ath12k_wifi7_dp_rx_get_link_id_wcn7850,
 };
 
 #define ATH12K_TX_RING_MASK_0 0x1

-- 
2.25.1


