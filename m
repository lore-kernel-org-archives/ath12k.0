Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A5CC6B19
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnvCQKb/Fl89d0FC9NpXpZbzIMX73JQDMnMO+GLMxxE=; b=In9NFE5Bf4G1aHpQNjSGsUilai
	Wf0sRquYAg0YTYj9sNED9wFUtyYLhbu+W3dlQCG3boxWgxHUTpzVkfPeNFxnxejQNhksq/kdJo1sb
	DHyikmtDLUGZ/OHUbONUlS6skMgkQ4dpsoKVVO7znAr9vG8YSobKD0A5TuSXDTQ3MiUTDl39dcBLo
	GsIVSrVzJgI+FSZJ9HajnOb14mbq++tTVTDX8X/71OGuLXCuZ4UGIxjPvAbj8fPzgb/R0VrPFNFIy
	H8U0VfYZK+LOV3Gpa/u0Kagt6gTU0GUsCqOb+Xkjilejxz9UvDVQ2xzo1zfQIG0UpndD7zf5eNXBe
	MQXSyq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGnmU-0000000EK6k-0xIj;
	Wed, 14 Oct 2026 01:27:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGnmS-0000000EK6c-3D1s
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 01:27:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3CD443E0D;
	Wed, 14 Oct 2026 01:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B291F00893;
	Wed, 14 Oct 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791941263;
	bh=CnvCQKb/Fl89d0FC9NpXpZbzIMX73JQDMnMO+GLMxxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEidWyfGo3yio8aoR7s1A/hPv3O5CjxScN7ahHERWZZw6yQm+dvsUsxc3mRvcDojA
	 rkKFQk8U8HVKVZH4LICRNBS4zLvReip2Lh9lZLW7cGzzBTB4wFq7dkAiaQdTjV1l1x
	 hAJzf6Jd9gnenpSuskBZcFk/xmx9whVZz6dSa3gsJUgX4lQG2Ct0NjGEtu6I/sOxY/
	 Yrndu9hBvxVO3EYinxh6d8Fm831Gy01t/Of3ntv2ckW/NKZK9599V2k4sLo3iqeLMJ
	 uSQVttM3U8cFOy/ikcp2egtvn4hGJqR9ikeFp/1RIRL8y0AVYxdTNvrRyYy/hhYdUT
	 EhoOoCArib8vw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Dinaburg <artem@trailofbits.com>
Subject: Re: [PATCH 6.6.y 2/2] wifi: ath12k: copy M3 firmware when reusing the buffer
Date: Tue, 13 Oct 2026 21:27:13 -0400
Message-ID: <2026-10-13-1-daily-reply-0023-ath12k-m3-reuse-2of2-hold@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012165925.32575-3-artem@trailofbits.com>
References: <20261012165925.32575-3-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> This fixes my 6.6.y backport of upstream commit 05090ae82f44 ("wifi:
> ath12k: check M3 buffer size as well whey trying to reuse it"). There is
> no corresponding upstream commit, because upstream never had this bug.

Holding this series until we have an Acked-by or Reviewed-by on 2/2 from
Baochen Qiang or Jeff Johnson. It is a stable-only fix with no upstream
equivalent, so I'd like an ath12k maintainer to look at it first.

-- 
Thanks,
Sasha

