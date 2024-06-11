Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0D5C27C65
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egxilELPCmP/W4KhrWj5PVa92XuPUKSqDx/SxrW4fvw=; b=lx3PfLZ/UarVAfVWTyMidvdZhF
	XrSuIQnxPWcQ/qstA0Omp3fXoqnYmJJNjyRJp+q/69+VX8iOiBD2J3JsIGOIP6Qg2AjxEjzMwNL5C
	4ID/oggigJ0z/3PP23L6trkbG0tYdRNBBXjlFpB5yI0Rvr9s0EnbZZ2btzKPpJd4d+vmF/W+CJPib
	AfRtoTYnPPaTyViX6z7M2ltuBEqtS2e+/Iaj7eitCiCB2h7mnnF/QdIVO0lJkKSKMo8npynHhZd1S
	+vAiBY4yg7Ss9JBga9NmqbzJ2S6CRf5FfUI+MBbxtdkZrdIUBOY83LPQnMLqaUwS51fcJpA9y1pjX
	JXfz7F+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Ud-00000009tI3-3Add
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 18:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Ub-00000009tH3-1ibX
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 18:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A578610A7;
	Tue, 11 Jun 2024 18:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C575C2BD10;
	Tue, 11 Jun 2024 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718131512;
	bh=LB+xYWiQgFmIvjz06NaeaI39lPvfaqivVpjZ+4IalEo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BBhojCS5D61lD363LS9h3qLSju+haMi6m0YyMKxom16DzSY5mcrLaYaLL3rTqBeF/
	 yyRfJN4mjMfvxjrwYhExUELea0lRKDcroBufcqgbZS42VHU+ZpnPUCiaXqpCpEV9ZM
	 +6IBjxTyZ7vT2xZgtQKv2eZ4uGolj50DO0r//pufW2npVrO3ZdEax3+bnl16VxBbPJ
	 z9Mnr1VEEOXiQtrPI5FZdGYAYOQiAQzlkiS4TNJ1SkKUagEBwFjiqpUwlwn62ZKkDv
	 UyBIZMIc1CbPZtjCXBGMpR2disJTOitw6DecMsUdX1n2AEsQnntUR3jhWrNQUz1ZjY
	 Jn6JioJXvpzIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath12k: fix per pdev debugfs registration
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529043043.2488031-2-quic_adisi@quicinc.com>
References: <20240529043043.2488031-2-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh
	<quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813150979.3564613.3522946420612603449.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:45:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_114513_554307_94C02757 
X-CRM114-Status: UNSURE (   5.81  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Function ath12k_debugfs_register() is called once inside the function
> ath12k_mac_hw_register(). However, with single wiphy model, there could
> be multiple pdevs registered under single hardware. Hence, need to register
> debugfs for each one of them.
> 
> Move the caller inside the loop which iterates over all underlying pdevs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f8bde02a26b9 ("wifi: ath12k: initial debugfs support")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

8dd65ccbdf91 wifi: ath12k: fix per pdev debugfs registration
4e1eff38d37a wifi: ath12k: unregister per pdev debugfs
5a16da9cfb40 wifi: ath12k: handle symlink cleanup for per pdev debugfs dentry

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529043043.2488031-2-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


