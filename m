Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEA1E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36XHzJgs3hRpyUhWRqmmM4frcYeG8spnhjedoLF3FEo=; b=cqKfXIeUBWeW/W/gnbMzeRmFH+
	SZZLgjsA/swiOpRQAHB632m6MHbZ6arFkqnxOunENioinHzG8dxMuz6o90P8n3Kwho7yk8Ro6fKiN
	T59GBfORyvnR5YQcLHR4eQJhMrRUSJszPPNy2gyewQc9bsPaPvpXQNvT7/8wXyX7inFVfCtrmWVni
	PRNfIEM/Ac2EkT0GKlhnKW9UoulfH2JXYZ0GzrVBo2iGR/O3iiLoO2RnD0yV9m6GZ87Ld5JzFrQfV
	xlrk99C0i9oOJ8Vz+Bzi/IDnm66woYmj10nBOHKBMibUd5kwzzHHQErxLcFUa04NCmcuczbtNLOzG
	rqu2PZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEr5-00000001geu-1R6A
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:38:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEr3-00000001geV-11CF
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A87265C6387;
	Thu, 19 Dec 2024 11:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1036C4CECE;
	Thu, 19 Dec 2024 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608288;
	bh=bHtqNa7Yayi1Rw61Coo9r6kUdcmqvQVYD+XOu8+PiPk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sP7UiQw+2ijkXugo23F6orIwxk423kMDY3pa6QCVRueu2HNLa8WDG+z9BWs8orvNh
	 WbnS2MWCtCygjSnHaydErqkaN4ONTaa6mR5fuwR+IPZNaS9rrVp64AjB3dMAuYBEbB
	 dp+Z83jQJUZKagFAwmVRAKdVuYByI6DaalFfO87Vk3kW4rIevGm3zp6IdpEfmRI4Co
	 S4KEER9CL89MTRjg1NP5idSag0WrSuE7rru9qrY8WiZ3K/sp5GctTCIy/X4fC7wdC5
	 3K2oOlxTgiWYMrF+y2aLxXjU6CWAyH9Pzwcf6+bfXygp/THHUi3wAve3MWpM/8VoRc
	 c2y3McESAsjeA==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Include MLO memory in firmware coredump
 collection
References: <20241218040149.4041728-1-quic_rajkbhag@quicinc.com>
Date: Thu, 19 Dec 2024 13:38:05 +0200
In-Reply-To: <20241218040149.4041728-1-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Wed, 18 Dec 2024 09:31:49 +0530")
Message-ID: <87jzbvj42q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033809_323343_60C799E7 
X-CRM114-Status: UNSURE (   7.38  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> The current firmware coredump collection in ath12k does not include
> the MLO_GLOBAL_MEM_REGION_TYPE memory. This memory region is essential
> for debugging issues related to Multi-Link Operation (MLO).
>
> Hence, add support to include MLO_GLOBAL_MEM_REGION_TYPE memory in
> firmware coredump collection.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

