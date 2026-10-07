Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F232CA5FFF
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 21:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=; b=WaAUL+Ny5OL+MhCTy5glwlc6wC
	ssWXPN5YXPTjJDwWc92hNpltaOXR153os3jTcmK4i9OVo+Jvhdn0BEfSDmHXpLmnOH/s463RLeERj
	I+0zPWB8Sh47YSO4JcFMb919s0z7THfeimbwW3oCzB30iiCR/Luv8UG6ZLOFZ8JxtU+nWPhfgqBKW
	SdkJ6sKE49C3eTAdNZjE8u+jYfHQbZab9y+jDVM+/tuO8vSWUPEnomCSfJ4ESEQ3mUPO0wRNx5jZo
	VVY3Wjts0/fhdo4S+LBVbAbhqaKjgNiBUONo2o7o8eVPjgP8HDO93kyA3n0I56dT0eEbL05pdSHJu
	f+DrqFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZM9-00000003Cm0-1X5J;
	Wed, 07 Oct 2026 21:39:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZM6-00000003CkK-4BGi
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 21:39:20 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3a9761758adso19060141fa.0
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 14:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409157; x=1792013957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=;
        b=cvFZxkKh0nnUGP2G+gXy1Ds9SgCI1W+C/ruRtnPHSg53OcVKHNBBNH855ks7Ou64kM
         3AgaJvNscbESyZI9ArFiQ++6fcqtilxLD5sNZ899BJbe/jX/xw3RbRiKG4dFfLxCWXP2
         GAw1e0YovzpnGe+r1rge1r/HMbt1wIeIAaGXPSpbeDQqJgUuWu4/JwE6oYCyPDJY3vEP
         7Pw6hIPWnK0CxezU8U1cNsx58xJRp/auK/L4pK0H7sPjEI2hdwjXuOjwAv3RRWgZDJOU
         GMDCIOF49ZwHT1vjF19pZOxIJBqWuDMjFsY94B1gF29XRf+PUkJhN5AuTT2krKhis+18
         66BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409157; x=1792013957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=;
        b=E4Lt9JedBXWgGOZ6FfGG75WeMgsbNo/LtjNiyZF9VVEd7fPx2iuiFMhWFQomUHKAhQ
         iTWcIkBVtv6wVl9z+kvjagPYMDsrCcLKcT6S/HJUerljDsDcB60CXPBbHfXa302DVsB/
         z0UY+ATof66SUMQhjRHtUA95kqz0MYZ8sarDb18wvq2jyQ67Og4mAyrpS/EA+Gi5i58V
         rLt0PaShIx4yLJv4nm/GmGyIYzwAEVz06hIwBv3Zo6GHPLL6SryBTAVzJPiO2KegIl50
         wp5i/qcG8DYqNii+Z2LtARyOQIBdrsBSOQoMiPmi/Wts016T6Yzng990kvJLSFdenOdQ
         rS+Q==
X-Gm-Message-State: AFq9FYKW8GZfqg2H0Kt4ytgAbhVkGBotvwmzeTV23GY5PfhCn4MZnSdS
	eO2SCzz0WPGeSuNTpym1hUnfSYLWlaElbiSNaVs7m/JwpqPEzKHdIYkUPp5gVvWYEXA/DGAMY00
	=
X-Gm-Gg: AYBFou09GjhjzZ91FCmwqmmVng/cVob2cVW9bktbOfjAVVkVmDxsDeb55E/Iy6iL1ue
	RGJry8iv9vTNXMHktfEBB0AWZMj87gwaJKBtX20ia7Q6o31vNDNJ52xCqx8p31njXHkIwdflZ+u
	NR3y7b2u7qJes7iin+AG00uOCPJq3C+pVkOPObmU/LR1G83XevqxUAPIT3evSye8fGXbHifHTJD
	66S2ylUrvcXRi+81QOHjl6ck1nrDwlJdHOIzy3UMiFRFq61b9fluEa4AyxC5dMEeZWhO+Lvmot1
	777Pu6y3FsCUUpOfLdz1WNVuU+8++JQ/KODMUaQC3BHBlDWMLeekRWv1Wbq2cedQGC9Axf+x2e+
	L9qrVF1GgBoXQZESX3z2zj7UCksjxDIdNMMTBMgp4wgNOWHsjjt24iD2udiEVliZO6QwDscLrOq
	lZF0sRkk2KKD3Qwn3xoTr1cVE2Po+oNO1gU7e1P0j6ENRLtdrjm9bxZLe167MwwqwpNHj2zob/r
	dc=
X-Received: by 2002:a2e:bc0c:0:b0:3a6:55fa:a63 with SMTP id 38308e7fff4ca-3a9a2cf9a53mr8216851fa.16.1791409156559;
        Wed, 07 Oct 2026 14:39:16 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ae563df4sm1241411fa.30.2026.10.07.14.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:39:16 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH v2 1/2] wifi: ath12k: make external IRQ control idempotent
Date: Thu,  8 Oct 2026 03:38:28 +0600
Message-ID: <ccca0d5d087b862c3b41ab4d3c5849ca0dc2d32b.1791408913.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791408913.git.agent00791@gmail.com>
References: <cover.1791408913.git.agent00791@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_143919_048661_98217854 
X-CRM114-Status: GOOD (  11.60  )
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

The AHB external IRQ helpers change the hardware IRQ state even when
NAPI is already in the requested state. PCI has a device-wide enabled
bit guard, but also changes each group's IRQ state outside its NAPI
state check.

Tie each group's hardware IRQ transition to its NAPI state transition.
Mask IRQs before disabling NAPI and enable NAPI before unmasking IRQs.
This permits an extra IRQ disable before crash-recovery RXDMA teardown
without increasing the IRQ disable depth.

Based on Mark Ruvald Pedersen's ath11k IRQ lifecycle fix.

Link: https://lore.kernel.org/linux-wireless/20260719215817.2468580-3-wabsie@gmail.com/
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nikolai Semendiaev <agent00791@gmail.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 ++--
 drivers/net/wireless/ath/ath12k/pci.c | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 85360365a..a5eaf5bf5 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -182,8 +182,8 @@ static void __ath12k_ahb_ext_irq_disable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath12k_ahb_ext_grp_disable(irq_grp);
 		if (irq_grp->napi_enabled) {
+			ath12k_ahb_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
@@ -326,8 +326,8 @@ static void ath12k_ahb_ext_irq_enable(struct ath12k_base *ab)
 		if (!irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
+			ath12k_ahb_ext_grp_enable(irq_grp);
 		}
-		ath12k_ahb_ext_grp_enable(irq_grp);
 	}
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index af0e882fd..d2a7b6719 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -458,9 +458,8 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath12k_pci_ext_grp_disable(irq_grp);
-
 		if (irq_grp->napi_enabled) {
+			ath12k_pci_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
@@ -1108,9 +1107,8 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 		if (!irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
+			ath12k_pci_ext_grp_enable(irq_grp);
 		}
-
-		ath12k_pci_ext_grp_enable(irq_grp);
 	}
 
 	set_bit(ATH12K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
-- 
2.43.0


