Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB074C3ABB6
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g/371Q6oQqw1MKBej0mTkEe/j8xwzyts4/XiR604vM=; b=OyQG3UquszPBaibR8xs2RQTe7C
	7Ncq/RkGm9XHPiS4fbkpLNWg60Lj3+97zF3WqbLmAnr2J1KEktU1PlbBaHIlV/e96YofoYlm5mYy+
	KAv/CqUTGQdTwe8SgNWR+NYVB1mAopW5MrHApZhaPhCFv2Tu4s95odXxoB9vc7peBk813jX9YeBy3
	ttcCS9Nw0J14v0YUJqi9HNjfpLbHv7UxC43Q6OrSDO3ygrZWXVmO65q1yteABbF2RgZXnn9oHWBNB
	KtvLYWyAEt7lLDryqEVMAGldG65glMYsBgDbkjHn6VjDJrZStYiAMlt4eHASlNBUkJrx5WUy/LDhn
	U1Y+5rUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6LT-00000009KoL-2NTC;
	Tue, 06 May 2025 00:39:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4RS-00000008oQx-2xvV
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50DA1629CC;
	Mon,  5 May 2025 22:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0828C4CEEF;
	Mon,  5 May 2025 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484661;
	bh=PtKmNWhYuxw+9m13WySu1j15Y14gKpgGSQvph/hqweo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DvLg+OtBRPypsZNGYSEFYmNG2fmwNhpPca2KQ23Xhqno6Y586V8rBrBHrplg4YZpZ
	 +Rg+yyNQyHDE/7OuLS2b01zTpSZIp76BBOOaxWYNwfzis3uxVltEr2djv3fUsrvJxK
	 cUyL0MBWoOfjBQNrrDElPHq8JK17gYrTA9qdjucTivS04qcvyjsreXDg9TJI2TT0qQ
	 TTWRdYpPMGw3w+/jSc3BcTWX+Yqhui+rr5IeH7hZcYFn29/2bQlWXDKlUSmp538E05
	 SDf0JqZCgZnPoEPShCF3Mlw6lwaSr3z0w552elkw0VgovRSDMTTqaLTSwYn5Al8+aB
	 WI4B5nO10l9xQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicolas Escande <nico.escande@gmail.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 592/642] wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
Date: Mon,  5 May 2025 18:13:28 -0400
Message-Id: <20250505221419.2672473-592-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Nicolas Escande <nico.escande@gmail.com>

[ Upstream commit df11edfba49e5fb69f4c9e7cb76082b89c417f78 ]

Since inception there is an obvious typo laying around in
ath12k_hal_tx_cmd_ext_desc_setup(). Instead of initializing + adding
flags to tcl_ext_cmd->info1, we initialize + override. This will be needed
in the future to make broadcast frames work with ethernet encapsulation.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Link: https://patch.msgid.link/20250127071306.1454699-1-nico.escande@gmail.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 75608ae027afe..a39bfb959797a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -117,7 +117,7 @@ static void ath12k_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
 			       le32_encode_bits(ti->data_len,
 						HAL_TX_MSDU_EXT_INFO1_BUF_LEN);
 
-	tcl_ext_cmd->info1 = le32_encode_bits(1, HAL_TX_MSDU_EXT_INFO1_EXTN_OVERRIDE) |
+	tcl_ext_cmd->info1 |= le32_encode_bits(1, HAL_TX_MSDU_EXT_INFO1_EXTN_OVERRIDE) |
 				le32_encode_bits(ti->encap_type,
 						 HAL_TX_MSDU_EXT_INFO1_ENCAP_TYPE) |
 				le32_encode_bits(ti->encrypt_type,
-- 
2.39.5


