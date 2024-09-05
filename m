Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA309CD5BD6
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zBvME5tD40fVGiw/EVJjgKoz+dZPhj0zD8duFICzlY=; b=Nv1agl/dqfuKTV29hNVrjh2Glf
	7M9pYtCHHn7IKyVWKBbF7o9KLMMTOloFqtDjwTIxJ7YH6abnP6vlolTAaIxnk3feMTzIb2De6P5Co
	pjl+GO/dOtRGK9h6ZUH2jtxPZouHtoGTJeqwSqdVnRqG0Zw1TGQI3WpIoBEHjxqQgpefmxeugvtHJ
	NJO65FVWLbSmQmCC9zFcFFc8hOEM1VzTVEYXYhaX2NGevgvLf2tdB6j0+e+sxZDBRK7KShDruq7Mr
	PgLrvT+PbF3LXsxaexqR0xGvgav+6h1vILMSt/FC3wumwNSVq5kHemFO4/k8dHbT+hbAuHFmCNneS
	h4bDDRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFDl-000000095Vb-2Jus
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 16:20:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFDj-000000095UR-0IMw
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 16:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18E0BA44D9F
	for <ath12k@lists.infradead.org>; Thu,  5 Sep 2024 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6B2C4CEC3;
	Thu,  5 Sep 2024 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725553230;
	bh=qusHqJLOWjw7pUwleJIWBOfj0NWh22390XqDHGqnV8s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=u9Gox4+ENg+5bDZQr5wkDzAyb79a0pTAFY3xI+V/xvYcrcIB42f1zZUtNaI9+TTEr
	 55Wmog8B7A/JP6ZOH2m1aJWueoJ4v+9V09QZ/e27YnKhNl3xUAEqTN8xagYBVuhEVo
	 mIGuuAfUNoxQ5H53IRq4dOVeBFTK84FXQxAkeob4qrQpvEm5+HoCRIzfeWfCx37qqj
	 hyTGsm/jvC53kbwtPHb8YJMDK+KP7K9NRC4x2i4zWRbF0XYW18+XchrL9VD97SoD6A
	 1d2E3+NwgVIItCShSfnE+ahVof65qwvqwU9hTaFAUPuMZLFudpSypHPYDgRliTyuZv
	 C8bzMNVnENptg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] wifi: ath12k: Avoid -Wflex-array-member-not-at-end
 warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZrZEuxJihMzAaTVh@cute>
References: <ZrZEuxJihMzAaTVh@cute>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172555322675.1740680.5516276191783582303.kvalo@kernel.org>
Date: Thu,  5 Sep 2024 16:20:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_092031_207535_76D0717B 
X-CRM114-Status: UNSURE (   7.38  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the structure. Notice
> that `struct ieee80211_chanctx_conf` is a flexible structure --a
> structure that contains a flexible-array member.
> 
> Also, remove an unused structure.
> 
> Fix the following warnings:
> drivers/net/wireless/ath/ath12k/core.h:290:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/net/wireless/ath/ath12k/dp.h:1499:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

02f454f9aa62 wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZrZEuxJihMzAaTVh@cute/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


