Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4031CA9EDD
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSUpEqLrV0X2B9mHs8V/zQL6TPWRwBaZtNzo85tRy5c=; b=xNJMVR0m6y0KjSJ7N6eb7uEhRJ
	YiGdc/NZUMOdMyWvnw/yBSeN8p+vdtwVToPaai09nNd5b1z8pP47tMx5iCUf3CBJpGrtbPY5JZhB3
	+ojicvY5ImBUv0Hp/eB5MR/lXqR5EPnb7XVNqmgvWYncWefPIayH9p4PGnrvXPD6L88AdYaAYCZSs
	75pP5XCKM656V5KT947J/Es2aGhwnMk5m+6FBGbt4wT8l92yWjNTamAx/plsI+025SrcstM+5RIVK
	ln+tp8+dx/rcp8baT3xFbwrtxqzbJ2T/rnFirQ7dC/YXujunAUKfNXOs364xa5jl4q2/6HLzz2Bgp
	xzhxpJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN9-0000000B2fw-236t;
	Mon, 12 Oct 2026 16:59:35 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJN7-0000000B2eY-0NFA
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 16:59:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-33e6279a1d7so392486eec.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791824372; x=1792429172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSUpEqLrV0X2B9mHs8V/zQL6TPWRwBaZtNzo85tRy5c=;
        b=htBBif/CNvghSTc7Sn100oLwFZtBE69IfQNzAg3Kcy/bYO0ZEjKHzrcjghTGhwxl3c
         xbY5O108YxPaSc3kK9LgID5xLBqmV4c7G3PWTtjjoQVCthUZ5RSo1ioBR1AXNP9Vb5JI
         jlEIELTouDqSKSnBbdFI4PQ+kgBzIwF12JHy8QhAsAL2UZ1B/bwAS7ffUS6EKdbfn2Ev
         nzVEVF5xAIiCeeKyGmsJPB5RKheOuc8lpM2x7Ks7xJgb7EFvFP2lVc4E/qjhuyCgjGUj
         JB0XfVcEH76e5U/AzV4xpDcJI0tJbJQ9RzSXVGago6UQfTWJiuBlUyxQly6BxKyZz87B
         mUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824372; x=1792429172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSUpEqLrV0X2B9mHs8V/zQL6TPWRwBaZtNzo85tRy5c=;
        b=PhLK1LO+9RwZ1+e1hz5H5mBiuVdrpvNO6azi2n3vjaGw3/TLV6i+0C6QcpNbnE0mEi
         kwH1z5Wou8h2Z/AyIu9BZ1QG1pAhM9yfzGPkukcxsfXwEhnmwGMeH/jw8uzG2MvjCY6J
         fQV7cPqMP5EptGq+Lk8+Fryksw1eoH9WPfTOy5IZzZndT7qd93xDUvCMqux1dz0Vy/aF
         ZuHndNX55Pk3vI3MZRZSA5PHMqfITBZmHJOxH/jQKfMlX5J+8k49/PgpVjZJVNsJzXOo
         VoCLG45FAE3mPRzozfDILmV6Vt3fM+cz7HSyaEKFaDSJ5hen5R+4lHkU1fBsH4z+MZiW
         qllQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk0Kw1iBKRXEwq4IGO6evDUmPmC7rteShv/b9c7zo3Nc9ylNuhh27FWqPjUkWKdFZNh9NQ9+0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0NHL5tkl8Nf5z5YvIB2PTmFPvw4lPoXg14dW/3Ka8nN/f3wP+
	eMI0+svcSiPPXkFYInN9MnKQN1uGFWu9u9ffZ1I/9MBXupqFN9BeREurm6HG5CtyBdA=
X-Gm-Gg: AYBFou0Qyg9khhfP7Rl8CZP+CcDze54yhEpFfgLygp6kmX3zyg357R9YlEq92FzDANc
	FGNyjb1Vhx4MSBAARrROlrhfrAKw05GPuberG6we4e/vkqVFLJrMGnC3iPUyjjS0Abloe/2bg/M
	UZkoDGwCb3HqNXvOUsQ9cJl9DgdswMYwQlpg2rhGLWP/8dvc0+2TplVuLCF+179WjVXnzahW+hi
	dSLCUoup7o3Pt77cI/7WD5kzsJcbKGIig7gpK5aHHJUSjFE3Jc4MCtxiYNLEbNU4MEsSmA2PHCJ
	5Lkxm7HmiacaqWrGFVHm5eooYmb60lcAOQtns3SwTQ8DWtLHlb33mwPi9wueSkGPF/dUwCV2uxz
	fSwQcaGHAbuZsedjT/X3ndkCy1eQVpPLwNor43x3T5nMzH7i3ReGjqSFCrDttCyuJ1Hcp99v7Hu
	VC9aQUDjntus/eVPeyA14UHXz1m+wn5L+Nj2NflyB+rlNFjD7EoSNmu9HvIZ8y9a3HSNCsx4N95
	fzkbtm1XVOAC7EdDeu7CaxLrvxDa3UokaRuDZfD5uOdRGbiqv2LmshOI+5ndCD3+HyPs3tBoOqf
X-Received: by 2002:a05:7301:77cc:b0:357:e9:dcea with SMTP id 5a478bee46e88-35700e9df2fmr11300677eec.15.1791824371897;
        Mon, 12 Oct 2026 09:59:31 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:1464:826f:d188:9e33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm34296900eec.28.2026.10.12.09.59.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 09:59:31 -0700 (PDT)
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
Subject: [PATCH 6.6.y 2/2] wifi: ath12k: copy M3 firmware when reusing the buffer
Date: Mon, 12 Oct 2026 12:59:25 -0400
Message-ID: <20261012165925.32575-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012165925.32575-1-artem@trailofbits.com>
References: <20261012165925.32575-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095933_155821_1A6B09D2 
X-CRM114-Status: GOOD (  13.91  )
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

This fixes my 6.6.y backport of upstream commit 05090ae82f44 ("wifi:
ath12k: check M3 buffer size as well whey trying to reuse it"). There is
no corresponding upstream commit, because upstream never had this bug.

When the existing M3 buffer is large enough for the new m3.bin, my
backport releases the firmware and returns early. The new image is never
copied, and m3_mem->size keeps the old length. Upstream instead jumps to
skip_m3_alloc, which copies the current image into the existing buffer
and records its length. As a result, after recovery or resume, 6.6.y
gives the firmware the previous M3 image whenever the new one is the
same size or smaller. A larger image is reallocated and loaded.

Replace the early return with the upstream goto skip_m3_alloc. The
previous patch, a backport of upstream commit 00575bb44b2c ("wifi:
ath12k: fix reusing m3 memory"), keeps the allocation size in
total_size. So copying a smaller image no longer changes the size passed
to dma_free_coherent().

Fixes: 9a38ba5561d9 ("wifi: ath12k: check M3 buffer size as well whey trying to reuse it")
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 86cc61dba094..8dc1c8e0c7b1 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2543,10 +2543,8 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 
 	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
 	if (m3_mem->vaddr) {
-		if (m3_mem->total_size >= fw->size) {
-			release_firmware(fw);
-			return 0;
-		}
+		if (m3_mem->total_size >= fw->size)
+			goto skip_m3_alloc;
 
 		/* Old buffer is too small, free and reallocate */
 		ath12k_qmi_m3_free(ab);
@@ -2564,6 +2562,7 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 
 	m3_mem->total_size = fw->size;
 
+skip_m3_alloc:
 	memcpy(m3_mem->vaddr, fw->data, fw->size);
 	m3_mem->size = fw->size;
 	release_firmware(fw);

