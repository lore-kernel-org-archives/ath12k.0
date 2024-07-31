Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF71C3DA64
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w73lBCBvubkJszbXM31TYGKQ+ivOf0oCzgnHkj4sJGc=; b=F8eBOyyWf54VsNBIK7fEqH/suz
	dEU95PgK49EhJ19FV338qUcBHWjTqOGclMeHcHOzH4RoNyQavabdz5eo28aZmwnCt6sLqJGczoj+b
	QghZ2Kc0OpG+zvH4vP71yOHo0gGoGt919y0Wl1JHsL6/KvuDgR/BfxsBXeFgIvBeafbnuAFqPTHpr
	PGSCJSn0u1uPTjANBJ6vrHztG0vLPBNtaD7mYMsSPcKgJbCmgrHbtzu2VWodXCgHEMUKexXDY6woV
	EX7CsK/2G+3T5hn5dkdNNTxi5UAV2zR7xbtKwHxcV5fOrLp6scoNWpWRwQun+OvgGTB0PLI9x5oX5
	7OgP005g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7JR-00000000s2T-0dRb
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 11:16:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7JO-00000000s1o-2Rpv
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 11:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4E2B0CE136C;
	Wed, 31 Jul 2024 11:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDA6C116B1;
	Wed, 31 Jul 2024 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424563;
	bh=SUPI4qo4qkr7r16Mtzw0x6BO36Kq+wQPNTi45oAOZJw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pzaWflu+iKV/lLZb7deprPg0CKrMgCZr/tKMMe7wxpd/q31Kc7T7lo2MLYv0Loo1T
	 h/5aN0k/TW+oY/PngbooHY+spwN+PbQ1ohDLNxcXPIDnxFbQrJlv0+Aap7krXDRjVq
	 06DZGRzJkBMDBjtLfqVm+CE7GrLQFv3+/H04ni0iV6P9d5gS2vT899aMZxn5GmrjoD
	 WyH6und6+cUl83WAfRXeC1Uo+P0tJ2fjB8G9LczeUahybouVUzLjSqTmJhE/j57Xbz
	 DkIAuJrIAIoN6A6je4firzS7BJCynkAEvAaUy/WBrEnk3PJNnmeqG83Rqzs7HCyQsG
	 e2YdsAtfewwIw==
From: Kalle Valo <kvalo@kernel.org>
To: david Atkins <david@3adesign.co.uk>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
References: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
	<LO0P123MB40573B6A94FB2775E73F0211D6AB2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Date: Wed, 31 Jul 2024 14:16:01 +0300
In-Reply-To: <LO0P123MB40573B6A94FB2775E73F0211D6AB2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
	(david Atkins's message of "Thu, 25 Jul 2024 06:27:48 +0000")
Message-ID: <8734nplslq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_041606_816646_2E94AD1E 
X-CRM114-Status: UNSURE (   7.10  )
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

david Atkins <david@3adesign.co.uk> writes:

> Just retested the WCN7850 on systems to see if its working on Wifi-7 for me.
>
> Initial results promising but driver fails after a few minutes, do see 1 giga bit/s for a while with iperf3

Please start a new thread about your problems, don't hijack an existing
thread.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

