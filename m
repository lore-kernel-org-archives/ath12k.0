Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF5BC54E5D
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+wZ5vDPdQdH+xiPNEaZhVlX9Ylz5Z7dkvuwDXHECfQ=; b=Bu/6JciRLD3io0CEAwl9UcG6Gc
	Whvtf9AJUzIE7r6ikKfyzbe94Vkb4T/ICwZchpD2YKfD5dsnkXlmm/TfJ65u1cZrPKRBjoWc71wPz
	ejzhVWCAdzu6QDjWzHQ+USdkHKwopUAnqBaf5Nlewf14V54sg8sg2Zx1LUT18gOF6xDfNZ4LZRROR
	3djHVpc5tvOnAl7p4ic8RLJq2IryMM5JnUACdcX0hguTWTUt+ZAn8KEtncmz3lDj+XcYFqjkHXZ+V
	j6vuot/M+IgFx1opPvoc5Ht0wJUaR3N0yoPaWZLjf7dpeHCKakf3Xi58u5gYrdJn0n2xSumj6TeEK
	JT5BBuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4Qa-00000006SSn-0vYO
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 15:52:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4QX-00000006SRr-185S
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 15:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09CD2CE1857;
	Tue, 12 Mar 2024 15:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4B4C433C7;
	Tue, 12 Mar 2024 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710258743;
	bh=mtbSRIPvbViwXMrn8ElRlBH+5PRYe0IF62ONmRRLyqI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=F8MniqIGPZjaPyQRBJFTeOR0DTrgFb6IA79l9RaRRs3NwZl+I3pK2cBe0mbobJ3WT
	 A09CCDfjcCp/0GjhsFUD6jwz1e1yHIt7akMkSPVnbEZPn4sZ6l4zASL0qAK9n4XwX5
	 VxLShNkPCrsQKISmzT+NUAirt0JlRKMkRMJs9v0ohg6cwrl4nqNwBOUAO3wPEH001r
	 kkP/0OXjiQ6EB5h8NgTwaAF5bnpKUY0mMyiHW1slsOM0JeQMIFB1iSkac2aB2iHI7d
	 kstSK2DLY3VZa1ieyTcIKSFhw7wLzB8015vc/q5V2Iu/02PZKDsWe9N7bEWUehnFv2
	 voDt0+tlgto5g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix wrong definition of
 ath12k_hw_ring_mask_qcn9274
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <CAD73Kh8_Ks0Fb6EsG6ks0oKKONfwr98uRccV5bbmEb15PLPvow@mail.gmail.com>
References: <CAD73Kh8_Ks0Fb6EsG6ks0oKKONfwr98uRccV5bbmEb15PLPvow@mail.gmail.com>
To: Weng Lin Puah <wlpuah@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171025874055.2085908.13856941842998116352.kvalo@kernel.org>
Date: Tue, 12 Mar 2024 15:52:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_085229_573736_2D908098 
X-CRM114-Status: UNSURE (   6.31  )
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

Weng Lin Puah <wlpuah@gmail.com> wrote:

> ath12k_hw_ring_mask_qcn9274.tx[3] does not match with its counterpart
> wbm_ring_num. This will cause the corresponding
> ath12k_dp_tx_completion_handler is not entered. Thus, some of the dma
> memory is not free and eventually runs out of the dma memory.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00148-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: WL Puah <wl_puah@compex.com.sg>

>From and s-o-b don't match (gmail.com vs compex.com.sg)

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/CAD73Kh8_Ks0Fb6EsG6ks0oKKONfwr98uRccV5bbmEb15PLPvow@mail.gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


