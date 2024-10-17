Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11B2D374A0
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzbsOsQIWvMjhCBmqr/bvH8kbxpl/7q482cnO1TVMSk=; b=YN88efpycyAHCZkMy9dKydVh5M
	HoXGcO0d+d7kO62oFWzXHt8/iLCrg/8K48Zs2Xx9JrgZgbQlPxdebneDYN4MQmYPBLznxoi+5WFzv
	qh2bztYrcrU8t/ZUH4sTQvUk8pUg+WcUmtEO5To2HUeLSpktjWFHN14nXnN7W+AVTq16ZnOpEhXGB
	pt6pCuc3lJCpu67+F8r+NS1deRBYSEUPkS9caX8rsFbpX1LQh0P+zq0m7UDnoWCOa3UwRLyC9dfYG
	sGwdCW5AzSVCfjHB9kPyQYcncJmASgto3tdEPl4L/XJCxMSvW37vo9JSFQLcISNY51LT/sNscg1It
	PM8F4okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RTD-0000000F6lv-2We3
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 14:27:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1RS1-0000000F6f0-1eM1;
	Thu, 17 Oct 2024 14:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 30A89A43A04;
	Thu, 17 Oct 2024 14:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E67EC4CEC7;
	Thu, 17 Oct 2024 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729175163;
	bh=ICXkrsXNnojjdPLcTUdfr92shgtN7o7vqH9yRvnuhVs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cmV7ieoASYhIh9KQ1UX3edFptGCC5G3yzJQusjGH9tL+W457eyXZZ8Yu3btqeMccN
	 YywWWQkNGHTAjL3cJhY6vvdVrQfslEATqA8SwhLUaklq6fjayuSxYYVxLVJR4M+pup
	 d9PG3HZ7rqvS93Pk3IV+Yvc0CnBDBNg5JIzNA39ruplH/Xt6d3ZXD5FnaSI8XapnTW
	 qJwC0SoUFLuvXjkCtiOaQTylz2I8c/lqOb5ahfKYgK7BBstcZxHm4DGZhN7t2HB6Ni
	 P2iGpul1xBx2i8YMGsZyMSx2CMj2CPgiWi1rcx7wyaBoWAoAVbNKRsXRGrIkL4B90s
	 h8DV2r+FCe/tw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-current-20241016
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <0ea819f9-d563-46c1-9a68-3800c81565dd@quicinc.com>
References: <0ea819f9-d563-46c1-9a68-3800c81565dd@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
 <quic_jjohnson@quicinc.com>, <quic_kvalo@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172917516046.799221.17034758455768979128.kvalo@kernel.org>
Date: Thu, 17 Oct 2024 14:26:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_072605_537986_84764BFF 
X-CRM114-Status: UNSURE (   9.47  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The following changes since commit 2f833e8948d6c88a3a257d4e426c9897b4907d5a:
> 
>   Revert "wifi: ath11k: support hibernation" (2024-09-02 19:33:00 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20241016
> 
> for you to fetch changes up to befd716ed429b26eca7abde95da6195c548470de:
> 
>   wifi: ath11k: Fix invalid ring usage in full monitor mode (2024-10-16 07:30:31 -0700)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.12-rc4
> 
> Fix two instances of memory leaks, one in ath10k and one in ath11k.
> 
> ----------------------------------------------------------------
> Manikanta Pubbisetty (1):
>       wifi: ath10k: Fix memory leak in management tx
> 
> Remi Pommarel (1):
>       wifi: ath11k: Fix invalid ring usage in full monitor mode
> 
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 7 ++++++-
>  drivers/net/wireless/ath/ath10k/wmi.c     | 2 ++
>  drivers/net/wireless/ath/ath11k/dp_rx.c   | 7 +++++--
>  3 files changed, 13 insertions(+), 3 deletions(-)

Pulled, thanks.

a940b3a1ad0f Merge tag 'ath-current-20241016' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/0ea819f9-d563-46c1-9a68-3800c81565dd@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


