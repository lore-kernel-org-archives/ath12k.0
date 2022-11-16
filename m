Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA6CC4708D
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdOMfX0VUJpmBTtMz/vCcVnY0W37xbPXH/Y83fG1SiE=; b=rKlCRsraRZdDKC
	mCw48ga7w74FIDzpCCGUqyGmtpPu4pR7pguh2zOihSo2qhfIdSjIlBbqfKUqjWKfqO+KPqDGU+QoM
	pqzBZbnCJju43haNYhOJW4NxTWcfLRfwbQtIWKB/37n6gGE52yNipLS5AK+tpC3+mAowYcak4OZ9v
	AGt/6AyROshu/g2KwBe4IcLcP86Zqk8nGGdGbWNKPbNZcQduL4itxNN8sKLE6gTu4LLOj+5gfAsaW
	acJ67hPFDqtacJBhP1OuqCrrpjE2QGVATIK7wCGBlADre7DFTP/8UuCClW9bFvJrJt9KhLjkIaCFp
	QJwB5TmWaHXIsyvU5SlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovMUJ-006bzk-PQ
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 17:46:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSB-005yWM-AQ
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:40:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6E3A61EF8
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0C7C433D6;
	Wed, 16 Nov 2022 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616798;
	bh=LkYPOzL8QAlFxe+/Q60xcGyTfE4txp2r67xDszwbRWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6vsel9q2fD0x3PhEoqhktWcTRmUx5x1CpNQv0zRBFoi32eSYZrPt+2V9wYOTXjVy
	 Y3WFVF35bU+7GF5JXG3lU+i1w2mdbWKDEoZ8OK3obI45ToLtkyKbhMN51viShhZhYL
	 AEdm8Yjv3aHaxrDAo9fOVeurHVS8kSRopkBBCYxbgphGd/mFbcfVUPrvvBAtiy/YH7
	 4+5ulYq/ojT5KFkdhBtuBITRwYTRgTCXGNEgx5WKD6f1BMZWSnXgyB2PFTP5WYFOPl
	 tAOnDkZDfr3+y+nCKf6ALaE+ZUZVHO402OngKCZrjSl7x26kXGL0njPdjVp4etrKRE
	 bVsfTiXu0kbTA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 48/50] wifi: ath: add ath12k to Makefile
Date: Wed, 16 Nov 2022 18:39:00 +0200
Message-Id: <20221116163902.24996-49-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_083959_434560_50F8A149 
X-CRM114-Status: UNSURE (   8.96  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/Makefile b/drivers/net/wireless/ath/Makefile
index 8e4ae9de5ae4..8d6e6e218d24 100644
--- a/drivers/net/wireless/ath/Makefile
+++ b/drivers/net/wireless/ath/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_WIL6210)		+= wil6210/
 obj-$(CONFIG_ATH10K)		+= ath10k/
 obj-$(CONFIG_WCN36XX)		+= wcn36xx/
 obj-$(CONFIG_ATH11K)		+= ath11k/
+obj-$(CONFIG_ATH12K)		+= ath12k/
 
 obj-$(CONFIG_ATH_COMMON)	+= ath.o
 


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
