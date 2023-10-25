Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20AC25B47
	for <ath12k@archiver.kernel.org>; Wed, 25 Oct 2023 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAtWHSZFU6f/PuplVZSuC+qOTI4UnegTTvMDji/Mnec=; b=IqipDnwT3WWliQ
	yecT7mIynnAlS4eRaCu3Pvby3q5d+o03ACgohDz8+lI/6f+v0s1hdP2dJ04Ux2I0GR74M8mZsJstc
	r7Mly+KY1L6mbfhtXtCtI4dsZ61ICz0C8Vsf7al/vrzVsBjY+WykgbklSS5N6TOL0V4HLsoHQrhs9
	A1TSvB85insVdo2YrQyCMeDbmskauKrhGhTBcaH9Y72jIesT6ACuKimbySFKqg08ivxs0se2+loI/
	szXoOhE177u5kwI2AS2en29IiVdTKWUa2PSSjUw/53VmkF8k51lhR0Ow2tkUIKWh9Wezoyo8uZWys
	Z00aQ/AsOR2shk1DqW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvacq-00Bt1S-2j
	for ath12k@archiver.kernel.org;
	Wed, 25 Oct 2023 09:56:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvacn-00Bt0u-1r
	for ath12k@lists.infradead.org;
	Wed, 25 Oct 2023 09:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDF29CE363E;
	Wed, 25 Oct 2023 09:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE110C433C8;
	Wed, 25 Oct 2023 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227787;
	bh=Io+0mhN/DI2Tynf/rpk7RkkqXG4/7BUXxxxPDKfR8JY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Fv1NqmZjZ2c2hQMnMV4qc1/CVIJPxsGmw25WIcA1X1sjR5bwuHD+SW5jo8viVhlO0
	 HQJGErC+HGvgTlH2B0iSf7PtUF9AoHlyOlRuSNxwliru7yBBV4/aP6I4sjylMB4NW5
	 Ye4gIFb9E5ABIjfSOYLKPoKTndludG5VwMUJiJA/mctRrZC7KzmB3Gnl+TLl1B9ei/
	 rDk8hT/ryVh+pRcW/BMWq9j/ExIkxxRUes5v5jH1JY3W48wLxwnEHPQfN8I1Vesbmq
	 p6XxEzeVK+Lz++KAI8d14LsZnApqusVnUB4FM/mbYhw2b1AChq5teI34bj2LQiZbST
	 m/08VTK5ILBvA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: drop NULL pointer check in
 ath12k_update_per_peer_tx_stats()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231013074711.2202850-1-make_ruc2021@163.com>
References: <20231013074711.2202850-1-make_ruc2021@163.com>
To: Ma Ke <make_ruc2021@163.com>
Cc: quic_jjohnson@quicinc.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ma Ke <make_ruc2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822778398.891844.2822098383458779586.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 09:56:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_025629_809147_BB35BECD 
X-CRM114-Status: UNSURE (   5.68  )
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

Ma Ke <make_ruc2021@163.com> wrote:

> Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
> in 'struct htt_ppdu_stats', any of its member can't be NULL and so
> relevant check may be dropped.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Jeff, what do you think?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231013074711.2202850-1-make_ruc2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
