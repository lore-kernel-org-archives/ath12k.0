Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66962C05027
	for <ath12k@archiver.kernel.org>; Fri, 17 Feb 2023 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWprYjkjttTIybleFqFsXtEiwpUnCakYKWA1d8GmSvA=; b=JsEvZQKEQKBUPL
	rXTLhk7jrnUs1qiqcnFKDFxjZXbKm78Uuxk2KrNRDW7N/xFc6A4pJfEBo8bCK26QEUr8I3f9izhYj
	hLGe6fOYQmWIWO6AnMQmviYpscWOuf0jYju6jIiYf2YrNmnXtGCndihEso1saX9HBlqHup5IcTUfZ
	Dmbf1XLGI73NrYHcveIZJ20sjh5McxwyE+po6bV3gont8t5pI6pVrysyyRgYrU/7/5tyFuhTl/UYD
	WtDrFem6g6KQGYjSPZtcJiUx7HLYXU9FqTJJfP+exB6TpuJQF5OpjnGDt+vhci3XRIt3XvkFSzwJe
	kgCyBuQIyLAarbJwfUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3E5-00Eygj-RW
	for ath12k@archiver.kernel.org; Fri, 17 Feb 2023 16:04:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3E3-00EygI-0c
	for ath12k@lists.infradead.org; Fri, 17 Feb 2023 16:04:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8DA1AB82C82;
	Fri, 17 Feb 2023 16:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F062C433D2;
	Fri, 17 Feb 2023 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676649880;
	bh=MhbECQnoKSy05RSvXladUTSAdb/Mb7zR8TEQqOIMZ6c=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DGJXci3x60y9O+nZEq+OdbAoI6bpewskbhX947OXu7XRLiKbxPjYUgybyEyACvgzr
	 /GsI6BHpkS+Qz1jmTqcb0FGh+QYW4iAIe6DqB1cRwPEpWSxqAlOKV8zZkLPrZbQ0Tc
	 QHBlht8mYhGpm2WLJiMEWnLM6bkajPudXzudtd78jbwGspVJp/LRTyV2hQi+Q2/Uc9
	 WtEsLfsDhrB5BCgneqOM/I6JNphsENDkyES5wlACULuG9UXDCJIpMhmhtB35Rl9QpX
	 z6+GzVRxqSjELTLVyiL+wwPmWASwYlnCCinvp4SvNtMKMBJxwDyKjgwHK5cl8506H0
	 f2akMTLj3es7A==
MIME-Version: 1.0
Subject: Re: [PATCH][next] wifi: ath12k: Fix spelling mistakes in warning
 messages
 and comments
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230214092122.265336-1-colin.i.king@gmail.com>
References: <20230214092122.265336-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167664987616.8263.15640226468725297685.kvalo@kernel.org>
Date: Fri, 17 Feb 2023 16:04:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_080443_237603_6474B59F 
X-CRM114-Status: UNSURE (   7.21  )
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

Colin Ian King <colin.i.king@gmail.com> wrote:

> There are quite a few spelling mistakes in warning messages and a lot
> of the comments. Fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

480c9df57787 wifi: ath12k: Fix spelling mistakes in warning messages and comments

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230214092122.265336-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
