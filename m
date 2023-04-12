Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F807C77B72
	for <ath12k@archiver.kernel.org>; Wed, 12 Apr 2023 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gbDMPbfji6MdBw9qc9Ua5EWi29loZ1t8Y1cb2nJyeI=; b=lo3keQ3D8PUXXy
	953naIu+ZwuMMwh0VV04eIEA5POAaweFZXaBVxL3hr0QXWvynTIz0gG9rP9pCXpboVqitPv6gwptx
	ymNpJmgTtbFEPa5unLPz5gPy3kTY4NGZXRU/NnmDTJDtMyPDItmxSEX83j0jU/FZzdjanzfPPvlIQ
	Zs3lKx0wvfGmfeX+glc1qwv2pHr4noJNq6fD2nc1+nFXEiYh5iYHUNx/WhEZNQvDypVk07Kansqxx
	eUk0z6fYMxRVtmSTeeXJ3R4cUYKqfSHPUdEuk4LDHCdRvbZsUJchaciDFimpOm0+ai7GsDky5Hllj
	yv5X1q04hHppbha2i/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXKL-002VLr-0V
	for ath12k@archiver.kernel.org;
	Wed, 12 Apr 2023 10:03:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXKG-002VKl-2e;
	Wed, 12 Apr 2023 10:03:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56D9660FC9;
	Wed, 12 Apr 2023 10:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABB7C4339E;
	Wed, 12 Apr 2023 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293819;
	bh=tEpNk+OfBlpzjfw7+X3xFjLc7iWcYLC+okDPMAZ5S8E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=j4vi955Im0u3442ZSdiXtcvq3q4XLPHy5S8sO5xupwMzU9LBAJb2K7uv25yw8DEJY
	 n6pPjs4Zq1uW/F/0o4SaHjBzLO66/C9dxcYVm7cmBNPUbKFLJZZFBnaRwR7w0O/XSC
	 Ro4U0XKjCqi3Wqa4/8d0vFMOGC77bFWw50msOjDqrIvt2cel8xAbP4oPaz21rpbcjS
	 mOFVeg+CcbJt5MvIbAHnmXgd/2y6p0GgJRbCdcej0FcWWTY0MiHtD7DFtz9e04z3Ry
	 cmtXeDmRgVkhI/tRtOEXNYy+KW7boYNAPjchqm6FeiZrpzY8WI1uL+t5hRQq+CnrDR
	 Q8erlwVwUQvfA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] wifi: ath11k: Remove redundant pci_clear_master
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230323112613.7550-1-cai.huoqing@linux.dev>
References: <20230323112613.7550-1-cai.huoqing@linux.dev>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: cai.huoqing@linux.dev, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yan-Hsuan Chuang <tony0620emma@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129381469.14673.15764454080204541798.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 10:03:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_030340_896611_1B0D4356 
X-CRM114-Status: UNSURE (   9.17  )
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

Cai Huoqing <cai.huoqing@linux.dev> wrote:

> Remove pci_clear_master to simplify the code,
> the bus-mastering is also cleared in do_pci_disable_device,
> like this:
> ./drivers/pci/pci.c:2197
> static void do_pci_disable_device(struct pci_dev *dev)
> {
>         u16 pci_command;
> 
>         pci_read_config_word(dev, PCI_COMMAND, &pci_command);
>         if (pci_command & PCI_COMMAND_MASTER) {
>                 pci_command &= ~PCI_COMMAND_MASTER;
>                 pci_write_config_word(dev, PCI_COMMAND, pci_command);
>         }
> 
>         pcibios_disable_device(dev);
> }.
> And dev->is_busmaster is set to 0 in pci_disable_device.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

f812e2a9f85d wifi: ath11k: Remove redundant pci_clear_master
76008fc13b09 wifi: ath10k: Remove redundant pci_clear_master
b9235aef8492 wifi: ath12k: Remove redundant pci_clear_master

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230323112613.7550-1-cai.huoqing@linux.dev/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
