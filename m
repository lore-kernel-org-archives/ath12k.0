Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC07E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pgc1KW1YII919JJuAi/ebkB1XmfavdutAtTBjHMlsY=; b=pgvzncUXHeD/tHTMNisjGXp+tg
	Yxh7dqQxHe6v0ZrsZ6J+XZbXyx9q32PWSGLzWJPpPLWSuiORl64K8M3APwkga3MQ+xVdBspT2rW8m
	B4FsnoCcOVBmtZOurWewGVveDRkZ0LIYjztt7Ww9ku4+CQhw+zI/pohRv9lKQkbQFny9ypWbLLO9I
	9kYZxmKvwGSH6dnZsErTW2uC9Rzwkjv+5NsXtpZxZHNM2gWFoz77Qlej+s4DKSktaLWc3Myfe8Epy
	/dU+qA4EBfWBkyiuumRuWOEZv8SHOYhRCg/Hx/TPiILFPFWP9i3PI+46FUS4xubnAkjHM3qzXMdb/
	EU0EU9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvZJ-0000000AhSW-3QyA
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 08:26:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvZD-0000000AhQD-1klx
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 08:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05B25A40C0E
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 08:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94777C4CED6;
	Tue, 10 Dec 2024 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733819162;
	bh=wIslMXPf6g6d6drxaf+NhnS5S/15I4YZ2uGx61UaOyM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Gkoix8vfFtKCnxxtliBLiMt1zyycM7MPba/MdcBuSU47JgrbFPUFQq68W+2zwR6vh
	 E7C7Z7/bPI9EzaxSZiP9w63MUV7yxlJfVZgaF5w9z4B8N+msJyKSK0ZcgM/hPnna7H
	 HPtIEutPr5PojwlOojNqJGI4ge/8cVFbWxFZxqm/WAn5BDUwjg7EcAAs1H0JM+puo5
	 L/hjTi1UwP7xku1OttU8M6SUHP+qlXNTwKezFnkV6Fqvx0RxOlq0/eeyF2Lc5AgN8g
	 fK53dEW6fpGiQgMAf9JTJVgsOX/AieH2vTlacHcy+IDCa1EuGFRC9sXAzekTszPmiB
	 UbtTTYQaS8CeA==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/9] wifi: ath12k: MLO support part 8
References: <20241209185421.376381-1-kvalo@kernel.org>
Date: Tue, 10 Dec 2024 10:25:59 +0200
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org> (Kalle Valo's message
	of "Mon, 9 Dec 2024 20:54:12 +0200")
Message-ID: <871pygrlk8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002603_513427_C0D1EA61 
X-CRM114-Status: UNSURE (   8.65  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> Getting MLO to work with QCN9274 is getting close, this should be the second to
> last patchset. Small patches this time. Minor changes to data path to support
> MLO, some interface combination rework and few fixes.
>
> Please review.

I forgot to mention that this (naturally) depends on part 7:

https://patchwork.kernel.org/project/linux-wireless/cover/20241209153034.50558-1-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

