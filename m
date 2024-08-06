Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7410C3DA64
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 06:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIa4LRXFXfqtrI4a5BcQ9AKUrAxd+xjJgo1Tmf2bd/o=; b=5AdH4zHf5+gx3Njx/hXrrIQ1Oq
	hU4yswONRfS3eb33mFGqxHkX0RNYAGLYs8J3We9xVrjiExJAbZe21UJnqfz85FzCIqppsNTTn8lxr
	tAVB+ewJrafzEj1FibA9rjewqlt7tG1LTYCmf8a2nkNP31ZSQSn7yJtbGEHB+d94M9klUlp9v9omG
	yk+dOJ4A+Nq3Vx9CsN7l3/JrgXmGRTmQa8WQMDZTQkl3ReHEfQSCN3tVJsU112AIzRsjLndvaUqVk
	kjwVdGgzlbot1sZHZFSIltP74+Osm8G5OJ6tiTwjOE1mH1+B4Oy5ROykuixK2MbyVSQS5N7qK/pMY
	e1v7uyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbDP8-00000000dtf-2c9S
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 06:10:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbDP5-00000000dsW-0TYh
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 06:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 706EFCE0D85;
	Tue,  6 Aug 2024 06:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4497C32786;
	Tue,  6 Aug 2024 06:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722924636;
	bh=xe4TyJsYfcn1tWGldXgzTjCuFxSyYQ+iMyXl13WsQII=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VJUA2BHze/EtcjsA+Rc690T+VBSWMXMr2eUWHDh6F+EzxVu7CTWelnLO9Dep7Jjc1
	 r4K059Kz0G+UowJxVXKsDJhEfswndC2XQVP5nb3ayvH8BXghkqYOdDoas8Yw3oO04e
	 6oIb8L6u1SsB5R5wRtFQxs3xZ8Hbywa5wcTL3gByU1Zl6jnuTXys//LmRRxUAiAxfF
	 OetZTLHhILwNyYH5gP5+0SB8GCEzBpx8t1ih7KZsPZ1fykwQ+3qNllQjUyDWNHHW3U
	 o3Pqm0l6vzug6CZHoIlpMxqOIe5Al072j/sfRi6aP6idFiTNmm51ihPIQ1ERnjNWS5
	 X2aNHap9peQrg==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v9 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
Date: Tue, 06 Aug 2024 09:10:33 +0300
In-Reply-To: <20240628095139.292952-1-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Fri, 28 Jun 2024 15:21:31 +0530")
Message-ID: <87y15a5gh2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_231039_352157_F550E9DD 
X-CRM114-Status: UNSURE (   9.53  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

> To support multi-link operation, multiple devices with different bands say
> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
> an abstraction to mac80211.
>
> Device group abstraction - when there are multiple devices that are
> connected by any means of communication interface between them, then these
> devices can be combined together as a single group using a group id to form
> a group abstraction. In ath12k driver, this abstraction would be named as
> ath12k_hw_group (ag).

The design discussion is still ongoing in v8 so I'm going to just drop
v9. We need to conclude the discussion first.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

