Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3EC54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsQ8efejRfR4jrpntzHdfwXR5WFw1YJduEevQG/1wQM=; b=AB0x6pPPXD4Afd94YQSc+R6qLM
	hSSU/iwBfBRLFpsG2RlFrHBsL1To/mXjkSai3LpxqOIERWDbJxMRGh937xf3JL8Nl6CvtnH4DsKYW
	YOf3phFRwFvKLVE5lNP7t1/oM2ENapv0GKn9hxot7khj/kIO3SWM+AaHOhix1TK1p1RH51iPvtQ+g
	Qf6RW+dV1v94Kc9s+McaM9HXZ/y2/zK5H2AkwuJ/Y+vo+BccYfebCCrP7wBgeG23+LnWtHhQn0YdS
	KG9Z+gx5fZbGbzNW4PGtiXRh1w3tmOooqL6qgaQ92v3Xzqy/qlkJyGDHOhxjNLDs2QMNdHOLCBL5c
	aJJPV8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmue3-0000000H3cQ-1jx9
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 12:02:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmudz-0000000H3bD-3XKd
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 12:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0921DCE1009;
	Wed, 20 Mar 2024 12:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77492C433C7;
	Wed, 20 Mar 2024 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710936125;
	bh=sgGC0WQisFn/sGQ3msTWQSi18AFa/uPbtXXxTNrXZTU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tkDj9gJ5s27iu7hUF6eGe0ZCrIP9Gh5YTu8j9iYTrxZgJLxC4bbGpVXowgiBZkLyn
	 lJqeaeCM6zukts+8KtKhgOSzG0KPEHbRtdJX6gt0Ybj+Ht5XE0W+0jgbomJMWPfu6B
	 7MkOAlauBeswKpVJkQicV4D/9A97w3K2tQ/ExfQqEhTs7E4pnNpSQoZN62E5E4CDoT
	 pb0MO8x/NO9bN6S1te340PWWR4MPZpvDxQAyG26xDx5xLZHmkWDcdzcKK7qrp1tDbN
	 cgY0Sj2xBtxqULaeQvmlwJvHI/Sf4kwfeKnpz1ixsHE2yIZJl17Ysce7SFLwFPxGCT
	 t0m4tLN0LmJCQ==
From: Kalle Valo <kvalo@kernel.org>
To: quic_tmariyap@quicinc.com
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath12k: fix desc address calculation in wbm tx
 completion
References: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
Date: Wed, 20 Mar 2024 14:02:02 +0200
In-Reply-To: <20240311180708.9334-1-quic_tmariyap@quicinc.com> (quic
	tmariyap's message of "Mon, 11 Mar 2024 23:37:08 +0530")
Message-ID: <875xxhaz7p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_050208_107707_7EDA8317 
X-CRM114-Status: UNSURE (   9.26  )
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

quic_tmariyap@quicinc.com writes:

> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>
> In tx completion, status desc is obtained from offsetting the address
> from wbm ring. Having HTT_TX_WBM_COMP_STATUS_OFFSET(8) and reserved 8
> bytes in status desc offsets the address twice and read the values
> from the incorrect address. Hence, remove the
> HTT_TX_WBM_COMP_STATUS_OFFSET from wbm completion address calculation.
>
> Also this patch is applicable for WCN7850.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

BTW please fix your email setup. Your From header has now:

From: quic_tmariyap@quicinc.com

But it should contain your full name as well:

From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

That way there's no need to have an extra From header in the email body.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

