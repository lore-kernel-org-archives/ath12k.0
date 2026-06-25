Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3444CDB47F
	for <ath12k@archiver.kernel.org>; Thu, 25 Jun 2026 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORF77YaUc0EKc98iyCcZrroMay4agDe0TGT8ZMQbFL0=; b=lnJerIPaKROBzcvIEbzDUdDupY
	RBjEUwKu8t9ZoRtRtlxq4xSQyh3xfILUXqEkFHCpkEljre4oMWSyRKV0PB+M6t2pQLKHOhftdlqi4
	H5PbeAKfDE8BsJJAuVyfQsHCcqESLHQBwfpYq088vXlWju/9DZ074MHQNNes18ZkwUtOVGwd9PcLM
	oW78DjfFMHcJbzcuLR3au0339kfELX6BZNrxxFEQ7t62U6wEvIcYYAMQpkC7j7FusiowwnsXGH9hp
	wETmKtkKtYuZoWlDHWWszQQZ5xqY0zaRKyg7MlpDr565E/Ui/bZDO3WrL4iZj32UZOZoucuidTQgP
	GXrD8JWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcecX-00000008lrp-1pU6;
	Thu, 25 Jun 2026 07:35:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcecU-00000008lrU-2Vj9
	for ath12k@lists.infradead.org;
	Thu, 25 Jun 2026 07:35:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6gpmg1527063
	for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 07:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ORF77YaUc0EKc98iyCcZrroMay4agDe0TGT
	8ZMQbFL0=; b=HvUtteXO1Qr4/ipJF0vPK+oZQ51mRArDxx6kJ8WHDEtnS2rMOnz
	K0cWVYp67Z3FALr/xLmOF7dgKzrXipSNRiaBsvivMMj7CAZb5j/IDJ7A5NEOnvOB
	Kc+bZFSR4yrQ9rNPuq47oRnRlEocRbADudx9S/QPfjXsrD880ADEiKCg1xLaG5gs
	RkODDjE/14ieOHTZH2votnAQQTqL8NQ/F7jiBGR/swhNrFJfClidmSBExwict3Y9
	eh8Lj4jzAqFa+7gn6MWAG+emXfyWf5sQp/f7d9o/wHCyc8eKkCAXwJajzJSNfmE7
	ETjb2yPvUZ6lecvJIZBMhp6qY6O6eZ2wF3w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8r6hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 07:35:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c42d96713so1381373eec.1
        for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782372928; x=1782977728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORF77YaUc0EKc98iyCcZrroMay4agDe0TGT8ZMQbFL0=;
        b=BoaefC4UrvAu13MUmy4Gm6XpC1fZgi8nqB9fZNQXdTJLOw/Mfv2cnKN6ZB+CvfxRAf
         1/PAl7gGwlxbZZzOL4BlwueL78X2f4sAONlH3f784UGEz/bhoJRHeNTtUavjKS4ZKbzz
         mVP8Im1ECpp0gImByIU7A82C8CF9L0c1ZN7dzDMrmZJsqzv8wRCXRrVgvIgHPhUE7Y+g
         0GRBTw3BU3/ri8EAbhaPSgUQD+Znxc4OU+KE2ESQ7lcocMlKidUkpBZtivtxwZRA0qvp
         lGlKCzV20RUicK4qEV8wPw6Nylo4c90QPuvat6d/wGMt+Cw0+ZQlP0TSHxU0NQGIN5us
         wJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782372928; x=1782977728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORF77YaUc0EKc98iyCcZrroMay4agDe0TGT8ZMQbFL0=;
        b=RRYOMPd8+Xj9nGjc3zoQOZmiRFhrja14VXmiwwU8UjUmggn1iBIa9H+VfdkO5sFY/4
         /6DAzbNA+VCoKP7XFe6b33qMnoyq7OkIIYaR2YzHFyIODl9pLONr4Wg8VZWn0O6oeKS5
         QA0JeMUK5mNlyhRv/3WKYvAtzkQHuKX1THVTWjakdZsr3Qs7SdE1BE/II+3b+xHVE7hc
         SkO72jYL4E3jWIVoKbujZqge2NbzIBM+DcTOkK9pDQqj9suFZ1gRWMoSc7syUM6GGMDM
         yBnvo1ybLzlK4fddOKOa2rvkUvzudZwxSCOzv8GsNdNJ9btxx4NBsFvGerOyTvzAk6l1
         jEBA==
X-Gm-Message-State: AOJu0YxlTDKenzB+RjZQgE1vRXheRiKUjsbRO4FlLH3ZuxgHuezE29vA
	oEr3uq061Qmj7mQ4OaBIbhfF6KvDabfbxx9XxnVgO+4l7TT4AZiqeX0nqwmuEv5aGkY0QETA86C
	KyB9HNTd/glfv1R9KnprMGuTl0GRRhnpsG1t0NYbjghWGoyIRQkPMjT/2IkA1oN7mAnXoF9zY
X-Gm-Gg: AfdE7cn+CbtIm2NPEXnySe3nAffu1btu7Cjp38UXmSce8Rp8lImrilcNz4I7isgtIFH
	POU+UffyVOOYrZT7BkVNFlcSlAqrAmmrSLSeyG8Ec/Ddhh+wEM0ZQBzT4cv6+Ft5RxgMBNaPZ4z
	71Cao28VJIWt2xBsq6o89BAdEujwN16Kzpvao/U7arkW5Jt7jsRd2QQM1tAihc4FryDb413NllT
	I8OmXZHdYjoFf2EyeVNm2K2/4tPJj9QHpr4GgNhOsyeXkmXCMRmjONxS92PvAECv2DiwckvQNuv
	5aCZBgYVCST7rhF4GLwhTWyq4pHhQ1xX+G1BVn0xlgRjs+xeqasaC6vYGqAm0YegEVeyPEUYrLz
	v1E+F7raxu8D8y6s7leHNIz960NgkY0YqSUyPoBVtwkSUjVaw5j/Xf1R6STdt2hhXcKlHLzLAaa
	4hb6Kpz8cXW+dljGbGUJREc8a7RQ==
X-Received: by 2002:a05:7301:5f14:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30c84d127d9mr1436671eec.6.1782372928046;
        Thu, 25 Jun 2026 00:35:28 -0700 (PDT)
X-Received: by 2002:a05:7301:5f14:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30c84d127d9mr1436621eec.6.1782372927249;
        Thu, 25 Jun 2026 00:35:27 -0700 (PDT)
Received: from hu-hbijlani-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca21fsm6027633eec.6.2026.06.25.00.35.25
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:35:26 -0700 (PDT)
From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
X-Google-Original-From: Harsh Kumar Bijlani <hbijlani@qti.qualcomm.com>
To: ath12k@lists.infradead.org
Subject: [PATCH ath-next] wifi: ath12k: Guard dp_peer dereference in ath12k_mac_peer_cleanup_all()
Date: Thu, 25 Jun 2026 13:05:17 +0530
Message-Id: <20260625073517.766582-1-hbijlani@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX7zBWYWkPo4WB
 DKTmcCxInLaOITlBLTiZvgEX0k2qbJ5wzD+UbINC4ib5g5LUcJaSOBa2xlhwYvScgkGiwoU/ICA
 ARy7yN0gysyVM2fKr0zBi6ugWjs5d2A=
X-Proofpoint-GUID: cdu3WeXVzdlif9vZibSAVCBAoz7doFwo
X-Proofpoint-ORIG-GUID: cdu3WeXVzdlif9vZibSAVCBAoz7doFwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX3T61xT2355ed
 ek9+OXaawMILbLqjoSzKZYVWHPO0Fj8nLZx0M0j+5uRvQvDvjJ1Vx0X7WZczKX5lHvO+kazaDfS
 DAdF9v5QdGX5jThIHIK4l/nxo8dvZJwit4yLKzQVxKmOebQSvjhTqUYDNYQR0LZBo1l2qvjpTc4
 XbVMDcLOFzSSjGmYJkNf7KNkBGirLp8aEQVT8n4fSgQQcPiI4k+2+bCww1imxxTDIotywDj95B5
 8aLW4a8lVqvahVqAE9cbSDS0jR5H1udRJcJAMkXxcisn/0hhIQrhVTJ7i7ufi6BZAeaLsrHS7Rv
 I42b6YF7M1PA6hVFeMb7viPeJ3Y2i0FYifQIwpDsOIn266TGxLTq5j9Jnu2KsdHQyWl28kLdhxM
 GfOcbT+xnqTZdiU2Zn6fPcB0Zw2DFWdfUj/agxg6VPr7o6Sjxxf4tcKnTq5Mo0HxVBR16pT1NFY
 tyzPMtTjbXz6bllNHvg==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3cda41 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pHrGrg7HEta1e1VtBTQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_003530_799169_D26C3D19 
X-CRM114-Status: GOOD (  16.27  )
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

From: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>

In ath12k_mac_peer_cleanup_all(), the code iterates over all
ath12k_dp_link_peer entries in the dp->peers list and performs
datapath peer cleanup. For each peer, it accesses peer->dp_peer
to clear the link_peers[] and dp_peers[] RCU pointers.

However, peer->dp_peer can legitimately be NULL. The
ath12k_dp_link_peer structure is allocated and added to dp->peers
during peer creation (ath12k_peer_create()), but the dp_peer
assignment happens later via ath12k_dp_link_peer_assign(), which
is called only when a valid dp_peer is found or created. If the
peer creation sequence is interrupted, for example, due to a
firmware crash, a race during interface teardown, or a failure
in the HTT peer-map event processing, then a link peer entry can
exist in dp->peers with dp_peer still NULL.

Accessing peer->dp_peer without a NULL check in this path leads
to a NULL pointer dereference kernel crash during the mac cleanup
path, which is invoked on radio stop or firmware recovery.

This is consistent with how the rest of the driver handles this
field: ath12k_dp_link_peer_unassign(), ath12k_dp_peer_cleanup(),
and several other paths all guard access to peer->dp_peer with
an explicit NULL check before dereferencing it.

Fix this by wrapping the dp_peer dereference block inside a
NULL check, mirroring the pattern already used in the same
function for the Rx TID cleanup:

    if (peer->sta && peer->dp_peer)
        ath12k_dp_rx_peer_tid_cleanup(ar, peer);

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Harsh Kumar Bijlani <harsh.bijlani@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af354bef5c0d..caf274ee064e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1237,10 +1237,12 @@ void ath12k_mac_peer_cleanup_all(struct ath12k *ar)
 
 		/* cleanup dp peer */
 		spin_lock_bh(&dp_hw->peer_lock);
-		dp_peer = peer->dp_peer;
-		peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
-		rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
-		rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		if (peer->dp_peer) {
+			dp_peer = peer->dp_peer;
+			peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
+			rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
+			rcu_assign_pointer(dp_hw->dp_peers[peerid_index], NULL);
+		}
 		spin_unlock_bh(&dp_hw->peer_lock);
 
 		ath12k_dp_link_peer_rhash_delete(dp, peer);

base-commit: 972c4dd19cb92e03d75b66c426cfade07582a1ba
-- 
2.34.1


