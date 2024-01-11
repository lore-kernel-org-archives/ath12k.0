Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681CAC47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJxk/req2xq7rnTfx7MegJQK4qFqH1dtbLL+NmEs+S0=; b=Am7YNL3hLw3SwfOVd2Ec9j2Mb+
	43vngrV9qeFISPeqxAvAHMwVBFBIMfjJlZpkRpln/InXk0TZ2m6QgaeLQ6InG7nWqeawN/ffYvbaS
	SCm0ikICD5gkB1L/hi6h4kaVA9KsBI17eQHkdjXUiT6iwojw0AtNoUhJwWdQHsoJURCbJ9QZxIoAo
	RvyvoPZ3F3nfQ+NU5vElJbWxzr1MvOKV3ARDv+oq83Fll0jCPcxtF83fMzkF4SZZ2m2Qs2b9MNXUi
	AR5vf/RmDBBB4y+DxblErDQ83iXSw/IZuZHK9nokv6QcZCNbWWvZJWyrIpf8tUqJMpNr2zk6hGuon
	mni4xOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNt69-00HE0J-30
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 11:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNt65-00HDyt-2Z
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 11:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5A5461957;
	Thu, 11 Jan 2024 11:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69410C433C7;
	Thu, 11 Jan 2024 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704971979;
	bh=Q9/z0JTCs5oAXPg2oz0DSid0D9U8xfCZj5Fj8lNgZhw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oZr061gAEfGm9VIgIl6pViy+elfHvPvzJVMWcEkkC8QahThUmWL2xUaXBMEV0tR55
	 o9CfW4SyAgZSjHD/kAHgZQb+VcuBXlx5PT/sfenWfxngYu8BEvtyK8CtItVjFKRuGA
	 3XEOwg9O6gHTBEoHysXhd9m4rkvCpH21dIhwpxLQFC6da0bJwRdvfEtE8KcrdZqYTL
	 yO2f4on0yzwymFtCGtXUWJ3rfp22X7fWPOb7D95KW4PU6gHKImQQG/H+TS6Cp/Lzn5
	 nEp3/fRidpDTLh3eSgQO6B/KiHgapSL7dwcov7X/pD3Uxt913eEMZE3+fh3Tkj2sqH
	 /M5lInkddlRSg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231219091022.70861-1-dmantipov@yandex.ru>
References: <20231219091022.70861-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170497197672.659902.926273640514593696.kvalo@kernel.org>
Date: Thu, 11 Jan 2024 11:19:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_031941_880010_E2F43F1F 
X-CRM114-Status: UNSURE (   7.03  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Since 'ath12k_wmi_tlv_parse_alloc()' always operates on 'skb->data,
> skb->len' tuple, it may be simplified to pass the only 'skb' argument
> instead (which implies refactoring of 'ath12k_pull_bcn_tx_status_ev()',
> 'ath12k_pull_chan_info_ev()' and 'ath12k_pull_pdev_temp_ev()' in the
> same way). This is an ath12k counterpart of the recently submitted
> ath11k patch and compile tested only as well.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fba97a777dcb wifi: ath12k: refactor ath12k_wmi_tlv_parse_alloc()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231219091022.70861-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


