Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407CC982E6
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s8pWNm66LVdiHzafdbCttJBcf3IazbTGcwd5qfxU4As=; b=ayYdoZHltfO6vCAxu+406FmAA+
	B8DcZ25byxhakV7CTfF26RVRLVZVI/00xT+r6OS61nizgbd72SJvsbuuDMci5B884elm/n0NVRsXL
	2sB5v62YpsqF9C2bqMbXM8TZowgU/UByqS5GP4veWFLfDkvwCbkiiuTQERcqGnnGk07x8SaN2BGhF
	v9bXmQbg1zq2K4e2tvXLAM5zpZyqecBVYYDO+6hUt00Ge4WAq/8UgNW7hbamu19Ebxfl4jkit4NPS
	W4T73E8HGD77OLWTFv+2PbcvPyFHvptRe3DvnwnDvbN7hePItQKgealW2B8PoeQpq0vacgazVV/13
	CdzspRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hqs-00000002zE4-3NCS;
	Mon, 21 Sep 2026 17:30:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hqq-00000002zD6-1aHn
	for ath12k@lists.infradead.org;
	Mon, 21 Sep 2026 17:30:49 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so14048835e9.0
        for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011843; x=1790616643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8pWNm66LVdiHzafdbCttJBcf3IazbTGcwd5qfxU4As=;
        b=p74oB9rDODRuA/OuLDHVmKaoP1/2FGQwtPRTngDyzFH65V/tWYM2ZW9gGAbL5ogH/b
         DjW3maEityGrhP9ItG0HQau0tYsUDGNPfxxZ4LjLvmyG8VmQlfrDeaaudolmYXRVWydN
         0m1C996lY5Q5CtXyZQwqMC7fliVSvq7f7TNK3zUkqk9V4HE7kw2XzWiRTLlX9TLI+Kkq
         c+61JjTncYxEH+dsvbWlC8GH36lEo6OSfvGIiYdG+qY3AvbBr2uiSnC3H45dc4Bk3kCq
         4Yd0/O4hdvEfffcedISbgqPuBXR9ydmYjK5BFNWIK12Jl7cha5LpUp+XN8PeKkR8ffpi
         SHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011843; x=1790616643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8pWNm66LVdiHzafdbCttJBcf3IazbTGcwd5qfxU4As=;
        b=zafM+xTz+9GUzXmmPIyDXHhkqB+suT8F1TIzE6WZgg/BuAZ91uwA4M16WxUo8NDM+6
         MYDqKCq1TqqG+xS7D1ICT3/Q3VWuxi96HDZQahsoe1g3g94ofWwtCBnwbLWlNjrb3XFR
         T5jaOCrVMVZDA8gmVRm6JGPb3yORXonYtrzyZy4LHApW8wz5WLlyxRfb/pIGxT8oQ7GQ
         zRMMYJKy3Uc/BsI+DZeJpSgtJ/PSFkE8lSYpyIY43HcUO54z632hcYrxQ1HQkJhrRBM/
         47DUWMrWOw3BqafIqm3Bqdjc648rHNFhaBNTf6Kw6rMMQ/nwJI/Yxib6P43kj7PcJ+LN
         tsuw==
X-Forwarded-Encrypted: i=1; AKwUvBzt3O8/Gy2ID5iXnon08qXdnW4hxbtyFRL/MmYWyE4wWFXhi8SykpZfdxTedQr4MfFX7Lo2Zlk=@lists.infradead.org
X-Gm-Message-State: AFuF++lxwtY4mjC84SZjwPkQel/Yj18NgMLMs7lCHCzpV5BX2sYy1C9I
	vadIxB29ifpS/ofGTwr2qn9kRHGwIcrW0dge5T633zm/akq814oKMjUL
X-Gm-Gg: AYBFou0J+wlQTJ/u8qy4ay7r9x6ab2MaCfXBOjI+0IzRUgvGP5pG2hPA+DcwBI4T4Do
	MR2MrT13SHFmbTyoh2Eg4HDd6jKA8L8350A2ogTXKHob+/L/dyckqrS7n6l1nPQX2MtHIAICtPI
	//EwusfYn51NGNSIpVHstyJMgMCLuJX2H7RAtNgoAlGsxfiexupOK9nenazZqqPQJKKPsfmmJow
	AbMqnkRbZPNGFs+58qtYf/9fcUYmVR0uDkIJipNE452bbVcqoYKd1Cb1M6F2JHq0MtXJn0/+Jvo
	9/hsMvdfyMCNPVGXQA3NC1VfkktcIjLdjBe4djPBNr2cBOXLC/yTnQ5XlrBJsPU512Oin9ginij
	yEQKxSJzQp0w9JGveebJm9XC6OjhBFtCbDhQfDlRiscKlfB0TIiuGsjV0gHtSNHzwgGWmGxJfaX
	wbWFG1TIy7KUwumIrmP9inDko1Hh4AkaCL8Sg3Op2Qj0HqcKY65NE87Crtlq7AiE0=
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr6562135e9.5.1790011843197;
        Mon, 21 Sep 2026 10:30:43 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e34f:2f52:ae98:3e30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8ccd0e1sm6146505e9.6.2026.09.21.10.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:30:42 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	kang.yang@oss.qualcomm.com
Subject: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address pool
Date: Mon, 21 Sep 2026 18:30:33 +0100
Message-ID: <20260921173033.846332-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_103048_453527_72A75DEE 
X-CRM114-Status: GOOD (  17.42  )
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

From: Vitor Soares <vitor.soares@toradex.com>

ath12k supports creating vdevs with addresses provided by mac80211.
Userspace can already make concurrent interfaces work by explicitly
assigning different locally administered addresses.

However, ath12k does not advertise an address list, so when a second
interface is created without an explicit address, mac80211 has nothing
to pick from and falls back to the permanent address. If the first
interface is already running with that address, bringing up the second
one fails with -ENOTUNIQ.

As in ath11k, provide a list of usable addresses so
ieee80211_assign_perm_addr() can hand each new interface an unused one.
Keep the first entry as the wiphy's permanent MAC address. Generate the
remaining entries as locally administered variants by changing only the
upper nibble of the first octet, which naturally limits the pool to 16
unique addresses.

The cfg80211 definition of wiphy->addresses does not specify where the
addresses must come from. Some ath12k platforms use it as an interface
MAC address pool, while others use it for firmware-provided per-radio
addresses. Gate the generated address pool behind
advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.

Other platforms keep the existing behavior.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Assisted-by: LLM
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v3:
- Rename host_alloc_iface_mac to advertise_iface_mac_pool.
- Clear wiphy->addresses and wiphy->n_addresses during cleanup.
- Drop the single-radio check and rely on hw_params gating.
- Enable the generated interface MAC pool for WCN7850 and QCC2072
  (QCC2072 compile-tested only).
- Follow kernel block comment style.
- Link for v2: https://lore.kernel.org/all/20260915152815.254016-2-ivitro@gmail.com/

v2:
- Gate generated interface MAC address list behind hw_params
  host_alloc_iface_mac, as suggested by Kang Yang.
- Enable it only for WCN7850, the only part available for testing here.
- Add Assisted-by: tag.
- Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/mac.c      | 48 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
 3 files changed, 55 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index e790de5737db..c58db8482aa4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -238,6 +238,7 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	bool advertise_iface_mac_pool;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..46f5f338f44c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14743,6 +14743,50 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 }
 
+static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
+{
+	kfree(ah->hw->wiphy->addresses);
+	ah->hw->wiphy->addresses = NULL;
+	ah->hw->wiphy->n_addresses = 0;
+}
+
+static void ath12k_mac_setup_mac_address_list(struct ath12k_hw *ah,
+					      const u8 *mac_addr)
+{
+	struct mac_address *addresses;
+	struct ath12k *ar;
+	u16 n_addresses;
+	int i;
+
+	ar = ath12k_ah_to_ar(ah, 0);
+	if (!ar->ab->hw_params->advertise_iface_mac_pool)
+		return;
+
+	/*
+	 * Only the upper nibble of the first octet is varied, so at most 16
+	 * addresses can be derived from one base.
+	 */
+	n_addresses = min_t(u16, TARGET_NUM_VDEVS(ar->ab), 16);
+	if (n_addresses <= 1)
+		return;
+
+	addresses = kzalloc_objs(*addresses, n_addresses);
+	if (!addresses)
+		return;
+
+	ether_addr_copy(addresses[0].addr, mac_addr);
+	for (i = 1; i < n_addresses; i++) {
+		ether_addr_copy(addresses[i].addr, mac_addr);
+		/* set Local Administered Address bit */
+		addresses[i].addr[0] |= 0x2;
+
+		addresses[i].addr[0] += i << 4;
+	}
+
+	ah->hw->wiphy->addresses = addresses;
+	ah->hw->wiphy->n_addresses = n_addresses;
+}
+
 static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 {
 	struct ieee80211_hw *hw = ah->hw;
@@ -14762,6 +14806,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 
 	ath12k_mac_cleanup_iface_combinations(ah);
+	ath12k_mac_cleanup_mac_address_list(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -14878,6 +14923,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->available_antennas_tx = antennas_tx;
 
 	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
+	ath12k_mac_setup_mac_address_list(ah, mac_addr);
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_iface_combinations(ah);
@@ -15120,6 +15166,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 	}
 
+	ath12k_mac_cleanup_mac_address_list(ah);
+
 	SET_IEEE80211_DEV(hw, NULL);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ae8df80928b0..ad362244ed9b 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.advertise_iface_mac_pool = true,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
 	},
 };
 
-- 
2.55.0


