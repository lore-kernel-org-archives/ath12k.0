Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7FEC4828E
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5+agWBKWtb3TgUtUPW1VWtVXJXzzR5efC2o1U5Q6/Q=; b=namyeEY+c2pNHXxKu3cGEpidIA
	+EgFXNTpHbAPHigY1D1t9fj94+PAml6aA5cCrIn6FcI8emL5NNN07HjzZ7Kve+iH7S3XzKwaIHv3L
	st9pKYq0B8oggY5MmLFEi4Dzjp0W+I2u31xpkOIP1qPAUyfeZoiqq4AcMBttKgoQ9XvprN+/p2RdI
	lhOjCM2AR6cca0CI13RKqF3O8BPn6apcbRHOd4FWmYXHNvD0xYOX2xhLqcB4X9JPFJao0K4irsE1w
	Rr1zh2B474LZVJw7m7QWwSh8lICO29ybUNrmVmXZzga7hMV17KJZQjgnIPtqEpIsZ2Jue7ecahaqe
	Rzb9WYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsox-0000000BV7u-2oGl
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:39:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsov-0000000BV7G-0Fy3
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80DC962542;
	Fri,  2 Feb 2024 12:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4025CC433C7;
	Fri,  2 Feb 2024 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877540;
	bh=jlw+WaBxmiMvgg7wAZHfkuNgaQW+mz46kwn198X8l54=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kpHx6Im4m5FUw3oSPT8UtMvBZ9+w79xBqOJIDEsQHqwrezV0/SrwQtYezI/n5bLDe
	 5ZSk8dTpDkeWS9JIu+UFuz7XWQZOecu5eW1IlZscwgucd0dQIp6FdgYFkYg6ad1tB+
	 C8hvdm6DijciUyaQNMu9Buo+4u7x3Bs7VypRVYwIq9zTvO90W6XVfYENj1pCnoGWhp
	 Ky6JpPEjPL/y30qQS6ZOoR3MgZVF7aTrxd2Mmu9yPIEsq/kcLeJYI40NCaxi2ScZc1
	 2HRHrZv6v1s2ZWMqhi73Cw3iff/bTFG1X0ihi8xZOCLKxzlYyJBFxs8/Fjsuw8NXq2
	 urHzoPi/e3WYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: refactor the rfkill worker
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240125154555.3169706-1-quic_periyasa@quicinc.com>
References: <20240125154555.3169706-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170687753736.3221346.15559067668006296036.kvalo@kernel.org>
Date: Fri,  2 Feb 2024 12:38:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_043901_694854_98D3DF0A 
X-CRM114-Status: UNSURE (   5.97  )
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

> Currently, the rfkill worker handler access mac80211 HW from the radio/link
> structure. This is will be incorrect for single wiphy model, as they will
> hold multiple link/radio structures. To fix this, access mac80211 HW based
> on the number of hardware in the SoC/chip. This approach makes the rfkill
> worker handler compatible with both multi wiphy and single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e7c7fbb582bc wifi: ath12k: refactor the rfkill worker

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240125154555.3169706-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


