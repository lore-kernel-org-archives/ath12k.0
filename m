Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D4F606A326
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aaIMFKV4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O97OMIgd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEfl/JKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=30hNboA5vDWIzu7p4g9YsHRcZFHxLVMIekJQJ/Su1pQ=; b=aaIMFKV4OHVMis
	GHX1iegOqx3ZI9pdxyAYGj0gNgRfpaMJ+Z4tMS0R/U64p3jSp8H5CTmv9VtREnepNG0fSbTjnxQPl
	EzHt9l9DT1RtNNyfXaM3RmcrlfSsliP+eqeYV4E04JJQ0bLMT5F2jnNpE8oWM49lnEymwu1YutHp7
	X0hECSTnNq7ZtsDKGLei90nRsOTvXxyE/nMTGC2bFLppeGrFz+d4iMZTs85REgjOw7RJcDlEHT3uf
	no8+mBUa7Lzj0jOxCA49tMQ8Yqc+yHcKLOpIykLW4DalW/RJLQU641TFR2UDkSiP3cxqLkIOvG08X
	YQPsdG8FU+KZxOFENyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhI-0000000FfBa-40fa;
	Mon, 02 Nov 2026 06:39:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhF-0000000Ff4F-1Qos
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:39:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vM2G3324761
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30hNboA5vDWIzu7p4g9YsHRcZFHxLVMIekJQJ/Su1pQ=; b=O97OMIgdPBa+m19F
	0QtkAnEULWr+LliALsMxliGg5PAXzfIMpNjXFNi/C0LtFqSDloM1SUZjIEeyJOq3
	FHVYUFGlbLESB3243P0hxl/lOlC8nfQseY/XYyWtPbtQsMpunSNwydYTINVQUZb5
	5FlIP5zLZbPAPqgpfHMNZgRmkK2glYs9U1bDw14nzUlwQNI8EJ57Aqd06kOABllz
	7i05WDoY1jnCJuUC1d1hU+BdQehzyXd5jk02zeBtLIb4GqQRdtQKdSNo6APrV7We
	tDSh9/nV5PBDIITZPxvSgy6HO7zFXaV3jLe2Iw7oCb7aSJeZt7JBXmCj61XGDKcG
	54LA2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nmvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:39:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2139314a91.3
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601547; x=1794206347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30hNboA5vDWIzu7p4g9YsHRcZFHxLVMIekJQJ/Su1pQ=;
        b=UEfl/JKoU9kCcuc3FkeAL8ZSAA0hdWFOYx1wo6i5gcw+nLKI3fLPnLu+datnUZHrDF
         m4Q6Q2k7ii//kdYMPwRF3WUBN3vugYbk5/EB3t2R6FMlQhxc8mpme2s6So0+VX+nnkp8
         nr7j9/gy3GWcsxzPE6lrpQIT6qWhXvNWQP7tTC3mCLgo+PGPmJj/kwJk8mco6WQ0F+Ku
         9yUHmLPh6NiDYU1UbQZQRpugoTx4dwLmTIF30tiLUhEpo2MV8mS8s12n1aYclmgCS9Bi
         1fKPynf561kMp7ytf6OCFnNaXQYv8wAIIEYlFChehbDn6b5QYxL+3zt4XRFrc4PwvVIC
         EVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601547; x=1794206347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30hNboA5vDWIzu7p4g9YsHRcZFHxLVMIekJQJ/Su1pQ=;
        b=PE6eFrnnQGgBWocfRAB48iGxXZH7Y+F08vAmKaTSnDwlFHXtcUvcUN6FDww4/e3TSh
         epMFS6FJHgYFTc4qQfoBCoVLOIgOXmZeTyi0UgbfjdAbIajC92ZGpBDxU1wb0hS3nKof
         vRtIQNmYRl4ctl+aMZ+UzwtQImon2nX6zs46MfEHGpFNy8RmlNuRgrubiDufE0OdqML1
         vzWa1+gAn91ulNTKjY1Nywh+CmXu8GJYQ73P2i7fQfrg4xDGgVfBjS/ylyce8TeoWTFC
         ip1Rcup6meadFBXFCwK4REqX+ieIfjq+9T69pWkzs6Bzvykv7yI/Ti7vnhtesgoGPNv9
         alHg==
X-Forwarded-Encrypted: i=1; AKwUvBwEiWhcIV+jK2DMj/zH5gHKSsIx7hcDyt8e+T2peyFs4QAaW3JvZLejva2xdbIYxPBg3agt1MI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9DCQDL8aeTOMJZKmgyZAu5O/17J25IQWHkLevOtvwPr782d0A4
	nHpIboF0mnoqxaU61fE44NgWsNpVh4xU6PFG+EaANuhQdvlkODJFI87Q3puz0PwYvtBw+Ivc90X
	26Mbcv3dN7MNhyLEQ5y6zLHOGFlsTyiGUF3UZvjLI0lzTRLxPRjQpBBzY+FBSpXD/
X-Gm-Gg: AYBFou3Rqfg43/tPMgiJLJmeZoZdbSRdUQfgK8wKoCOrWusbLnZhlDhxcWHcDXpzc3U
	rNDWkJFRST5W77rYn8SuBj+XKOwikdXHRaew4Bsj10SOYalDMWM9TGQeEAcuabdxWGT01Bsrveh
	vktUqu+yo8L4iTBSCc5EW4ybTi3Je7S/NEF2+vsfbA0yVLxRk3F8b+kQK1XMAihr+Se0KsOj95R
	GIUhjCwVvfZPF8NNHf3MMNNQeuAErGcLhc0zpASdWAg31YhP4RLwX4Zn+ZTrjMpZaZ9nDB1NLKR
	if5rzEMbbrqa4oRSsTT7HNUxxFCSoII6QLBphc0EqhCk8uaMFzgZRm5bd18OtukdGmeQKe/DZ26
	PkSKCBV6WarlKtW4kaVon8o2lAKPJijlNswlgPpnGrVdW6h5wR4/vkPp8047NosUxrDuzTtRxnE
	bAyzhPIc1ZS091HmEXM6kZ526jBuuB
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr9184032a91.10.1793601547003;
        Sun, 01 Nov 2026 22:39:07 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr9184014a91.10.1793601546412;
        Sun, 01 Nov 2026 22:39:06 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:39:06 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:20 +0800
Subject: [PATCH ath-next v4 11/11] wifi: ath12k: use link_id_map to resolve
 RX link id for all devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-11-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: nHxVqdAGIox2KTKCnp-ycveVLcdLc4T3
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae8300c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KXmYhDJzFV-ZoC0c644A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nHxVqdAGIox2KTKCnp-ycveVLcdLc4T3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX7fazDGplA+1v
 TMVXI05iarbp1rqHQLBZZ23UZ7BY4YIBfO38WAjPxRR+rQ6Gb9m1UzhFQv6wQziA7KXNsDnHybR
 WSRAUUBmVebKXyxrQJ4jQkewhdrQSaY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX/OoAvsRf21BM
 hu+QpPX7myiVkTOJIp3uqO+CoyMBuzSdD5giEReJOv57F+XzKdmUZXiYBEzwcqjOmLljmXczIXh
 NNIje+yGx1jusQ84cmHuYpn3+DjDEsnkuH6W0INjvULqryiVpXfnaIStHC6NyeUzsDnSPoq2TzT
 VngCEqb1gxeGYX5S+TBGL5AtKMSYx/HucMe1hM5TnJ+S8yk9kX1+My0YFgnIlHFS9TJMGEx+TfU
 46y8iNbmPktl3rviCbzGDx9hxz9vNFY73iuSVCYjY72vAmrVjNK/72GvIrw5DkoHAEthRgTRmdw
 NTKuUuHodpep5c5wOwenxzLcbYmyWnMwDPbcweBu3g3NYDP36svPo3OX7Bbw4A4tTUEMpxrSUNu
 vxbim8D7Rkx++Wj4LV96WGbG18apBYRj9NDLBUD/u0xELlmkp1H2baUsm0aW45/GngveUvl2TIm
 9uo24cU7BiiNytgCUaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223909_521503_A28FF598 
X-CRM114-Status: GOOD (  18.43  )
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
index ee3cdd7ca460..ff88c694e1e3 100644
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
index 106d858efc44..3a7d1959f19f 100644
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
@@ -255,9 +251,6 @@ struct ath12k_hw_ops {
 	bool (*dp_srng_is_tx_comp_ring)(int ring_num);
 	bool (*is_frame_link_agnostic)(struct ath12k_link_vif *arvif,
 				       struct ieee80211_mgmt *mgmt);
-	int (*get_rx_link_id)(struct ath12k_dp_peer *dp_peer,
-			      struct ath12k_skb_rxcb *rxcb,
-			      struct ieee80211_rx_status *status);
 };
 
 static inline
@@ -288,17 +281,6 @@ static inline int ath12k_hw_mac_id_to_srng_id(const struct ath12k_hw_params *hw,
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
index 01c048046290..4ac31cb9a5dc 100644
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
index b073282e5525..080ead233106 100644
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


