Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF510C4345F
	for <ath12k@archiver.kernel.org>; Mon, 15 Apr 2024 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBCF7EUKQ1OiDC7/0R4mxmEW6/4vkS2zD5H1AFx8PLo=; b=GnaXRI+CINHn/B0ZQ2yc4DrEGA
	Pyh/0Qramsep5b6AOb8XPnjPAOz8RMmwUHTVmGdmk2lmW/BhjkOiKV015QJym1jUntLz2/TPpkZ4p
	gNzBJ2CBp1otVt3GPhhmOhVoJJTZUYLa/zNftLNmjme2lsGMraf6JsljpEWERma4wtKQ73Sv5eTPp
	OlqIZRpSvk5cgITzzl4u70CgeiJ1oquocLC3vqwRREch45tZAOWDTmJyAp1qiIdSZe425ft2XkYxE
	rl4iJHDSc/JuTP053eazyUS7cukyKSqwfdZ6r/sdn2bJmiwI9c/O4MGZ1AmV1JAneOduHUQsT0HfP
	Nhxii14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPx5-00000009Iqi-1kbS
	for ath12k@archiver.kernel.org;
	Mon, 15 Apr 2024 17:17:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPx2-00000009Iq7-3ods
	for ath12k@lists.infradead.org;
	Mon, 15 Apr 2024 17:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6060A60ECF;
	Mon, 15 Apr 2024 17:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C2AC113CC;
	Mon, 15 Apr 2024 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713201424;
	bh=kn/5VO3WJcwA9ybjyGIpA4RIajnbI3g6G3Ka3UzJcjc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=k6imNyz5beEoW6GKd8cohZoAi5T4JM0xB/lrGwXK2E7/5fr/TsiRpoxgm89c5fp7I
	 +1N4sal+bt7XAKzKDCoT1rTsLaIosn2xn5RyXAQpPgNuCkgkq8UfwOrLziK6a5QATY
	 DhGJWza6H4d/T3d7QZHvMmknfjq6LR2zs/tFYlDFuhuJ6zcn+vubVWfBPGG8NUNVy6
	 OMsvyLmZEDw/WTFY7QUIR/4qadvw3GPv8dDHSLYQ0MPcfMNBUcdXpmCwLKnXe7ZluX
	 puY295NsTGU1Y3OIg5DUsG1AoXRlfc5PfuZiwccN/K4PX66nC1A1R0Y3x7MD/tT4eb
	 bI/9mGKP5nXTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: enable WIPHY_FLAG_DISABLE_WEXT
References: <20240411165645.4071238-1-kvalo@kernel.org>
	<e8618364-e547-41e1-b18f-4cddeafd3371@quicinc.com>
	<87h6g2y4jp.fsf@kernel.org>
	<c5080887-6d94-405d-a57b-dae5e6a57721@quicinc.com>
Date: Mon, 15 Apr 2024 20:17:01 +0300
In-Reply-To: <c5080887-6d94-405d-a57b-dae5e6a57721@quicinc.com> (Jeff
	Johnson's message of "Mon, 15 Apr 2024 09:59:21 -0700")
Message-ID: <87cyqqy29e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_101705_017769_C245FD6A 
X-CRM114-Status: UNSURE (   8.58  )
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

> On 4/15/2024 9:27 AM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>> Is there a Ubuntu / Network Manager fix fir this?
>> 
>> I would hope that Network Manager doesn't use WEXT or especially run the
>> iwconfig tool. This is why I suspect that you run iwconfig manually.
>
> I am not running iwconfig manually. I'm simply using the Ubuntu wifi settings
> menu to enable Hotspot. So somewhere under the hood Ubuntu/NM is running iwconfig

Oh man, screenscraping iwconfig is horrible. I would be very curious to
know what software exactly does this. This makes even more important to
extend the cfg80211 wext warning per process, otherwise there can be
more of these which are not detected.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

