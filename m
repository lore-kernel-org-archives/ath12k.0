Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BFBC98318
	for <ath12k@archiver.kernel.org>; Sat, 26 Sep 2026 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5O5WX6Ju+BA8sTDcfWfc/DMBswAguDXrunWPXvGBFRY=; b=RS6zNKwGEyWbi5UB/uZ/r8sqmH
	+o28evXNfDnVYGaa5Va4CDvIGlY3I3f+ER9InCu9q+jHFOid0gOJLD1SkQAg1pzyBfWBZ9CS2D2do
	FfWao81veHy18FJWE1arHORzyPvr4Cv4RrsU4LOHP13OCVGVpm2m1NaO/wb6OHiTpjSz2RmCgg4L1
	SV0oPFSYJMSmGVzcdgw4rw9sye19oknzOP5hSeHy+JCV/frpiEiOpE/D/+2nBUdcz1kdvJrDBl+cS
	T9US1KLGKTZOkFYnJwB5/nxI0IrlvNhcltokPhhw2ogWqF9o8uA6Wam07P8yTLsu0lfWwbMqwwNEC
	b7jW8y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHO-0000000FMDJ-0VPp;
	Sat, 26 Sep 2026 12:13:22 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARHL-0000000FMCf-2FRR
	for ath12k@lists.infradead.org;
	Sat, 26 Sep 2026 12:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5O
	5WX6Ju+BA8sTDcfWfc/DMBswAguDXrunWPXvGBFRY=; b=mWshQn5aDYXgv8GStu
	jCnazaaT+qbi8BMT0omrLuNZnKElrHKRzdVmzR8jrAvqYCiSAmFf7dwrNTX6pDgB
	F6MJDpIeqq7F2gM9etlEW7dUROqzVscerpDgiwmzD7bZR4VxjKdv89E6i6fnT45j
	OnJj2DS7hXdQranKalU4+x3Lg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338nKtrdqfXOcAw--.9011S4;
	Sat, 26 Sep 2026 20:13:02 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
Date: Sat, 26 Sep 2026 20:12:49 +0800
Message-Id: <20260926121250.3258285-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926121250.3258285-1-yaojiale02@163.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD338nKtrdqfXOcAw--.9011S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWDWFy5GF1kWry5tF4kCrg_yoWDCrbEqw
	4rtFn7Zr4fGF4jq3yxAayavrWvkas8XF1kWrnaqrWfC3y3JrZ8Ar95ur18XrWI9ry5JrnY
	kr9rJF15X3yq9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKDGYDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w9po2q3ts8f1gAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_051320_190179_9912BA8C 
X-CRM114-Status: UNSURE (   9.27  )
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

ath12k_write_htt_stats_type() accepts count == size, which fills the
zero-initialized buffer without a terminating NUL. sscanf() then reads
beyond the buffer.

Reject input that leaves no room for the trailing NUL.

Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index b772181a496e..f84f1828275a 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
 	const int size = 32;
 	int num_args;
 
-	if (count > size)
+	if (count >= size)
 		return -EINVAL;
 
 	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
-- 
2.34.1


