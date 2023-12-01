Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B014C4167B
	for <ath12k@archiver.kernel.org>; Fri,  1 Dec 2023 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qME1IvJnToxR/dhEDemxbxklUoKov+H/asgNQJxtrx0=; b=usEMec4i8eYTg3OcaVv0Qzgh87
	GV24WZzfaJWsaxbv95ygfO9nJVQWzj0E5IRpT1GJYSiRY6G6SGUvTNtkOoVbjOqSLzcxT+x3NpYDH
	OJQ8msznUrWzP5FZIUywkVUZPGIenKxbrFqRcBvhHZlbdnmDjBRFSrifb3GVUQPCQl26m8uEquJjl
	q4jd9RQJNJYWgK8/fI98XqFlpMwEr/eEfhqLyEAjyvn8g3UVrlfu2OR6Y4N4FmrDdFkg/tIFAf51k
	f2s8IPYZOh/QhBryluA3LdfvC4PzEsYRfsWF3qg0Pbgm7ybke+9da6CCshD8AoNnZYOnZXWQtxTjt
	twOnwXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9601-00E6vg-2s
	for ath12k@archiver.kernel.org;
	Fri, 01 Dec 2023 16:04:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9600-00E6uW-0P
	for ath12k@lists.infradead.org;
	Fri, 01 Dec 2023 16:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 971F961F96;
	Fri,  1 Dec 2023 16:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AF5C433C9;
	Fri,  1 Dec 2023 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701446655;
	bh=WDwXHLzsxJNvZ1n+6tjB8Oz2qvJBOEOwe6+fzg7nsD8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MFkgkuUhOmqOnVGH04okkKwpDpQQevjvOJDaqrNPMktBiKJGeLypo6dQaZ7kdMizt
	 9lgF3GfFhNBgGl75sflKJi8yEIHz0zlEQhA5/KIOX8POfMyyQImPSHAZhumCw9EXDv
	 ha0qTkhHtmqqU3xw8YYfYlc8kTl87gAq5P4X2Ly2ObV9Yu+apmBU0zxcwuxM3jprqT
	 LMBTqpV0RgE9SeaFlg7HTPey5PQv85Vg6ZbA5U1SuGR0mLMv2YjhlqAPO8ooh76pGY
	 MpZdThCSOSWEOokHCbQpN5PvIjHSc3JczChgvbIF4kU+NJVYieyn5/P73pXw1BzMTl
	 gXr43t6N6WEWg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: add 320 MHz bandwidth enums
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231116221839.1303170-1-quic_msinada@quicinc.com>
References: <20231116221839.1303170-1-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170144665259.2201420.686860353883258402.kvalo@kernel.org>
Date: Fri,  1 Dec 2023 16:04:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_080416_206690_23846BDA 
X-CRM114-Status: UNSURE (   5.42  )
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

Muna Sinada <quic_msinada@quicinc.com> wrote:

> Add 320 MHz bandwidth as a new bandwidth enum for ATH12k driver. This
> is extending existing bandwidth related enums to include 320 MHz. This
> is a precursor to supporting 320 MHz in the future.
> 
> Sanity test performed to confirm that there was no impact in existing
> bandwidths.
> 
> Additionally update QuIC copyright to include 2023 in hal_rx.h.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

37a0dd6137ec wifi: ath12k: add 320 MHz bandwidth enums

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231116221839.1303170-1-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


