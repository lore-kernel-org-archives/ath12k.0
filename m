Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D0C4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaoLAU+XmM7M4HTnnRUmEqnJIvUFfeEougvcZS1OK9U=; b=WGecHLJICl1Jaf7RoK0jSORary
	XrkTLT3HVUc16pV6+etXBdssIl8XPGpHDelaL7vdtsCjxXqiw6dXZxJIQ1rIXKlboX9DOUX9m/kkE
	kHAdvvNvkfhmFg6uUX4ONqB0tMQdyC9lalBzF8RUG19E2ljdV0jF/Zud2Jesjn1+6wLbGoXLu4lMK
	UiTQcIZK0FS6n2OMTbHdYbGG+dvzmHV5QubqTtcXQG/C+2/sO4yfxwLRrqfrGm/3zw6jHzpFgEY9M
	kFflIUJjKuAyXrI8VKbKw8+E1KRZJsOFWHKOMyeARI11+2u3rH7Stpn/O3Ygo4Vw2gd/cWc242URy
	puzOQdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTaP-00000002m4N-27Zx
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 15:22:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTaM-00000002m2v-1Q9n
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 15:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B736661789;
	Thu, 18 Apr 2024 15:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9B5C113CC;
	Thu, 18 Apr 2024 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453721;
	bh=Fg1mdjdgbV6WAOs9fX5Vh5bSfuJLR4gB2Io1vUVq0Ow=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b6njuncz/GTRtyZCSdS1B1/Ad8EjDgdt4DJQSyvXc0sD3jLanGamISxk+cbbq9KPm
	 pa59pyusK607rNfSLv+hf3D8jXmQcy6ZqwPYLvW9ZJZyNNjvfjypR+a+oLAMFUk/PC
	 dgLxqv0K+Xg0nd9lmQY0e03GAGZz3tUDQ4qge4CXbOJ/5LZVPhGKuRtB6pNmvF3yNr
	 nFlhdE8NeYDksom0i9Q8ABV08wZ7BaI0zF4jHwfmvyLc2nMy1bk0mxuc4rkeL9Jc/f
	 AZh0aPIvoioLqLmbvRjNcLQ5t1TWegpe0/q8xhXI5xDvllENbaTQ7v4Cw8XL3C5QW6
	 nIEHWwyd4CL2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: enable service flag for survey dump
 stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240410085329.3649572-1-quic_kathirve@quicinc.com>
References: <20240410085329.3649572-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>, Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171345371816.934743.12955577371994067370.kvalo@kernel.org>
Date: Thu, 18 Apr 2024 15:22:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_082202_560422_8233C217 
X-CRM114-Status: UNSURE (   8.47  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> The survey dump statistics does not display channel RX and TX time
> properly because the survey flag is not enabled in the firmware service
> flag.
> 
> If firmware supports enable the service flag "bss_chan_info" in
> wmi_resource_config to fetch and print the stats for specific pdev.
> 
> Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
> on WCN7850 since this bit is not utilized by the WCN7850 firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0d55f86d0260 wifi: ath12k: enable service flag for survey dump stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240410085329.3649572-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


