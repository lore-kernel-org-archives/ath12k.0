Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5D4EE49A3
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szA8rJurHN5g5ANrMrfbjyKUwLLhPNpA2ZltR6BtRnE=; b=ExkWd2EMtOA6PJ
	zLbfhGhJMSZobsEGIxymq3GkAxyKLtdH5yCrz2SIkFHWAsCg1aP20OZtpCwA51OdJa6WeHdLU/wYp
	v+Opaj7OCjWfx8XrX/x90oDfGH3wtmnobcUTm912lFs5Px9XmDzkbNTmrEMuFnGQvQUYkGFCB9TzX
	ULvH96/qjUXHG6xWlZKML2+m6cWY/1XjkaDZwnwmgafk1h9/oxsAYWkcousg0vTiGFcXSf8tJeDcR
	SI/pL6VSV/bZtowQE6qu08jxM1csyh5Hnp0WbF9hkBR8DgnwmABT6kVpwVh/c/fZvsgp4aSL7IeIS
	rlsfLQjjYOoRuUxG0udA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRQA-00G2wx-0j
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 13:27:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRQ8-00G2wS-02
	for ath12k@lists.infradead.org;
	Tue, 22 Aug 2023 13:27:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BEE7656C7;
	Tue, 22 Aug 2023 13:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EE1C433C7;
	Tue, 22 Aug 2023 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692710862;
	bh=H3lL4hRz7BWjICYi+JiYCyi4XJOYiVGuW3F+KajnREo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HRqqrVKDb+lhDrsTAvfLnbHvNGpIk8nIymTQhmXvBix6Gbi0FCZ4/f1kekLJ4JV7R
	 gwuE+iRfw1WfJXr9X8xjWr9McipV15yxhN8dsbI1bE0mYh+qAf/KHH1yG/EN/08eRf
	 X8tGXEvwtDTvNVHEDf33oBU6EPVDQ0O+CuqMb5kwiQ23ptjSJGG4wgFq3B2sKFqAzG
	 aL2Xf17yrCA6HXXpWXsdWzej79xSbSXi3rC7+KEQ70AJYzZUOoOREuCp58SPxODkJv
	 o0HOgDt/nOE2cfz6TinxF6WVgin+laFENI+m0EIYaXuWfX0Ghc4ZjKcuJy9LUCMWIi
	 FPxxEMlhxCRHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath12k: fix undefined behavior with __fls
 in dp
References: <20230821130343.29495-1-quic_hprem@quicinc.com>
	<20230821130343.29495-3-quic_hprem@quicinc.com>
	<ab94c255-8ac3-4b2a-a7a5-af40058ad6e6@quicinc.com>
Date: Tue, 22 Aug 2023 16:27:39 +0300
In-Reply-To: <ab94c255-8ac3-4b2a-a7a5-af40058ad6e6@quicinc.com> (Jeff
	Johnson's message of "Mon, 21 Aug 2023 08:27:53 -0700")
Message-ID: <877cpni4vo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_062744_094286_A7957534 
X-CRM114-Status: GOOD (  12.65  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/21/2023 6:03 AM, Harshitha Prem wrote:
>> When max virtual ap interfaces are configured in all the bands
>> with ACS and hostapd restart is done every 60s,
>> a crash is observed at random times because of handling the
>> uninitialized peer fragments with fragment id of packet as 0.
>> "__fls" would have an undefined behavior if the argument is passed
>> as "0". Hence, added changes to handle the same.
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7
>> devices")
>
> this should be in the last section with the Signed-off-by
>
> see
> <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>

I can fix that in the pending branch, no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
