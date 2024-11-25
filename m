Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A3AD58D69
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gf4+w8YbN6zPZ2uYri83emtN9m6GLOw7AMssdyhrwg=; b=ey26umjvBhUpoJFBHmAlSsVM+n
	mlO4/JgP/3bWutztaGNq5dKQF0SahRHzsxSQu7ofmAnoT61fQhuNsulLMh4Ip9mj8eKHmc4Lz/UTV
	UkkPZfWfmVlf7H5gXhix3bxEJiGESt+0ox6QlwM754Dd3/siNTnvBzAMfs+mDTKJ5eXptmFAajxYg
	BmJdG4lbNYZlxlNA/BUQTmCZfJEscGe3c4FKHblxjh1YKo5XP/9fNb+h0axVVmC/DHWln1fTPtd65
	4gAxtLlgdBHiVAcZIweKUDnarHeSuB8i3QPEUPSqGFOZrxgQcvPReXxxdnI+lebhv8NRqB4PBv4lX
	cEPwEMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcRt-00000008gyn-09dk
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 17:00:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcRq-00000008gyF-3uw5
	for ath12k@lists.infradead.org;
	Mon, 25 Nov 2024 17:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25B41A41865;
	Mon, 25 Nov 2024 16:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B54C4CECE;
	Mon, 25 Nov 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732554029;
	bh=ZpdtgCOvC2vYFV3iJbB+pzmCQ15Uvkhci3/MOAeUb3Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pjmMEjANOc5F3JWy4dOwfVC0OKg2xAJfDJXJWFB6sVfzyckH+SxHsqxxiIruv0EPT
	 lycmuNKmj1pxIBvzZ0aAlgqh9USEpyze2YYjWRRsGWECigMWjl+dJuL6AFCAtQLlSh
	 szflwxQI3Q15DMMsctMw+RRo/e/m+WGMZix+qfHRUepfv0uy68SktEIKb0JZKO5oTJ
	 R1QUecEDYNIQpDOfk/jYr947Ew7JwIF/E/hdA5rfstWuTZevcr7LQZV3IbjAqEmT7v
	 Ye9fAFUVZzATre9JpqRpwqWMBtEz5vDeDwd8/cKZ7ua7OMs3hukjRFX2owpz8yOLZU
	 DIKx4sq4OPVBQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/8] [0/8] wifi: ath12k: MLO support part 3
References: <20241121155806.1862733-1-kvalo@kernel.org>
	<43157125-9cc4-4312-8005-05bcc670b89c@quicinc.com>
Date: Mon, 25 Nov 2024 19:00:27 +0200
In-Reply-To: <43157125-9cc4-4312-8005-05bcc670b89c@quicinc.com> (Jeff
	Johnson's message of "Thu, 21 Nov 2024 09:01:32 -0800")
Message-ID: <877c8rw8no.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_090031_038727_20521A23 
X-CRM114-Status: UNSURE (   7.72  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/21/2024 7:57 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> We continue refactoring ath12k in preparation for supporting Multi-Link
>> Operation. For example, in this patchset we modify station state handling and
>> start to use more link level configuration.
>> 
>> Please review.
>> 
>> v2:
>
> FYI "v2" wasn't captured in the subject, but please don't resend due to this :)

Oh, sorry about that. I forgot to add that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

