Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50020C4332F
	for <ath12k@archiver.kernel.org>; Wed, 16 Nov 2022 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D987dmg3gyawLPtIYgITG3ktPfgRKsfX82YZD5DKKac=; b=aLkHwdfo49YPgX
	wmL01f9INtrCYvIOw8z5Y5x/NEDU1OT6Eb/UFwR+xN/yVkyeM+XHvlyRtVgxXxsGaat66s+M5M3yf
	uWqZd8PE9RXkrqaQurZCVPwSzoZkVHzeylEBAq8XMy1gbnv0TkjZ4Z6Zk5Ip54eFFVGW+v7HAPKSy
	11j2j7+LbcaCty68Nk7Ww/2uBmZKPJDnjKKmvkPkMYzRHCkYqzEyFatO6Cz3jA6MnR2yEcy5L5/j+
	FRnsETKb0r9E5dnrPYe0vmDXam2UVmVfFUNer/1zVWqCt+S0t/hPPDMDXEVDf9ypP8EstW+RNXhGM
	DLUpRF0Uqe91gMBUWwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSI-005ygQ-PQ
	for ath12k@archiver.kernel.org; Wed, 16 Nov 2022 16:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSG-005yeY-Uz
	for ath12k@bombadil.infradead.org; Wed, 16 Nov 2022 16:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rQxHBQb/3xeYcu6UHg/k01hSmI2Cu6ScevqrH4mSwFs=; b=NcfAJOnHZntYMNGODrRpkBF/ei
	gSFnr9uxsBmlbIyJsFg5jsENPYVvICQCh/bl5OTtb+C077IS7eZco8+FHDrAjy+xE+Y7NK/hDf6W9
	dnaKeSZZv9K+GwaA7DiZAF4o+0pi69NUW7rl4/O80KeFT0PyFexoo8E7CWbQH9gjGCSDfn2gL1dN7
	paY1KMy25owKvDMFWrBeI1NR8vBGccmcL4eeWcHkAXxjcGMGodfWlcFRvpb3HX5O/SciJpuLx5d0k
	mbBH4OVtCzybAOt4wHIlwhNNln5SOJrSRqjyQP9LkG/KYqBfE1MwRnx7pM35V+CnM2PtVCa7UBEGL
	J9y4Q0BQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLSC-001P5E-NB
	for ath12k@lists.infradead.org; Wed, 16 Nov 2022 16:40:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9088661EF7
	for <ath12k@lists.infradead.org>; Wed, 16 Nov 2022 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0394C43144;
	Wed, 16 Nov 2022 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616799;
	bh=4S0ctAgJxaRMot9ezZoNGGdbm/MGqGvprRUthHCdQSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MNH3gIV3JwMEQKZZu9prjX1/PTOsFHcv9OKY2SdjoQGyZP80cYy2yXOL85R1Z3fI1
	 DdN+gYTwI8TUIRRimvYVvMHBxwAhenr6MKeF4rdtl5RH7OwshAc9TRUFbdq8GUf0wN
	 e3eXme5yeFTDcAJNP+zuwXpJQEqKJbaLhZAWjxkICsHNGqhJosY7dtrf1XjyeI0fd7
	 0iJC0vn8qKt9MdNAz33UHFKAvRATfZxoM5X2PzGzAyRZ5zqVLQjPTXWbIBvjopCVg7
	 59UNST9EXytPDj3SgesiGoocsXAcRO1V8wAkWfKU4LP4OgQ62bkx4Ebhw4TTa0wNLX
	 clyt1AfnipXOQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: [PATCH v2 49/50] wifi: ath: add ath12k to Kconfig
Date: Wed, 16 Nov 2022 18:39:01 +0200
Message-Id: <20221116163902.24996-50-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org>
References: <20221116163902.24996-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_164001_016365_3C9926C3 
X-CRM114-Status: UNSURE (   8.82  )
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
 drivers/net/wireless/ath/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/Kconfig b/drivers/net/wireless/ath/Kconfig
index d88edbf1bea3..910c10028b14 100644
--- a/drivers/net/wireless/ath/Kconfig
+++ b/drivers/net/wireless/ath/Kconfig
@@ -63,5 +63,6 @@ source "drivers/net/wireless/ath/wil6210/Kconfig"
 source "drivers/net/wireless/ath/ath10k/Kconfig"
 source "drivers/net/wireless/ath/wcn36xx/Kconfig"
 source "drivers/net/wireless/ath/ath11k/Kconfig"
+source "drivers/net/wireless/ath/ath12k/Kconfig"
 
 endif


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
