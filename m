Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EA9CA5FED
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=; b=5Amdo0nA7XExQp2vaszY14Mt03
	2RT2C1pjnvn9IxIqST+JtX0wWtloBHUIZAChjYYN6wh55gQmU6iqLsTBYjszkXsvdIfRcr7D0cgRv
	2qZiyqJkRiiC1KVFOetVdeM/6u4DSagnxkL5XG6T0sU8/S5yuIrD+9sOKQmb2cc5HCrVeLgKyG/L1
	kfXdS3KSgkfnbNa+XD/B+YAokgn2YHzVs0AzlxK4hAS4URajanTCtD3jlDTFfXA1rkNTRzjX64NSl
	g5fq6AWJtmYO2NHxLyk4c0NeCRbmzXnCdvrz3R1D8wq1UOZa5ctq+nFj/RgmiszwnH6XfubzVxN9Z
	abzIj+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1ha-00000000PZO-3rdb;
	Tue, 06 Oct 2026 09:43:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1hX-00000000PYn-2tH3
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 09:43:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2533d83e3bso55815266b.2
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279790; x=1791884590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=;
        b=JaPSdtBaIcKT9QlK/wWBjDuyhU6oyandIb98/x04HBwTgpFBT59Ej6Da6e9Ewfr7m3
         vw4osiX/hqRGpRA0pnnDdNV98aYpPk3iEG3ZhzaR8vKCzzBFauP0eEcdwG9MxZCGRWr+
         9HEPgCsKh5HjnPgTkIztEJF/wrTzUJJrloGrE3N75hH6dxM33gki+I5olbPg8dycdhIn
         jmwWo5kXiKr1HqWV82Gr+dObKB/AfAK7j+7by45Oniocjqk+/SqDVixOueKBTJBknl+6
         9Eq3MCkjQTu17UQ8mt4CugOVe9/KWFtKDrjayVD4fhohRDTOzl1KBf4QCtrC667M3aph
         MocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279790; x=1791884590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL50aAuTc7iXXkRUx082+O87VcrVi0CqO+VpMmcaNUY=;
        b=1oB1s4+zOdS3FjP827/Ld9+dlcmM+D2Gz4OYZSypL0MWTzNtU5Yj25c9/gsPcdzcCh
         VtVLWUGgBywPXAq/yuQ7hhTl9k37+ofB7OnLPEtVcmyv4irw9sHK+IMS4xGbObroshc1
         jq1p7kPCyoudashRN2Anc+oqUhsDTQf3jnDbVNby5hjVIWl75J0WI7odFHJ9/pRXmUHv
         6TlNxYI3LJ1TZseD44PHCTejZRvdglK6gvKfb9G7ELyGkzcDizNyfzUlCJHdA402vgb9
         Hp++kba+u8UgCuAcTILCwQYB7tyatenOONd/qZlMHg/25WZOZpXNzK3yAnDtTxQxOSxn
         9eQg==
X-Gm-Message-State: AFq9FYINRytXkeKGfiOFPG33im/QXvqgHRp2i4m/toBe74v7dwTHVXGL
	3lm+Fzb3whnojVvQA8cHfsDEdQpEYGQ4zwDBh8fLBVu1KQSkPgHQ/ma47hGvcVWJzwypvKZuR5E
	=
X-Gm-Gg: AYBFou3IjMgutQXio5v8tIacNt5R1Irgji6M03Whbj3Q36r8W88YICGH7Ond2mshcjk
	7UDFZuvwVWUw8gG6ytvCNqEfZAwzDJgFSyYG/G+ic3DQj84/2MAdBXP1Axo6eCs6XJXcmJJpGZS
	gdOEzU0uyTpyufJ/S/xJErQvSUHgpmgmQ0BQO+EWpU+sT7aObEVa5bUMQog5HOxnx2d4I3rfCgF
	R2HLzN5wfPJ0+QhhKXDNqWhcbsVGVel3wIrjVhqeDe/MjdEZK3tzDUf7rfm8l9Jky5P4nYtMu4R
	w6/q4gYYEe7o11B4RBXlsZ4qYqJUDKXKrAIovcnF8/E+w0j0zSuoms3vi3miOlGSsdwZt3nhEZR
	jDempJWoo/TCvLvwdVHbEWaMhSGmCx7chIG47o7tE9gkpcntekIGlcY76l0bzNdouPpxyHliIkW
	UVdcUvctZkAPaKymiqe72X76ivXDSIY/4Mkd98SEwDeELcMsgh9PJgYyEEzR2o7uwXUWPvz6JtY
	dE=
X-Received: by 2002:a17:907:971d:b0:c29:53ba:a4cd with SMTP id a640c23a62f3a-c3169fc69b9mr80144466b.11.1791279789844;
        Tue, 06 Oct 2026 02:43:09 -0700 (PDT)
Received: from Quarx2k-PC.lan ([92.124.138.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562da31esm183753966b.38.2026.10.06.02.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:43:08 -0700 (PDT)
From: Nikolai Semendiaev <agent00791@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	wabsie@gmail.com
Subject: [PATCH 1/2] wifi: ath12k: make external IRQ control idempotent
Date: Tue,  6 Oct 2026 15:41:46 +0600
Message-ID: <ccca0d5d087b862c3b41ab4d3c5849ca0dc2d32b.1791279304.git.agent00791@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791233788.git.agent00791@gmail.com>
References: <cover.1791233788.git.agent00791@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_024311_745085_C4422D58 
X-CRM114-Status: GOOD (  11.62  )
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


