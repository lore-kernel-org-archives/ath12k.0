Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86246C79F8C
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeAecISyFtoS/s+HRCWL6bIRyIqegC2fZufUlBFIf1U=; b=t+HlF5br57OZop4WRHw0mzAKLg
	NJI8V11CZP3cVf3BxFCXafm9TegvamgfC/JFYuQ9gcbz69y9vSfHgWh/+kX2U/FZpb9AVUivvsEc5
	igu+XoSjN1QFuaqjQ6T7ij/sFNsVrBRz765RCwjZiwGKuj+KkGzi01xvn6r2PPxf/hPxM/AgxVAvd
	F21h7t2sQSBGxvoHr/XlpeRCZ/DbIrODoPqmnHUcnZYYl/U+R5IHjwl1u1MAmbEQbbucoshl963rG
	L7n3W6qDevky6LEj+t5kPKi58jCfbQIIDnS3i/UM1T/SExQCR08U+RL/Rj/W+mLXl73GXFD11Gl0v
	1QuhGWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DX8-0000000B54L-0OTH;
	Wed, 09 Sep 2026 08:19:54 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DX4-0000000B53X-0R82
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 08:19:52 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b1a806664so730959a91.3
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 01:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941988; x=1789546788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AeAecISyFtoS/s+HRCWL6bIRyIqegC2fZufUlBFIf1U=;
        b=Ry5IXVQ9+dTrdiKKVTJgc+dMc+wfkMRyxJw8rYL9pzkdO0CpdAU3y9Z+Fo6G9oLXI+
         Rz8BG35XKKIpUY0bEbWcEf3c8QRtU0KCx6HJk3nAVnC1byJKGS3EJ9ggMaGkmEZesZYH
         9njQEysU8s5LOQMkQbSg2W4TIBZbLxDpRMHz/eYlLF4s7ue3HRs1CoQBHOM/8h0+/u7d
         rmZwptPtJB2VscTFteX9J7GUyJ7iUj+VT1rrCvNBg/LVTBYt1LGQU6gde+fqbYNL2Sl+
         TfZ9A2Vmk8u7oBVuM3ZX0ebAAhJVwWM30U3PaIjoEKx7DLvZqNM7ROv5aIdanqAFDpEP
         Gs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941988; x=1789546788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeAecISyFtoS/s+HRCWL6bIRyIqegC2fZufUlBFIf1U=;
        b=qknF7m7zvjWwOKHIv/Q8xXbf6D7jNbMmMnXtVBVY5wVmbpBSroSRPgTtqG/f4wtGWy
         81q2zcb7PI+7Bw3/HDL8qU5MILjRYwRbGVSQVQW1f5IXu12Sy/4Bo2isH8F6W3/ODTVC
         EhFBIpctyDalKK/q2fmLglllQIwtTXw/wEYW1jY2zZL0EIU5KxoAhMhifJOBGNf4ILKn
         dXdBW7WuCx4vzH5GInXe9gsoajaSWMgA4qI5K8GxahO8eEbS38y2j/G5b5SHjSAVw9RV
         KzzMxD6HGIKUX62JbuO5zN/jzcnBLAwL2r+GAXsvQGsHUdGgQfDCcJCpUmLNIziZNjeT
         PXKw==
X-Forwarded-Encrypted: i=1; AKwUvBwucXtYcJAuSQS/e9cgECJdAFBU7UyDU63o2WOq8LU5ewDbGZjUAv+RnJkzzw/szB93swF6TBk=@lists.infradead.org
X-Gm-Message-State: AFuF++lejeGesAev7edyPvnx3P+U8/iYkkzrcArHOGOpqcWbdmGpAd3S
	ybdfjljhBxqHn/kPKQXmiQlfep1rGvC1O0laTc2XOsovSGXqNvM9QyHj
X-Gm-Gg: AYBFou2Tuoq8QKI6xasKey2vgF/5JoJaUEkMVYQrThZNEXpFFvo0mADpR7F/SRZPp32
	OnxQSqW6cd4+3UbiWGEmg0YHLGsJQaceyF6Df91/sXijB1nLFMqvnYGyg+3d1YEltoM63wg65Q9
	5KSthBPbCLAMpjOXpaQdCMkQse8tqmHl9YqUdidwgoPDkFzMBJZWKPQj8EoI9eOSrUtQ/bjkQND
	f0KOlEd3WyCh9/u39X6fnLTPRDemVWI3i0puexQRorEWIbdXMhJsciJ5SO97t6zMLxVJ8w//+EM
	G+hFKX6JDujD2KhfK/dLLbHAjj86sY8Uhpgb0YNORqHwMfCzv0ClUJCSZBbUpX83MC6/AEc2gpy
	lOIvzrHIAPgT71IlRwdzY+id+7iiW+gdeKqI44GtZtdkn3TKeibuhU2t+yX/aX07NjF2dAZZZj3
	KkurMeGaL7QjDp395BpJB1dK/0kOgw3ZUrojfg2MaSGIQbUvmDx/QDHbtfh9bmcOboUns36wWKJ
	UlVrg0eMKyi4Q==
X-Received: by 2002:a17:90a:2cc5:b0:39b:64e9:2510 with SMTP id 98e67ed59e1d1-39b64e9607amr12279879a91.4.1788941988297;
        Wed, 09 Sep 2026 01:19:48 -0700 (PDT)
Received: from fedora (45.62.127.193.16clouds.com. [45.62.127.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b51eb40e6sm21357488a91.16.2026.09.09.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:19:47 -0700 (PDT)
From: Frank Zhang <rmxpzlb@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix EHT GI reporting in monitor mode
Date: Wed,  9 Sep 2026 16:19:29 +0800
Message-ID: <20260909081929.122174-1-rmxpzlb@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_011950_165295_6C007AFC 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
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

Store the EHT GI value in the EHT-specific RX status field with the EHT
GI conversion helper.

The EHT RX path in dp_rx.c already uses rx_status->eht.gi with
ath12k_mac_eht_gi_to_nl80211_eht_gi(). Align the monitor-mode RX path in
dp_mon.c with that implementation.

Cc: stable@vger.kernel.org
Fixes: 5393dcb45209 ("wifi: ath12k: change the status update in the monitor Rx")
Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 44c5cff75f16..08b3caeee8f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -176,7 +176,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k_pdev_dp *dp_pdev,
 			break;
 		}
 		rx_status->encoding = RX_ENC_EHT;
-		rx_status->he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
+		rx_status->eht.gi = ath12k_mac_eht_gi_to_nl80211_eht_gi(sgi);
 		break;
 	default:
 		ath12k_dbg(ab, ATH12K_DBG_DATA,
-- 
2.55.0


