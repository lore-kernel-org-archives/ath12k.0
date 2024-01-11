Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF10C47258
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbBef/npBitbuc+Tzry04ol6YuhS4jOZROUDTjLYr94=; b=CnE0CtSklcFkUjA8uBAlhzZuZl
	+s/gNAH4/JXRpneo1nxZ2Jtz/bOuDvluow8lzkNXFWOArRMlJcvbx6moieRhIoORxtWLrshFXWxUF
	8MlEaEXQkF2EmbAskpVJgasdYH7Aa6xKJAZ/fglfAUsOCOzH9xfxRDp97MbCVQUEy6JjV5LXxAf7z
	DoW/DiQakELSE3QbO+Z3h+twLVP7dvXM4pHOJDoRlbw5XjQb85m3QcBSRjD0YnUQSYHxuYm5ct/4d
	6+3My8hALKIa4ZTpyS9g6n97XJ54Q+Ps+S8FWKyols32GDfyURD8XeukRn0KTPiFNePrvi+ORmFjM
	9LBOOlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxo6-000aXw-2W
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 16:21:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxo3-000aVe-2B
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 16:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA721CE1E6A;
	Thu, 11 Jan 2024 16:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE39BC433F1;
	Thu, 11 Jan 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704990081;
	bh=cLMSls0CclaGc98AAZVASmR+hPSsayxTFbvOAqBnEQQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Sd4NHbiuDtAmFeJViN6EkVGtGanE/TQTIzyeIoRQ1TBpYJFA4se4MwkT0lhmmdoP2
	 UwOH/0tWuDwDFGs0+VktMMWC06uQDmrTkMMR1jEDikRZTPsfngeGWbHF+Ie1PaUNMu
	 oOoCzWEw6IUC79iks94p6YnoftyVkzWvKT1t915YKJgt97ySr9ScjRLSV0xjdad6xS
	 MAG+G21MdgH0t6wZD0HMrQ/uUublvOQXgU4o/IxuHuvI1X5ebtZfEbhmSQQCaJlvrG
	 7QnTkR5GUrTywjZkEwjh9MaLeCJkeh2NSJc063rn6cGT2UH75tutXnjeT7G7/al5hX
	 Ln7c0PocxePzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath12k: Remove unnecessary struct qmi_txn
 initializers
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240109-qmi-cleanup-v1-1-607b10858566@quicinc.com>
References: <20240109-qmi-cleanup-v1-1-607b10858566@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170499007813.916301.2323327164409855961.kvalo@kernel.org>
Date: Thu, 11 Jan 2024 16:21:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_082123_905723_17EDB9C1 
X-CRM114-Status: UNSURE (   6.54  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently most of the ath12k QMI messaging functions define their
> struct qmi_txn variables with a {} initializer. However, all of these
> functions subsequently call qmi_txn_init(), and the very first thing
> that function does is zero the struct. Hence, the initializers are
> unnecessary. Since these consume code space and cpu cycles, remove
> them.
> 
> No functional changes, compile tested only.

s-o-b missing on all 3 patches.

3 patches set to Changes Requested.

13515170 [1/3] wifi: ath12k: Remove unnecessary struct qmi_txn initializers
13515167 [2/3] wifi: ath12k: Add missing qmi_txn_cancel() calls
13515168 [3/3] wifi: ath12k: Use initializers for QMI message buffers

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240109-qmi-cleanup-v1-1-607b10858566@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


