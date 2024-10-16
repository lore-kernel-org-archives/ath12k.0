Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0B5D1AD43
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t35RrnvDQXTH6WlgCiQGNdu+PPMpKHTypuZ5fkXYJTs=; b=lI/V7rq+UpHrSedClZ/AqRBnjc
	maOnghPtVQa7A+8L05gFzkt7ylE7jqSKK/LzNDlJVQEfMChBXvtI3f9LHQDZoFX0Kjs1a9Qdx3Olf
	4QNew0CuMwBLlyEbuF0MqDoyU+4J71dJgl7uDMrost/72DXqoMnMnZB/i3mROFCRmRiooZvMUFzHY
	cHcZhBOc7fFnza9ST9vFRXEYNMpYSxFKVFpwHg2JdvGUC8anO98XubemoOEZ/+en6jOgZDLLsDESD
	xgNRvak6RJ+M4wryMIuM/XHuWMgr5R7cysSBW9x23g1qUqRHzTMwCNzaR1LVbEMkjIKzeHZAEas/v
	neJm06YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11yF-0000000BZ3n-1q0X
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 11:13:39 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11yD-0000000BZ3N-1KHR
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 11:13:38 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6e330b7752cso5748487b3.1
        for <ath12k@lists.infradead.org>; Wed, 16 Oct 2024 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729077216; x=1729682016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t35RrnvDQXTH6WlgCiQGNdu+PPMpKHTypuZ5fkXYJTs=;
        b=HXpJz8NuEVFMlGpXrawq4IEmhEPzh0ELufpY+aUNSVKjo/GbCBaN0/MJt/oDR5/zkn
         UYhsA9l1XfFrINv1QZEUujkSjfKvexTpe0Ghb2/c26uV6vLOL1/KPBQW+hVYm9rHNGuj
         4Dmw2tXpgMt2gfJwj9n2SIVqAELsOsFclnCZFll9R4kX/nAQpIy8MNxi/EtqklAR+0mJ
         EeJablbEuqzHL9IWvLngvxHO+p98/ILN7dxJbaKkwTzhExtMkByx0SKf7SVudRS2+Yyz
         iPBJd2LU6exUf2RtCGBa6Mn+IWTDIEPblxIRHUZ2uEfWIKRUnfNJ/1OEqrTQ619oYJOU
         2atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729077216; x=1729682016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t35RrnvDQXTH6WlgCiQGNdu+PPMpKHTypuZ5fkXYJTs=;
        b=NAs6eHqwI0QUgxncKhe4/A+rkqC4t4FR7UxqnnkkEMSILJFmSDZfOAHkUxRkIT/RKx
         A1pd0xGHo/PsjHo154mIjBzU3IUcOuhcQPCZhbpWih6vtSeejQjuvBgg47NTMf89TZXF
         aoGO/bJ6wKPSuSq6UVWqbMKVBlVwODZNXe+qUChjRF3ZaSzAwIgcUMcfxB4zn4j5YrgH
         DMlBLIC0M3QYXaSD8v3nd0ZwHbxsphbtZ6IJZczpeuhLg2Fp78XWyiG93rO7uGJJvlJw
         TpCntxaAEZMTO1jtwLUziqLUlfKlIq/6zecP4zCnnOgYzDdDd+tfyQt9MdtuZC3E6SNu
         +fcw==
X-Forwarded-Encrypted: i=1; AJvYcCXL3en+yNoVpaHDKOONprQ+Irc4hSqsM6IzvTvX5iGuFoQxmI0tPF2bUHp2O7klnt3uR28shNI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsil1d3z0B0EojoV5vw+rHyYwPQmmhcXAHbArEEQ2u7W7K0lEt
	n5LDLXmsKFDp1ieccJkogCwVnuiCC2c47WmSeBfliDEuqbgcazfMF40xd/rvhGPUe4hp9AuEpzL
	ZQlJKV01H36bPq4Lpo4b8jU3QHlYq5B7xg5JqiQ==
X-Google-Smtp-Source: AGHT+IFbaQB1b7uprlpkX9leHepB8/oAO3NTYJHXyEBNTbByJjabNy9Zt6W7LL2bl36doaQxwSWNeBZZmKsWoyLbeNU=
X-Received: by 2002:a05:690c:3587:b0:664:74cd:5548 with SMTP id
 00721157ae682-6e3d34ee5a7mr30758017b3.1.1729077215816; Wed, 16 Oct 2024
 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-3-quic_rajkbhag@quicinc.com> <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
 <gnv7i3m5ooxtyi4ywgq4q5sq3wj6j7xtjx6puuixoulypeiwjo@65wfj657x5ug> <28d9b410-dcf0-4431-81a3-6c33d536d217@kernel.org>
In-Reply-To: <28d9b410-dcf0-4431-81a3-6c33d536d217@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 16 Oct 2024 14:13:24 +0300
Message-ID: <CAA8EJpotk=pgcmFePrqESnpE5edRZVboCs-M9-nPOQcG0xa2Jg@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: add wifi node for IPQ5332
 based RDP441
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_041337_389974_FE6CF5DF 
X-CRM114-Status: GOOD (  15.51  )
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

On Wed, 16 Oct 2024 at 13:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/10/2024 12:30, Dmitry Baryshkov wrote:
> > On Wed, Oct 16, 2024 at 08:58:25AM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, Oct 15, 2024 at 11:56:17PM +0530, Raj Kumar Bhagat wrote:
> >>> RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
> >>> device.
> >>>
> >>> Describe and add WiFi node for RDP441. Also, reserve the memory
> >>> required by IPQ5332 firmware.
> >>>
> >>> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> >>
> >> Don't send one DTS patch in 22 patchset targetting different subsystem.
> >> Imagine, how wireless maintainers are supposed to apply their bits? 21
> >> commands instead of one command?
> >
> > Huh? b4 shazam -P 1,3-22 should work. Or ideally the DTS should be the
>
> Hm indeed, it wasn't some time ago.
>
> > last one, so applying all other patches should be obvious. As a reviewer
> > I find it troublesome to review bindindings / driver without an actual
> > DTS snippet.
>
> Considering that patchsets for certain subsystem *have to skip DTS* (you
> cannot include DTS in the series), then better get used to such
> inconvenience.

Yes, I'm getting used to that for some of the subsys.


-- 
With best wishes
Dmitry

