Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F882C4332F
	for <ath12k@archiver.kernel.org>; Tue,  7 Nov 2023 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfV4+HdMwlLRV5eBBRBdtW1XFuosclK8MkrOTZB8eLI=; b=Flo89wDm2oa4WN
	vTgUixI3I6t4rTvo45VlKfqsbzWZFsp///d3+6bASlvc/1rR7l7L9ZmdBxG+GkwcIU81bGcbZ9pQg
	HeEkoXjj7w2nPy541p2VVqFLes0YcPLB7LyCCdIV8nOroA8UXAlz6o7ydA8iSjqa8LMe0HrsjIwUs
	H0zued00SPUuTu1uycjEsDyarZ/GF0iTGVh53lvt6JIoIYK5pb9XD1KcgQDUdSEEQJqN8pssdLQ7X
	SM567Nm7g38h+77hJnESMrTbSZao3gwaKXHOl4WAtQD+qt0UpY7cpjXDqMQ+bTe4tnMABj3BJbbq2
	QyLf8TWMvFxOXQak5Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KsO-001Pee-02
	for ath12k@archiver.kernel.org;
	Tue, 07 Nov 2023 12:08:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0KsL-001Pbi-06
	for ath12k@lists.infradead.org;
	Tue, 07 Nov 2023 12:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EECB611EA;
	Tue,  7 Nov 2023 12:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E73C43391;
	Tue,  7 Nov 2023 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358887;
	bh=m4GR3HEp/0QZHpgM7Xx9QUuUGlCZyWMpGXU8UeBqoPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfAvLFc8sp3WBbtTixmbNfjbIrw/29m8+auk8S08Giwz/MDtV/ehJ4DCGlA+wy/y0
	 1XWjJ/X+JBXuk02pS+IpjUInfiFK6z4/D7+OPriRfcb8+r3cASwtQB/oVrsEoYRh7L
	 h2otiQ7IZffR/mwWEZnCCEH5IYbjOmI8v3yULlD3YDLAsxSadlweY2vVOC6Q9hw4n4
	 l/UVqTTL8RbYL2wxW5+Wr7fahBdtsMTX3BGLigTrtlQerTW/WCI7xvqt9yksLfL8rh
	 RoGgrbdoqJbVxQKZK1FeeYbFjVBQWgtWHF+l4GH9WAS5O41rF8lbp1Guya1FMh3UmV
	 4+pBHFq5NoHiw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Ke <make_ruc2021@163.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	quic_jjohnson@quicinc.com,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 18/31] wifi: ath12k: mhi: fix potential memory leak in ath12k_mhi_register()
Date: Tue,  7 Nov 2023 07:06:05 -0500
Message-ID: <20231107120704.3756327-18-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040809_121701_E1C6F3F0 
X-CRM114-Status: GOOD (  10.84  )
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

From: Ma Ke <make_ruc2021@163.com>

[ Upstream commit 47c27aa7ded4b8ead19b3487cc42a6185b762903 ]

mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
ab_pci->mhi_ctrl = NULL.

We can fix it by calling mhi_free_controller() when the failure happens
and set ab_pci->mhi_ctrl = NULL in all of the places where we call
mhi_free_controller().

Signed-off-by: Ma Ke <make_ruc2021@163.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230922021036.3604157-1-make_ruc2021@163.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 42f1140baa4fe..f83d3e09ae366 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -370,8 +370,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	ret = ath12k_mhi_get_msi(ab_pci);
 	if (ret) {
 		ath12k_err(ab, "failed to get msi for mhi\n");
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	mhi_ctrl->iova_start = 0;
@@ -388,11 +387,15 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
 	if (ret) {
 		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	return 0;
+
+free_controller:
+	mhi_free_controller(mhi_ctrl);
+	ab_pci->mhi_ctrl = NULL;
+	return ret;
 }
 
 void ath12k_mhi_unregister(struct ath12k_pci *ab_pci)
-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
