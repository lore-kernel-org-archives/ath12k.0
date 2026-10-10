Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4061CA6004
	for <ath12k@archiver.kernel.org>; Sat, 10 Oct 2026 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPzUTBNIsG1vnWSfHU0KClPEm42wHLDDcUKF5FSqaVc=; b=yjvqJZTshbzlZ+iEsEvJWKiqp7
	WoR2u4h7qTKZ2KQS2S31D8Wb5EzJQPV26Ki46wPP3Z1livBScrwrqojUwRsxz6wWgu49LmDyfkWg/
	evqcldSMUBodHnil5/jkQbYI1M5RIK4ryJV5DCSCTNWU0GXXhTSZnN41LjGw6j3KaqJxBKvczRcyO
	PeaeaAF25TAm5K5q/yvXzZzouO2wjb4g378WnMG+vx/CtTaPFRVKdrr/fsT7Y2HDX9wUbmEiLfmSU
	8nKnSL3OKk/b8bU5Ha4u3QhAzRKaqYzMwHGcJ0vJOwn+NWYrmYnKtd2m1zQND9jDb/4p01KrS0MHn
	yJWhX+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFPMx-00000007XDA-0vpq;
	Sat, 10 Oct 2026 05:11:39 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFPMu-00000007XCg-2Nwt
	for ath12k@lists.infradead.org;
	Sat, 10 Oct 2026 05:11:38 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15168a20b47so291304c88.1
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 22:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791609095; x=1792213895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPzUTBNIsG1vnWSfHU0KClPEm42wHLDDcUKF5FSqaVc=;
        b=SqGwlv52qrb5tflr4+8iUImSqjCeomdqAiJZWpqUywJX8ABJf83/M66fEFuTzrBpy0
         z1a99tvpTegUj+BQjhNCvdbgOPrJ+7XQzcaZQM7fO0s17gD2LGeZbGo3SRQCXC0C938g
         BbYwhw1oMcLBW+FjDpDxJ5aUiJoVO8N+ygLgMwnOW+5kMzAa6gDVDSko1wNRqkuyxBqr
         nRfAHmgTOEYs3gjr1SLf1VpuPc2NZgI0gIg368yt0AJbT3kr8k0v/3rUExjkqPWL2e9L
         xpAR3kHQ3oyqvfXj+jF1vnaJGpvf2LRrv0eniEZ99Z000hSO9NM4u0wcUNkWwm0cmYd0
         v3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791609095; x=1792213895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPzUTBNIsG1vnWSfHU0KClPEm42wHLDDcUKF5FSqaVc=;
        b=0dNhJpAvc9xZdFCBnpsDF83COUx7gtLGRkhGI7HEhd2WeUoLZ6VOmfYjWyh6lmqoG8
         wB2qu8MDETsBSrNE88qeskI2JTGBOfifZJTxt8wlG6/lknw6rGzof+fW4ijPp2KLIqbk
         xdXAI5VH2/P/Zlid07NFbznJ4XTqwrNFrpIDC3eRMbLmg9V1WXm61mAqCuDg8RKiAvEC
         gn+Ii+RgAKzKGXDJ9ud1TKUy8M55DXMmORvdu9OtH1Zc0WdUP0ck6Kbs4yg7JBzf6LL2
         Mj0beuqALeIO9tM4k8KtSf8gRf1zp7hr/Kr/5QX8HFVFjmhqUx93ncHgCWL2z4LZVh4m
         o1eQ==
X-Forwarded-Encrypted: i=1; AKwUvByilZpKSpIeExnfTqHUFRiWb1kaEAiqhN2VENFlW+ySQ9lpvfohxXJWOSE7bIWXCpxTWScj58g=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUiWw8UFM8ZvzikGSjzYz1+ozu3yQWGLkcjjxtL0Koxdhp9Opx
	8vI9y9TGrhEd7h1sPermxdh1yYr2foUF2vvRMagEFptCXZOT6S8HV2HEVsCNuRm4B0M=
X-Gm-Gg: AYBFou3SczeGhjdFPwCDnQe+ZYtxJ/dHV5Vuj7KDyh8ZwJLir8b2redN8tRAa/nvxom
	wVmNc1WV4uXVlGXScErFCmfPTFMnLoA5UPSfy8nv1YZpQ8M31/OC9XkU4QT83w4a/oJcEQH75T7
	YH7q6Rdx5WWBTX81IGTsoUEerGnQXIg1rnCeGSP9pZH78YswXgxyPrafTrvpyXmiN6PdUkj1Ydi
	sqv/H89YA0MmixTfryZRTIa4VbWiqbTRWMOuEvAHmlm1bkfTUeMQN85CKVyUyqoYmtBijSjvkYU
	zDgsXAxChNUp83Fhd6LREy6pWWtS94xstkiCyV5IQ0qvXjdcAw5neGVChTJSTz/2LSQ0+WIjikt
	vY9VJ4H7T3LbV+LH06IHTAvs4xmD0dClbD7glX5m7W+w+fBDwMzlQ6o1z2fZWWMtMQ9zKn8YJlj
	76Vbpa88X1yunro+9hGm7KTe5tLHpoEYXW/LcR5IxeHwgCOPOb8d0lDgB9O3N4i3acqYTi6alC2
	VWUlmVon8m2gF0knA+HKhK/3RdR5NmXhNCQspSCdxG+zbaeUZZhxo5m5G6dcO9c8rzc34k=
X-Received: by 2002:a05:7022:7f0b:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-16a4f627a7cmr5226042c88.0.1791609094685;
        Fri, 09 Oct 2026 22:11:34 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:fc0d:3183:3e45:a830])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm11181963c88.5.2026.10.09.22.11.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 22:11:34 -0700 (PDT)
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
Subject: [PATCH 6.12.y] wifi: ath12k: fix reusing m3 memory
Date: Sat, 10 Oct 2026 01:11:29 -0400
Message-ID: <20261010051129.14918-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_221136_623224_5DE0168B 
X-CRM114-Status: GOOD (  22.38  )
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

[ Backport to 6.12.y: drop the copyright-line hunks, which do not apply
  to 6.12.y. The code changes are the same as upstream. ]

Fixes: 05090ae82f44 ("wifi: ath12k: check M3 buffer size as well whey trying to reuse it")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and ath12k maintainers,

Please queue this for 6.12.y.

6.12.y has the bug this fixes. When a smaller M3 image is loaded into a
reused buffer, m3_mem->size shrinks to the new image length, and that
length is later passed to dma_free_coherent() instead of the size that
was allocated. The patch also fixes the allocation-failure message, which
reads fw->size even though fw is NULL when the M3 image comes from
firmware-N.bin.

The fix is already in 6.18.y and 7.2.y.

Testing: applies to v6.12.112 and on top of the current 6.12 stable
queue. An x86_64 allmodconfig build with CONFIG_WERROR=y is clean, and
ath12k also builds cleanly with W=1. I tested the M3 load and free
functions in userspace with firmware and DMA stubs under ASan/UBSan. I
did not test on ath12k hardware.

An LLM helped prepare, build, and test this backport. I reviewed the
results.

Thanks,
Artem Dinaburg

 drivers/net/wireless/ath/ath12k/qmi.c | 9 ++++++---
 drivers/net/wireless/ath/ath12k/qmi.h | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b93ce9f87f61..5b02d1d76a36 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2724,9 +2724,10 @@ static void ath12k_qmi_m3_free(struct ath12k_base *ab)
 	if (!m3_mem->vaddr)
 		return;
 
-	dma_free_coherent(ab->dev, m3_mem->size,
+	dma_free_coherent(ab->dev, m3_mem->total_size,
 			  m3_mem->vaddr, m3_mem->paddr);
 	m3_mem->vaddr = NULL;
+	m3_mem->total_size = 0;
 	m3_mem->size = 0;
 }
 
@@ -2762,7 +2763,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 
 	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
 	if (m3_mem->vaddr) {
-		if (m3_mem->size >= m3_len)
+		if (m3_mem->total_size >= m3_len)
 			goto skip_m3_alloc;
 
 		/* Old buffer is too small, free and reallocate */
@@ -2774,11 +2775,13 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 					   GFP_KERNEL);
 	if (!m3_mem->vaddr) {
 		ath12k_err(ab, "failed to allocate memory for M3 with size %zu\n",
-			   fw->size);
+			   m3_len);
 		ret = -ENOMEM;
 		goto out;
 	}
 
+	m3_mem->total_size = m3_len;
+
 skip_m3_alloc:
 	memcpy(m3_mem->vaddr, m3_data, m3_len);
 	m3_mem->size = m3_len;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 0dfcbd8cb59b..e9eb186441cc 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -118,6 +118,9 @@ struct target_info {
 };
 
 struct m3_mem_region {
+	/* total memory allocated */
+	u32 total_size;
+	/* actual memory being used */
 	u32 size;
 	dma_addr_t paddr;
 	void *vaddr;

