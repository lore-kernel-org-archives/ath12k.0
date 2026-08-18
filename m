Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C249C5DF74
	for <ath12k@archiver.kernel.org>; Tue, 18 Aug 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m7dVJLkNi28+BTlhsO3WjBgH7kpW+cZErXxqcXKNxuE=; b=RAMb1vHwzRFDLR2XU+/zZ5B2wc
	saMRErRRFvf61YRWqCGnJaoBCWkYPQbHhKBjHA65HlH10jEVfVuF2IYWn4ES0OIrBDLfGEm1q+Pco
	3mZva2xAejuzaIO8KiWHaU8AK8KCsXge8adVcqxjCVAZGeHifrTSoP1qAKQBp3bxQhUiP392EEwBx
	k0bTTkjA0xaGL/q3cq2Zo3ZDBGFJz2fQzH492FjYgAkXBpv/QzMSVa22OtjAlVewc6PG0UnBdV3YE
	/w9rWMAtwkV0XEuH9w7VS+qYfEh6ztZEtdp8Ogfr9hNurT80AYblu/fx/F3zj4ogpYcOQqTnHsQvk
	ku6vyqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLFY-00000008D1s-2zPe;
	Tue, 18 Aug 2026 14:57:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLFX-00000008D1k-1CLI
	for ath12k@lists.infradead.org;
	Tue, 18 Aug 2026 14:57:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C19E4124D;
	Tue, 18 Aug 2026 14:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1211F000E9;
	Tue, 18 Aug 2026 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787065030;
	bh=m7dVJLkNi28+BTlhsO3WjBgH7kpW+cZErXxqcXKNxuE=;
	h=From:Date:Subject:To:Cc;
	b=IlG2V5RofAupbPL4mXBtWcP1II1kkYrwfkFijrAKD6EDmc1cAaUQskgFP08KeSj7W
	 eP3KsuqOHQg1y0ushC6KK7vXuSKiyO0NoX3MQKCsl26RDqktrE07ZZS/B0L/3WhsyS
	 yNO85xUL3vy6JygEfGXIDfV6JlEbhgq/c8f1jamIOnIfr+YzJMfYn2d3Pen4/VEFP+
	 2JQLeRf/UoRKqEHFTFSH0e5lkC/p8+oVkT4OXKdm9Pi7+rN2+SosoDJMjl5EAtB/Bo
	 pMgLRuGSHU0uB8ztaosnROXTQhlksykMuxLXZ20AtHeYRm3Ric30sdd1IoY9g4ADh5
	 jm8jFerXJi3LQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Aug 2026 16:57:05 +0200
Subject: [PATCH ath-next] wifi: ath12k: wmi: Complete regulatory update for
 dropped events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-topic-wifi_reg_fix-v1-1-18c7c289e528@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSeYUFSvEhE2jjUtKrQbhO+e1
 fI7cP4bPDkmD3Vyg6ODPS9zRJYmgKOeBxJsokFJVcgyK8W2rIziZMudo6GzfAmtJFYqLzC3BuJ
 xdRTnL9q0v/3eT4TbW4IQHqD0uxh2AAAA
X-Change-ID: 20260818-topic-wifi_reg_fix-a20c9256c5fd
To: Jeff Johnson <jjohnson@kernel.org>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787065027; l=1840;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hvZ5AUZfou67LdEvHueGUsn8P6t9OZp7Fyj2rqGhT0c=;
 b=YegAy2qbb3sIHDaFpOU2QMaLFi9phuM0A3HuJNqUxyn5hdSI+uUZ+ZzlRY1iXJj7OkaFa3jeQ
 +Nm8DcWlng7DP6TO3koWMnwKw1JY5mHsd/mmdrGJQZx9okOv72Rk7ql
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

If ath12k_reg_validate_reg_info() returns STATUS_FALLBACK/DROP (which
are not fatal), the code then jumps to mem_free with pdev_idx still set
to 255, making the following completion never take place.

That then results in repeating "Timeout while waiting for regulatory
update" messages, as observed e.g. on a Glymur-based ASUS Zenbook A16.

Fix that by updating the pdev_idx right after the actually-fatal case
of not being able to extract the reg info data is ruled out.

Fixes: 906619a00967 ("wifi: ath12k: handle regulatory hints during mac registration")
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..4ac78ba6c790 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6975,6 +6975,8 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 		goto mem_free;
 	}
 
+	pdev_idx = reg_info->phy_id;
+
 	ret = ath12k_reg_validate_reg_info(ab, reg_info);
 	if (ret == ATH12K_REG_STATUS_FALLBACK) {
 		ath12k_warn(ab, "failed to validate reg info %d\n", ret);
@@ -6991,7 +6993,6 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 	}
 
 	/* free old reg_info if it exist */
-	pdev_idx = reg_info->phy_id;
 	if (ab->reg_info[pdev_idx]) {
 		ath12k_reg_reset_reg_info(ab->reg_info[pdev_idx]);
 		kfree(ab->reg_info[pdev_idx]);

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-topic-wifi_reg_fix-a20c9256c5fd

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


