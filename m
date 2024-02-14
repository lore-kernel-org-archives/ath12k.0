Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E637C48BEB
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4FL/FfRRnoRovnHa4V5ydHdKnnkL9YwjX466G9tv08=; b=1C4uWGpLGTo+CA5TSr24zWH/UU
	Wt9JsEeWoIgzeCO0nRRqanwm3umD7nJLhxaZvEkcKcJrFsyISbDNk1T9/BHRocWfwbSoyMJbKNizI
	fUzzq2d22pFoGRhspXjn0xnOEnm9QU2Z9rwriiM46giM+5GQDyIn3vgYlElAvbY6Rxy3kPDXX3/Hw
	dvc8y+1rn7JpeGP5G1LqsO/ciDVQcTlZ01lcIJRjtl8qnoKFLKVMa4H9rNkwaWQISMq8e16Brhzic
	3YqXExE7t73kpNsq+xweAaOsjQi13rHCKlXtI0cbEBsewWVJvkABXEZAOUn3K7q3u3PoqI/lU6QMN
	RKIXnzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raAsR-0000000CASi-34lL
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 08:44:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raAsO-0000000CASJ-109y
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 08:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1C844CE1C29;
	Wed, 14 Feb 2024 08:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F849C433C7;
	Wed, 14 Feb 2024 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707900257;
	bh=u3CxopS384xy1pq8axVOiaOQ1FEfcHdIIJHwm89eKjk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WOJigtsTcgI88bgbEoVvVOczkajq01e+kG6HeD6HlkMAYEUj9Wrrpef3REFn6wJDg
	 g5aSAHOhpNq34cZDSOiBUGIwHLoW9USIpqSlMpaIIXcwbs4dQDHQHeYQqfkkvU0zNA
	 ASiPhjwkFoAIHXAZOICEPdIPKISqmF63Wl/OLKAgsWWQzPtNk+8g1zuG9Zee9Q8hux
	 v8TeXX2DSM0sWs8cP+LV03YKLZrMS1YcxT4hyaB+nvOzP5ybzmMTavrr4ex29w8lay
	 PswgbU9vEcQaRGtcarXtl6eRViNjwdA3KBjJw0MqyOubI/CzyywG+CTwwIJGnx9wMF
	 EbJv8vb3MfWGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240213100912.459018-1-arnd@kernel.org>
References: <20240213100912.459018-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Aloka Dixit <quic_alokad@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>, Muna Sinada <quic_msinada@quicinc.com>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170790025305.3179441.138152315558305278.kvalo@kernel.org>
Date: Wed, 14 Feb 2024 08:44:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_004420_497645_B3570544 
X-CRM114-Status: UNSURE (   6.17  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

> The return code has no initializer:
> 
> drivers/net/wireless/ath/ath12k/mac.c:8006:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> Make it return -ENOMEM for allocation failures and remove the unused
> variable instead.
> 
> Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Nathan already fixed this:

https://git.kernel.org/kvalo/ath/c/04edb5dc68f4

Patch set to Rejected.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240213100912.459018-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


