Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C93FAD3E3
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 06:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QK/PQSL7AlydxKgd+pW/m6kHp0nO/nGLtQp9B/reZs=; b=Lnm+yptdWWGvpVNdm/3JVKPPCj
	+Nz7kPV8ijjwgWdD9okTj0vjM2Qexyn+MLSwhc5xOtqLRfjn7/DrDEpuQ/f9Rg5gSKiDBQt+fm0j5
	UzmxomrGmRg2HruFHQWN/Dm4ivCMTihucgcsWec3ELGB6Jh8iPVr2U2R/y+D01n4K36+LnetyI4BZ
	FPZ6o1DhQoswfv6HpfMlf7ncRsKgv0ImeC4WFJvQcCmuxmHJwxyeaKQFFhA5NlEj7wPefOqZ2xDZl
	F8VUy2BQSpe906RGaSIAXdXt4NrqUKrbCtXgVxaqc3FtClIq28E+gGN+J4ozmzPUw3bujsfFc9rLk
	z65bld1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnZz-0000000B6tH-1CWv;
	Thu, 23 Apr 2026 06:30:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnZx-0000000B6sw-0ApC
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 06:30:26 +0000
Date: Thu, 23 Apr 2026 08:30:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776925821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QK/PQSL7AlydxKgd+pW/m6kHp0nO/nGLtQp9B/reZs=;
	b=w4KhrPwXGbaoDowx3GqDG5eHQAYS6ILllFxfRwUqJ61ar+WdAlXUtIR0AJBqk9yBpJGk0U
	ylVax1x8o64yWs9PCKo+KZNJcfEh15vw/Ow8TQAUe+UFAfUPNfqe8puNc3Dh3uCQgBlXiI
	BqoKGQtDSPOK53nSQbtHLBTjdh6XJFJq7HAaCYvXdYUaCIz3HJgGZ/kYuG9/N0W6la32FA
	YibSRIuTJedz7lvxdQSzeGCgAS/88RnnwJEut/IKDRy8pu7oKw9VUnNkCrBbEx+x6kqpfe
	MsGUMxK2z771y2EeNJgL0Q+j9uF1qBBxB73Eca9QrLV6uIeeWJE1WQ94cakjXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776925821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QK/PQSL7AlydxKgd+pW/m6kHp0nO/nGLtQp9B/reZs=;
	b=r5n5Mr5bOSF6htPlcUxw4k6WMRVkCoHdAeBNqa7vGYUuyVEfzqrHUCPBtbvcaIbIYCQ9P7
	K5jLWTkrTlk+s5CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yu-Hsiang Tseng <asas1asas200@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3] wifi: ath12k: use lockdep_assert_in_rcu_read_lock()
 for RCU assertions
Message-ID: <20260423063020.NAero6Rz@linutronix.de>
References: <20260422180814.1938317-1-asas1asas200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260422180814.1938317-1-asas1asas200@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_233025_250402_6B2CDA87 
X-CRM114-Status: UNSURE (   4.50  )
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

On 2026-04-23 02:08:14 [+0800], Yu-Hsiang Tseng wrote:
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-1.115823.3

This could written in plain english as in "Tested on =E2=80=A6". Not sure w=
hat
this "convention" is but anyway.

The change is okay.
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Changes in v3:
>   - Use lockdep_assert_in_rcu_read_lock() instead of RCU_LOCKDEP_WARN()
>     for clearer intent and more precise semantics (suggested by
>     Sebastian Andrzej Siewior)
>   - Reword commit message: this affects preemptible RCU in general,
>     not only PREEMPT_RT
>   - Move Tested-on before the official tags per ath convention

Sebastian

