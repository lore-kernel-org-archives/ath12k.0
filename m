Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443360A3838
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMA9gAQH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtoSifKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=; b=nMA9gAQHJCObKsAuPVDau/oy96
	idFVtbJkSLlXIGoRnsSClretwE5rI82x8pWyko9O+HU9aVhY1/Le9hjSmKhdy2Tz871yK/CODdEoY
	yARfwMGPJjxjDRH7sRruc2lrORbJmdhW2huqlTZ1ihAIv0ZKond5eXNv6bon2Nh1ZBT+bI5fZjBRi
	vSEYHC46+t8L/WCCFhfICRtW3I8fLhInZ96tCC9lVy5+80VQGPEBtAgYJiPoR0+jwLXR3g6MSFlrq
	J1TUEDLOPmcgLSpE87xKTGfcjgm81tRAA/wMygmpvbP0kMIOBgEnpb9Yk4hKQHuD8u9oKjvDz1s5J
	1WhqhKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGLR-00000007smC-2lXu;
	Wed, 11 Nov 2026 21:59:05 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGLO-00000007slp-00BR
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 21:59:04 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b0d63f60bcso48793557b3.3
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434340; x=1795039140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=;
        b=dtoSifKSinNDVl0Z62pirTwch5FuEDTy+S+wtwI2Qk80kHVJkoCN68vzbgzKUEMhBm
         hpMeeJtFcmaZbozAnZQZHJLiWS7+WThgww5U35KGq35wtr2TvKz3a0hTIAlShM7xrng/
         q/HPcooxUmBtQYlRyulSF3OrsiErgBobj3R+9BWsZ6940Pk2WOP6Ai290E+VU3XmXHB0
         q+5wvpRxzK7fZ92SeEfd8Id1M/TaRQml+wU5XTtzFWnlKLCLx/4cTEjnam65OmeNOyO9
         iJ5sCoL4Yj5AMgeUyAtaD0ZJL4RGDQ2tjoxf/0qYRXgxZY4TiteMclv0I3E7nM3IYVf8
         FiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434340; x=1795039140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrI5c1CwAeizeSx3dYvL2iX6nP8MVXXZ8SSttkgR4Q=;
        b=PcKd3c1uqOm/HLsjyUeeTL2+NTS7Hg7XrI9TbmcM4KvvxFTYs9OLSnjflOGRtE3hVh
         Ok0l0GFaS+WMRrg2OdAIg8Gc2gnjX9EPjaCfrXQzXeUMDcZlKmCvY6V3ypkzhDnEIHST
         QiiHJMEh1+ZMqEcAWo4oTWim8glqJFGo52cVIG0fLGp2fgBJyc686+UsxnTWfOyURPY5
         QI/umQ7aGcRfuyTI5yUW7Bs4ZnPuI6nSeZMe0xzfedLBTCTw7joT34oho01UMVk4BYNf
         47ygZQE1FvAccByo85rUCQJoJBVyf1rO+Tn/fsCS0MUfjROqW4J8FPW2lSqYutPMc0Yn
         QI/Q==
X-Gm-Message-State: APuU4Z8RPhDCv3PgO9WKH51Eu6M2lTUDv/MDUPn0xTxlLp1AbtlzWkpY
	VQMmmY3Ws0rVYHa2kfQMZOezLPvPDEIBcqxDkvsa2wmUjG3mFr2UUhCkycIA/wua
X-Gm-Gg: AYBFou1y0pOxDvG0CHQ7vmkcnlud9jZ4hHtSLL+tLMUIsKw6gWV7uPRAskXsRSDawio
	AjHHJhdnAGO2PXOYy/BosLFpQBkL098t5q3pQdJnjuvsOJWOiBjSylgMEfpDfPyOJfjQxwtPBLk
	9Ck+JM5hsV8ldC6kVdCRJ9jbq++k63dODwyu9AqD4iZWjD44iDrKVjkkgay3Z/ZtEFMBi6WOxWf
	1WhW1+LlwyGfcct774J1TSL7p215EJNdPpBr3B1GfsrQ8Zpwzv5SS/23UfOiriw5vP6TFWnFO+a
	5fpmjiA+q1YST8ermLFEVVj9TDgiQ60aGr3L0hWtkfP2vvOMpDgebhc2OgGbYY9IRCkz+NEhQCP
	XiwXB9iep+ju5FXoOQZ+a9NZjNDidYkQUCNX83Gd9hzp2lWt1gx+ZkeCP3AAu31vxC5+EmL+MH9
	YSrdpbxwVdjA8qnZW2WV7QPcIyBrBpGAtLeFWiZDwegMpI7wPlUeFh8aUHrqD/R7tnLLeAAX6KE
	Rxx6d9aDBxGoDSxDKJXJEmnM6MEdOaJSzRYgvvd0rnmDUk6wOVYHd5g6XB+pJjxq6N0LeTpgyw9
	84DKZH47zfarBVN11h/u0lrxWV+sZtTiPusJrvxrFT2v1A0Yh+oKXN20GsXrJ1ixV892DF1rGyG
	Vpz3/6gbUtIY/B3+rZ1vkbMFJhRvzFZSF4gkKRCxBYGdk4nqnmJ2sXf8PIAtaRNIUuLKhqb48zs
	LiWULoRQ==
X-Received: by 2002:a05:690c:d87:b0:8b0:ab62:c636 with SMTP id 00721157ae682-8b3a8188200mr30390687b3.45.1794434340531;
        Wed, 11 Nov 2026 13:59:00 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9771:d7f:1e99:8362:7799:8e00])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39340e374sm54959677b3.28.2026.11.11.13.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:00 -0800 (PST)
From: Ronald Ouyang <repaxan@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Ronald Ouyang <repaxan@gmail.com>
Subject: [PATCH] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
Date: Wed, 11 Nov 2026 13:58:45 -0800
Message-ID: <20261111215845.814490-1-repaxan@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_135902_055606_ECBF0295 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I tried the WDS support added in https://lists.infradead.org/pipermail/ath12k/2026-May/009382.html.
With a ath12k WDS client, the frames received by the WDS AP had some extra bytes in the beginning of the frame.

My understanding of the problem:
1 - this is a WDS client, 4 address mode.
2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_ENCAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
    so it software encaps the ethernet frames and sends the resulting wifi frames to the vdev
3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offload), it has OFFLOAD_ENCAP_ENABLED.
    so it expects to receive ethernet or "native wifi" frames.
    it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
4 - the wifi frame from (2) gets passed to the vdev marked as "native wifi".
    it already had a QOS field in it, the vdev adds an extra one when doing the hardware encap

This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")

Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index afa3556480d3..1b1c3f738590 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10275,7 +10275,8 @@ static void ath12k_mac_update_vif_offload(struct ath12k_link_vif *arvif)
 	if (ret) {
 		ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\n",
 			    arvif->vdev_id, ret);
-		vif->offload_flags &= ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
+		vif->offload_flags &= ~(IEEE80211_OFFLOAD_ENCAP_ENABLED |
+					IEEE80211_OFFLOAD_ENCAP_4ADDR);
 	}
 
 	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
@@ -10939,6 +10940,9 @@ int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
 
+	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
+		vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
+
 	ath12k_mac_determine_vdev_type(vif, ahvif);
 
 	for_each_ar(ah, ar, i) {
-- 
2.56.1


