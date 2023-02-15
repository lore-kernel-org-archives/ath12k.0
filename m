Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF35DC64EC7
	for <ath12k@archiver.kernel.org>; Wed, 15 Feb 2023 01:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y9oFgzQzVLjkRNO6a2jPPMgBsR0syi8RHnCRmWBWSt0=; b=fy8BH7jj1y6g6t
	ZblAORNOa/a4QYCnV94a7UPONH3P01TTEgUkisiL8Ld6hf2NzP19TphNvTEWJ+P4pIqVOOuRjHziZ
	dQ87dF1OQISQb4Br9EfYmeidbqdSPHBE4J1zGMNR21/8b04s33klt4OKVN36enVqWMqDdrfIdOG98
	u76XTuMMd3tJ/qtW82CzXIa+ca247T6v5cjZVnzCF/SITi1LIrDPKoUOeC5MXWafFm2veo/vbhmQJ
	8CUFo7h3BJemaBy0IJKF6c8ySzUSRICF0xpa3tC3OpMDnMvFi6fZtAlenhMgGCDZWkeyZIJqs3GFM
	MXRiydUPZC/oYOau+Yxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6nF-004Ipb-9X
	for ath12k@archiver.kernel.org; Wed, 15 Feb 2023 01:41:09 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6nB-004IoV-Ce
	for ath12k@lists.infradead.org; Wed, 15 Feb 2023 01:41:07 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VbhioS7_1676425261;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VbhioS7_1676425261)
          by smtp.aliyun-inc.com;
          Wed, 15 Feb 2023 09:41:02 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	kvalo@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] wifi: ath10k: Remove the unused function shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()
Date: Wed, 15 Feb 2023 09:40:58 +0800
Message-Id: <20230215014058.116775-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_174105_628343_5D045E29 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

The function shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()
are defined in the ce.c file, the code calling them has been removed,
so remove these unused functions.

Eliminate the following warnings:
drivers/net/wireless/ath/ath10k/ce.c:80:19: warning: unused function 'shadow_dst_wr_ind_addr'
drivers/net/wireless/ath/ath10k/ce.c:441:20: warning: unused function 'ath10k_ce_error_intr_enable'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4063
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 52 ----------------------------
 1 file changed, 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index c2f3bd35c392..b656cfc03648 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -77,45 +77,6 @@ static inline u32 shadow_sr_wr_ind_addr(struct ath10k *ar,
 	return addr;
 }
 
-static inline u32 shadow_dst_wr_ind_addr(struct ath10k *ar,
-					 struct ath10k_ce_pipe *ce_state)
-{
-	u32 ce_id = ce_state->id;
-	u32 addr = 0;
-
-	switch (ce_id) {
-	case 1:
-		addr = 0x00032034;
-		break;
-	case 2:
-		addr = 0x00032038;
-		break;
-	case 5:
-		addr = 0x00032044;
-		break;
-	case 7:
-		addr = 0x0003204C;
-		break;
-	case 8:
-		addr = 0x00032050;
-		break;
-	case 9:
-		addr = 0x00032054;
-		break;
-	case 10:
-		addr = 0x00032058;
-		break;
-	case 11:
-		addr = 0x0003205C;
-		break;
-	default:
-		ath10k_warn(ar, "invalid CE id: %d", ce_id);
-		break;
-	}
-
-	return addr;
-}
-
 static inline unsigned int
 ath10k_set_ring_byte(unsigned int offset,
 		     struct ath10k_hw_ce_regs_addr_map *addr_map)
@@ -438,19 +399,6 @@ static inline void ath10k_ce_watermark_intr_disable(struct ath10k *ar,
 			  host_ie_addr & ~(wm_regs->wm_mask));
 }
 
-static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
-					       u32 ce_ctrl_addr)
-{
-	struct ath10k_hw_ce_misc_regs *misc_regs = ar->hw_ce_regs->misc_regs;
-
-	u32 misc_ie_addr = ath10k_ce_read32(ar, ce_ctrl_addr +
-					    ar->hw_ce_regs->misc_ie_addr);
-
-	ath10k_ce_write32(ar,
-			  ce_ctrl_addr + ar->hw_ce_regs->misc_ie_addr,
-			  misc_ie_addr | misc_regs->err_mask);
-}
-
 static inline void ath10k_ce_error_intr_disable(struct ath10k *ar,
 						u32 ce_ctrl_addr)
 {
-- 
2.20.1.7.g153144c


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
