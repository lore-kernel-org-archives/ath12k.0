Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64208C77B6C
	for <ath12k@archiver.kernel.org>; Mon,  3 Apr 2023 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DXvnCwIedmaszFfAXgJOBAvWmP7trUODw8l3uNukXo=; b=IOPf1GxbeqgluV
	UvjtBUKCirPxwf1Aa2uTreHQ8eQxaYkPd2GQZKbbiO9zM3ZDYvieaasq/iS2A1/Ub/k0FFTU9lGZB
	55qsCifN2JSg7UA6/0U1c2R2592uGHvHgDQYV+q3C5Bj6fxc6nW8V2tkHZwv9b/hYk7hN6P3z2/VT
	a5eGaSRtLsHUw5miijj+/TBzxGKL5b8xvZYXmxk/wDC0iW37QvNIvolhAAHM6elVBL9J5QRVoYhH1
	5jCpqYjXLmabOu4mHAigP1WBO3ElRbcCzT9/xTuyON4RXyHQD/jccdmBfk55D11/Zt/MulUT/BleW
	Ses6an1767Wz7zGqQ0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKOq-00FUOh-06
	for ath12k@archiver.kernel.org;
	Mon, 03 Apr 2023 13:39:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKOl-00FUNU-1V;
	Mon, 03 Apr 2023 13:39:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 180A3B81ABE;
	Mon,  3 Apr 2023 13:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D49C433D2;
	Mon,  3 Apr 2023 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680529140;
	bh=WCFvnKJDN1ldCJrZMZbHk+9WKFAoxGDQHk9tIhXqgwo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bQx4o3H71KLPaOm6ptTMMh0RvtxCrxsDEkwm4PMtWC9GyNKGMDETnrLnj0Jy5rBJh
	 e0AykclcdzyEyZQ2gD3hFOeO71+vIbBx050ZL5UKjSm6AYMU5sd1xtKJkngBkWiWea
	 zezUPu7foE6Ydwgy28xzGHwitbzYq3KBeU2ofvrgNbum+sb57y8rS1HcQ1Fv5D9I3z
	 SINpMH6zoFjI5DY/CEIdgFJtEOqZeg/j+2e6yJjNEEZ+XKrf3xIWyVuyxsMnRwRefw
	 W7rOtuUijJaa4wa0s+pPOVo0A1CbWWFud7YdBH9KG/hBsvFYwZp9ZIwdaicVe4fsQ0
	 erF1GlQuqxuIw==
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] wifi: rtw89: Remove redundant pci_clear_master
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230323112613.7550-5-cai.huoqing@linux.dev>
References: <20230323112613.7550-5-cai.huoqing@linux.dev>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: cai.huoqing@linux.dev, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yan-Hsuan Chuang <tony0620emma@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168052913602.11825.8401946165259356841.kvalo@kernel.org>
Date: Mon,  3 Apr 2023 13:38:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_063903_649026_422C79F4 
X-CRM114-Status: UNSURE (   9.09  )
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
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-next.git, thanks.

5995f7463101 wifi: rtw89: Remove redundant pci_clear_master

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230323112613.7550-5-cai.huoqing@linux.dev/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
