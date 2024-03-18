Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EBCC54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ea0x6rhWSAj0eEZO04PUVPCBhh40SoP3teizHo7H3Ck=; b=m8yxM33YtiKR48MUwSIsdPTc5B
	cNHZFA5L3X1O3hSY6pjVgw00NpzowYRYF+3XE+ao3bmjfrsiB83a75ZRv+Q5Bbz9UNw5SkQA+O2HW
	WQSzsIBnbubAs2v1xg1v73BVGJAkT+zc96v0pT11l7CYxy5QCEtDbRo2LsRoNd64PErJDq91unOFY
	qD0CKay8iB7xCXfrnUYj9uQ7EiSsQrMVq54AsabUxPjNR3pYYUoIoEzmTiwMc3sKCptrTnpzU7MUs
	zqQBJkXC4DnH+mEEYXN9G6UgPd2OlzNypKcDSzDA7WYPW81uXZpz0MKn8MiMz+XIGJaLmcYYmMN1d
	UX4/jEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmI3O-00000009jlR-027b
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 18:49:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmI3K-00000009jkQ-1kh9
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 18:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9CE4DCE0B2A;
	Mon, 18 Mar 2024 18:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED36C433F1;
	Mon, 18 Mar 2024 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710787779;
	bh=EeqLoy972CXIctyyYCv4fLVanv++DUBIP/KXK2igIPY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qgLLG59XHcwBB0Ehrd7jAyICGaVuQI/sbLd1nWOw+T4Z+7QkrNTi2DfIaCAGHeqAX
	 8QxZIHMylviaIIIx+YnAHej6/iKSdjPXFwUgpAmxXZjzWxpJvDctsVTELtQaKjpR32
	 553kXW77/uUf8JociB7e1Y6g5yqaPQkHBeUThplkAUSwzoakEpQyr/xsHkc4wUp5Hh
	 7h1h1obyB+ixb6j8/10/EAM6N3hv6ZuV0xCwOfbVJ+/dgmStmvz1vYcUrNeyYMsz7i
	 FjxvoOKdt2d/L5iJcGmRZNoUN3Tr40Rvat3Q9/YN66epG5WGDUUlONXjDL+DFQugV0
	 BG/SGnwXMjHxg==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
	<87sf0nczca.fsf@kernel.org> <878r2fctng.fsf@kernel.org>
	<4940b6cf-a68d-4799-ccf3-f90dcc105e3e@quicinc.com>
Date: Mon, 18 Mar 2024 20:49:37 +0200
In-Reply-To: <4940b6cf-a68d-4799-ccf3-f90dcc105e3e@quicinc.com> (Aloka Dixit's
	message of "Mon, 18 Mar 2024 11:40:02 -0700")
Message-ID: <87v85jbcji.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_114942_671025_924EB009 
X-CRM114-Status: GOOD (  10.98  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> On 3/18/2024 10:54 AM, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>>> Aloka Dixit <quic_alokad@quicinc.com> writes:
>>>
>>>> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
>>>> peer_flags by peer_flags_ext while sending peer data.
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
>>>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>>>
>>> What does this fix from user's point of view? Does it mean that 320 MHz
>>> chanels were broken before and this commit fixes that? I can ammend the
>>> commit message.
>> And what about WCN7850? Does it work the same?
>
> 320 MHz association was broken. It was a re-basing error while sending
> the original patch because the correct field was added during testing,
> still used that way internally too. I have not tested WCN7850 on this
> patch but yes will require the same field. Current code was setting
> QOS bit instead of 320MHz.

Thanks, does this look ok:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c4ade6bdf3d1a2d9d05606a85431f154559d5a80

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

