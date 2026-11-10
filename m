Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A8606A332
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p+zC9SLk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg3Ozsn4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjcDg5ky
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=; b=p+zC9SLkB2cHcz
	SxnFxK2R0htOjr8fYTfnzjgH/MeMRGagAoEVHUnYkCGTbbfOQfghH8E46TIO+YOl/h737vQJ2SIs+
	7TVR0XOcTbGi/n5UAdMal/EfGS4smtIZ+z693ACoGDmi06BBafb218TCALxl9TokuP3uxuSFJQ2q+
	8YnvnwvDOrBX24cO5D90Gy732sKArJ5OmPdgOVACi7Oo+Dz2xfKzJ2CVjNWzKkdySs6I9qf6Lz2tg
	sM6bPqLwLkEUIIINBfq8u0W0cJKjxeunJD533uAQIs93eSvuIjxOSy1sw5hjAK/IiL4pFUG2YyKc6
	bZfpBeOWlx5PCFSObVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXB-00000002fmB-2FqO;
	Tue, 10 Nov 2026 06:40:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfX8-00000002fj3-30sT
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA54vvh2414651
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=; b=mg3Ozsn4R3ha6X4E
	8vnmZSIqLTNp2Bd50OkjRI2WgLdUOfwDLt6fD5B817tLvOG6RGdnG6AQj+JKEHza
	YrAmgcyzZkdm1xRcEj5CJqkznZ7cwrFancBy3NwFhhvQcV1s3aGMma3DYZpO3xEm
	RWi4Her0MV0bjgNFrsn1cc4pahF3JUmxaRAxjWJcGJuwenWbBgvyA5Z4kP9EvkCe
	LLzWiLdPg4jJtZJQwdTm9AzwUVdI9ztio/6v7NkJhXlUMQmAeAOwwR7V5pTv7Dpo
	X0Hu0I64slVahXoTz2Xne0NaPxsxmUaOLneLWmywT+/X3OpwVL8nw7+kYSDv9EAg
	Rb/bdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8car-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1449125a91.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292841; x=1794897641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=;
        b=HjcDg5kyxPmrNWhRlV9CQhefzWFDX9LtGSX3x2u0GB0ctCJQwNNbfGkSYnHygjyKY5
         g4fzunhFgSyMwM/nvqIyZN9jJUu+HJ2GGUkE+hIQ4H6VFTnf3SIBy0WFCoMn6Ek9D2RH
         lFLGbwRMOMw7QP8AroNEfAZuiZRG/xsyh/C3GO/SYFHlI7jLvahecqM04YlLqaQkA+U7
         9XJNfOa+gSeTBug0WdfheBmc69+EWxhit5CrM4PfZj5vmsUaer+XP6W+RRnkiZkMB8f/
         nJYpyoLOj7q/bYWgIAup++Zh5uxofqsD38wR5N6a3v6swYSO9XFVj4Do33QrbqQY/2t2
         x+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292841; x=1794897641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GysLaXHwtS7qcNSbmMR9hG7CzdMJUmd3P2p/iqOMPYs=;
        b=eCr13dPOP6Ra/QCrwcz1Wd7g/BQhcYjGHyB4aiao7XcYbZLYyuOOq8/plXRT8frjGV
         uHuFLWWsQRxoru0mYgSr4Fe4qu/dOL81aE/brZU4zkaBVVULnwUNHM5vUkkrEQYWu3vj
         zwoe207welTPZf1GUxeEpl1VlrhnlxT8l63pQaKSMwf4YXURUFnFx0JjfTRwHFA54uRC
         RR4eqnaM0JaSNCHCHmcSR2YAR1nu+HmTX/j3Dld69D1bTUX/p2t0zTp+2mp5OS1qk9EN
         8CkblNfuSJynxtmBQ7p6Cdn679UjqVWpNOvnxzl1PzUeMVaI6xaubQPaxd8Bv20TGjfM
         o7zg==
X-Forwarded-Encrypted: i=1; AL+hErGXpP8gQkY7KpUR83Ld1eoyUXMZeJmXEtA3EArm2SR3BuvYA3JhA9xLGqU9jEYmpoLG+qRlrLE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9m0GtfWnBts5gknDqm7B3egzHsGB4mzTZJ4bL+a8yvNP7OPF8k
	uJ5uV8Yp2k8/PJtMwe3h+SQad9kxkklWjMUDrkoR31ueyLZW+qt0Z5Qu5WkU3KP78GBQXo5R6An
	owv+BxOi1SJ+g38kTOTwk1f8lc7/bcWyCRvQGJAyAM4wbg9NrpzCnOTz3TYg4uyOL
X-Gm-Gg: AYBFou39JSjpG+iHHSPET07rT05eegaCViMkhCjHW2yLVbcRFcFCjxw+45kFS9En4Tl
	uZWDgwRSYxWGe1sW/sKSCndM8eNfxsQtGK8zR0dfD6dzOAHSYCWaqSOfBSFlOKjcnRqCeDmPxJu
	qKsFnmWP7DRXB1I/eqYgLTbOxhWJRze/HnHSNNPHp03dVAkSxuq9BW0oW38cip9RqUaBg3h6a8w
	B4o6szynS3uwmK2QBPH26dUYBOyNQV+ESEvn5O7hDE55kT7LnuZAmhkEtUF72JUcUT6iK6jLwMc
	+uFEpsRpQ05CLS6NI8baeZB3OgSpXoByMIUUh7kenoKk3kgTQfj3cqc12TQYFmf6MHiwcvSZsF1
	P3u+ftFm8ZxM45c/yvoiFc2oBk3g2gMb9IrCpVy+CxLdUozjLCkb09nSXOb5gyhRxqq9dkMT5UL
	C2OcpwFomeO+3BRMpPeDGc/bvGnIBs9A==
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr1651004a91.11.1794292840570;
        Mon, 09 Nov 2026 22:40:40 -0800 (PST)
X-Received: by 2002:a17:90b:3c46:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b166c93350mr1650998a91.11.1794292840101;
        Mon, 09 Nov 2026 22:40:40 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:39 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:23 +0800
Subject: [PATCH ath-next v5 02/11] wifi: ath12k: skip hw link id match for
 devices without hw link id support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-2-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: j7i9fSwjkCp6aiWruHqklHkWp1hfUrL-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+yr0crZ+44dS
 7JCj4vqiH1gYMMcl6mgwN4i+0HLH1NGXQ3ERdsDO+Z7MpjyP1fk6Is5+LHMvf9oMV3+p+vzpv/g
 6KOgXBDpuhTFC/sru/yHj2hJtjAkGOA=
X-Proofpoint-ORIG-GUID: j7i9fSwjkCp6aiWruHqklHkWp1hfUrL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX+FA4d+dHKUwV
 dNzx4F5RTuLNMaWC20S+URNZKOqdj6IaaVwbdydLeS1GKtF+Kgog7wpyi/sy2eUPrsNjUfgmfoO
 6kmx/BdLQoj7KCammuf55tbYESMpY0zQi6MdwolTpDxtDuRUnoDUJX1b4GibNWaT92FDCcTdqtd
 aD5cd+3J/oEwn2YtvjqEZbr7gPs0weYMkaK4fczAUDkAeXKg0pP/wsFYVLVMMAmTxipxiMvhFXA
 c5GWE1+A8KmusWOTrS9vVln/NaGA5bTSWUZzVjTE3sIvZ88D3iJasjGGId9qEnED0hc7tzplert
 G+s6cI10eeR5UOmIdk/B8CZqrNffHefb+oIaiSMNHayU+YX6QdZT6cxXRhPm+d9SuNYiIffOfMU
 jhB0MkrnQEmtN14vd7AVhJ0gQ1bOl2opQOVjsjOySXAZUgyflET4qJtVZxt919G5FccoBeWj7cu
 4/8c1ZphFPMSOUmRkSg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2bc69 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=71Z9w-pHtoC7iivNk9kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224042_879021_0A779B8B 
X-CRM114-Status: GOOD (  21.13  )
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

ath12k_dp_link_peer_assign()/unassign() maintain an address-keyed
rhashtable of link peers. To handle the split PHY and roaming scenario,
where two pdevs share the same rhashtable and an address may still be
present under a different hw link, both functions compare the stored
hw_link_id against the one being assigned to decide whether the existing
entry belongs to this link before adding or removing it.

hw_link_id is only used by QCN9274, IPQ5332 and IPQ5424, QCN6432; WCN7850
and QCC2072 do not use it and rely on the logical link id instead. Also
such devices are single pdev and never hit the split PHY/roaming case, so
the disambiguation is unnecessary; keeping it would also break the logical
link id support added in subsequent patches.

Add a support_hw_link_id hardware parameter and, for devices that do not
support hw_link_id, add or remove the rhashtable entry directly. Devices
supporting hw_link_id are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c  | 48 +++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 14 +++++++++
 3 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 100b398cf868..102e67109ab0 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -557,25 +557,29 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/*
-	 * In case of Split PHY and roaming scenario, pdev idx
-	 * might differ but both the pdev will share same rhash
-	 * table. In that case update the rhash table if link_peer is
-	 * already present
-	 */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id != hw_link_id)
-		ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
-
-	ret = ath12k_dp_link_peer_rhash_add(dp, peer);
-	if (ret) {
+	if (dp->hw_params->support_hw_link_id) {
 		/*
-		 * If new entry addition failed, add back old entry
-		 * If old entry addition also fails, then nothing
-		 * can be done, simply proceed
+		 * In case of Split PHY and roaming scenario, pdev idx
+		 * might differ but both the pdev will share same rhash
+		 * table. In that case update the rhash table if link_peer is
+		 * already present
 		 */
-		if (temp_peer)
-			ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
+
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
+		if (ret) {
+			/*
+			 * If new entry addition failed, add back old entry
+			 * If old entry addition also fails, then nothing
+			 * can be done, simply proceed
+			 */
+			if (temp_peer)
+				ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		}
+	} else {
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
 	}
 
 	spin_unlock_bh(&dp->dp_lock);
@@ -621,10 +625,14 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/* To handle roaming and split phy scenario */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+	if (dp->hw_params->support_hw_link_id) {
+		/* To handle roaming and split phy scenario */
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, peer);
+	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
+	}
 
 	spin_unlock_bh(&dp->dp_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index fb807d5a6ae4..41dca4cc6d4f 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -246,6 +246,8 @@ struct ath12k_hw_params {
 	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
 	 */
 	bool hybrid_bus_type;
+
+	bool support_hw_link_id;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 67c6fa79f859..76f40073e002 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -499,6 +499,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -596,6 +598,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -689,6 +693,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -776,6 +782,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -874,6 +882,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -964,6 +974,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1051,6 +1063,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 		.hybrid_bus_type = true,
+
+		.support_hw_link_id = true,
 	},
 };
 

-- 
2.25.1


