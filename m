Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5684CFB43F
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k3MxJd2ihmbeoFRWOYpVkWc95GJbSATzHaBKP8Od44=; b=bcMv9Mu1jvuIsmvjpYr5TFTsUe
	yAPkDYR4QxvhgvgoZlPXyZu/w3sWQucRx0KvHT6fIe4PPDIg/lOsueewF6fOj80pWRpwgoG2lh8NP
	aDrMan3mhXbHP2QIE5PNcL0/eaLrj23BhppZ3x653tqrU+ftvYmPTgMKc8mlVnQmCMbkLc9kalwpx
	J1UnGKh8gpjaIvGhkA5Pp+8bMViJ0z3MTsbrVrWB6TeGPq9sySZkOIQICBVQoiCPhVlHFlbFfyk99
	SKzitt8b7bo32Jhps+fFCGrll6nJab+1NSHP2o8jbcn0mch9YM89LT6iDHjaS5+hhWq77dqSW3ls2
	iDro3TKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxlmf-00000002AZE-26BM
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 11:20:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxlmc-00000002AYi-12V2
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 11:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AF4CA41ADA;
	Mon,  7 Oct 2024 11:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0AAC4CEC6;
	Mon,  7 Oct 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728300008;
	bh=kjZDC/Kf1R8Y03yq633O0mQsv2RP9MmyoADslJ4TRDM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UTb0kfP2cZ50KyEzL6MbnlEGQMSxWdgRZXx3YVT4AYuDXqJTYgK1UGRiXZtCdI3wV
	 tQHaXq378mHySKMPInmAuJTO/Nd/ROZXvmFR3ZGXYIfKoE0TGdQVq44aYmBnXiVQ6l
	 8lozIGsz4IqXSIydL+MxwqxLCF4w9CU2hQYcT2fG2bo9z+ECPmJG4yQE4OfIF2Y6xY
	 mLAL/Q5GxEfm/4J1YreFnwIBXGIsxyPmRLUDwDZBhJsgdfvu5L/IvjnoYJgdXRLYmT
	 lniHH0hMfSKORjPFwkZSiRPUw/Q+I7Fi0bJrp8hKKycKz6XKRptABWWu4hBKHvXbQM
	 nKu2iFGkkMxLA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,
  Kees Cook <kees@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Baochen
 Qiang <quic_bqiang@quicinc.com>,  Arnd Bergmann <arnd@arndb.de>,
  Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  linux-wireless@vger.kernel.org,  ath12k@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix one more memcpy size error
References: <20241004095420.637091-1-arnd@kernel.org>
Date: Mon, 07 Oct 2024 14:20:04 +0300
In-Reply-To: <20241004095420.637091-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Fri, 4 Oct 2024 09:54:13 +0000")
Message-ID: <875xq45fdn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_042010_376033_3EF41D27 
X-CRM114-Status: GOOD (  11.26  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A previous patch addressed a fortified-memcpy warning on older compilers,
> but there is still a warning on gcc-14 in some configurations:
>
> In file included from include/linux/string.h:390,
>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
> drivers/net/wireless/ath/ath12k/wow.c: In function 'ath12k_wow_convert_8023_to_80211.isra':
> include/linux/fortify-string.h:114:33: error: '__builtin_memcpy' accessing 18446744073709551610 or more bytes at offsets 0 and 0 overlaps 9223372036854775797 bytes at offset -9223372036854775803 [-Werror=restrict]
> include/linux/fortify-string.h:679:26: note: in expansion of macro '__fortify_memcpy_chk'
>   679 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:199:25: note: in expansion of macro 'memcpy'
>   199 |                         memcpy(pat + a3_ofs - pkt_ofs,
>       |                         ^~~~~~
>
> Address this the same way as the other two, using size_add().
>
> Fixes: b49991d83bba ("wifi: ath12k: fix build vs old compiler")
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

