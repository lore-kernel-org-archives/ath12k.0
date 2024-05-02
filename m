Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E9C4345F
	for <ath12k@archiver.kernel.org>; Thu,  2 May 2024 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9peeQB7GCuROIfv5um45Sveq6+CRTrQ/SvJTyg7wsw=; b=lYqjqRHq1kCR+FYpiF6446qrDQ
	bQPUA+LmYyhN3y06ZTbpecZkIHxq1uEJ4ISkXh6urJAIRpHa72q9Z9OodcEBD3/zAIqSytnXeVAuX
	6SP2NaPRZv4GjArSX8Gy94po/LGluFJpg3QQPtVvMuAeks+1Cw2jt0ay6YweJinnlm1ZU1SEBDMUe
	A399nR78RVq8PsGbVPrljfH35L9aEiCdd08tYzEZYeZzzoIsjkS5rOawPoUnrYLlYgKV9dgMdSj0o
	DgCAhisaCWKrsb615M+FieXKssIjufMOlAQmrNBV1Kl2veH6qTS8KW5vgT36EDoNjyVcU41PMcf99
	nViET8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Tok-0000000CLeU-18cv
	for ath12k@archiver.kernel.org;
	Thu, 02 May 2024 10:37:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Tof-0000000CLce-2gm6
	for ath12k@lists.infradead.org;
	Thu, 02 May 2024 10:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61A9FCE14EB;
	Thu,  2 May 2024 10:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E346C116B1;
	Thu,  2 May 2024 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714646245;
	bh=WNsB6b1rhLdp1scPWnLRpWHAR+bWWGIuxHzjMoVEX64=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WDIg3z8KlBnOZ5OM4xZauO0NsGOYv5o/MnjsRG0x7E86VYeZhR6uGyCIjhaHHtIYx
	 2pmUh1DH5yUe3UtZB7kQFH7k7UZSBcFK4LHa+aeJLNs5PJPfEqpVh81jdnDg6OqGfJ
	 vfvHnybabIRWobCAL/t85UrjAxD95uw6j2H2rffu6y9abo0Bsm1GG8l+xluPXxcfqU
	 ZdFG58FpeDJIc/1CkNYiJGgbqsy0R1GZgK/3/haahljka+0xZwhVNGA5oBpVbd8lIL
	 qaxyundeRUfYqrNO+WDJ6BAGrVqXKEsRYsu+WZncCOgLiR4f/b7ldxeVfUss10VWYg
	 qg/01haCSzGdQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] wifi: ath12k: add multi device support for WBM
 idle ring buffer setup
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
	<20240430165811.1377182-5-quic_periyasa@quicinc.com>
	<67fdaee8-db68-4eae-897a-63d11f680103@quicinc.com>
Date: Thu, 02 May 2024 13:37:22 +0300
In-Reply-To: <67fdaee8-db68-4eae-897a-63d11f680103@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Apr 2024 11:46:05 -0700")
Message-ID: <874jbgpkil.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_033729_999200_1C441B8F 
X-CRM114-Status: UNSURE (   7.40  )
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

> On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
>> Currently, inter device MLO is not supported. Therefore, the WBM idle ring
>> buffers choose the implicit return buffer manager (DEV0_IDLE_DESC_LIST).
>> However, this implicit return buffer manager design not meeting the
>
> Kalle, can you add the missing word in pending:
> design *is* not meeting

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

