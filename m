Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1057C3DA79
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpXGTmG95W3tUSykO5LZoothpBmZ/Dd2MuSkHy4HFjQ=; b=WIh89vmtnr2mAX7Gzk6lFUK0sq
	fHNJZqXQDFS0wu1oRoRFXyl34z+FjdPUXMFXKrZcwkol3wG8h5lnLRfEip6hkSgso4JsgzUOUef/N
	Cv9LNKNNpmo2hUZLhhRAKU7YXL1zH4RyqIIrsc6yuiIGiBTG/jCIKOR+0mhhigTYG7Ha2B8NPT+NT
	rJXQNLKDwFg4q+o7QMpYThomgxhoKdC59fg+bswXpehYzblkF6BvfUQdrY1qIqvPAMiQWhV5Eb/mI
	MxckT1kMSosZ3EF/WM0EU/c647HGOKGdHnvAbGYpNNEa9yvk7OczsCR+dVXsyAjJLyv4i52gQHUfP
	LOF0PzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPgd-009cyy-25
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 16:19:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPga-009cxi-1N
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 16:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DDD47B8013C;
	Mon, 15 Jan 2024 16:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D906C433F1;
	Mon, 15 Jan 2024 16:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705335578;
	bh=QiSgZSolxUPSfOYbyLUUHLTy4CLjDRtp62kNYexLlyA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=X5bvSBwzhpwwuM9OTTEWa3LR43D6ATbj7nHrPlmN1FTD7QAsb0S7HG9+8VuCTqQYJ
	 /iLdfdR1FJ92c2odOR6xTcg38Ang2XZVV694FtvUE0eBgd0PQ0g7zHhF9oDyzywFAY
	 nO3amy6rKUtR97rK7qwb2snkKJPDgtHhZRRGQ+4kobY1DW2Jb4M5cFlWY8GthHK+vB
	 1kGfHvWyDs3f8v80k9BVb6UYkWYB8KRqyUVCaF3r48/Pc0Uh3uwAECDHV1N7FTMgI5
	 xFusOOFXmSuIQ2QjuNL5BlKFoqnyXcJ1bh+jKIXRm4E9FEtIRzcgycmq9ZTzRdYhEX
	 bXrRiM+figKAA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] wifi: ath12k: Introduce hw abstraction
References: <20240112024214.3481840-1-quic_periyasa@quicinc.com>
Date: Mon, 15 Jan 2024 18:19:35 +0200
In-Reply-To: <20240112024214.3481840-1-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Fri, 12 Jan 2024 08:12:12 +0530")
Message-ID: <877cka7enc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_081940_618359_896305C5 
X-CRM114-Status: UNSURE (   8.93  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> To support multi link operation (MLO), need to move from the multi wiphy
> model to a single wiphy model. However, the single wiphy model allows
> multiple link/radio to be exposed by the same mac80211 hw. So introduce
> a new container (ath12k_hw) structure. This approach improves scalability
> for future multi link operation support.
>
> v2:
>  - Rebased on pending branch as per jeff comments
>
> Note: Raised on top of pending branch
>
> Karthikeyan Periyasamy (2):
>   wifi: ath12k: Refactor the mac80211 hw access from link/radio
>   wifi: ath12k: Introduce the container for mac80211 hw

In the pending branch I made changes to this patchset due to my changes
in the dependency patchsets:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=9a0e461254022db80d13f9a4e4046280bfd2bd9c

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=f7f6382c4e81f1de141d687e32a0159ee1a3f11c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

