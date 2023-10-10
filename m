Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EBFCD68ED
	for <ath12k@archiver.kernel.org>; Tue, 10 Oct 2023 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsB2/XZLtlv0SKll8tgGlRPrACIdnWTct4dBbEJR0CA=; b=fGYcxune07X/9A
	UI2StFHtXCHVzQIVPc8Q3ua+wy+cJipqCeN35q4mLw/TAOHelirueJKG4WIiWME97yr0gG+/+3gFR
	Ucfov4mAMD3x9Pktxm9B/hKCNewt4ZPPgO2LwdAVR3Z+EQmuj8rJ8fhvVw6+x+H9YGB8wuD8InaBp
	y1z0c1VqWTBmHcC6umYA4ZqbzbFFV2MW5gRsBhZJW244FmqNW4wLQSU7J5XSGUv/rTmldzIYzqV8/
	VAp1GMfekvq4TjSNoZ+r/PMY5Y/CVCLYcEyqujWXOMHNMRQKbmYXSxfSKuB7GC1lwvcYH32yRgZGR
	nHYg5QMWIQA+GfZZgvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq77Y-00ChRa-28
	for ath12k@archiver.kernel.org;
	Tue, 10 Oct 2023 07:25:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq77V-00ChQz-2d
	for ath12k@lists.infradead.org;
	Tue, 10 Oct 2023 07:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31757CE1C99;
	Tue, 10 Oct 2023 07:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434B8C433C7;
	Tue, 10 Oct 2023 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696922731;
	bh=dsCZmko66D3I+q0qFacuady/BZUkjXk+jklN8wRloNo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZjUd9XjIf3+GJhrLG21e4SoChwZb4r6IPXzxVLEAgP0bzhj5oYKSVyzOP5UDUqfSF
	 w/WRhciTfr+SoC4epz3u7sJC0tq5ACwAJNOTD0bKS/7AJdbADkVQDQGAirRO/sHCPO
	 XZtc9g2J3WXE3XI5DLaFs6mfYLpAvR/jQeKjRt6rf/GefJWEPxn0A0+sI5RwkSRWwY
	 vB/X40PbgsfX9NjEs7suul/REky4do1/N+GijCGI5Jm21l0qyx6Nlbc9HBkJ7+uoWL
	 Wqy3qBkxvsYE7Jkpx0h7jC8cF/2PPvHzeIlUhLgi/2FaSfVhvE9zPI83Fo9CKs+9D8
	 4PLQXr8UQ3a4g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Consistently use ath12k_vif_to_arvif()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231004-ath12k_vif_to_arvif-v1-1-3f38f6882d33@quicinc.com>
References: <20231004-ath12k_vif_to_arvif-v1-1-3f38f6882d33@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169692272808.2589238.531453282923447433.kvalo@kernel.org>
Date: Tue, 10 Oct 2023 07:25:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_002534_030100_B42FDFCE 
X-CRM114-Status: UNSURE (   6.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Helper function ath12k_vif_to_arvif() exists to retrieve a struct
> ath12k_vif from a struct ieee80211_vif. However, in multiple places
> this logic is open-coded with inline typecasting. Since the
> typecasting prevents the compiler from type-checking the source and
> destination, update the driver to consistently use the helper
> function.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

13556aef0bdc wifi: ath12k: Consistently use ath12k_vif_to_arvif()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231004-ath12k_vif_to_arvif-v1-1-3f38f6882d33@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
