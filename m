Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B493DCA9ED0
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B50ZIxaB0P1k35+NQhIdQPJS8AyS5zQSlPA1ktBSYzg=; b=mjphNb6HFhMgE7orFieOhMfFbG
	Fg4XL23ZXtCBtt038xwYzMstexVf9unh/pSXbw6pULF2NPjEuBq1PJmZ6zxwNoswqfMq1UH1drBbh
	D4fAWiRb6xEczDXLmM9Uqobg2Xkmof8115scrKU+7OHXzGjU6c3iM7JLKjrIHb67A2IISO7oZFJVR
	Pv1Hs1iCFBy1Evs5wyZzELyuWEL55+IP4ZbK7cJihOahihXRPAD10eJbX8SaPx8AXDE4WWfprp6Vx
	XbfTFHWnJ/Xep1Q9L3313vWYhUisYk5uLaek5C36jgLzOiUrhq3O0240rk35BsF/hyS97mIM/4vxU
	hVI7iVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN8-0000000B2f8-1UPO;
	Mon, 12 Oct 2026 16:59:34 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN5-0000000B2eA-3Lpm
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 16:59:33 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-170135e43c7so1099416c88.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791824371; x=1792429171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B50ZIxaB0P1k35+NQhIdQPJS8AyS5zQSlPA1ktBSYzg=;
        b=cIQBGr8ef2xERJS/oKLvHDETGTYJwriv0zWG4aimuIc4lJzQHOsakcdzVQM0308C2k
         Jm9xvyNo2smku3iummhDl31oXszsh1/Fe5pkjO117Go/Y7jFyLUrxzoGCIvnQg5e9BR/
         mEszepU5D+H58D/yr9D/eSbbaWjfYUebkr+ed1m17F/fs0mV0YItyOhGAoeJuRAOTMLk
         SSozSnugeJK23E3G8k6zSw8n0bbO0NRVc0dSlGxUfCgBWI724q+XokTcHa2BtUs6k9b/
         C7KlQyzafHXnxOgZl31Qh5A9D5StkfvR+6KlbECuLX7CtRGbnJUq5GFgxjIqbRljRAWe
         DNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824371; x=1792429171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B50ZIxaB0P1k35+NQhIdQPJS8AyS5zQSlPA1ktBSYzg=;
        b=ollN+yHPBbFNtLuJMOPpAh8RrecAL6HO9L5ZZD8ERZo7pwRcYFfBhp6qsw2wmtLl2I
         tALdUA8ic56kBj/tnsFiEV86Z/dmPNDok3h7KNxJF+4/jwevwz6iPLbwR73rFEgCj5lR
         O5BWYsPnOQrnSc30kC7MFUYBWEXeYyvk5FBcJAwed3RGRWHvqrceCiELp2EziULqUZql
         wqYN+NtPR3mY9Q+dGgqLnS/CbIbpvwLkE2fBZ39GvrigG+hpja+X8bB/Dej6UWfK63f0
         TW/DRm4HzR32A/RptUxURD6vd2ReFXzR+gf1WiuEokEF5FHtRAoMEvqzyebII/nIgtd2
         UoTA==
X-Forwarded-Encrypted: i=1; AKwUvBzvbUoGV6VwTFsfzG9Ixs4wH4bYG7Bxsk8BtA5rTJYHkVSIuXNUOjBvOwqTGK69AL2SW1+LxRk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLSnvx2LyKPm9FhnI9qE1xdj695zcgUvaMK3iotlvliwi0lcD1/
	loAJzbqJ/FlC59K/K3LbwAP3kD7LFR5dLlZ4B+AjHu+A2NNWDjmkXv8TV6GKPJTIvL4=
X-Gm-Gg: AYBFou00vE4Fc/rvJGemAgo0U11l73xzbpxWTUZ/TnpP/HMwVXvquG15zbufVFN1j+s
	NsklSE8dz1rpVB0TgayNGwRGyfdSAQJ1i9PYYa6Cyh9dO5pN3LT6CclQfVaGMdDQJazNMjjQ/Eh
	sDaaDEyqP/DmVVOzOpu6do8xyrxkj36zgJBYT9l7589K01NQ/4DXmL3t9ZFPs1q2JMWZgyT/+2D
	5DLIOeWPq0KYJEx7+4giKkF9MBrNGle1ggpeNu+In5qSzp9KCADHRDr21fCcoNYjy4CEObFcswU
	4ouvF44upFOiQNjJhu/AciNFBsHY7BUNPrI7vz3RtdttHJHMu/+uGiybXWiLYvHBnXL7/5ElPvw
	FFlW1qKn90H7RlfOVEzsn/CCirGkpRq+N8Wmx7IAmjO5SAAScwCSelbGSXI/5bpPoCl0gcXKiH0
	kxwTci9xqBDG2gNopIU0OVMrU4FMd+W+HMzYOclTSCYLrARWvg7MvFgHg2WE+7oKUOdussQNEhO
	SaLzyeHosuHkL/kX/GpP9MW1euYG5tVbn7k1wP/uBNcjiKZs+hwrfoVknqxb6qeBg==
X-Received: by 2002:a05:701b:2058:20b0:15c:20b8:7964 with SMTP id a92af1059eb24-16a63386d86mr14785713c88.27.1791824370766;
        Mon, 12 Oct 2026 09:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:1464:826f:d188:9e33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm34296900eec.28.2026.10.12.09.59.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 09:59:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 1/2] wifi: ath12k: fix reusing m3 memory
Date: Mon, 12 Oct 2026 12:59:24 -0400
Message-ID: <20261012165925.32575-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012165925.32575-1-artem@trailofbits.com>
References: <20261012165925.32575-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095931_838868_4CB88536 
X-CRM114-Status: GOOD (  18.55  )
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

From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

[ Upstream commit 00575bb44b2c2aa53d0a768de2b80c9c1af0174d ]

During firmware recovery or suspend/resume, m3 memory could be reused if
the size of the new m3 binary is equal to or less than that of the
existing memory. There will be issues for the latter case, since
m3_mem->size will be updated with a smaller value and this value is
eventually used in the free path, where the original total size should be
used instead.

To fix it, add a new member in m3_mem_region structure to track the original
memory size and use it in free path.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

[ Backport to 6.6.y: 6.6.y only loads the separate m3.bin, so use
  fw->size where upstream uses m3_len. The upstream change to the
  allocation-failure message only matters for the firmware-N.bin path,
  which 6.6.y lacks, so it is dropped. The copyright lines are left as
  they are.
  On its own this changes nothing in 6.6.y, because the reuse path
  currently returns before m3_mem->size is updated. It is needed by the
  following fix to my 6.6.y backport of 05090ae82f44, which copies a
  possibly smaller image into the reused buffer as upstream does. ]

Fixes: 05090ae82f44 ("wifi: ath12k: check M3 buffer size as well whey trying to reuse it")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 7 +++++--
 drivers/net/wireless/ath/ath12k/qmi.h | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 48d0043fcee9..86cc61dba094 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2518,9 +2518,10 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 	if (!m3_mem->vaddr)
 		return;
 
-	dma_free_coherent(ab->dev, m3_mem->size,
+	dma_free_coherent(ab->dev, m3_mem->total_size,
 			  m3_mem->vaddr, m3_mem->paddr);
 	m3_mem->vaddr = NULL;
+	m3_mem->total_size = 0;
 	m3_mem->size = 0;
 }
 
@@ -2542,7 +2543,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 
 	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
 	if (m3_mem->vaddr) {
-		if (m3_mem->size >= fw->size) {
+		if (m3_mem->total_size >= fw->size) {
 			release_firmware(fw);
 			return 0;
 		}
@@ -2561,6 +2562,8 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 		return -ENOMEM;
 	}
 
+	m3_mem->total_size = fw->size;
+
 	memcpy(m3_mem->vaddr, fw->data, fw->size);
 	m3_mem->size = fw->size;
 	release_firmware(fw);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index a996c6d57aa7..62c7a526f111 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -119,6 +119,9 @@ struct target_info {
 };
 
 struct m3_mem_region {
+	/* total memory allocated */
+	u32 total_size;
+	/* actual memory being used */
 	u32 size;
 	dma_addr_t paddr;
 	void *vaddr;

