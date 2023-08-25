Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4E0C71133
	for <ath12k@archiver.kernel.org>; Fri, 25 Aug 2023 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzfMDD6dybmRaZj31iiKFRTY/Y/IUyoWVDC3qKd+duI=; b=nGOnjlUSKUEZx2
	ZGGtsnFE1QnNkAp1FKPXSdZBLJz4s0LXFJ9VSTn9p5+no/1w5PpgIzG2EE3eL2+2tJWWW75VV6AUv
	bL99LijCYPvznhz8LETeTKxts0+XmpBOX5+5dK+yk0Ydr4Tv4oPDmNTjAE2Zb7kPmztVRj28CFQhB
	Rt9Nbm2Hq/ao7XVWOmjvBpzBOVLPIurNHy5sgfabnsnT2raNRHYHF5qp3vCFkhy3VrpiABbpPs30h
	D9YWDwot/brOkjOIHtix1mFVLTPcNeNr3i29MRjCFuyQ5BbUSGYaHK11Dde3EQ6JduMGv9vUFNYZx
	vLdhxRV0kj1JBFG/duVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRNa-004YJ3-3A
	for ath12k@archiver.kernel.org;
	Fri, 25 Aug 2023 07:37:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRNX-004YHD-1p
	for ath12k@lists.infradead.org;
	Fri, 25 Aug 2023 07:37:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4677561793;
	Fri, 25 Aug 2023 07:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F92C433C7;
	Fri, 25 Aug 2023 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692949029;
	bh=hN0YbyiYrl8AjNUF/1t/u5T7kx0yqD0TeUUlrQE2plg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Nrg6nBDrMmxqXdYF5fepANNakZ7UkIAotoNtbwc/ZYvUo3ge0Z4xybUE97XE40+bh
	 l/wsMOPQnsr3Yt2FpX6xz3aDvrAL0c3W/WNb/E/jyY0VFyDwlJUbD9gtsP9QNM6Bi+
	 98huwsfWDrVMTg/Hkiot6TUdq3TpqfOost/R8noAqYVO8q6k/KBuzyBAqY3oM+C3Dt
	 /xR25VLENxo5AvVBfDo3TrNIOLyzdvseW3b1fEDrF8/qKiDN/8pBPMsnAKDO3rL+UD
	 W1TxSYV9jUYwcTXZW48LrAHu6fdv84dhhr93wqHo3KJApgSxHrJCIVsmf0PeBjIUD0
	 iSGzIdeAVh17A==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: add check max message length while
 scanning
 with extraie
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230809081657.13858-1-quic_wgong@quicinc.com>
References: <20230809081657.13858-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169294902664.1674223.5798401346278788819.kvalo@kernel.org>
Date: Fri, 25 Aug 2023 07:37:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_003711_646742_BCAC9ADF 
X-CRM114-Status: UNSURE (   7.94  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently the extraie length is directly used to allocate skb buffer. When
> the length of skb is greater than the max message length which firmware
> supports, error will happen in firmware side.
> 
> Hence add check for the skb length and drop extraie when overflow and
> print a message.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2f5124e86ae7 wifi: ath12k: add check max message length while scanning with extraie

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230809081657.13858-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
