Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48EC4451C
	for <ath12k@archiver.kernel.org>; Sat, 18 Jul 2026 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=; b=duA31xm+k8KEwPfIGp36A57rdM
	2UI9NgPjGUIH3FDDTgKghACyRBZJth70jAINhMn8aT2SGP8gRu32Et3/gD2uikIXp0LAFO3QR3x4r
	9GZIYmPapQZKwKPmwUETyf+Y00a3LRuxg7V4FXC+UOFLZ8vOeWMu6DpUiJiF6v377RQ2jOmqOc8mT
	xnMzc+GMpYLXJuPV6gW0sKW8RlQpUmClnKaFNxJLRGo35MIbf0mPlBxnPEz5gJ7mqXofI43GjHl2d
	XVU9B09lXsP4KGskGZRZZWQcg4iTpZUGXi7KgnFLpLbi7bBljQraLvb2z8853uBfowSkR9/+Irmhr
	Id1JMDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz8k-00000003oK2-19vX;
	Sat, 18 Jul 2026 07:07:14 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkz8h-00000003oJ9-1GFm
	for ath12k@lists.infradead.org;
	Sat, 18 Jul 2026 07:07:12 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-667b0ced2d3so9838944d50.2
        for <ath12k@lists.infradead.org>; Sat, 18 Jul 2026 00:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784358430; cv=none;
        d=google.com; s=arc-20260327;
        b=TDHieVkYgKFMGYtYGypaygPs7u1kzXmrXfKnV3wN8BfX89vaTxN4KEWGYBBY5S9ln4
         rA25WIWIueuN/Lw9eQcNhRP/RU4YlUaKLfOrJIZB0jr9F6HSDgiUz4XnICbYTHw5xRrY
         +gixgWi5g89X9AuarM93dtzMveZqhLKLa1bp6bTHrr9mGM0jDG32Mh2/cVoeVsAk8H/3
         msx0mLt46JYPUvQ+7gqRKLO6MVK2Ce46ePS9sFAWMoBxLuDEQRj7ToFLuCNlshWXeJr+
         Tctrlw/A7bTriUJlQaCH5yqKPm/z7GL6wGjINa5CDz2NIgKlmFBxydpY8I9NmZ64dp6D
         05TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        fh=HVBVs7zKP0ookOGIQ95kLQ7KxQTZHtLaiCy6QtMYkoY=;
        b=lsWeh0x4Q+BvqBiMohUyVWYkivga5g3avtBYvlGC//PJ48p6jkb16qeZw7pb2TGC2u
         0kKLF3tNezhj7BBZvF8qoyR6/psODDtr5Vr8GN2iI8AIaC9XxCrhS3Q2Fs8COrPadwtd
         /AcuE9wN87QEsH5FLQt5Bki0nmT+cij2uVjXHITZo5bqpjtNoIWbpN54m+ot5/TtWCWY
         DiG3ekMMcwBuMyOdZBojMKRHbT28tLpaHrFvy4E+yhO5j9k2re8W3NIDOGw3dCJ4n9FS
         0+7BtGGD+I57SzibX0jem26wv/9XHNysa8v94htRPDIamGtijv188tESE2Kl7mpfj6n6
         1KuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784358430; x=1784963230; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        b=OQGUkntbo+MNKJ8o+G44TqUvndylhsVu3PA25jxjp12J7fnb6shbuCB7srKS4hcmcD
         MhFgGmP/BjdiI2cUUnlQdi2uZVTNZ7EuEUQpq3UwDXX6cgYZ0G2gb5u2sb0BA9/J9Lns
         auyMONvkGUyOHdpqdXZxVxH21Cb9RKFPzU83n1hl1vbbWjYy55n5H/93RrTctWVTYh/K
         qYgnT7BquDw9mtRwTuNbTLPv8+aNF3foYIOnB1rE0xWJZ2YJjJGH7HvQ+qWYyQKPiERO
         7TSi0OenxiOAoGZVBDB+HywFEYRGufRYFCv7foZafeX1seeGvAtf9GbymMHcpc+TrcKR
         Ftow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784358430; x=1784963230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wmSIkFJSqyaKz3/VEwKpr/MGHtYZvKLOlp0Bt0CKKUU=;
        b=pTykoNb37rGkBLeDoFhqkDJ8ITDHA3H0H6SQrHsX9TT3ZZIl/akPpPU+GGPD4ZcWQr
         BZ58NSnE7MUfJ2RvAcNhHt84kJC6SNtxiAi4aRlWFnbZzsjU7KI8NO61SAh83JGptU+R
         jtc0mQqZd0XTjG+EKE2p7MIKVmH5KMLzKSHEzQyGbtNxiq9nqygd8MEuxISniZifMwPh
         wD7kmkP7VFu612ZJrfZ/BbuxzmTlL5Oac8xC37kOi95BL/mLWTGzxS4NDp118T41Q6vv
         BQ3edfElpKd4090+qvaQz5Wg9QBPc0RATL2hSYrWs9XwniJsVcfmtMZp1E4G4sKADrae
         alGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7o6BhyChzBjRaZJvwFDjAVXnYsMwA+6JL+JIWhB45TpDTJp5eEF8YpODtoRMly7re9s+vkfI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlqLzGLR95IPtA7vQ303iq0tHo/af1yrgDjU9jZ0G9BGGK7u+/
	iFDrR4k2+SmsjBoXytmJCaCXbtkmH45PzgxqymUsVj2YdniIptJL2NPrumtzKjXd58Jj7/iM7H9
	jfCpUAvVJ2BVshKUa4Zr4gP8C7P53+yw=
X-Gm-Gg: AfdE7clDtI55+p5iP1zs83NCy8RqeAI34rxaT1Smrslf9CLeaSvd8dhFy8n4kTqd8d/
	t7zfFw31OiL4q10tE/QkYrEvPdALqAJd/A7aT4NXAgPaWJ9c/oqo9y0VJNLeO2XXWUF5LpJyYKT
	Szn+i1xXyz+QYKPQWzzfDSZiQs1auUgkTQKlxtNASYf8aGiVQkyJb6un0BZSzaEh8P6aCSF1Vh9
	mNd3ddTU7WgKgrWTqk+XjM701sTvIgX+Rk3qz5uOWC6EXrEFb3v1AMJqyKFpddJ
X-Received: by 2002:a05:690c:6d0c:b0:80c:85c6:898a with SMTP id
 00721157ae682-81ef266218emr20230547b3.57.1784358429733; Sat, 18 Jul 2026
 00:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260715064042.1988288-1-lgs201920130244@gmail.com> <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
In-Reply-To: <faf48c76-373a-42c1-9c69-cfbc5178640a@oss.qualcomm.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 18 Jul 2026 15:06:57 +0800
X-Gm-Features: AUfX_mwQ4-arHf0bC-CsIAMvfm-Hm1rvw6GpPIJETr6Tid6aJ6SrX8LIeHodJIg
Message-ID: <CANUHTR8DHt+dABWn1KmnCJNZhjY2NASqGwPp2SU7CSrhjhOe1g@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k/ath12k: release QMI handles on late init failures
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Anilkumar Kolli <quic_akolli@quicinc.com>, 
	Sriram R <quic_srirrama@quicinc.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, 
	Kalle Valo <kvalo@kernel.org>, Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_000711_346346_2A472D52 
X-CRM114-Status: GOOD (  16.94  )
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

Hi Jeff,

Thank you for the review.

On Thu, 16 Jul 2026 at 08:59, Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 7/14/2026 11:40 PM, Guangshuo Li wrote:
> > ath11k and ath12k initialize their QMI handles before allocating the QMI
> > event workqueues and registering the service lookups.
> >
> > If either of these later initialization steps fails, the functions
> > return without releasing the initialized QMI handles, leaking their
> > resources.
> >
> > Release the QMI handles on the late failure paths in both drivers.
> >
> > ath12k_qmi_deinit_service() uses ab->qmi.ab to determine whether QMI
> > service initialization completed successfully. Set it only after all
> > initialization steps succeed. Keep the ath11k assignment unchanged
> > because ath11k does not use it as an initialization-success guard.
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
> >     as suggested by Baochen Qiang.
> >   - Fix the same late initialization QMI handle leak in ath11k, as
> >     suggested by Vasanthakumar Thiagarajan.
> >   - Drop the Reviewed-by tag due to the code changes.
> >
> >  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
> >  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
> >  2 files changed, 18 insertions(+), 5 deletions(-)
>
> Please split into two patches, one for ath11k and one for ath12k
>

I will split the ath11k and ath12k changes
into two separate patches and send a v3 series.

Best regards,
Guangshuo

