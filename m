Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EADCD98D2
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KfjdmvbLZ2ajcdt58jAGget3u2obgXtGYDr0JfRuXz8=; b=PjcuyWx2Jkx1QaloPR//vdqvW7
	wN5wBbf9WriqilmWfpcTMO3z3Hi3QhhGVHWFYw7Wtt6OpxSrQYGFM8XwpdxdOPhqn5/hMfVy71Apg
	4KYPnQ8BRWWuy5LjQT6Fk61bkTqmg01Ky/7gl8FoQdeKdsKFxKjuCwoMHRrQznNZxQoMK2Z2rpjum
	jwP9xDS88lXHztH6FRlSWRTs4Wg92x/Cyd7SNZ1+0+cK+la9uMrAkJnOCxnsaEAf7dfAOaLmAajaR
	F+IY6skdl7hh5mtesIYmKIuVfjqR/yJrpFhDM8HBdHdtkPKYkVpTFl5cl8CXI5r0r1TSJaVAmSzHm
	wp7lXGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb1Y-000000092U1-2buN;
	Thu, 11 Jun 2026 08:44:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb1V-000000092Th-3pG4
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 08:44:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490a76757e5so51206425e9.2
        for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167464; x=1781772264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfjdmvbLZ2ajcdt58jAGget3u2obgXtGYDr0JfRuXz8=;
        b=GHB/2p7uOm4l0nv6mDnxSYYhkkk7tTkfSX6SKzbwSTIIWj59CTo6ssUONuBDRlc+GP
         ODhbJwFy3pV39jwovcD/gVKj+rKAKrezbhbT1FKmdGzn/jebrGt59BMuQebbWQhuw167
         lWSMIconXI95Z4AsmPSTaLUnb0LSjb4lz3EDJQiwE3GlpxUoc8csERhb7L7dwyt81mku
         Tsn2mdGr/3pzPBGHY86nso8Jp5ETp7RXlyCXHyppccuCouYkI5Ma32E78Hw3OBFukAOt
         XtiXhTviQ3X0zdiQ+jE8egdvPLjjDyHURvm80RG0QJ4g2Bz2fQKdwxQxC0DrpLO5MhGL
         1mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167464; x=1781772264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfjdmvbLZ2ajcdt58jAGget3u2obgXtGYDr0JfRuXz8=;
        b=HrOYmkXzthGI1uw/2AxHFBxrEc5MNA4rtARp7ucL9nn5WBhK/JJ/10RZ7ensOyPceK
         XfrqSvy2MCmTWEdEGUYGeJtLKveAEyaXZczzB8OXFKR4+y1ZzrudXMFqKHZGyhZcJhe1
         B99DfPAfNgpAbnSjOdC4YWVTyGPTMscA0KOQpBIa0LZG5kmMCZ17iUNaOH+Aulh96Rii
         1TVE9wrr6HA+CXEoLQhm6eZOVNaY5XWncJrWDYHjK5+I6Z59OkRlmDbVzxYu0Sq1tWTZ
         6DBumA2mAQ2Z8CZuNkdCMITElLiMEO0zzne1XhLwQtK6a/Sx0pAHAzW06TWOrKF+hSyb
         wKeA==
X-Gm-Message-State: AOJu0YwjL32tDTG3DzGQif6Siz0tphd9I/yIdN9Nc8bBiHHEjGQJZT18
	4SNBaxZWYfyh/qF3AXeFsqtgYrhz7j3m8cKqq+wFz6VrD8YIpR0XQvAhUNAkxg==
X-Gm-Gg: Acq92OHl6cn2/ndlIbo+wI23AYrDQ61qi96l9Lc8jOksdUc+IjGrUr4Y77Litq4KBub
	MNVDzL9Dl9UoePR7nbStpfg692F8belRB9GJw1KSPRI1JnCX/1xHn8IVyq56Ltnn9Ln8x0sLMDJ
	Vw5YvioDmbcjwUfkHi8N5mYcZ/zp6waj55h28U3VCV12BqOwV8TfG5LszODuVrn7BWoMZiiVUw6
	NFl+BhyFJc/8ARPobJnEr3wWOlcmunszgDRu4kFRUy+8AkZ3LQPIks+JxCmc3xrDC1ace+jnXZ9
	r5jcE58p0e7AjosuDO+B9Q/UDVs1xW0ljxqIOsfJ3dawxm6Hl7z9ph4BDJPTINztwHC4H/pOYpo
	t3gSAB+yePB4etFHML/A+cyoh8uYDA38Y5Ax3M7+EssrIdr5+J7bcuWBr0QoKW361A8kcGwAYC/
	r82lRfwx0k6Y41NtWro0hyoA9c/u1IhTiRpfQwMotV9f/YngiEwd+xt4rorIAu/I2szMA=
X-Received: by 2002:a05:600c:5250:b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-490e5620658mr18944445e9.35.1781167463459;
        Thu, 11 Jun 2026 01:44:23 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm81024394f8f.1.2026.06.11.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:44:23 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v2] wifi: ath12k: avoid setting 320MHZ support on non 6GHz band
Date: Thu, 11 Jun 2026 10:44:22 +0200
Message-ID: <20260611084422.1511513-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014425_989564_48345A3C 
X-CRM114-Status: GOOD (  15.42  )
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

On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
realated features on the 5GHz band while it should not:

    Wiphy phy1
    [...]
        Band 2:
    [...]
            EHT Iftypes: managed
    [...]
                EHT PHY Capabilities: (0xe2ffdbe018778000):
                    320MHz in 6GHz Supported
    [...]
                    Beamformee SS (320MHz): 7
    [...]
                    Number Of Sounding Dimensions (320MHz): 3
    [...]
                EHT MCS/NSS: (0x22222222222222222200000000):

This is also reflected in the beacons sent by a mesh interface started on
that band. They erroneously advertise 320MHZ support too.

This should not happen as the spec at section 9.4.2.323.3 says we should
not set the 320MHz related fields when not operating on a 6GHz band.
For example it says about Bit 0 "Support For 320 MHz In 6 GHz"

  "Reserved if the EHT Capabilities element is indicating capabilities for
   the 2.4 GHz or 5 GHz bands."

Fix this by clearing the related bits when converting from WMI eht phy
capabilities to mac80211 phy capabilities, for bands other than 6GHz.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
Changes from v1:
  - rebased on ath-next
  - clear all 6GHz / 320MHz related phy capabilities fields from the firmware
---
 drivers/net/wireless/ath/ath12k/wmi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 84a31b953db8..a8a4654c4f34 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5154,6 +5154,7 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 				       __le32 cap_info_internal)
 {
 	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
+	u8 *phy_cap = (u8 *)&cap_band->eht_cap_phy_info[0];
 	u32 support_320mhz;
 	u8 i;
 
@@ -5167,8 +5168,22 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
 		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
 
-	if (band == NL80211_BAND_6GHZ)
+	if (band == NL80211_BAND_6GHZ) {	
 		cap_band->eht_cap_phy_info[0] |= support_320mhz;
+	} else {
+		/*
+		 * It seems the firmware can report capabilities specific to
+		 * 6GHz also for 5GHz, so lets explicitely clear them out.
+		 */
+		phy_cap[0] &= ~IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+		phy_cap[1] &= ~IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK;
+		phy_cap[2] &= ~IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK;
+		phy_cap[3] &= ~IEEE80211_EHT_PHY_CAP3_SOUNDING_DIM_320MHZ_MASK;
+		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ;
+		phy_cap[6] &= ~IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP;
+		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ;
+		phy_cap[7] &= ~IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;	;
+	}
 
 	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
 	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
-- 
2.54.0


