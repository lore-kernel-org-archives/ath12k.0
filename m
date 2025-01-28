Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B00C0218A
	for <ath12k@archiver.kernel.org>; Tue, 28 Jan 2025 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0FSPDmkhR5E9SecqlPKheoWuTMfPr9YV9XShY2LJ2c=; b=esrRc11KBmkczcZYtVpQWr1KXZ
	2FXLz2DC9mFltQAfDYE37Nq8YGXHSBn6HqBPUi6QytZGCY25P47kwh7RC5dnjGLdlscaRILvZNd84
	h7WEKz8uy2TPcAPj9Ae+/tKEpgxOjHqsxjQtje7liJN/LhyQWNO4L1AbETiFDK4xEABbDB4FsEaz7
	NifFIkzQ8YWZGdXpqteuJCIAxf7pbAv59Ucx3UHHqTqzPIMh4C8d3vdACs+6IUywZSgZ2wbL9puAo
	CUAtKJs0YMpFnuph1z12GwwhCz3hRrsN2jkqh5Ec0BnYRz+zz7dYV3LBn0kvV/y7avL22LslUf2HY
	FBfiDCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqBv-00000005Yg2-3zn1
	for ath12k@archiver.kernel.org;
	Tue, 28 Jan 2025 18:20:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcqBr-00000005Yex-2tpt;
	Tue, 28 Jan 2025 18:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18661A40D99;
	Tue, 28 Jan 2025 18:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52162C4CED3;
	Tue, 28 Jan 2025 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738088398;
	bh=IJ4s4wbxmvi7WlbVja1PWuObnoO89o4CJKiawUCQvz8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HilBwh4WeFTUFHEmit/Mtn0GULsgGNjf02f2Otr0gm/p0PhwvGQtsKmz+KGpZB8TL
	 lZkRs6lrmOFBmR7sbKXgRFhbwC7hCKkQecwzOTEw9fHau9MnZWA0HHTxUdiWMnQJG1
	 v7azmU736wBqlw25+pBrTn+6+AqH+gKVXooxb1uWwtAHH2Cc1GZy/elILpxdVnQu/i
	 Hh4dVhb5JrL/X1BXIauWV3uPNIBxir6B3fJYywT0dnSK3d/jhzP/cC3iVmNOT6XDVB
	 9Z+F2Ove635aEWc+hLsJa6kdSbAISfTWEbDZAXH/fjVeSWsPy3Ms7Foc8o71VDIjr9
	 f0EiYkPbKy1VA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-current-20250124
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <3311fea1-c7c0-4929-b92c-16ab933de33c@oss.qualcomm.com>
References: <3311fea1-c7c0-4929-b92c-16ab933de33c@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, jjohnson@kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173808839535.1321818.16289363523697290711.kvalo@kernel.org>
Date: Tue, 28 Jan 2025 18:19:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_101959_799439_E8C59BC9 
X-CRM114-Status: UNSURE (   9.37  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:

> The following changes since commit 146b6057e1fd28fb1a38d300bf76a38dfba7f9fb:
> 
>   wifi: cw1200: Fix potential NULL dereference (2024-12-18 19:58:27 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250124
> 
> for you to fetch changes up to 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64:
> 
>   wifi: ath12k: fix handling of 6 GHz rules (2025-01-24 10:32:44 -0800)
> 
> ----------------------------------------------------------------
> ath.git patch for v6.14-rc
> 
> Fix an issue in the ath12k driver where 6 GHz operation no longer
> works with new firmware.
> 
> ----------------------------------------------------------------
> Aditya Kumar Singh (1):
>       wifi: ath12k: fix handling of 6 GHz rules
> 
>  drivers/net/wireless/ath/ath12k/wmi.c | 61 ++++++++++++++++++++++++++---------
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 -
>  2 files changed, 45 insertions(+), 17 deletions(-)

Pulled, thanks.

3319569bf9d8 Merge tag 'ath-current-20250124' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/3311fea1-c7c0-4929-b92c-16ab933de33c@oss.qualcomm.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


