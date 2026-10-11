Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D035CA9EC7
	for <ath12k@archiver.kernel.org>; Sun, 11 Oct 2026 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGegb5Ng499wgNrgppeFLcY2MCpJ7L6+lwe0tFDn820=; b=Zqx9EN5bJTa5BLEjU7yRrdW96T
	JDcz5Ku7b2a9Nll2hrC73QTS65zjkKg/l6ucoU5MfsUHystY8Lda2jasvDtJusx8fhNwXbZkb/T1R
	0Y6Q9PPcbS9s9y+0ty58OmGHLd8s5YUszBmdvkHgm7zihUhfoiSqnJ9n2RMbWuMLNIOUNSqtW3zZ/
	aUp6tGuAK0+Kr8arp+/oQvsuhvB/EyIbRiptLawDtPko3N63KUT1MtXlxqbB/M/AQy8jPtk0UE3Au
	C2qFNBUhITkvgMqFsyoY57VjLvhxMr75uu9JGGwX3CP5fTmwlXHM9wC5UcpkVYFpAgOQWGlE5R550
	nypu2org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFwjB-00000009EHf-31i8;
	Sun, 11 Oct 2026 16:48:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFwjA-00000009EHW-36SN
	for ath12k@lists.infradead.org;
	Sun, 11 Oct 2026 16:48:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60C9F60213;
	Sun, 11 Oct 2026 16:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC39F1F0089C;
	Sun, 11 Oct 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791737326;
	bh=xGegb5Ng499wgNrgppeFLcY2MCpJ7L6+lwe0tFDn820=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ahs1FBLyoneKSrrJ6vYNs97stm5nGQauk5SV8oFSjrNB4sxzVgOlwSP4uK3nC1uYk
	 NHTJGp0u3STa9nftpXWMTRew8mrOhd8/FNIPJlkWW5vZY1b5HcwIgw6w5Q1GNyY74g
	 ndya6MeDhlsYUeOgu4G+3qHxJ4sa+cNZb/vyspT4HrSGIsDQ5apMGGikq5vNKSY/2+
	 d1FpuFwf8NgC7hbGsRNulxaLZGcMZ3Fs0MZ3HNnAlkbNsWRFCso4e+CmC+PGTcTT9w
	 F8czswMEGMpwTjUlUwncpIqGErryS+GfiM15OLufvvEAOB7+FMQxa6UhTQ//ii7mgO
	 Sfg2E7UD5WefQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Dinaburg <artem@trailofbits.com>
Subject: Re: [PATCH 6.12.y] wifi: ath12k: fix reusing m3 memory
Date: Sun, 11 Oct 2026 12:48:22 -0400
Message-ID: <2026-10-11-1-daily-reply-0015-ath12k-m3-reuse-6-12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010051129.14918-1-artem@trailofbits.com>
References: <20261010051129.14918-1-artem@trailofbits.com>
MIME-Version: 1.0
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

> During firmware recovery or suspend/resume, m3 memory could be reused if
> the size of the new m3 binary is equal to or less than that of the
> existing memory. There will be issues for the latter case, since

Queued for 6.12, thanks.

-- 
Thanks,
Sasha

