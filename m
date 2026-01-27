Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CD6D25932
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 03:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lr2+tNxH4fOHIvQOeYoJgdvCBLvY2/PQOfoBT4idddo=; b=q/TIQ8NnF5qancFli6+xJTRkLY
	Y3QyJpKCFS84miuNL8bOEHArtf2sQjjVDxUVSoAp/5/eAfFcYsgJS9ljqRXm4HiVh1+zuqcDNrQ5a
	8V3LK+DcaU5GpuACGyIJfd7l24fcIdB8laQKkOlO8QveTHCYWyzcTk/R+nejE3aOU8ROTeKV7bbu4
	lhUUEsWXJG9DZ7cntWmtKucqk48XlCX0q4NUe0E/bAY+tGS6tceUu9+ds7HnuKUnbdBGxKTf35jH3
	Kta0U7VPduUnFgxMP7F+ENDuyoYqsG9EtEejdiOGPY2gWp4KT5yrvoZqLVFPvzRtITtVwEFV650wm
	JX8Q1hgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZqF-0000000DbNQ-1i9N;
	Tue, 27 Jan 2026 03:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZqC-0000000DbMq-1vVI
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 03:34:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJ3j3912684
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lr2+tNxH4fOHIvQOeYoJgdvCBLvY2/PQOfo
	BT4idddo=; b=AIgaAaH/T5bYvOrniiEjPifgU2BpvnWQQURxZl8CzSwnhWHNZET
	gabng2xqaeMUttIstbv1NiBn2Gj+M/NcyeCEhDwHKphiSE50p9+bogvEsdXvBN1M
	1M9bwlOvAUSFzYjPkPsQx/QhGwpdVYqtdkQ4SVUocdvlCF1T11+9wbzNDK+3DhHc
	sGRA6NxjE+WBdy1I3o5V1VselDagGgs3T9wqgtDAXWnPCPuaUEjHAWYqwNPZx+E0
	16hEXJqG/w1TI9UywBGzNkUGN+yi2BrVCVDealtpr+ZkQ8CclSh304m0rGSkn2qL
	mJ6GxbWAfk1QeRRLza//xzTbqYToS3kl8fA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3s32e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:34:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8232bde979bso1125658b3a.0
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 19:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769484846; x=1770089646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2+tNxH4fOHIvQOeYoJgdvCBLvY2/PQOfoBT4idddo=;
        b=Dg4BsNJh6nklfmZSDNnJm4UZT1A8jUFIK2xJsrPc0+s9QlXwm2P2X5fdc+Fe3+TohM
         69ZA6eQycwQa+VGHVIwHC604+E6XdERKBDsvfEuyYRsLzjlvuFSnqiXp/WudcbRZyfGJ
         blQEmJq6gRktgrJNwD2ERigYxUYhq+g7sp5JMOuaBEBGP1+WOXHCIXjhvRSVYMtcm/sQ
         e3TE7nLky46L8PDzJsvaUFqfcupLln3Jn8jl/sqkwMMrOoYqH7hYY4j+YdAS4BthoIRP
         eV3QyWQXEREr3QPZA58HWEIkWNlOEOyIeGEq3yOYKGP0VFMZWxGVdPN0gUfdtOaMqLSJ
         Hf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769484846; x=1770089646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr2+tNxH4fOHIvQOeYoJgdvCBLvY2/PQOfoBT4idddo=;
        b=o/Sw+jXsDkE8t2EyCndwoan5oV2mPejd4rPPkBCl5Z2DsJftGH5qdHc8noiwYBqjFK
         jmXToNyO8oHKFm+KOkS1Pi+Qnd76XZMpy0Er9J6cIyobTlqXQrFGRXv2up1VI957+kR0
         sqwrXgKAOv2p5uKMS7LjuRcpTk7qDXgPfsobpbvnNL62ISVwDUZP5xr2ZCMNSfpsc10v
         cSIcPs7Ja/otmZYoa1WLZuRVQ+Pf+8tb78xpzFwSdEJQsLePQ7TZgS0BADWbRWHbQRhI
         26Yv6NhEmyAu8j9lOx4+3qBn2+9pxZBapL/jCcqYFKQF3rTg7w1IYn/YK/PSLpU7pC99
         62ZQ==
X-Gm-Message-State: AOJu0YwmrpnUYxqMi5w2LK9ubuG0aKO+K0Owc2DveVrtUSaHl/c8+FcJ
	W2y6X9Z010Qjxl7ObYEE8Fe/VhXBIEcasqEf+20TwULJ0SNED2V6J53F0M4E3iW1voM3BY4+ELY
	NiD8yWWonXay4dZgO6bMbZ/Q6ddw6M//9k/c/fCFEdCE8Z5Jab/uigIcv0PXwfx6zfesaOWAn
X-Gm-Gg: AZuq6aINnCHv9b1+MngfIzi7mh1XPa5u3/RPAxwq4OMpBhk67pdF3eMLNg/BTm2wYcl
	CEkG4ygQhMlGszTbuVe9aP67uSQYeXGaVcxStXVTqJWT+VOGKK/zPf6+/PvYp8VJvHIPzRnoJO3
	S+lZ1fPSpRyaakHpUK2iLjH35s2WRGMh1xo23eZr3S4/g/CAWDJs0WgsmE2deR89+QP1HySSnUH
	LKp8DYodWr3a9WeO4lGr8n1e0PpdAZecCzyTExLAYUP8qHyypWDukLMSnwgRZMtmlDR033J6YM3
	WVhDi2RBhJf0W9Fet53rAI+tbE2xcdZ+tPyhdFIfGzM1MLztV3iwmQFbbJQh78xJB3Gdma6zimd
	pfwx7uY0yozhQS1gpfLDYkbBqbklxOOihGMwB/07gLNf1Hmr68mDRDrsSsm8bx4BaV0wF8o4+7W
	2qnw4QUeIQd5c4mbTzaR7nYyEWfaLKuYIQ
X-Received: by 2002:aa7:88ce:0:b0:823:b1f:893a with SMTP id d2e1a72fcca58-823692c3a61mr411948b3a.48.1769484845926;
        Mon, 26 Jan 2026 19:34:05 -0800 (PST)
X-Received: by 2002:aa7:88ce:0:b0:823:b1f:893a with SMTP id d2e1a72fcca58-823692c3a61mr411919b3a.48.1769484845436;
        Mon, 26 Jan 2026 19:34:05 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82339095c85sm5934929b3a.67.2026.01.26.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 19:34:05 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: clear stale link mapping of ahvif->links_map
Date: Tue, 27 Jan 2026 09:04:00 +0530
Message-Id: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qpauLPBwpQ62t-yLwnrGSJboeW9qjsqg
X-Proofpoint-GUID: qpauLPBwpQ62t-yLwnrGSJboeW9qjsqg
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978322e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eHKh3QcvEQMPWO9sNqkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNyBTYWx0ZWRfX8eogCnigpkkF
 y0rJM08JT1KtZRdM6i/DgMKti3Jp0tWw2qWKx37Sae5VgZDmQYKy4MtKuyA8UYxjtcYgBxjedE2
 Ehb2eeeQiuicGRosA0bawc04LEsfbkZ9IDTJrI5O0OmY1wHGCvO6WxhmfN3yTwOYezf5dgAsFrk
 OPH92m8SbmppN/AqQFDKZAZ1XrGbMB0wHQHCz01jTtYKKnwpxIRuHpTwBvh0sw0k85qIuBsYQPF
 TpRFbjZosTrWMR7zeVPPQKUICYIgGWQlE1206BK+Rig9O5WMOQDVEbyQWuysIwsZESjVGNPA8b3
 mTp6hQ8PPzj3B+qecz3kTfvzHeyGe1Dp2M1RESJFwDV1hssdmTqJyPFR6Z0awv4NxT2KJCmzZpi
 Rgu7hTyrtOh+gJXcgXDAbmLWpFG+KnKfJzOx78YVVlODX8TgduH8BDdFAEVUcbesYfRKtrPSd/4
 A5ABRYkAXxRE1CEWASg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_193408_502662_FE4E9C3F 
X-CRM114-Status: GOOD (  14.53  )
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

When an arvif is initialized in non-AP STA mode but MLO connection
preparation fails before the arvif is created
(arvif->is_created remains false), the error path attempts to delete all
links. However, link deletion only executes when arvif->is_created is true.
As a result, ahvif retains a stale entry of arvif that is initialized but
not created.

When a new arvif is initialized with the same link id, this stale mapping
triggers the following WARN_ON.

WARNING: drivers/net/wireless/ath/ath12k/mac.c:4271 at ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k], CPU#3: wpa_supplicant/275

Call trace:
 ath12k_mac_op_change_vif_links+0x140/0x180 [ath12k] (P)
 drv_change_vif_links+0xbc/0x1a4 [mac80211]
 ieee80211_vif_update_links+0x54c/0x6a0 [mac80211]
 ieee80211_vif_set_links+0x40/0x70 [mac80211]
 ieee80211_prep_connection+0x84/0x450 [mac80211]
 ieee80211_mgd_auth+0x200/0x480 [mac80211]
 ieee80211_auth+0x14/0x20 [mac80211]
 cfg80211_mlme_auth+0x90/0xf0 [cfg80211]
 nl80211_authenticate+0x32c/0x380 [cfg80211]
 genl_family_rcv_msg_doit+0xc8/0x134

Fix this issue by unassigning the link vif and clearing ahvif->links_map
if arvif is only initialized but not created.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: 81e4be30544e ("wifi: ath12k: handle link removal in change_vif_links()")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cdb72439dcf4..9a926f5b7e8a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4281,8 +4281,10 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 		if (WARN_ON(!arvif))
 			return -EINVAL;
 
-		if (!arvif->is_created)
+		if (!arvif->is_created) {
+			ath12k_mac_unassign_link_vif(arvif);
 			continue;
+		}
 
 		if (WARN_ON(!arvif->ar))
 			return -EINVAL;

base-commit: 13f9e5344a517048f3d8c61e49a9a72f97410de3
-- 
2.34.1


