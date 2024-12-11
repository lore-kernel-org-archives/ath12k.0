Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575CDE7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tSQihQWVS6W55bpb7kvbLjd05B4Kx963wP+SFkQaLg=; b=21Dnh90WlvxPFqP4rqZloMrvGJ
	A/7fuPitp1q3TSKvdWALnlwehHKfTphGHGbNDrvFKR/gy536kSovyhYIEI5Dk3kaqfsqc+TFWQ5AB
	3zqS+79zvMfa+/w78e63b73Wap5djZoU8HtiI/fNBWS6deSVrgfR0hRwWbQYujwAVgR2en2yEPw9X
	PNPtfxQThXQftKDoRn2CuEWVbwfNjLSmQ5Qh4Q3F29A2XYkZAoOjLzJqA5UC1zDhypaVf5uHgsPDU
	QrIH9tBgy4tLQOHl8RNFU05AYkrWcKynjjYOVA0r7vB/RfiKwVue6CNsG96CW9GZ/4XyEJ3BOUbaA
	0V1Vsbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQOJ-0000000FZwz-05pV
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 17:20:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQOG-0000000FZv0-1cGt
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 17:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2D345C66EA;
	Wed, 11 Dec 2024 17:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE0CC4CED2;
	Wed, 11 Dec 2024 17:20:46 +0000 (UTC)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241206054552.177424-1-quic_bqiang@quicinc.com>
References: <20241206054552.177424-1-quic_bqiang@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix leaking michael_mic for non-primary
 links
Message-Id: <173393764697.2156603.1195377255874275806.b4-ty@oss.qualcomm.com>
Date: Wed, 11 Dec 2024 09:20:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_092048_464480_FAFC90C8 
X-CRM114-Status: UNSURE (   7.43  )
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


On Fri, 06 Dec 2024 13:45:52 +0800, Baochen Qiang wrote:
> In ath12k_dp_rx_peer_frag_setup(), commit ea4192553850 ("wifi: ath12k: add primary
> link for data path operations") checks whether a link is the primary link, and
> returns directly if it isn't. In ML scenario where we have non-primary links created,
> this results in leaking the michael_mic info since it is allocated by default but
> could never be freed for a non-primary link.
> 
> Note that we can not move the might-sleep allocation after primary link check since
> there we are in atomic context (due to spin lock). So keep the default allocation,
> and then free it before return to fix this issue.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix leaking michael_mic for non-primary links
      commit: 02f41c8aa643b0d329ee9fa3f3341919bf86b759

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


