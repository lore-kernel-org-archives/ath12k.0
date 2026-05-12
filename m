Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4EACD37AC
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 04:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iIPH/EreHBhCKOQUYLGHDzjj9qbMcXYyayD8tZa/wA=; b=bnWwuQZHa2nTyaW5F6qQip2uvk
	IvvgJn+WnWa8kFpkS5o6tu6gY2Dx8yb47wNwt1SzOWQFwwxXOxf0Y7cymp842sWtwR8D6vZxnaFw4
	nBuIf1VEMdQbqlonItb30BJzlu5miKnODxHP2B2K6xe4fWLD+FnOcSW9v2btsfdPkuD1x2z+TUeyG
	LEfNzwh1knZemAfiZwkl3t2WE2PL83My4dUIW+L3/DwpXOS2qYy4w4c7AtnnDcJK10u3HYJHFTPI1
	Uyg3E1JaMEmbmAgO8IpN/leCW84u+UdrkjZe+kGvZr8/ecoEddmRqA+fjmq6Aoz9/Ibv5X2Ji/cze
	SOrtNj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3f-0000000FVjF-2Vxq;
	Tue, 12 May 2026 04:49:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3d-0000000FViB-0JnX
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 04:49:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6r0K3385188
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9iIPH/EreHB
	hCKOQUYLGHDzjj9qbMcXYyayD8tZa/wA=; b=mgwPL65a8kB4GOJeH5s+SOX4kmK
	PkvU6k2APw2WDBC+HnddZvCFYh/k2voALPpQ8oeNauhsT/vvXwNGzNKOJGCCyCAP
	l5l1G9beh4JgldjrqKJoRZF69Lsew4V0h/EEyfL8sZ3Pl4vq+uhjJl2faE3m3IlE
	ui9HfqImWEHp7skxC42fuLssSM7aqiiDVUdSGBnJcG9/SflsU5hxgrIJrD7WEi+j
	gqKrJt58nX41IWBJ37oGWjDjpVRNg+QYuHuOGUkPle2+RRW8YEKboPDwSN76FktQ
	XK4p0k3uMcIBVqlImk5nwxhxcrr9m3okTU7szIC4VQtQ0cMPMqiZJIXWUbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4hfmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so6844733eec.1
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778561364; x=1779166164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iIPH/EreHBhCKOQUYLGHDzjj9qbMcXYyayD8tZa/wA=;
        b=kWSJ/nYiaKiQeR25TnaUJMpC0JSoxbDavWUmpNwWnb/o1RY/i9COI1W2BzKpg9t6z2
         Art4aW5eYNSD1q96sBZygKNs3Dh+dZhW1l+BdSlL+d/9llZIf8LWFMt0Mj202XZfs1nt
         pk5KqkWTENCCLtMnT50tWP0CHdDs6Jr2eXcEx7vegwxo0GOq6ldUQ93tWy+Uky5GHck/
         4QhZayCtirSU9ytAfmo+7CxAYtmDspWABPnazDqE/dTSK+RTG4WNmz1uywK89v1bNEz7
         yVLAxxGHC4BaauhZVA0TRVrr5CG/XbFJzTo/em/I4o6ZLsQodWJ8AiPk1l68QcfTmvVm
         wB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778561364; x=1779166164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9iIPH/EreHBhCKOQUYLGHDzjj9qbMcXYyayD8tZa/wA=;
        b=pChedfg24CG3ZeZEulhi5rdYY8GJ4gfrrpYkskizRnTCUSagd3CCUXH4hD7McPC5Pn
         5ocb5X9EkXbfdDdFQZvldey6xwfuWgEGrVbzDbFEWoHuPBXlm1XovSIUPR0BtOyMtYiX
         Y4Ub8huLUe0lHms9TYg7eTWSR6vQlW0YGyL5gqBLgZbxeCNqix29LLwLYihKYuvfxL9d
         ohh1mE7ykuXSfh5VLAIzgnXlnifn8PEZBSscHUI9l88C1w+ZVXxtE60FDNlsfc8CtcxJ
         iPE9MOF1ic8O/qy+9HVXqiBrAmOVvcgJwYm26JTiUasgOEQz2nLxor9GvyJ+AiRGkqHj
         czug==
X-Gm-Message-State: AOJu0Yybu1dx5elNfQ4bSipakOwfLlAwH+lK2EQ3wlkBXeGjjue9I871
	PY2mSfJI1CL1BZK1lNqU2q7x4ucbndVJV4ynGu+maIqpEpyMcqnGopJWV6rpekol43H6amBLLSJ
	5qLcCQRKgjOic4I1mxJIDoauPQnkf9diyuoP+rs3Gjv5FuzuZ/TckVQ5NeTMZLiry
X-Gm-Gg: Acq92OHJBrhna10MAQskcZfEM5H4lNDEocnaR3NYRrxAa0g8FxWZue1RBKPpTBZp9WO
	ItUXZyulG/p4O7Ls2UdmLFq+YUXCs1w13Ncy2NS1TaDkckNDf/yOk8ODENfk7ZALdohP85JQ9pc
	tSJJb2oBP5/mojV8B+q7bkcGFeXVesmjXVt4hmwRCk5x09wsvHeOBC6i9SbwSqT327878AoE63t
	A3WkMGHLpNlMbSeh10wGFu1ShcvzUS6F4luzaVy6WuH/wEKeM7OD9GK4XeSjWvKWu72cSkExZ2s
	rzDA8+ZLdBucFXu9FtbK0s3z5iaD6j67AryBxYSi9/Zoi1ehU7Q6D0k5G7wNjz2K+yApThk6mKZ
	ZyprLtXfhDhRyt8NAsH0oiI+e0fXRQZwb6dPk4wLL8F3PdvTbiAVZw22nt1Kz6LxUiACz59uti1
	GypA==
X-Received: by 2002:a05:7300:fd0b:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-2fb4b82cd05mr5874958eec.2.1778561363331;
        Mon, 11 May 2026 21:49:23 -0700 (PDT)
X-Received: by 2002:a05:7300:fd0b:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-2fb4b82cd05mr5874946eec.2.1778561362692;
        Mon, 11 May 2026 21:49:22 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm16032926eec.11.2026.05.11.21.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:49:22 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 2/2] wifi: ath12k: fix NULL deref in change_sta_links for unready link
Date: Mon, 11 May 2026 21:49:05 -0700
Message-ID: <20260512044906.1735821-3-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
References: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02b154 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5nEK3cMyjPeeF0Mhq6kA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0MSBTYWx0ZWRfX/luFgFEUr+wB
 8Mp5tXYvvVNzN/XPmYLC/Mn8ZfNeni4ZN6ejAkm06Hgv3b9+IfHumeWPFgqcEJZiw6GT3jy3Z0c
 cTso0jSCIigPiHNmeNebgjpBl6kL4kAyIaFz2p1rN3zg1G19AG/vQGwsYMHv3LE8bMsMnq8B5i5
 il6iPvWyyjTb10BVR0v7vZaLtdVSHv+a2iVoGaXPlQ7Krw2RXBRg1LX7MmFCBgn3QPRtqKE0zdw
 ZMjYf3eYZ4y0r5ybGlteVnBgTPQ90ImHOyWA+AO5cmSLoMOjPpLxP43fcCnh//wGEAsnIy6+j2A
 9KD40Tgny2gvN8qmGJ7P9vFka9TaA24gc2l+cspftcpVC8v5xyvsziTmc7mVpKTpJzDL34xesT6
 Tszm5bbS+kcHHRjJTkZdwwXrsBsQqsYsGJyoWEc7Q7snXUWlwrqX8xLk2xo6YcseA3eTE+FZvW6
 Ot7agOuzMuG/bcAjL/w==
X-Proofpoint-ORIG-GUID: SvKrm733_8GMibj9h88K6iPYEfmAyOH6
X-Proofpoint-GUID: SvKrm733_8GMibj9h88K6iPYEfmAyOH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_214925_117974_CCF87D12 
X-CRM114-Status: GOOD (  14.13  )
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

_ieee80211_set_active_links() calls _ieee80211_link_use_channel() for
each newly-added link and WARN_ON_ONCE()s if it fails. The call uses
assign_on_failure=true, which allows mac80211 to continue despite
driver failures, but when a mac80211-level channel validation fails
(e.g., combinations check, DFS, or no available radio),
drv_assign_vif_chanctx() is never reached. Since ath12k_mac_vdev_create()
is only called from that path, arvif->is_created remains false and
arvif->ar remains NULL for the failed link.

The subsequent drv_change_sta_links() call reaches
ath12k_mac_op_change_sta_links(), which allocates an arsta and sets
ahsta->links_map |= BIT(link_id) for the broken link before checking
whether the link is ready. When the vdev was never created, only
station_add() is skipped, but the link remains in links_map.

Any subsequent operation iterating links_map and dereferencing arvif->ar
without a NULL check will crash. Two observed examples are NULL deref in
ath12k_mac_ml_station_remove() on disconnect and in ath12k_mac_op_set_key()
when wpa_supplicant installs PTK keys.

  BUG: Unable to handle kernel NULL pointer dereference at 0x00000000
  pc : ath12k_mac_station_post_remove+0x40/0xe8 [ath12k]
  Call trace:
   ath12k_mac_station_post_remove+0x40/0xe8 [ath12k]
   ath12k_mac_op_sta_state+0xb60/0x1720 [ath12k]
   drv_sta_state+0x100/0xbd8 [mac80211]
   __sta_info_destroy_part2+0x148/0x178 [mac80211]
   ieee80211_set_disassoc+0x500/0x678 [mac80211]

  BUG: Unable to handle kernel NULL pointer dereference at 0x00000000
  pc : ath12k_mac_op_set_key+0x1f8/0x2c0 [ath12k]
  Call trace:
   ath12k_mac_op_set_key+0x1f8/0x2c0 [ath12k]
   drv_set_key+0x70/0x100 [mac80211]
   ieee80211_key_enable_hw_accel+0x78/0x260 [mac80211]
   ieee80211_add_key+0x16c/0x2ac [mac80211]
   nl80211_new_key+0x138/0x280 [cfg80211]

Fix this by checking arvif->is_created before calling
ath12k_mac_alloc_assign_link_sta(). This prevents the broken link from
entering links_map, so all subsequent operations iterating the bitmap
are protected. The reliability of arvif->is_created across all error
paths is ensured by the preceding patch.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: a27fa6148dac ("wifi: ath12k: support change_sta_links() mac80211 op")
Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8f8456509468..529a693fdd28 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8045,16 +8045,16 @@ int ath12k_mac_op_change_sta_links(struct ieee80211_hw *hw,
 			continue;
 
 		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		arsta = ath12k_mac_alloc_assign_link_sta(ah, ahsta, ahvif, link_id);
+		if (!arvif || !arvif->is_created)
+			continue;
 
-		if (!arvif || !arsta) {
+		arsta = ath12k_mac_alloc_assign_link_sta(ah, ahsta, ahvif, link_id);
+		if (!arsta) {
 			ath12k_hw_warn(ah, "Failed to alloc/assign link sta");
 			continue;
 		}
 
 		ar = arvif->ar;
-		if (!ar)
-			continue;
 
 		ret = ath12k_mac_station_add(ar, arvif, arsta);
 		if (ret) {
-- 
2.34.1


