Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5BBE7AD6E
	for <ath12k@archiver.kernel.org>; Tue,  3 Oct 2023 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XsbzzqN2LGiNzJNOlx1060AlzylXfa+dVGMyGGBAL8k=; b=bqvU+SLTboFx1A
	IVJp1qpJVHwwFIsgiU5cZJYFkoZmElWa8tF6Flz0H4QCy0T8YExWujCl6kD7S0GKll4gZ+WLnOsli
	1cbxetw5OFRztITbZCU1KgaEJeaxh0gLPPrrcTId8B+1x3s6kAWyYq7qlNotSBEPmmlZFP2aR0wrT
	AUjaxjFiz7EXd0+jsle3neaXoTRZZ1jfSJd8uXynmygSQsrj9VJpf4NUrqonOWvHWIzvqkD9wWJp1
	FauasjPdCvWbfEZoKZyzDChxqTfCpGlR9GIcTE1nWEGpa9qrgHgElyDNUVSX0Rn00zd1Z29Ub3oDM
	JXB4+YtJv+Sbx/ywFD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngu5-00EqFi-09
	for ath12k@archiver.kernel.org;
	Tue, 03 Oct 2023 15:01:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngu2-00EqFN-1V
	for ath12k@lists.infradead.org;
	Tue, 03 Oct 2023 15:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8407BCE18A6
	for <ath12k@lists.infradead.org>; Tue,  3 Oct 2023 15:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42EFC433C8;
	Tue,  3 Oct 2023 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696345295;
	bh=lVcxIOxipF//JQsTO3JXp6HIOgSsOIh5C2sbfnSbzhw=;
	h=From:To:Cc:Subject:Date:From;
	b=CbosmV/bZL50DTPQD2iDFbm5HTNgTYuN+ab+ixJKEwcM+u+cR+KHKfBIeN9oEEgjf
	 XA/6a1P/Uu1grtQofMTDJdoAQNlUxfi4iG27XZ311+OrDw58TG76/lSiqh4Cwkmjl/
	 EXqZZuYp/tdGT/TZKdYNRfreKj08WhMr2kwNl5TcXxoPNxdmtM2GY7beJv8FZoB01L
	 5Vb8F/lBuolgH1MIVNeejOtrxiwiVwywZfoUeoyQO3zNXX86aZ60RwUOJlj9r/rmgF
	 R8ZrPkk2rQuTGYebnJfYec7QK+FGQq8q80KvIQ1IPsfJht4EXJ4Gwt+/pPliNoT+dO
	 QsOt1idAOdg8Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: fix debug messages
Date: Tue,  3 Oct 2023 18:01:32 +0300
Message-Id: <20231003150132.187875-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_080138_698408_1B7B19ED 
X-CRM114-Status: GOOD (  12.76  )
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

In ath12k the debug messages were broken, no matter setting what value to the
debug_mask module parameter would not get the debug messages printed. The issue
is that __ath12k_dbg() uses dev_dbg() to print the debug messages which requires either enabling
CONFIG_DYNAMIC_DEBUG or DEBUG symbol in the driver.

ath12k is supposed to use debug_mask module to control whether debug messages
are printed or not. Using both CONFIG_DYNAMIC_DEBUG and debug_mask parameter
does not make any sense so switch to using dev_printk(), just like ath11k does.
Now it's enough just to debug_mask module parameter to get the debug messages.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index 67893923e010..45d33279e665 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -64,7 +64,7 @@ void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
 	vaf.va = &args;
 
 	if (ath12k_debug_mask & mask)
-		dev_dbg(ab->dev, "%pV", &vaf);
+		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
 
 	/* TODO: trace log */
 

base-commit: 140accd3f29eee6507f8a51bc38e85c119aedf14
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
