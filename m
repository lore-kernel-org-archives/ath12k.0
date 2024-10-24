Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C6CDDE69
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEnnFLThdO+zIcLN4HyrkKkBpISVEvSlyZWikK1eo1Y=; b=JfFvL4i0EUmnJ4RqXlHfzfbDp/
	vkNNbOUZuUK+UNXBdZvkanqI07QiWZXxjNOXTpYf820EIFfVVMJsL9cA+J8eNyx2uEm04YEr5iYNP
	QiFmW1GvFtF3c4W6UwLh7OmUKVFzmSU1BdLlXqn7yXG+1HLazt6Wr8hyBYBAvnTVpSdq4awhP7wf6
	MdL+JE8K7bzSpjJ2fthR7PKvZC9ZP5tpWM3ZIA5NFOiHxjzEdrJFEPNTL4xss8DsCXaMmRLmt7H2Q
	4bgy4iQlorJfzSZilFoH6+ujhftD1EvCWPv8LlH0MaJdclLdDyjmhSp+gDocb2KsbF/Rs9Q0yCi7s
	mj4R4Ihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uc8-0000000Ha8P-2ThY
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 09:58:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uQv-0000000HXmt-1kl1
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 09:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93AD55C444D;
	Thu, 24 Oct 2024 09:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4093C4CEC7;
	Thu, 24 Oct 2024 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729763227;
	bh=cCm1wP6opaGAztrcw772qFXE4vsc+zqik7tKDHrv7Rs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tIJQIoa+WNd/sqcAZdw5R3LkoLxfp5sl0+Fjrnbxzm0+Kiy/a45KscCQoDYbCF6V5
	 zlePcldYf/KD/dcAE7LHjmHq5tBrxKZxkZoFp0voH8JZYNn6DjJKVkhJuYEvjEDmqO
	 2y/JR4LD09H8Xzi3RWM8aul3NTrmCbRSBIRTkY5wd3OqjuWiQKLBQljz0rBUMbA7UW
	 MHPKnoKbdEpr8s8oxMIoz7hobXW2aGVbBS/GZ2JbXR2X36yw6WvOTZ7N0SFqrMJg7n
	 RfcWhoP/1j6FWX83sMb3xlacuZEOv4sTOZCmW/vFKRTyl/ptygVPdyAp3SeQuE4akP
	 0mJQ7zt4yEfKw==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: <ath12k@lists.infradead.org>
Subject: Re: QCN9274 targetted firmware version for MLO
References: <D53APBVN76LR.1NVIJSAOI4ENB@gmail.com>
Date: Thu, 24 Oct 2024 12:47:04 +0300
In-Reply-To: <D53APBVN76LR.1NVIJSAOI4ENB@gmail.com> (Nicolas Escande's message
	of "Wed, 23 Oct 2024 17:36:58 +0200")
Message-ID: <87jzdxn887.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024709_525476_C6AC4863 
X-CRM114-Status: GOOD (  11.46  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> Hello,
>
> I'm wondering what will be the firmware version that will be used for MLO
> support with ath12k on AP side.
>
> I see that the mlo patches posted by Kalle [0] are tested against and old one:
>   - WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> I see that curently in linux-firmware [1] we have a recent one:
>   - WLAN.WBE.1.3.1-00162-QCAHKSWPL_SILICONZ-1
>
> And on code linaro [2] there is an even newer one:
>   - WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Is it decided yet ? Any pointers ?

The firmware for MLO is not available yet but I'm hoping it will be
soon. We will inform the list once it's uploaded.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

