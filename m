Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82810CF395D
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDrVJ2+xxUoRrolvNBdyIlI8CXuehTAXOskaq3weWow=; b=ySqusSLU70dQfKMs3cOYPVfla+
	IlDkotNL2M7/Yp5KODNnJifMcV9SRH0ygO8vwqLa7zT5ck9+bzqepSeMaYO+1tP2LzoL4RTp5jGTP
	F3ZxK5/IXEjChgdgqOBzvA1ZcLSwlyF+g5bPzqUpBxv6vbx84buyqR6kXjOdwfghc8JD1lzf1kPiJ
	nnT64L+ujZbi/Lmr+ReDmEK4EeardhrnXSvP8r1hB8GfV1F1wMqCV+ns+LGXmds9ggDi8+yIrBNUh
	8wEFiGio9lLc0Jpksmd652VUyd2h64AMK6Wy+lbNV9K2NxVZNu2xs/vIGWBsJfw9A7MxPLICPb2dJ
	1sA9IeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srKBR-0000000Agfy-0u4q
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 16:39:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srJqJ-0000000Ad9k-0VcZ
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 16:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FD37A43EB1;
	Thu, 19 Sep 2024 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1157C4CEC4;
	Thu, 19 Sep 2024 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726762638;
	bh=sjj4xoGZyqBiJoPJLOdx5QdG3kIiMdBBPYT8rVH+FNU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WlJ5eFln1Ei+yDSLAvwG5p1jF8wz+GnlJS3mfddEyWXqJwBQXKPMdpSE8zB4ZCiws
	 MbsO+o1pskEjg1J1F/2NqrTvrNu+g/W7uJ1xkyoLA05bJuJUncKPPlLX50KkSiew8A
	 B+tZQDCChDF4NrMSY37IFBKg9FcMd+mHg1aReOGuQ9ep3mwSXLPBs7IquMVlcbwU08
	 UxWrebmN1/U4RvSyTdFJy6E0iXib7kg/hGgyXDkzpHLAWg2ix9PrBmvGn8L01aXmAA
	 OBU4U14L6EeWodnfz7DPrlvecK78wxko4HaB1HC+XJvMqwRMKnSM/8QRbIb59db+Ep
	 RN0gCKIzG50ag==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] wifi: mac80211: make read-only array svc_id static
 const
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240912144456.591494-1-colin.i.king@gmail.com>
References: <20240912144456.591494-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172676263461.263986.17402367834704723969.kvalo@kernel.org>
Date: Thu, 19 Sep 2024 16:17:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_091719_257805_61419F5D 
X-CRM114-Status: UNSURE (   4.56  )
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

Colin Ian King <colin.i.king@gmail.com> wrote:

> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f8acfee2f8e0 wifi: ath12k: make read-only array svc_id static const

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240912144456.591494-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


