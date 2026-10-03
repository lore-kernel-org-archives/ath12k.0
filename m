Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E663CA5FE3
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hM+05E1a1mh/WwKjkgJQR1/fatfBwyc/hZAhxEXV5ac=; b=Vv/Qe/n5V2mUBXZ8Dte4aWgP5y
	skeVipyD9OluDaRrXVqbi0LXY7sk8QZgMbkyJbm1lbsMSA18c1EVt9a0BGMUQPXwIa3aj1b/6w2fh
	fv48xIPTBpVUVtoZ2EOeD5T09kE7yUVBsuN/UAjgxVxSBCZT1U9XO6bmxRVyS0yWCHf8Zkx9pDekh
	Ot0R5Zs31fGAEluRAFmROueCjqmnDJKFWhX7PCJssuC2UA34jr/j9LnuGvBDvFUg6FeUYSgM3kk5w
	XMcjfMHsx0NOXe98/AHyU1CWBWf209wFM6AyWRwfpFtajrz6ITXtQ5ipk1cD5iMdGpVOgS7JcyB9W
	+ZuRrrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWf-0000000DJcA-0vVn;
	Sat, 03 Oct 2026 09:59:29 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwWc-0000000DJbj-0D2d
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hM
	+05E1a1mh/WwKjkgJQR1/fatfBwyc/hZAhxEXV5ac=; b=SCyKpqTS4lzBXhg49u
	dsjRTbSCKLzcNtC1nBNh1krBsMb1mQUPvIqwDJfiLjKiCgylJc69lRrfqSe5X9yR
	tqivRJcqh3xiam/3Cw7AhvZ48lx/roZO9Jj/N8dOW/JmOLQlqtUxsZPq3SIlJURU
	D/lqRwAUNM3JEmNyyHkMxWndI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDHl2Dy0cBq4TNFCA--.53805S2;
	Sat, 03 Oct 2026 17:59:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH] wifi: ath12k: Reserve space for a string terminator
Date: Sat,  3 Oct 2026 17:59:13 +0800
Message-Id: <20261003095913.575108-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHl2Dy0cBq4TNFCA--.53805S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7XrWDWFy5GF1kWry5tF4kCrg_yoW8Jr4kp3
	ykWw129Fy8ur17G3s5GFn3Za4FganxWry2gFWqv34ruFs5Zr1Fqr1YgFW8Wry8Ca98uF1j
	9a1jkr1xZr95t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pitEf5UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhN7tWrA0fMG-gAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_025926_522790_A2350269 
X-CRM114-Status: UNSURE (   8.76  )
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
Reviewed-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


