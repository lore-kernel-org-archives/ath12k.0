Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81950606A321
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kIIjqxRe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7XW/CZ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=; b=kIIjqxRe8V3AUjWTsU97vcUJ+2
	IrfiEeR/HJOe88JnsqJfKGw0APBCtVN3N7DNEnKDs6DbpyfXCdhC+zV1Hi9HylVNn8c3SGd871eam
	Un1Sh5VF565zqYHZo+sLHRxSf5fTTX3vjC/r3oRfJG7Ejpr2pe01zuUpCw2r5q0oW5yoj3ubYBlk8
	N+XEsFjFlJYEN6XMTdO7oiokrywwVL/tJdHtsUKOj2JEKXoS/jdfc/VdTfFmtIHJo3sjI7FeT2hr+
	K6GnYqdxvO/FxDhbduWSWZXzEK6xcOcBSmtnaSL/lX03g3DFG3PxhtbA8az8SoCIoisc0TmRnqh1i
	LKRTHc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSm0z-00000000uLF-0KdQ;
	Mon, 16 Nov 2026 02:00:13 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSm0w-00000000uKk-0V9o
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 02:00:11 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67db763cec7so393654d50.1
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 18:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794794408; x=1795399208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=;
        b=w7XW/CZ6RzD//9ykE+iYCCSVkn4wMMmb+hJaamdINIZyDRxPs0h/l1h4oAjrcISz4E
         KsteGrmt0x0saDABOqDJkoYOLALfU16Sgyvi3rInrevT8PmCOysMy7eKuZPocwCUuzaa
         v/Tf3iyHh61LvqcsEekVb9WfXnSXc08JGZNSKQYE/3ai08lYrNdQUu8jLiHZHRw0maG8
         BfZcCcNjR61GeF3dGgUH0WX+XuRBLk+cTn+Wo52Cl2C3/ml33lJrbtXF6YrXC4B64WJ1
         aigmc8kNyEAhHyeOojk0I/IiYP9tKJomvXqx8oyORmzKVFEwrHz7qU1sCAIxgEB7YDVE
         NosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794408; x=1795399208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQSBCimb2HV88dBcn7CRS0IAHMQEQfAagxqmbFiIr/8=;
        b=PgvKE4NzaN4KmdtwiS5Y3kByvFjVaGNWyKM0uKzQV8GpCvQy1G12g0sdNrmzmlrC+k
         UH1hF5nEhFg0BP7VvE23QTrPVe+k+T8lhhpmSWtCnwHAsKAVqoFbkwJrM0sXquBQjlvl
         NwpOymiQRTjReXokdmbYbD/3nRwOhnZM+YxKIogsFdbGl1TpPNUhnefP72nDBzYHxV2s
         E60iRpv60rWgL3vNOWPao/2d2upCMXORPv6Mcbt6BBfmhsEzbAOOKao003uLoW3+YZeu
         +pg+txHtoyPiQwhPtvkLO62rqhf2GBZoKMTVM08rtvuL/kE5Sv5WRXNcip2Nkc8nYYol
         Z0ZQ==
X-Gm-Message-State: APuU4Z/VBhkeDOds2FhHkjyRiRUQCXgseeTYjhtBmbFxkhc2hUay5Yip
	bmUcgsDM9vr2szz0+2Q3htwxMCvjOwBm+n0PZ9a3AR+boVkXiQMGwCpGsBEhNdJx
X-Gm-Gg: AZFdTZcSxn+1RX6l9XTB1mZOb7typSzCbgahsxV8g5gl3oo+xQeUFzXCfEUz6K76Bh3
	9sxTl0dU083W2f5Ufjz2xyWX02ZcXcj59YM3SkGv2FnrOl5oP0AXWDB/fmUbvi7l+eH53I7uzft
	aTqjinXfDihlDlRfZ/AtDeYQTtoW3Axc2nw7YBhAwY8hLTtpyrtSA5o9f5WSUGQaGgfzWn9xcKL
	aMi4/V8Zgg3uDp8zmvNA3C5ijXvQU9nu1B+0fFZRwaZ2djvU8hRXYLvv3fWVgash24s+KHP+H3p
	U9QC+tNCdDdiA4fOagBwkjfBxmmJEFygvlgvTFW4O3JHY9GjXgqze4uNP5czGv+lSqBZrXBEPhZ
	vlvT7RqHGcyPuK+V1hbUESLsSN997j4rYMb35NXc9boRs7dGRzw8rAAkoC5EEDQ7dcNVKdLw2z+
	9QEFZQ/XqFRUgZjbOSEPEifJ80VIDDGWUkdBLf3O99HmIQY66wxz1oPUQGCZuDIKsxP0rC0Vqsi
	TRh6W038thDqkmHVK5NNlaA7MNCnkNjmsQig0Y3ykpCrATl4Fc7k+jcAU2aCw6dLchHBmbnWnUu
	jFUa7sxNSvh1A2kKmkaYnrVlhBkLYBDCMx7G8NvZujwJQmAjsVjJj1gEou9dggbuNh76xs2/aV0
	mGC9NwBTrdr9Znh/CHs9BbNroebL7OvH3uooCJ8ZTwQI3pFld3CedEQQCSJob
X-Received: by 2002:a05:690e:1341:b0:67b:f328:267d with SMTP id 956f58d0204a3-67d8937ada6mr4503802d50.22.1794794408160;
        Sun, 15 Nov 2026 18:00:08 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:9771:d7f:b238:f861:680c:c483])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5b3b62sm8594280d50.13.2026.11.15.18.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:00:07 -0800 (PST)
From: Ronald Ouyang <repaxan@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Ronald Ouyang <repaxan@gmail.com>
Subject: [PATCH v2] wifi: ath12k: set OFFLOAD_ENCAP_4ADDR on interface bringup
Date: Sun, 15 Nov 2026 17:59:55 -0800
Message-ID: <20261116015955.564420-1-repaxan@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_180010_173634_F3D53640 
X-CRM114-Status: GOOD (  15.20  )
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

I tried the WDS support added in https://lore.kernel.org/linux-wireless/20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com/.
With a ath12k WDS client, the frames received by the WDS AP had some extra bytes in the beginning of the frame.

My understanding of the problem:
1 - this is a WDS client, 4 address mode.
2 - on interface bringup (ath12k_mac_op_add_interface), it has OFFLOAD_ENCAP_ENABLED but not OFFLOAD_ENCAP_4ADDR.
    it picks software encap for this interface and it doesn't get rechecked later.
    so later on, it software encaps the ethernet frames and sends the resulting wifi frames to the vdev
3 - on vdev bringup (ath12k_mac_vdev_create -> ath12k_mac_update_vif_offload), it has OFFLOAD_ENCAP_ENABLED.
    so it expects to receive ethernet or "native wifi" frames.
    it also sets OFFLOAD_ENCAP_4ADDR but it's too late here
4 - the wifi frame encapsulated according to (2) gets passed to the vdev marked as "native wifi".
    it already had a QOS field in it, the vdev adds an extra one when doing the hardware encap

This fixes it by setting OFFLOAD_ENCAP_4ADDR during interface bringup.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Fixes: 729cad3c3c9e ("wifi: ath12k: Add 4-address mode support for eth offload")

Signed-off-by: Ronald Ouyang <repaxan@gmail.com>
---
Changes in v2:
- add explicit check for station and AP for consistency with ath12k_mac_update_vif_offload()
- clarify problem description slightly
- Link to v1: https://lore.kernel.org/linux-wireless/20261111215845.814490-1-repaxan@gmail.com/
---
 drivers/net/wireless/ath/ath12k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a247dcf387de..f0936f6c969e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10276,7 +10276,8 @@ static void ath12k_mac_update_vif_offload(struct ath12k_link_vif *arvif)
 	if (ret) {
 		ath12k_warn(ab, "failed to set vdev %d tx encap mode: %d\n",
 			    arvif->vdev_id, ret);
-		vif->offload_flags &= ~IEEE80211_OFFLOAD_ENCAP_ENABLED;
+		vif->offload_flags &= ~(IEEE80211_OFFLOAD_ENCAP_ENABLED |
+					IEEE80211_OFFLOAD_ENCAP_4ADDR);
 	}
 
 	if (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
@@ -10940,6 +10941,11 @@ int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
 
+	if ((vif->type == NL80211_IFTYPE_STATION ||
+	     vif->type == NL80211_IFTYPE_AP) &&
+	    (vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED))
+		vif->offload_flags |= IEEE80211_OFFLOAD_ENCAP_4ADDR;
+
 	ath12k_mac_determine_vdev_type(vif, ahvif);
 
 	for_each_ar(ah, ar, i) {
-- 
2.56.1


