Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E5DC76196
	for <ath12k@archiver.kernel.org>; Fri, 31 Mar 2023 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCZnmt3etYN5eSZ+fi1AwdqD6y5PXyQXBmXo+LR/KaQ=; b=dmwfNvenxV0X1b
	uYWJfIaiOKfa/EMIIekgk6HE7xW66mADhMbeNdzNh1gqgGdc4RGyf8kNsJrNVjVc/WRIcG/Dc0i9r
	rNiUUWCYc5KX/BToLRBWJEZBFu9g9jFl4+CJ8SeMRkOukry2edgZtFgSxp2kb7jDQCQAGWPpEmE6K
	xGH389fMyq45XghH5gtr92JlmdFjtid6Q+QwI6T3P8U0lil7Z2vEYYg3R5lu4FW+Lhj5sBwsRc0Rq
	6wGFEqE3fgVgfrjNbgC/hRdcGGY/TUcHMtIqzJ5JCGsiPAAJM8NTQ+IS+xDoJRuUCmMQgFt3Rou1b
	8XZqMDaKD6cP/djPvDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piG4F-007nF2-02
	for ath12k@archiver.kernel.org;
	Fri, 31 Mar 2023 14:49:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piG49-007nD0-1x;
	Fri, 31 Mar 2023 14:49:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 56A57CE2FC0;
	Fri, 31 Mar 2023 14:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39ACC433EF;
	Fri, 31 Mar 2023 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680274157;
	bh=nwc5YPzwUATML1zglVwWiNR73nsURuoCmDlBMPRIh8Y=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=i5BirXI10C+WP67AGxYbXoGuzImzyfv7lkGdaXASDjYmzlIqR7xZkKK9cmBYuL62l
	 xV5KplyHb8fc45zfaP22QaeDtzV2J+yUX36hoJqF/LzJ70zTuse+0F3s5Dg6gyCazE
	 ZhcfO24xV9BdOQIg2mSqF/ZnfWKeqELg9eCG1cOl+r8nFsBpovy3qBQ17R0DQlTc53
	 i0euRVEG6uKQAPPFRk3PNoFnS0y3+TKW5yJKqCTHkreKaTe8TT2WEu4ktJgN6vZ0dg
	 WwFMrOkXvatdH99kpswLnY3JO687UJSBz1yBZe9KQWKebWpFztIf3F4EO3LH4s11m7
	 tH5idFt/LBDpw==
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] wifi: rtw88: Remove redundant pci_clear_master
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230323112613.7550-4-cai.huoqing@linux.dev>
References: <20230323112613.7550-4-cai.huoqing@linux.dev>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: cai.huoqing@linux.dev, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yan-Hsuan Chuang <tony0620emma@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168027415284.32751.5288169344605905589.kvalo@kernel.org>
Date: Fri, 31 Mar 2023 14:49:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_074921_839093_C9CDB808 
X-CRM114-Status: UNSURE (   9.26  )
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
> 	u16 pci_command;
> 
> 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
> 	if (pci_command & PCI_COMMAND_MASTER) {
> 		pci_command &= ~PCI_COMMAND_MASTER;
> 		pci_write_config_word(dev, PCI_COMMAND, pci_command);
> 	}
> 
> 	pcibios_disable_device(dev);
> }.
> And dev->is_busmaster is set to 0 in pci_disable_device.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-next.git, thanks.

e665c6d67e54 wifi: rtw88: Remove redundant pci_clear_master

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230323112613.7550-4-cai.huoqing@linux.dev/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
