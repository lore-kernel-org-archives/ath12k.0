Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D634FA1FC5
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5KzLQvcvG3E9iSzYk3XJze4x7fJp0aGFxlrrvbdfr4=; b=L4m3oEcKu0QbxYefhY0ySeQuoT
	XAJq+rIIRTBaRvq+4NvijjmCx1TtiL8YDw2l9C89OoXJ6WsPZL1XM84QZVVQytT+MTIepvPGsvsn1
	Q3cxnVz9FCiiuD6OhJXuFUOKJne3Z0oTgh03UWC0KRlPwF6NZFaXp1VVJwblwvRzCw381iqc+Plgw
	Nuxf1RKBywhXcDmrVJe3lwkzDuIzU9PhkIs6k36i71yZKDuluwoZ3d/5Ks+ZCgzuSsnScrwBEFxH+
	XRFI9rKwsHRp2R7QgnL7GfWrNZybQiC/uvCwhCaTSrD//VLBe+douiPAOU4ftITCHndtNpE6CRk44
	UrjuKf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaUo-0000000AWQV-3aMe;
	Wed, 22 Apr 2026 16:32:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaUl-0000000AWQ0-2dHU
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 16:32:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891cd41959so37875765e9.3
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776875529; x=1777480329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5KzLQvcvG3E9iSzYk3XJze4x7fJp0aGFxlrrvbdfr4=;
        b=ISTACO4qSlF2FHBXr7zNB/KIjDjZREbJp7QlcC6a9FTNHGgPS/v3CppfYHFsxDtrs1
         IGI3+jXIkS59r1hNhibyKto+o69vIGodv0eq6/bODMDKIb/pdz4mD73fjgugL8wz2i1h
         9FxM3QElVZemn5JtpfzNRhwbNo+2GJ/2ck4xtpoMQSx3fsys9XDGcvtplVGglvf4HXT+
         a/9rN634FuunM6t5fvdpcyfyXlcVgIK3+eXQOaxhnyVqtAkLEUUlgV+CM4qu+LUbNowj
         Htic4qgHavDIknoB1/oNB208NQz8xc6ZMfGLlKlH34DtF4CHnQZw0T6Mn/8XAXetIIZ+
         pFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875529; x=1777480329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5KzLQvcvG3E9iSzYk3XJze4x7fJp0aGFxlrrvbdfr4=;
        b=Qx45pjJISR3jlbzgB+7DtWh0KdqAbGUXvRhrnGgFZikMou5XBZUiCaQqDSEzr4O4NR
         gUa0jhkYcykHZHTTbkyNJY2F9W7atdrNV3w/LPO53Kx3OHADZSzlwKI6ot634zCmrOFv
         kbSrCM12atuufS+2IaUH9xNHIubb5HHFzZ1w16/aT1BtWUhg8dzp4uePQFO/SrR7R3SP
         ZchsTC73zii9Z67jQH8NNCvLrqId7P6FYJi7+gwq6sC84iUPN/RLJ7prtXZOV1te7okM
         ggxbI4PH/np9CbW949TR8P1rH7u22gj1uAxbUMKTXl9Ea6917s8VvcMOznRgXNt3xMzv
         DoYQ==
X-Gm-Message-State: AOJu0Yy4a8j31nMrWDT1IERVl60Jx/CgqAMQMLBfVOsZmOQGtphoM6q3
	CfraNnmjrjQfPUCRm/NeAhMkZrtdPkd0/wcgUyRcqXiUcXA8uV9/fJ6hrYX5ZQ==
X-Gm-Gg: AeBDiet9pAq1ZFTl73W56QmTyGFywGFUApC7so53AUkrIHDsQHXg2t/A3ar1lrclQRw
	+62yjQgDZ9Dl/Wht0HdskwaHN3jeDlprsfmhbNxOBkiyTVGW92rpX7yV6I/Bvr5+B0tNRqEUxWI
	ovB8ODEfJCLJDn/NA75/XHPrARQ78FyLtsKrX76ancvaM698MAfIBes2Vb2uPvJ37siBQ47wOMQ
	g872HRGWt5nkdYMavR3YHZ4n/qty3xV5lcNVgs5K8v3YMTAbIPW0jJLIydRsTUHdT2KOeBPyGS5
	kaJD4zITu+vNGwVg139KrVbHv6VAN2IoLtcWNfEGOrVwrxesYwiBSLrglQCTiP74UaTe5qXjOvF
	Oii6hLbB7VF/VkBpeYBe3v8cXYSkGxOweZHN6S3/IK/2Xr2TRaYJYbtayVTOlJQlgiUmhSiDyQx
	PrJFXryn+lIQdsnwOwLxCw2xBdMcmFJRMXywqZ8M7WgCV3fZ6CzXmXARXU/GQZ9ZvVdVs=
X-Received: by 2002:a05:600c:8b2e:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488fb7469b3mr356008235e9.4.1776875528953;
        Wed, 22 Apr 2026 09:32:08 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm514056465e9.12.2026.04.22.09.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:32:08 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: unify error handling in some ath12k_wmi_xxx() functions
Date: Wed, 22 Apr 2026 18:32:07 +0200
Message-ID: <20260422163208.3013496-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_093211_688608_7EFE25B6 
X-CRM114-Status: UNSURE (   8.63  )
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

This is purely cosmetic changes that simplifies & standardizes error
handling for functions that ends with a ath12k_wmi_cmd_send() followed
by trivial error handling. Saves a few lines of code too.

Compile tested only.

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++--------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 350f249f5ba6..bfe4af76304c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4199,12 +4199,9 @@ int ath12k_wmi_pdev_lro_cfg(struct ath12k *ar,
 	if (ret) {
 		ath12k_warn(ar->ab,
 			    "failed to send lro cfg req wmi cmd\n");
-		goto err;
+		dev_kfree_skb(skb);
 	}
 
-	return 0;
-err:
-	dev_kfree_skb(skb);
 	return ret;
 }
 
@@ -4335,12 +4332,9 @@ int ath12k_wmi_vdev_spectral_conf(struct ath12k *ar,
 	if (ret) {
 		ath12k_warn(ar->ab,
 			    "failed to send spectral scan config wmi cmd\n");
-		goto err;
+		dev_kfree_skb(skb);
 	}
 
-	return 0;
-err:
-	dev_kfree_skb(skb);
 	return ret;
 }
 
@@ -4372,12 +4366,9 @@ int ath12k_wmi_vdev_spectral_enable(struct ath12k *ar, u32 vdev_id,
 	if (ret) {
 		ath12k_warn(ar->ab,
 			    "failed to send spectral enable wmi cmd\n");
-		goto err;
+		dev_kfree_skb(skb);
 	}
 
-	return 0;
-err:
-	dev_kfree_skb(skb);
 	return ret;
 }
 
@@ -4418,12 +4409,9 @@ int ath12k_wmi_pdev_dma_ring_cfg(struct ath12k *ar,
 	if (ret) {
 		ath12k_warn(ar->ab,
 			    "failed to send dma ring cfg req wmi cmd\n");
-		goto err;
+		dev_kfree_skb(skb);
 	}
 
-	return 0;
-err:
-	dev_kfree_skb(skb);
 	return ret;
 }
 
@@ -10874,10 +10862,9 @@ int ath12k_wmi_mlo_setup(struct ath12k *ar, struct wmi_mlo_setup_arg *mlo_params
 		ath12k_warn(ar->ab, "failed to submit WMI_MLO_SETUP_CMDID command: %d\n",
 			    ret);
 		dev_kfree_skb(skb);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 int ath12k_wmi_mlo_ready(struct ath12k *ar)
@@ -10902,10 +10889,9 @@ int ath12k_wmi_mlo_ready(struct ath12k *ar)
 		ath12k_warn(ar->ab, "failed to submit WMI_MLO_READY_CMDID command: %d\n",
 			    ret);
 		dev_kfree_skb(skb);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 int ath12k_wmi_mlo_teardown(struct ath12k *ar)
@@ -10931,10 +10917,9 @@ int ath12k_wmi_mlo_teardown(struct ath12k *ar)
 		ath12k_warn(ar->ab, "failed to submit WMI MLO teardown command: %d\n",
 			    ret);
 		dev_kfree_skb(skb);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 bool ath12k_wmi_supports_6ghz_cc_ext(struct ath12k *ar)
@@ -10997,10 +10982,9 @@ int ath12k_wmi_send_vdev_set_tpc_power(struct ath12k *ar,
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to send WMI_VDEV_SET_TPC_POWER_CMDID\n");
 		dev_kfree_skb(skb);
-		return ret;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int
-- 
2.53.0


