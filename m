Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D493D0E6D2
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4kRefJcE0VcrIczVfPVtdHeaDqklwUni3c5CXVFqKY=; b=LbZph4D8v9rRxmWFvI2aM8Y+Z1
	Zdie9wB6ikrd2rx1D+VhdcwXqcB0mIM3myTvwj2Mk0QvLDVQHmeo4ewaQLnI2slWZJGBDuEMEzk0m
	QeMSDvmjlWTA1h29RQeCSB88TgzImPDf5emqroCFwnimzKddMMkAwnznyZHLfTfnDqne1jc2UkfYF
	wslaSsvZmkOB6dugZqw7KsdcDbJn0RBUSZNPfndbnCCVnuSAZFmAajj/7I0w8uMpRGekEcLJIz6Qw
	epURzGzyNWIAiJtpVAxo3/cy3O1lVVcwbPY1kE6oihAmMc6dK9h9wFdWk+7+gKoxadmruTPP5pu28
	GBA4ZZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o5C-00000006c2w-3Jbg
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 08:48:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o3v-00000006bor-0auT
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 08:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 148FF5C5A52;
	Mon, 21 Oct 2024 08:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F8BC4CEC3;
	Mon, 21 Oct 2024 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729500410;
	bh=JtPklSIFPtZfF1yiS+TaXT18UoyuB3gyohnvuVOh6sw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XKoSVn4gSoT+BAGpeUdysiMQhHIG4TBpwtJbSkFWIgEFqDsU378DGwYIcvdhqUdlM
	 DnfNhpY4mrFSH4X9MUaV5IQPsxNZJntz5mHPjEXN/bslZ5idsLXmfi+UFy1gmDrMCT
	 21M/hgQhFcdwaPay0aX7hSIVgyEkS9IphtKJNrT0vEwI5L1SftnMiDHYJugEkW2Vx4
	 I6sDFDHle3CjVBtIQWFmGJv7O4L7kQoyiIXygK5Y1J21WVBYH8AaQJUk1B5G/baaKs
	 UuZNFy4Izo/ctwvT7slgq2QfMgEiw8PHSDqBhlFwNxjV/Tghkjw3UrB6T7jM8DrJ3O
	 zPPq/yhQ4/kMA==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 08/11] wifi: ath12k: delete NSS and TX power setting
 for monitor vdev
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
	<20241016065700.1090-9-quic_kangyang@quicinc.com>
Date: Mon, 21 Oct 2024 11:46:47 +0300
In-Reply-To: <20241016065700.1090-9-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Wed, 16 Oct 2024 14:56:57 +0800")
Message-ID: <871q09rgg8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_014651_380380_CB3946B9 
X-CRM114-Status: UNSURE (   7.02  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> ath12k_mac_monitor_vdev_create() will set NSS and TX power for monitor
> vdev. But this is not needed for monitor vdev.
>
> So delete them.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Does this fix any known issues? Or is just cleanup?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

