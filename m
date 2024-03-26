Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D4C6FD1F
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBz2w5tasQrWfykbZe5ftXKTelqEwmM00RTlXOrRn5k=; b=KfZ34JWrHdIpK/Um3asmfb6dDF
	VvY4rE3Ra44cNwX4OZ8WI5f0B6A1KpZDeCfCMwuEIDiAPfpmyapiXQLCsmL1AmLpx+wlEpYpOfaNs
	2TbMeO+YWiatuknPLCozu15idM1rjT8vsGCeK8yqBE5Pd2cwg69djjLFkjJboNEpA5O8f7SOBaWL+
	RfGVC0wsvhV8LGKJUSCd2XA8FBKka7JZgo5taCyNCu01gxD5Pu1txWxVqavPAdo6TDymj8szhjyKt
	JMUvVmXWSNPLqNOscYQkEwvEgNEmlRyT/jLjq3qQ6ksg3thON4psKOXtLMlSD1CLVoVGaXyMVHAf6
	XMcjSsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8eQ-000000058R7-2VSf
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 15:23:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8eN-000000058Ph-1QWG
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 15:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52FFC60C02;
	Tue, 26 Mar 2024 15:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC08C433C7;
	Tue, 26 Mar 2024 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466622;
	bh=jJ5LuUqxRDXzEXygSR0WOYP+R7OkXRBkvw9wvksroVI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vAYgmjVNO+gUeYSYjGdeAgM9tawDdXYtxyzKZOkcCXybAi3UE0K71vjyGMkWp7t8N
	 6BnxJ31jnb/qAfL7lQegMBaxqlkdIrsTEK8H0jvcZvG6H9oXokg8a250N24O5hBdlI
	 xEdf7k7NMi18zMACxhyX+O05717Irloh1pn3PcKn9m07wVVkU8XFStLQBFWskUuVgb
	 WOAL2kw3Q87UOsDMXxvDZbSb03GfR89vdudLcRlfSLXOD7HlROY7hPcGVYicZRj0kl
	 1FOnaF0HT1eVNHSi8MIS2q7HIV3xmfk3EIFQK8TRFS8F6jkuL11uDAhrDesKZVzilY
	 cUR5uftjdI0ww==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/6] bug fixes and enhancements to 6 GHz band support
References: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
Date: Tue, 26 Mar 2024 17:23:39 +0200
In-Reply-To: <20240325212304.28241-1-quic_pradeepc@quicinc.com> (Pradeep Kumar
	Chitrapu's message of "Mon, 25 Mar 2024 14:22:58 -0700")
Message-ID: <877chp81ac.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_082343_449597_E4C79C96 
X-CRM114-Status: UNSURE (   7.73  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:

> In 6 GHz band, add support for
> 1. channel 2.
> 2. Fix packet drop issues.
> 3. AMPDU aggregation
> 4. SMPS configuration
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Baochen already commented on patch 6 but in general I don't see any
analysis how this patches affects (or works) with WCN7850. I should not
be asking about this for every patch, the analysis should be in the
commit message by default.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

