Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE09C3DA7F
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsrC8OaT+VraNG5Rp92PLAvVoTBY41KKfDCvcOMqxyo=; b=qmyii18HlQDbY7NfKfOQRew2FI
	JPdtkBGbqJXZb3kPMnDBEMXbm/ONNFZPr0QGlYep1kaUiTK4K8YyJtpkO4U3oH/eid6LfIIG9JzgM
	lBB1BY2c/pmAPTmwgbO1c/fghZJocEF77IuzfrXWYrbGPGL3BBBaBSA48QY0QNIOK1VYl+s/6xGEc
	8IhylLOcAKcU6RII2Mo56GjTKgAIW8QDCWl5qmg0wm5/oJ/fizyus3DlfapiO6lqxpWSmUdiO3rzK
	Vg18P0LmW9sPmWsm2+MV5XBdu6FAWgF7op1dIgkQia+HMPVZekY/18DHVQGYM9tSPCUBpvq9UJ2td
	MQNIOuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7PL-00000000svV-2Vu6
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 11:22:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ7PJ-00000000suX-0W5I
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 11:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 672CA6235E;
	Wed, 31 Jul 2024 11:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5175DC116B1;
	Wed, 31 Jul 2024 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424932;
	bh=RWov2fP2Ldj1Wjq1BbyCVDc90LthzJbmJPb+GphqrOQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ihwMH75SI14u2a7MmgbNO7U8ZBfBN6DTK2sBWMZCo3pMEXMI7vBrmBNAF3SDpflQZ
	 5av66Gcs5Pfbz/1YsBxx8zJ5TI9gUo6+18Rkg3nV0mK4p8SCgi7DVL6//Jv6TbiiF1
	 iban1ygQwqXPUrdCMQi8MIFzk3Te2R0is0sYAOEejudRVLWifxV9ewSw1xd5iRvuEK
	 V57kh73ln/RYYhGXnuPDTRiLzHMwdxUgGSLqeM0tMeLll7eviquiaJSYB2yzQ//jwN
	 UyQirh7WrfqJ/DmoOp1fQbORbR57Z6l+3FaFhWa5K3QOM5j1Opju3pcuQtDNM5L4vF
	 OQzQ4ACADj/MA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kangyang <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 04/11] wifi: ath12k: fix struct hal_rx_ppdu_start
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
	<20240725120035.493-5-quic_kangyang@quicinc.com>
	<aa2b6791-9d18-479b-a80d-722b99592cb8@quicinc.com>
	<87y15hkdyf.fsf@kernel.org>
Date: Wed, 31 Jul 2024 14:22:09 +0300
In-Reply-To: <87y15hkdyf.fsf@kernel.org> (Kalle Valo's message of "Wed, 31 Jul
	2024 14:17:44 +0300")
Message-ID: <87plqtkdr2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_042213_249428_A812F0F9 
X-CRM114-Status: UNSURE (   6.59  )
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

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> On 7/25/2024 5:00 AM, kangyang wrote:
>>> From: Kang Yang <quic_kangyang@quicinc.com>
>>> 
>>> Current struct hal_rx_ppdu_start in hal_rx.h is not matched with
>>> hardware descriptor definition.
>>> 
>>> So update this structure and related code.
>>> 
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> 
>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>>
>>
>
> Jeff, your reply was empty.

Actually I saw several empty replies in this patchset.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

