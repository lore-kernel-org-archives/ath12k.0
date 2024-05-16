Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AAEC25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBUv72SqUn1HFdut828M+DWwn4aU82lbMWOpwlWGhk8=; b=Q1aQjxuPblMXz5jyAF2M+aEYej
	mekmVJCqw9UZ+ZTYdxRvAE1+6Nhw8xNO4RL+OyOKcvJgcxnIfwNXxZscuf1+nVw0LykYt0wI0q6bb
	BW6F/8MXiUs8PKyazbxiqSqneqIs47puVd+KrzwIixycT3it7mrvcAHTGxTh0DlUIVNZr+IYmshhX
	cYvrryDwehm/98vsIQL9U2a2M2SevBAfYUzTGbTiKB0/Ve+wXinjQaBbbHypSqca/zw3cPF3LKuZy
	hqCeZZQhFiQoCBRiw1GuXjDzHtK6E+WphVtEVt5haJzqfYU+Vvt9CoWcc6b4eBhZodNAqw3MFxlm4
	VTcAQD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WUM-000000049fZ-1hqW
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 08:29:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WUJ-000000049dp-055w
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 08:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B7DA0CE177D;
	Thu, 16 May 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A9AC113CC;
	Thu, 16 May 2024 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715848155;
	bh=og+BKY1v/57bu87sOKGVbi0FZ9OZo43TWjKpRV2xXHM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LPbah6xfCDj1SyA+ArVIs7nQX8XpGXDQQB3MAYDNPtl9/Cg8DTi4CjDb5rn88D4Mf
	 K4tTvx0tNVDIGsE9iSkYsgaOGoKXnvaQKM2i5WQGaQ6B8WFkZ1E842Fkj7uKTaO2Pv
	 xjXXFnhu36VtVXsXGP2gJpg+2X2xsXBfbOfxZjiAC44y0xQuO9YAQEudvpkjSTsueg
	 +qacEZXBGYgHc2scGP6QIjGkHt34uS6Repw1O6S+041XmKBgGnHbO4zoZWI56Nv9x8
	 aQnA3tAr1G+wFSJs4ZdIwBPAmjW2aGwnXqzNCpJ9epMvSzJAhspCLp4AY86AfQmhlN
	 avyQqdgj8LXoQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] wifi: ath12k: remove duplicate definition of
 MAX_RADIOS
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240514063412.3483723-2-quic_periyasa@quicinc.com>
References: <20240514063412.3483723-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171584815207.2786544.13771582254842962889.kvalo@kernel.org>
Date: Thu, 16 May 2024 08:29:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_012919_378223_80FEE417 
X-CRM114-Status: UNSURE (   4.93  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Remove the duplicate definition of MAX_RADIOS from the core header file.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

28bfc1c9c9d0 wifi: ath12k: remove duplicate definition of MAX_RADIOS
7678f8bfd74c wifi: ath12k: use correct MAX_RADIOS

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240514063412.3483723-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


