Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC2C43217
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVnH/xxcZzEOXz21+7W0LTa1BS/Kz7F5t4CRLF3E0DI=; b=3JSmq1pZvOQaYS
	Uy6tNW5liZoOD+DjCAc1n//WsB+z/y7rUudcoCi11/YXkj/dP6klJKcjo9M4YKrDzKq3EkvsFkvSL
	KJuCHliiYbfNuhBvnl2FnlFHw3eJqV9xkZlIMnPT/e+DuvrSl9btcTjC/7ujnfPwxHJYKLZOf/umw
	XMdXVgO7GYhBDkK9FIViG/zIQ3yS3w6W1v48FMeIzfBeh2ZgnXx8Q6qQAbc62I+UB12pkJr6lJWUK
	416rKy/2DHBgqoocbCU0GxRuiRYEXAGaT1ItjSNt72dQCjV7nqWbVcMgllWsSi/JtrYPZU6lM8wyZ
	mrok3UF4WO5Cj9MlHtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPAe-005ni1-Q0
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 14:01:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPAb-005nhV-H8
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 14:01:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 08E59B81AFB;
	Tue,  8 Nov 2022 14:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32D6C433D6;
	Tue,  8 Nov 2022 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667916096;
	bh=9prAyGVeteAqqEgdah8x4O25W796zsM/hMuDhu14HI0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ByzqXn4+OWE99tlqZypSWAaHb4gsVGWoAiYFV/1LFrPGUGwREoJHjQ8r4MK5vBDA3
	 8gOXFxczaw/xksGs6YM8sMqJcoC7l2GOrFmC86q+G4QD2jN3VtrnIp8vSz1Xr3AzkX
	 1XO8dgWynzQxIcizCK2W2+7nX+pwW97UEk0ddD1CoXq0IB3TvjrBgyAaGuOrsuWAHD
	 +gBbeHRZzITKUB7Er5BzDXp56RTgr/Jb3Ec6OIsXodYRXqMCu7QGEN4X0zKDCuMssj
	 Ym2LZGhURee7TTJY91eWoxzjMcGjRHAP7A74F4XUc2IbOdw0SqLkIncRq8eC8QVBWc
	 AVWa26JAZNQTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 34/50] wifi: ath12k: add mhi.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-35-kvalo@kernel.org>
	<d4d4ab35-b38c-6369-e436-5eb37c502ca6@quicinc.com>
Date: Tue, 08 Nov 2022 16:01:34 +0200
In-Reply-To: <d4d4ab35-b38c-6369-e436-5eb37c502ca6@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 15:30:53 -0700")
Message-ID: <87cz9xee9t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_060141_725573_5C97B648 
X-CRM114-Status: UNSURE (   8.42  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

>> +extern struct mhi_controller_config ath12k_mhi_config_qcn9274;
>> +extern struct mhi_controller_config ath12k_mhi_config_wcn7850;
>
> imo both should be const

Fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
