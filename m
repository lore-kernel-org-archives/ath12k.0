Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3806606D805
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 02:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MUEqrY7X;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gdFR6Dtz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7LsjOtSFfh2NlyzX9thx9qIfkA/SfAfsf3PEzAZ0vbg=; b=MUEqrY7XZxhyDWB7KZSp34AcE1
	NdIIxlgvLsfJZjebjTGkvYfXAcPvna9m3kZ7MfvTHrtclUChTFKE9iIrP8ap9r0vtF/fUTiXyqJrN
	hkFOZYN9s7LyBgYbDKf14AWwtn+m4RyNfJagbcSleLkmF0ccKjE/rcn6aRTa+6P7nh8WdBRLmW3v4
	QRFyMgeIIDmRsR55a2QGS2DWq5MV7dx9qoqAPYGo6RW2xLJVr5t+lQ1xfTPYfz06ZgScmJcFPQ+/H
	qtskyeL38b3xa+lyJIPUO+Fgpab6NCJLH14GPgZTPpo9zBCYlbij8i+0wQQ8mrn9Vy/Wg4KoioQYF
	1SGB8p8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQp1-00000004A9c-3tEI;
	Wed, 04 Nov 2026 02:33:55 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQow-00000004A6S-2FxE
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 02:33:55 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 536858af8;
	Wed, 4 Nov 2026 10:33:45 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on init failure
Date: Wed,  4 Nov 2026 10:33:44 +0800
Message-ID: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a467c1d503a1kunm8831a46e1636fa
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR9MVhkeHRlJHU5MSEhOHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=gdFR6DtzfEExiqT1N++04TlU1WsxHI3HrcffSv0EPKKjJr3VAhVfNSputBzwDR9VMbZ6TmDKhOxsVMPqhRB0zUtFqCGvLr3iIieDTI4RWyBkwNfwLG9PTRToHEQQesJNGrqLnNGGstIU3Xv8KQVE7q0wsmI/cLNKElnTjhvK1CM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=7LsjOtSFfh2NlyzX9thx9qIfkA/SfAfsf3PEzAZ0vbg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_183351_162895_FC557B8E 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If either DMA pointer-buffer allocation fails after the SRNG
configuration is copied, HAL initialization returns without freeing
the copy. Its callers skip HAL deinitialization on this error.

Free the configuration on both allocation failure paths and clear
its pointer before returning.

This issue was found by our static analysis tool under development.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: x86-64 Clang W=1 changed-object builds passed with
allmodconfig and allyesconfig. No hardware/kernel runtime test or full
linked-kernel build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 drivers/net/wireless/ath/ath12k/hal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index c0c3d2f047ef..8dafbe44df38 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -744,7 +744,7 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
 
 	ret = ath12k_hal_alloc_cont_rdp(hal);
 	if (ret)
-		goto err_hal;
+		goto err_free_config;
 
 	ret = ath12k_hal_alloc_cont_wrp(hal);
 	if (ret)
@@ -756,7 +756,9 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
 
 err_free_cont_rdp:
 	ath12k_hal_free_cont_rdp(hal);
-
+err_free_config:
+	kfree(hal->srng_config);
+	hal->srng_config = NULL;
 err_hal:
 	return ret;
 }

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

