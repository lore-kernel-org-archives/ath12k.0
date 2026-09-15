Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AC2C982C3
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=; b=pXjSl9fIR1Pl33oXEwC3l0X3VX
	V1K82go6euDTOYjZut2zpbnOPxVrmh/NRvDp5B1unPqzSVpIhHjXPYc6yFXXfj7tszN8O+CyZBTKU
	1ogDOZ1TjRQ30FBzb20rscmMvbxz2nioBa7IxwrnQ8Hs0En02brBbhcBVE3fGLsN0uIz7tTMnbT8I
	6s/l22rKCmWWPaSehb0h3IKdJQx4woWdJj3NyUTz/wyZjvpruhN/Ni9XP8zc+2i88Xw+MyiZ0F0r6
	SY+snL5XY5BHRAXF8fBv3o0lFX6bwxMKquFHuAyn4J+IIejLDYuEerzB+R/1/bSQZUDB9zRodkYUG
	EoXc+cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V5F-00000007A0e-2enJ;
	Tue, 15 Sep 2026 15:28:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V5D-00000007A0B-3dYG
	for ath12k@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=; b=GvMj/Rpo8e3pqLsgMy1UbeJMOZ
	IBSmel5tKRLbiIFAIk3GdVE96R8XHUGBYFYYOzUQZ7OAmpbK81vViLSKBUc8SJ9PlxnPfPk85zSoq
	osVzL+Ca+89yClyPUfisHqSOsC9fW6uq9mYfWx9382bB5m2inlWUgTnQ8X+IoyDOWDJdpjertiz+Q
	2F3Y7JjBUIZbIVcxqjvu7cmpAz5HA9E42ZyEoq8O87NN9o9mX5qys5KBPTs1qYodQsuVqZtWAtfaY
	dxRxk+G0hdUKHQWmJPcLmY9xUzQVyE+mbixTBCrNvK1K2Mn2RrT9XnI12C2gqQLarn7gb08e3g5NN
	oLFbSBSg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6V5A-00000006wJD-3D7A
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 15:28:30 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so3819135e9.3
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486106; x=1790090906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=;
        b=gXIQuiTOkUG2aW5olSXKgTqkmm4ahHnzuOJFRJypiL43CX9KBjt155W4r9iKg9mfdu
         79hKUGoHpx8D+hPWxhGGhLTT7xQtRJnKbUbMUWeO3Q6EpJrD7o6hXi+PiR1B74vtSzvL
         /gv0RHZQKlPwSvT5BAsY5+RsQLhxyx+ytCxw5ybWisXvxqevSjf/CoNb9B3hq6zKc481
         LO3P1yiPtgoOxB6Q2Oj40VjuPJfXLLo59BqHH7chXdC3h/kDEFjuvVjb/gIb6ZZstvwv
         WZRhVqIezgYVBMHE9Yu6XxuBq86lUv+ZzUcxdtlxOY12FiQqGZek8GRCNAj9H0uxAyJz
         Vwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486106; x=1790090906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33gYF2jzy1G9rIQBj+NprKHNDmK+lqFhKcN1EOQ8yF8=;
        b=SJhOQcK/FS+9uzmpaoHSW7jGS4uUgcVNSjeDOQdhpokXNMcWXwVq00d7oxzkFpDjyS
         6a+1ri8vzAYEFvQUgsPh80SpH97WgGD8Ruqx/VgM7M3C6aRCBiVEmXCzOJomqp1mc6w+
         w4sxhnPb35FZ36RYNZgT6V/q3RTrYthiDu6Z9B6KRAMtkrvyjD6SIjIOrCaOAS4eZ43f
         BbGy7vq/akSGPa+jv5C6BO/1Yv/cVHRqWhK8sO7K87KTVjX4Del8GQcKoeFKJdH9szCb
         skTUIq89K0+KoSrwgo5UMPBHKSLPz4rkb+CzijFIkjJ8Zp0V06zA6v0NO9RFOh8PSwXV
         dHKw==
X-Forwarded-Encrypted: i=1; AKwUvBzzhHVV8vUL8VaE3NSUPR7+awkuA5tCOU35HahBF0whbEzFiOM/Q/5qlpgGiLdbcMxusL9xfbk=@lists.infradead.org
X-Gm-Message-State: AFuF++mVt9eJmKQ6L0z5ubLbjP7TOUAIGRHqPAogeR+3llNelU85kgyS
	p+/MQtfvtUjLiXh0tih9/W9zcHxhqBAmzJtqRatnaJ1eC1rov+HXaGWo
X-Gm-Gg: AYBFou1DaE52lbR2Di965Sm4io9u/YfU6oCkdzZaESB2XGdg4RYzq5e+H8Pqx9ghuik
	moUfZd1ucBSPR0QjeQNt6v+rf6i3cmRRN5BTuxRjQ5M/uQVxff+gR7Z9veMp8TbXHeDg+HwkG/o
	ydu+pQha4GRK52ZPTx9+ssfyx1GzlOJWP1p4TGHW1tZFUCsl8BOCZ93GGrZlHHJdvqh4sh9eGiG
	RmQtFU8D7iDxjKUoz9i3OWTKqAgY333Vhwyn4Pu1OUsitX2VB352raOAQhJpC5bYr4D3NCW2INp
	NT+tZpdIHk4gVzsHNWpNfx92gfgplHKQ/8Nm/hPDFwM5eI0KmxQsHbEiv5DStk9PbysX/GZGyzH
	EQpdR9eVCP8Bbz9P3orA2vqnzmck3tWG11ODoYhYx96aXp44d5cqNZjPPLx2YlsPHD9kFrXDGLu
	5UUHspMr4vPzj6HSDQwoGCPDy1BJP71QsodHngz1X/W4mbFIBSAx75cvAxiiL3yEA=
X-Received: by 2002:a05:600c:a47:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49e7a677980mr92009675e9.25.1789486106257;
        Tue, 15 Sep 2026 08:28:26 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:a903:f291:2714:83e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm36312931f8f.5.2026.09.15.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:28:25 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	kang.yang@oss.qualcomm.com
Subject: [PATCH ath-next v2] wifi: ath12k: provide MAC address list for single-radio wiphys
Date: Tue, 15 Sep 2026 16:28:15 +0100
Message-ID: <20260915152815.254016-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_162828_913933_9C834524 
X-CRM114-Status: GOOD (  18.32  )
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
Keep the first entry as the radio's own MAC address. Generate the
remaining entries as locally administered variants by changing only the
upper nibble of the first octet, which naturally limits the pool to 16
unique addresses.

The wiphy->addresses semantics are hardware-specific in ath12k: some
platforms use it as an interface MAC address pool, while others use it
for firmware-provided per-radio addresses. Gate host-generated addresses
behind host_alloc_iface_mac and enable it for WCN7850.

Handle only single-radio WCN7850 wiphys. Wiphys with more than one radio
and other hardware families behave exactly as before.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Assisted-by: LLM
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v2:
- Gate generated interface MAC address list behind hw_params
  host_alloc_iface_mac, as suggested by Kang Yang.
- Enable it only for WCN7850, the only part available for testing here.
- Add Assisted-by: tag.
- Link for v1: https://lore.kernel.org/all/20260902082219.3010793-2-ivitro@gmail.com/
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/mac.c      | 52 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  6 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 011bb22e21c7..03cb35071e0b 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -238,6 +238,7 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	bool host_alloc_iface_mac;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..45be5b08aa40 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14743,6 +14743,54 @@ static void ath12k_mac_cleanup_unregister(struct ath12k *ar)
 	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
 }
 
+static void ath12k_mac_cleanup_mac_address_list(struct ath12k_hw *ah)
+{
+	kfree(ah->hw->wiphy->addresses);
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
+	/* The pool is derived from one base address, so it can describe only a
+	 * single-radio wiphy: with more radios each radio has its own base
+	 * address, possibly from a different ath12k_base.
+	 */
+	if (ah->num_radio != 1)
+		return;
+
+	ar = ath12k_ah_to_ar(ah, 0);
+	if (!ar->ab->hw_params->host_alloc_iface_mac)
+		return;
+
+	/* Only the upper nibble of the first octet is varied, so at most 16
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
@@ -14762,6 +14810,7 @@ static void ath12k_mac_hw_unregister(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 
 	ath12k_mac_cleanup_iface_combinations(ah);
+	ath12k_mac_cleanup_mac_address_list(ah);
 
 	SET_IEEE80211_DEV(hw, NULL);
 }
@@ -14878,6 +14927,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->available_antennas_tx = antennas_tx;
 
 	SET_IEEE80211_PERM_ADDR(hw, mac_addr);
+	ath12k_mac_setup_mac_address_list(ah, mac_addr);
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_iface_combinations(ah);
@@ -15120,6 +15170,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		ath12k_mac_cleanup_unregister(ar);
 	}
 
+	ath12k_mac_cleanup_mac_address_list(ah);
+
 	SET_IEEE80211_DEV(hw, NULL);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index a20c21807344..8658828ea47d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -445,6 +445,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -539,6 +540,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.host_alloc_iface_mac = true,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -629,6 +631,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -713,6 +716,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -808,6 +812,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.host_alloc_iface_mac = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -895,6 +900,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.host_alloc_iface_mac = false,
 	},
 };
 
-- 
2.55.0


