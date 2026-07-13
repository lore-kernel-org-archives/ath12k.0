Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55D1C44507
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=VCrO5SwtbAAyquIq64F1zmAFmw
	+pQmDPYTtw/SsqwVUW4oka8DnrZtGmhTR7GbkEv0KuKSj25VP7EOzSHcduj/gGM03Fh4TlztxGwGI
	53HAZ37iYAyfZzV/NiKmPCMbK455EpL0Xted9Kfj+gB1c+0NHZCzJNJ9r08Cn2drd6kO3lZ3Hz3Yp
	qATIsn8JydRp2kfxyRz6MQFPhiP6rkh483owuRrZY3fAGg7nWtNGAygqSAO5QPwgEmiEWZ9S+FGKY
	zAh7+3aht0z7X0LDGFzO7ZfkR/PaifOhEfKc5K4Nq22XHRVh+eW+tX+OTGq8grR41ySG6PjdJ2pfy
	zlNHpWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAf-00000008Qos-1kpG;
	Mon, 13 Jul 2026 07:33:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAd-00000008QnI-0IoA
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KcaA774697
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=gM8xIqrPIVG1t/hy
	GZwNDiRtnaoEMu5dG9J4h1NTGjU1+2BmDNL9g6ZGrR985MMbm1KXJkbzJSXiVsmR
	+YKbALgbZocDKUtxdceayPth3yVtDCqHx9AGSIjs/PTBHsylDPzm9xwEHwSwjr4e
	KvF5gzf6oQ5S48Ba0Xol2hs6nrJwxoYcEGanipq6k9FSC9eInIHTOTq2W3cerPD6
	cHnDAXVNCf6zKFX+VKSvKxuFsKfb2OY0BDGCcVnjzC1d0qwwpcihrHqG+SFP2wXJ
	SMe16iLgOqaqXKaGNmHVfGL4DTT6lG+cnz2hFD1cXrfggQUmlxwG9YreIXsPUPuB
	5kc7ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj001md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so57918365ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928021; x=1784532821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=TWWamUVRWohFrjnlXHq4ocmnIkoCgIT5M+BKrpt/Pb8bgaz4xBTOBK0z++5HgiMDNi
         agvzBnVR5jB64ONcJ0Q3zFojUoORfR3k0sAc7Ug03FFQtLAPrXOU/wmDvCZf+IxRR0M+
         RuFEFL2DewGJ90jMsS2LkXr1DxyV0IyJ2b0n1Yfz5pnA7gQoPTcLPIgK2f9GhJQdONw9
         aqV/B984SR/5gPMvLmLqu6k6htjUK+X8iHgSWFJLbTbxHQs9k5o9RM7+cZumh2SepY98
         yKTri2FdDW3ZDJcgKGIbMmYsdpMSOO2aGlzyotTRi6nlzNK1Lilckt7FV9QzCmIQIKWJ
         NJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928021; x=1784532821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=dP5e7mjhlDScxnTcsucDrreUnZbdhC6Ij/dv5i9/y4VHWLPIjk7mnG2YwNr6rJOs4w
         gpQVXjz9KdoUpqVPgOyZqq34EYWGOJIiYA++eKY0q0r+WbLtq9+Jb/NxZy7pkwxxXhuL
         x3O0GuhCIFlZykCMD2S1rAqI5LBGuWlPWQrhgIcSDtLuCtgjA7NgAq/LPq6RlKmqWbl+
         sHgC+BoLKnSFvMGMwk/rRuJwHMnybUUAxH1s/QABpNvZC2BusqsNTCP2ILj+axKxp5OP
         jfkNOjHhsiQeDn071ohxDpuKiGpB+F4m9QmAikfOfjXqkb9N4NcwduSopVHE7FSeH9If
         tkDw==
X-Forwarded-Encrypted: i=1; AHgh+RrQkVuhCJ+mE9Seqz8UoE6NO3zL6zVRI6ZiNJmuZdThCmtJvpdAYT3SCgvYeevPcnd6o6dvS+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRNhGtDo3iQG3gLT27GRTOsUJw2atWsotG5IUdp6pfg+HrssLJ
	v0JDTQwfWhtCYhAIqJQYjz6R9hWLzuk6k4zDqUFTDqfxtwls/hW7IOZr6D9Eq2Qkh9FruzcGyfG
	QyQUEtNoLIe81nLQR6XCDDUafEcoLkrpjSlLxRLZObyhrNdhwIwAJfdPfyxxcIZJtBLmhu3ygP5
	c=
X-Gm-Gg: AfdE7ckY7Mir6q+nX+nfexTqOMErRqFcZ4tFmLMpr8b5nLDzhWGEVULcJ745QMhHKg/
	Kdo11VHjiZs6Cz/3bxGGseFRvE8BOnGuNe+JYkdN6CscQJ5cKfwuyPvbmurQVrz6RQBF8CmA3vM
	+7++31TRgnQQYoZilvyQ8qaGoEqrAme2Qdb4WpG5EHgOKwfRXZmcpQZjdqP4WciOFHNiZrivuRR
	db2Yh9M/zE3EgWDmIECFNaWhRu4O7YXVyDzTz+4JVD+c/kKCZzAcgb2Yr0Z351PpoT03F3MoqOX
	pHrw//Qg5okTY5N0cxaieduKu5S5IzzoQeRFGPWK651YQI2K1U5471Rg3XkluCvtSGVRQ5ZHxOu
	KvXjaSgafyr0mTGkgVeXAlRorLObzWwpLAo+hnceuVwYXDwENHlPtgCzvA8IXsWT3
X-Received: by 2002:a17:902:cf43:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2ce9e7a5228mr75289715ad.10.1783928021248;
        Mon, 13 Jul 2026 00:33:41 -0700 (PDT)
X-Received: by 2002:a17:902:cf43:b0:2ca:e565:7b15 with SMTP id d9443c01a7336-2ce9e7a5228mr75289505ad.10.1783928020829;
        Mon, 13 Jul 2026 00:33:40 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:39 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:16 +0800
Subject: [PATCH ath-current 1/8] wifi: ath12k: fix out-of-bounds clear_bit
 in ath12k_mac_dp_peer_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-1-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX5+TCcFd/LPgZ
 9Yc+2U/cYcArYFQCeNIUVO3oobzWSgn5MzPV7qFbWEHhA0oCguLXEi9hy8ct2bSZYGOYiVO2e7i
 fbRpyAIVtaK8jIzLsxWafHpJlriqt30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX8qa+nd/FhLx4
 g8F/egNoqen+Z1nheEYiN0Z8UemJWvWIu02jTq/r8o2kcyHfUtU7C6v30+GK/WZwks3B0YT+fcK
 XJ8GipgU+vFPniH3krn0l6vkbcZNHUYJX32DmKY9cd77Zas8F/kBUL6tlfdiP19QPQ2o+gTjxf6
 50ll6gJ9g5m4mer7GQ/lIWD3pbp+amrmkKAcmpjdrgHbq0EveeyZrp436cp101kZUn1Xaa/ZuUN
 G0bEmrG+W/ca1wxm6YoXtATJoJ9GAK9ju4ifJcWtr9XTfbcJnKHcznHYLwjeVFU5TvoVz0+7SuT
 cXJY5qv/TKO1dTYiPRNZBTe0et5jLbDa5FC6ma5NplL0loQUCOkG2ymJGyGzcb/VCBHEQyottqB
 eYwmkIrBhPEjlQxVAw8e8pSD5Z7goqnKo8jxr6A3bXha1GDyGAEY9Eux9y4hteX3E/Sx1MpDnxO
 3JJLvorBJ+dtQpdzLPA==
X-Proofpoint-ORIG-GUID: 3SgU5iO438n8SqkymvtNCYXLNjbymvL8
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a5494d6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IU88uQVEuTzBCV0X16QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 3SgU5iO438n8SqkymvtNCYXLNjbymvL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003343_229123_7E63C947 
X-CRM114-Status: GOOD (  13.28  )
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

ath12k_mac_dp_peer_cleanup() clears the ML peer ID slot on the
free_ml_peer_id_map bitmap by indexing it with dp_peer->peer_id. That is
wrong: dp_peer->peer_id for an MLO peer always carries the
ATH12K_PEER_ML_ID_VALID bit (BIT(13)), so clear_bit() is invoked with
index >= 0x2000, which is far outside the bitmap of ATH12K_MAX_MLO_PEERS
(256) bits and corrupts memory adjacent to ah->free_ml_peer_id_map. The
intended bitmap entry also never gets cleared, so subsequent
ath12k_peer_ml_alloc() calls eventually run out of IDs.

The ID without the VALID bit is what ath12k_peer_ml_alloc() returned and
is stored in ahsta->ml_peer_id. Use that instead.

While there, also reset ahsta->ml_peer_id to ATH12K_MLO_PEER_ID_INVALID so
the bitmap and ahsta->ml_peer_id stay in sync;

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 490c134c1f29..b7eba8ea981b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1283,8 +1283,11 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
+			struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(dp_peer->sta);
+
 			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
-			clear_bit(dp_peer->peer_id, ah->free_ml_peer_id_map);
+			clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
+			ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
 		}
 
 		list_move(&dp_peer->list, &peers);

-- 
2.25.1


