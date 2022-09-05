Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF9ECAAD5
	for <ath12k@archiver.kernel.org>; Mon,  5 Sep 2022 18:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjNNnEXkLE9mOog5FhBgLiCtV8YaVEKE9G2DsejP/Vg=; b=neIE3pVTRPMDOK
	8rj/86eM0ui5+GbqRkziBbCaBUlgNxv3UYRRh1J/U0gUuZIKWFXIu9ZDTJ7B0wOIyMp5SqugAoMgx
	RUFK2tAFur2pAoeIPCV8JR/YKR0DBWkJWaKwMLdIKBpoz9+wXct3xJglah66YrHIFwwH7Gealo5TZ
	9FzRszKN9JJPnluyR6+fzpdyQnbSgGSfzcktLHswy7SbUIYXjXisusiuyweVdwZKkdQrRzGYzzgKy
	PqAzmCfKndHZbSKpfMR1EQpgNW636YLp1GAMV7oF8FOSDTNgHHhEqBd/omC3gx8SjA5nLAKHkLvua
	yBD2L9gH9F6XRhAoSdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHI3-008pzk-Pl
	for ath12k@archiver.kernel.org; Mon, 05 Sep 2022 18:57:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFwa-007bJh-E9
	for ath12k@lists.infradead.org; Mon, 05 Sep 2022 17:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2EC761326;
	Mon,  5 Sep 2022 17:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A412C433D6;
	Mon,  5 Sep 2022 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662399090;
	bh=hjSUIFLLP713kGAkqYkFD9HnQwl67J2zTmeFtfJwdyc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KjvXTg0fO2mu7tGnq9WvnI/+l1tTLRgurn0wxXuKmkqj1DTbjIKUKTQheNICkJoE2
	 DtDJMWiy16mbtpRee5+g+4kSocwzyDDQepC5UrGLwLINZog5VG92xU0lztk7DY3HSX
	 03sxHjEtiHtEj6NrzS4LCxhOHFGXjG4oKMvTty/hN91B/t34p726HVip4l8N6xdQH/
	 QbC5EDc/u09u+RG9Ly8XS82pOurg61CPlx4QbGA6SMCxHGFVM4yGWePbVMVHmvCzpv
	 e2cCDOyLm0dPc7VphTNHzyYu79AEO4q6Q7uVpGbYs07ULWPKxC4myWZ5/l22Qv1s37
	 K1ZuKT6n7bJHg==
From: Kalle Valo <kvalo@kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath12k\@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH 31/50] wifi: ath12k: add mac.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-32-kvalo@kernel.org>
	<c9c4f3027e294e148bd595e3db1a62a8@realtek.com>
Date: Mon, 05 Sep 2022 20:31:24 +0300
In-Reply-To: <c9c4f3027e294e148bd595e3db1a62a8@realtek.com> (Ping-Ke Shih's
	message of "Mon, 15 Aug 2022 06:09:40 +0000")
Message-ID: <87h71laftf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_103133_809636_A0484FB1 
X-CRM114-Status: UNSURE (   9.08  )
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

Ping-Ke Shih <pkshih@realtek.com> writes:

>> +static int get_num_chains(u32 mask)
>> +{
>> +	int num_chains = 0;
>> +
>> +	while (mask) {
>> +		if (mask & BIT(0))
>> +			num_chains++;
>> +		mask >>= 1;
>> +	}
>> +
>> +	return num_chains;
>> +}
>
> use hweight32()?

Yup, we'll fix that. Thanks!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
