Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32623CA5FFC
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=; b=AtbH6UzZngc+kPGNAkD7HiLm7V
	Hvhf0GnAXgjWv4jai5ZESMWz40KRPDvL6kLYMRykn7xH7Z0OnDVD2or2eGO7wHglrtG5jpG3o1CAY
	Pp3EmMF1buubtOJBZTyKqNimH9u2IYrEakOhTPO5jzD8HlMJiQPgRrtOsyl5BmSFbLiJLdmCvqjVs
	LNq1YgYG0cDec7S9xFZxwsNVZXpNHc2vuc2+nAICH3CRngq/cyDvpZI3NYfg36zOYjfh9RNzE6cB+
	D3P8COpbYq7tNGkKB+UBRsL/cr4hwxz0Ppxdz6p9Gv+2Kq+F/ML17U009P9E5OX2pbuCeUAuY/EIu
	jdQPoKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlty-0000000Grrz-3Z8v;
	Mon, 05 Oct 2026 16:50:58 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlts-0000000Grqh-0kwC
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 16:50:55 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-451a49abd8aso1133196fac.3
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 09:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219048; cv=none;
        d=google.com; s=arc-20260327;
        b=DKcP+QPEnjl8qOgw6W4qZ3X/0L+sQqwyOPV0nAiS9gSDXOMd1v8sVVjeoDdRKwljoi
         LMMYCa5oimJLpJsg34F50rRnPH2y7MYsSa/gm55vxqV3ewADdIVPD5WOHOi6ElxiLSpB
         qqWIcVnVoeWi3UwXnENOcn+EEn96EC37IXy7XjyYX/2tAsSFMd3s7YBP/QmzaQ39hd5K
         MXTJr+IzrpgA4eHJw4NNMckdby3SWiHi+cBjcaRtXZS9Zu0bKUakrwYcldxZesh2yfbs
         hG3FzHrGxg5dBA/Cezg4NTV8PrVK336AwNo9muIbSxcN6Jgt06umsv7jFMVanUdXF+Gs
         Qwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        fh=8/pcD/ZpK/CEBaYjc3YDjEm/e737yke/EXgsvz8wM+k=;
        b=NxgJy/NN/E3F19TY+KqItIzYyLoE9P0sgaUWh4l8afQIgHK++TTBknqizV5ubnZbpr
         q5JrUh5tjB9Ws2g4wTDW7+HpcjrG/Dh7q2RT2cT6Vj+zTQ9hWXNUdhZTwqr1WzsdYQP2
         /1AYV7yeWQVtkcgY7495KqzadY7yvfBK1Bg4gHb1om3u40BoXN+uuu11NKmx0gnv10+2
         IIQGQGd/JeM8QkRkNvZw4x+bPY/uP2nwsdM2Nrd5HnvaRNNOGgCcWwdBNsXyZ06SuKSh
         EPj5lvyAr8E3rzTerNxW6EuIHSOzHY1A5yvsYXR6hXxGocz47hAGJ/IlwC8IVL6YZpQb
         rMrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219048; x=1791823848; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=P6c71jOcnsnBxg7j8mk5+3lRILBihlAfk0TyMRsWij6ljt1VJtzwFWcJB4IiyIxkBe
         zjuI409ui4eyub4CG/LtBxeoo4+rUwQHOEYJH2RJ0y2TZQz40dgZ2I5PvcAZbdfIlmZN
         yUsDVmCiO7v9WYmpaj3QUxE1SHJw7p5wcTJ5fjESvnjcxcQqwpCbB5oymhlyK0LpsZWO
         BFZ2NQLoEl0+NLSPTCkXMV/MzIcUGyXCzWzDUm1DKsq8llenxNrk/H1GIcRtTqQ81ehp
         X7nj7fku/cpBnQST7v+7d7UyE+rqUb4CCrOjsbBG1/+kyJhnf3KRpOBcLSz3RHs5JPHP
         FtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219048; x=1791823848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q5bEQNNXDkZhEHk+o9hidTvXzFCLdcCycoDgksfDDBQ=;
        b=FWsgmxz2SKwFKIJd7PexkJx8Qayuhtwv2SrfanCtf4Z1mO3HcJ7ReY5L8zrwEgnIMO
         Op76J9l6YShbuPTx05u0DB+RY6+6KI3KiJbR/FqSe1W4eGV4rD6c/XZOHlmF5ESOtduz
         TKmvHj0uFaDkAf7v5anaNrdjbh1uUTNCfZ8EAvbByGT0wIHAftbH0vHbRxVP1ka9OFk0
         Vcjb1xSqEN0LNX1JShrjjRCfUzgYmqOlWtAVkyU0CBeRqa7Nes9h5Q5mIDtmo1vP06ZX
         ZVxcd6/3aHqV3ZNJeMPq15m6IeVcyViDxQrpEUe6PRofAb5NaHJIK6Q0XZwokVPV8cBI
         O72A==
X-Forwarded-Encrypted: i=1; AKwUvBy25VvC0P53d9yRO17HIhPxtzuXEh3iOUK//+d0fAH7k9+3BSphCCxlYOEPzR4fkw+fMT3JXLM=@lists.infradead.org
X-Gm-Message-State: AFuF++kVlU4qcKNAEyhonMLo3y9b8FfBuNQlfwiPAr190EXTpObJ7wZ6
	2bomdgK478GNgogwoRHRKXkpjbCQExErYIL7NDRjF3rL2jGOSMApxlmdq2Z8WhKyTx0WGpPDEmf
	CFI+4dDkJ8e31EgRUECjZd2IAYkpXqcc=
X-Gm-Gg: AYBFou0KUC/juGWz2bIrYDQEXb02fpGoSroXB5fL1DCdmImU8AX1eotfJ0e7n2VX1Ju
	XApfq8BrHAvVmgm/UH+NUrCS+DQtJFeua9aHzf8oANAFs0d5MG64RDfzlTrUTrcWNYESMsI2Pl0
	kVo743dnS4s4+GfZxBlOFJuYONTCIXRtvF7yu48YPxK7p+1zUuMrGB7XeESjsxEdL/pXvGZVsjm
	cLAM4vfecscig2jHkrSseoLR4V/QASV9KDR5kV/sxg0U/GKlQC7dEtzGxZ5LNbJsEofT4GLxqct
	1RVR4gALuPUuhZRaOoC0SMd4Tjxk7icfOk+qF5yEym3/EmTtycFi1tktBg/1DuS/oDr4D64HSvB
	UP7u9imuRgNi1
X-Received: by 2002:a05:6808:1795:b0:4e8:2150:299 with SMTP id
 5614622812f47-4f679fe2a10mr7854866b6e.23.1791219047967; Mon, 05 Oct 2026
 09:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20261004165132.4313-1-franzelfranzel@gmail.com> <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
In-Reply-To: <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
From: Dale Whinham <daleyo@gmail.com>
Date: Mon, 5 Oct 2026 16:50:16 +0000
X-Gm-Features: AclHuK86rNmj1WNp2rnEYWCTMSv7GKXC5kLWAnqBi1EywA_4Cfr2oGHSi5bAdpE
Message-ID: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_095052_228084_34B53232 
X-CRM114-Status: UNSURE (   7.47  )
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

On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> my preference would to to break this out into a separate table-driven function
> so that if other devices have this issue they would just need to add to the table.

Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
also affected by this issue.

Best regards,
Dale

