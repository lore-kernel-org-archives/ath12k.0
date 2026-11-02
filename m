Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F949606A32E
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xfsBnFzl;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nhn4QyER;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZIPSCXP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XipYPlgLEWzVCTMCmQlUGdyQWvwcpjxbalStCmOPiu4=; b=xfsBnFzlYU/2bX
	FzUbFTebamber3hV/Jveh07Se+t19owywz8AW8R7aDZZvmLGcLTE4mgau508kjZo1Mvnyye5q3AXS
	vuHwJ6eRlKXhNd4paC5YxdYYrdFvfATAI5Z4fG3IUOJ1WANj8t1uz5T1nZkgY40RzpWclrmPa+E+e
	7mJmDxpsWsTaeET/t3mNEoZ6zC81/qrm6brX37KaLXK9LFXeobA7rVexKMTrgqtmqCWPOvMSExrzw
	MncJxUGTE+mpiRW/W3PWZusz3HJ8cpDL4y5nlltxoMe96mXPP/Kr9OSnj3M0Trex+IHg/jXyrWXlI
	ZJq8E10/o7pzZ0a06E1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlhE-0000000Ff3E-0b4t;
	Mon, 02 Nov 2026 06:39:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh9-0000000Few2-38k6
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:39:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v1JP2752042
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XipYPlgLEWzVCTMCmQlUGdyQWvwcpjxbalStCmOPiu4=; b=Nhn4QyERbz5Kg11S
	BVsk3zlVQQzWyBr1xDITgVwR+bnW9CCykcSRuwoDE8jn7gYuo9EMJnpqOnnqhSPp
	/KvCSfEuvMjJrYnCDbQtwnwqiwW79FXYEqh/Dk9FoGq6glt6s80A9nSneppSrUQh
	bEvTHh+wg6YjcddgdIdBODhBjjbWzMhaLTmm2+r0SLZ17C4iyLh2fFjV7eihmy2r
	v/gmcC92KL5trNvKzQ4YCxX1OD/JhOxyJErvY8FYMF6w4PZp/ol3AyiOviXhlivx
	NhTWnxmHZey94TmgrYZejiVPhN+ME0Gt3TEKUnX3aQ9G5ELARM/BvAiACXf9ZhBp
	dJYTqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg200yjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:39:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3752962a91.3
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601542; x=1794206342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XipYPlgLEWzVCTMCmQlUGdyQWvwcpjxbalStCmOPiu4=;
        b=TZIPSCXPT2okgM/Kx/VO66Vd919nxsMPQF2qcWfT5PqEOJAsP3hhp17R1ZxaY/jo8C
         ZovR2rOyKYW6PiBM7zwvQ/L5EcBXcTVR1RN1PTm1Z1oOqI3gT8Fq3uLbbXHxO7FEMYi2
         gPAB66l5tLWD8LKtTPOxGkJ5/vb3YBAD7O24YWaRTJgtcE0o5TIQipaLMSdRwsH2Npyo
         iyKufw/jQG/iEEYMJv/15Clmc0qUsL1ckkIWWSJyvIyocuaW3qwr4hfj9xIp8zuSFEXR
         ATK0XKFTvq4gsNxhuWedxITIY5qpQKO52t7N8H7RRZGAiBm1GlPX6pvQ2byNbHLVczm0
         Q2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601542; x=1794206342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XipYPlgLEWzVCTMCmQlUGdyQWvwcpjxbalStCmOPiu4=;
        b=uMo5m8BBNpl+0QOaVvm0JgMZllv5bVs5gWwqlmLkKAS1UyUsR13Q01LPSh3KGDwf5v
         Pa8FbalfNXZNUE24IZAoE6A2B0jROqCqVd53vdjmhBvtIGH2nnNVRW8n0ZNgQRFesI+s
         cm5lELdlZd0B3eUQteRtx6grW8PRIPXM3YsbPCFWm4Pklndk32eHgIoO412uvmQL/cff
         xxd51EWG6IN36f1IABz8GEAXpFHOtn6oA2kRNLZQB9uNS0u7rCQFYpaI9sH/oVLnmQRp
         L/H8/VdE1XsAUIoujj2h256UuWumIjDSE3PkJ+mr2sSs6jhq5EU/ZxXOmOMvAQ61vgV9
         Yr9w==
X-Forwarded-Encrypted: i=1; AKwUvBwmPs9xMURA0RRg5dHqOagLp5m4QjTQcjVoYCiGhzdeUX5Qjmab1+vVK+RAGJfFpS1VO0rol1Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z+1mA8hvbnz43bPCQCq29eh3iZY1o58wGu3FYQPgp2xHuyoMGbA
	q8UuERRMMi5kxaRyEflKIL9ZqOsloKOsU5ZeAX1YG1QKCDYai2XvFZiigO6PLQhQI+Xi6/dU8Ax
	e6rKvzhibfJFI07dhEkWsL7wgWsDnfEJLhbH5DwGFUIjy2vSeuy3pD6KyKXyetxAN
X-Gm-Gg: AYBFou0BFqfSo527gvRbb+BS+qqbdPPkMOTvcvrmy8zoTgN+iKJROul/GZH/6pnGfIw
	v0P7RPNIlwQXpFxkWGc+g0y461sb9gSKKKc8EvR5vC49Vj9afl5cKqivmOcoGWlprILqVfzP4QJ
	XgY7KP6+9qhBMlXYOO73IooWUULISVpevhGh7Oz2KbHkaJzwjzdYPkC89GEDG2jb4D3OZB6nGKJ
	746Q5QAf7l10KLiwbSWs47pyMaGw3vfCFoe+W0XBaztm5+T0VWPTV2Jqutt4na8lrVHJzG23Wxs
	yvLQGlfvSWLiza9ZY5TRKjQOk455v7deHz2nHqvHliW8kX50gevyMLDNqtbVS9Jl4fOqnIEq6gg
	WjqhbH6NPON+K3LFVbnif5KHiRHSuwN4kLU7dQhIvv9DUo+QzcybW5TCm0N/V7f6CC2IRoqGKPA
	oBJGNuoP3yi0vDLodnC7dRRnREyys4
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr6953231a91.8.1793601541438;
        Sun, 01 Nov 2026 22:39:01 -0800 (PST)
X-Received: by 2002:a17:90b:268d:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ae895a5bdemr6953220a91.8.1793601540889;
        Sun, 01 Nov 2026 22:39:00 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:39:00 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:17 +0800
Subject: [PATCH ath-next v4 08/11] wifi: ath12k: allocate logical link id
 on host when firmware does not report it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-8-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: cTHvmt8sZvHgKFTa1igW-GkDwi_4lwme
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83006 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2FDiJZU-w7-vk6pY0YkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cTHvmt8sZvHgKFTa1igW-GkDwi_4lwme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX5llfYi8U94Rj
 aBtPVaCjWRnKkZcofUWuRflowN5pc2Yo18xTw2/wFnRTDHJ4HGymCoqdqUBi/QUq0lebDzHGR2d
 52TdY/iQKkSa06cjpPHPeQbqKcB2NWdndtuZSRfg/RITjaQ2bxuVGnA1sNt3xaIhCVoKNcQUjUO
 ubSK5gjIX6BEd3Hh/qs1/QFGfB1HzeM+YFFVP9jqkZZo+cLyVlTNCD+6H+WroRfnzwtrN0sbXeJ
 /Ya3g5qVh8TFx1RsW7JCYaj4d8hcsSDmSCAVBMQ0BB2M9vofe+rW64yeePUIQFgxVHEAt7C3rYO
 yJv6BfEMVFXKnffnjCqj+AuILJUCnR2NgA9q48CaK1xnSq/4iRiB7l/6ObDxNupKMeN9bWUVP+3
 WJjMbuBaOKS7V4vmOA1wcCEPtvi2lgksAqxukDm+YfSkBlu7+fLDMU8FX4JKpPn37Ch06T7C+CG
 X1eGo+hBU/dFYeNXRyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXzliRfUD7RE29
 DpLbzZO4kBNCnqCQoD5jsdXU1FD5EbVwnEt2+Nukw/DphhqVYx5yYqkCu1697xxdskyW8l0dtm9
 0kGq7pnHTImCpVFh1Cd4QeQHZYTylWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223903_948573_7EBA16D6 
X-CRM114-Status: GOOD (  24.91  )
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

For devices that do not support hw_link_id (WCN7850/QCC2072), the driver
link id used to index ath12k_dp_peer::link_id_map is the logical link id.
When the firmware advertises WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT it
reports this id in the PEER_EXTENDED HTT event, and the host waits for
that event to fill link_id_map.

However some old firmwares don't advertise it, and no such event is sent.
In that case allocate the logical link id on the host, mirroring the
firmware scheme: pick the lowest free slot from a per peer bitmap
(ath12k_dp_peer::free_slot_map) at peer assoc, after the peer assoc
command has been sent. This matches the firmware, which allocates the id
while handling the peer assoc command.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_cmn.h  |  3 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 49 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h |  8 +++++
 drivers/net/wireless/ath/ath12k/mac.c     | 52 ++++++++++++++++++++++++++-----
 4 files changed, 104 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index e17f044ff812..88abe90767eb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -9,6 +9,7 @@
 #include "cmn_defs.h"
 
 struct ath12k_hw_group;
+struct ath12k_dp_link_peer;
 
 /*
  * ML Peer IDs start from 8192, assuming max SLO clients count 1536,
@@ -97,6 +98,8 @@ void ath12k_dp_cmn_hw_group_assign(struct ath12k_dp *dp,
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id);
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer);
 void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 				  u8 vdev_id, u8 *addr, u32 hw_link_id);
 void
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 1e84b9b817f3..ee3cdd7ca460 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -513,6 +513,7 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
 	dp_peer->ucast_ra_only = params->ucast_ra_only;
+	dp_peer->free_slot_map = U16_MAX;
 
 	spin_lock_bh(&dp_hw->peer_lock);
 
@@ -562,6 +563,49 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	kfree(dp_peer);
 }
 
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+	u8 slot;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return 0;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return 0;
+
+	slot = __ffs(dp_peer->free_slot_map);
+	if (slot >= ARRAY_SIZE(dp_peer->link_id_map))
+		return -ENOSPC;
+
+	dp_peer->free_slot_map &= ~BIT(slot);
+	peer->drv_link_id = slot;
+	dp_peer->link_id_map[slot] = peer->link_id;
+
+	return 0;
+}
+
+static void ath12k_dp_peer_free_logical_link_id(struct ath12k_dp *dp,
+						struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return;
+
+	dp_peer->free_slot_map |= BIT(peer->drv_link_id);
+}
+
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id)
@@ -603,7 +647,8 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	/*
 	 * Only devices that use hw_link_id can map it to the IEEE80211
 	 * link id here. Devices that do not support hw_link_id fill
-	 * link_id_map later from the PEER_EXTENDED HTT event.
+	 * link_id_map later, either from the PEER_EXTENDED HTT event or
+	 * from the logical link id allocated at peer assoc.
 	 */
 	if (dp->hw_params->support_hw_link_id) {
 		peer->drv_link_id = hw_link_id;
@@ -678,6 +723,8 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	dp_peer = peer->dp_peer;
 	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
+	ath12k_dp_peer_free_logical_link_id(dp, peer);
+
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index ea36947d1707..c2d060de88ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -145,6 +145,14 @@ struct ath12k_dp_peer {
 	 * WCN7850/QCC2072.
 	 */
 	u8 link_id_map[ATH12K_GROUP_MAX_RADIO];
+	/*
+	 * Tracks which link_id_map slots are free for devices that do not
+	 * support hw_link_id and do not report per-link stats. A set bit
+	 * means the slot is free. Mirrors the firmware logical link id
+	 * allocation: the lowest free slot is assigned at peer assoc and
+	 * released when the link peer is removed.
+	 */
+	u16 free_slot_map;
 
 	u16 sec_type_grp;
 	u16 sec_type;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1e539388c003..01c048046290 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3881,14 +3881,52 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	}
 
 	if (!ar->ab->hw_params->support_hw_link_id &&
-	    test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
-		     ar->ab->wmi_ab.svc_map) &&
 	    peer_arg->ml.enabled &&
-	    peer_arg->is_assoc &&
-	    !wait_for_completion_timeout(&ar->peer_ext_event_done, 1 * HZ)) {
-		ath12k_warn(ar->ab, "failed to get peer extended event for %pM vdev %u\n",
-			    peer_arg->peer_mac, peer_arg->vdev_id);
-		return -ETIMEDOUT;
+	    peer_arg->is_assoc) {
+		const u8 *addr = peer_arg->peer_mac;
+		u32 vdev_id = peer_arg->vdev_id;
+
+		if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+			     ar->ab->wmi_ab.svc_map)) {
+			/*
+			 * The firmware reports the logical link id of this peer
+			 * in the PEER_EXTENDED event, which fills link_id_map.
+			 * Wait for it before returning.
+			 */
+			if (!wait_for_completion_timeout(&ar->peer_ext_event_done,
+							 1 * HZ)) {
+				ath12k_warn(ar->ab,
+					    "failed to get peer extended event for %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ETIMEDOUT;
+			}
+		} else {
+			/*
+			 * The firmware does not report the logical link id, so
+			 * allocate it on the host by mirroring the firmware
+			 * scheme: assign the lowest free slot.
+			 */
+			struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
+			struct ath12k_dp_link_peer *peer;
+
+			guard(spinlock_bh)(&dp->dp_lock);
+
+			peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id,
+									 addr);
+			if (!peer) {
+				ath12k_warn(ar->ab, "failed to find dp_link_peer with mac %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ENOENT;
+			}
+
+			ret = ath12k_dp_peer_alloc_logical_link_id(dp, peer);
+			if (ret) {
+				ath12k_warn(ar->ab,
+					    "failed to allocate logical link id for %pM: %d\n",
+					    addr, ret);
+				return ret;
+			}
+		}
 	}
 
 	/*

-- 
2.25.1


