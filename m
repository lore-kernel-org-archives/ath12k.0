Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49348C32793
	for <ath12k@archiver.kernel.org>; Wed, 18 Jan 2023 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfUFvL8ZX406qjOM1jvgkD5dOI4zrxSBsbZXrfPRf5Q=; b=V37MmemzXBNHGS
	mVK9xh8LsrhSm7EAMFMEI2b3axbjgveoThjFHk6iFPe5kMc4tL40v2YFhZKvyxwp7E1OYmh+VxtzA
	5K0DFKrtu8mMiUcmkU/g9lqFy8vyoIwsVPfzbuHDYmnUoCbt1QYFEB/iz6Yk7/Be0PMxWJwSSG4xZ
	bOR0DrQzYXjsrSCIfyryPU8CQw3cVEQRgONMM94lykgQ6jQnGXoqHEi36khLU5hkec6u7nwY2wWYj
	FuA2Geq/wFJ3L9FaYoFPKImEp6QRxEjHsIdvOdAky3EJWnVo4nJViXGkZWNjAi2J+sa7cotGEeijB
	DpJwcarDoGg8cBQCQzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI249-00H78k-Kh
	for ath12k@archiver.kernel.org; Wed, 18 Jan 2023 06:36:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI247-00H77o-75
	for ath12k@lists.infradead.org; Wed, 18 Jan 2023 06:36:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB889616C3
	for <ath12k@lists.infradead.org>; Wed, 18 Jan 2023 06:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7C9C433D2;
	Wed, 18 Jan 2023 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023814;
	bh=rMt7RLBg+8UgFhPbYQja+uE8JR12ZtZAkrWUxIpGEg8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rp9gWJ00bkUn6AbhMl9kkRPzORTuVNr6xqZ47/78O8TwJ4aZJ4RYMaW6D4qXSDBXb
	 ooF0XixG4yONiHjr1NrcPXje/BWN+SlBcBNavzzCW0JuX961fimcYKgG9+kkXgtsv1
	 P2IcLn0z5/6tFelaSCN30uZ5njohXMWH+aZ60PM6t8SaWZf2MoxvhdhcCor3xHVoPx
	 9u6zTmIypYrIh7OdtUi+9ARWw2dsHJQ0D3nz7uqFSLJnTEpBIpZNyauPVZn/dr/aFn
	 37LvIi4NXY6p0nfmpb3+2H+3CM5VJnQhtgFhO/znJFA4ApF3LgT2vkda2ZA8BMIGH4
	 /ERrfPAebbpHA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath12k: hal: add ab parameter to macros using
 it
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221220120655.19389-2-kvalo@kernel.org>
References: <20221220120655.19389-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167402381127.24104.9379612780147081639.kvalo@kernel.org>
Date: Wed, 18 Jan 2023 06:36:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_223655_321703_53AB197B 
X-CRM114-Status: UNSURE (   8.53  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> It's considered evil if a macro is using a variable but not having the variable
> as a parameter. So add the ab parameter to macros using that.
> 
> No functional changes.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

1a8dc2eb5b4e wifi: ath12k: hal: add ab parameter to macros using it
f8209eef730e wifi: ath12k: hal: convert offset macros to functions
cfec785c7662 wifi: ath12k: wmi: delete PSOC_HOST_MAX_NUM_SS

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221220120655.19389-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
