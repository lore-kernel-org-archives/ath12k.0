Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A4CED628
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tH4PRsvJaHg6SXh8tH0Cpk14Nl/3edve3hiE7lRH0g=; b=V4mZQr7QmsSihJ6/MDYp7p24I0
	72EqEVrH9VXyARAoyTgwGhLp1faJispprjZaKRWwrKnbEaF66eu7mlO+OZagyZiRkjPKNgx08aQgX
	1bmZc4JChFEOiITMOCSy4MLZJOPFjwQ3VKM2EILD44eLtgraYMsouPVPeHZV7/rHExexON+q4F+3m
	NLnus2cDfNj/1eSq3IUlet6zRMFFvTiaF960NC7HCCZsGZdIvBvKNKxIMg/SZxi9kUed6kR4BSvGq
	/6QW8Ut0uZoc/fa6/wqOzMIeKGfe2Rj27OiBMa+qPZ6C/99gg8x0IdP3jl4YGkuYjE8C+yWwHUhEW
	lvHsc5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sySLM-00000008XE2-1LcN
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 08:46:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sySJs-00000008Wh2-2x2l
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 08:45:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53992157528so6984867e87.2
        for <ath12k@lists.infradead.org>; Wed, 09 Oct 2024 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728463518; x=1729068318; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tH4PRsvJaHg6SXh8tH0Cpk14Nl/3edve3hiE7lRH0g=;
        b=MYADv3nn/Es6mFbTwm/BnNKyTh1J+qWT7+uImRTc0ZnVCqrnM5O6CqL/a0lzS8s5xN
         1JsxGSXl/UinrCka4Hc+QAclAnFuHPbAzSvhzefLBhs9FCuhO2DOyPREgRM1YTbwU41Q
         VyuKB/NmRqsfVp+Xkrty3gEmua0rqyNaulEHp96PAwN6YHhttf0D8PmPyjr6kAc6co9x
         5CRtZDeja2NGa8GqllIGcc6J+yFX6dCjddEv4PtuN64vM3GkqxIDeWIUaNODQps0tFdz
         81RpqBis0kxzmCRUvPXgKZrQ/6c0lc9oWP5tjdONRMglrcB3Da8j1cCxjNtsVy/OyDq9
         SD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463518; x=1729068318;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tH4PRsvJaHg6SXh8tH0Cpk14Nl/3edve3hiE7lRH0g=;
        b=pdykPoxa4fovPySRzBIWGKnsztnUTJp4TlohhtCBiojjQleRLJeJa08KK2TMWn609S
         8JCgoIyNxGo1PPND0S4kWBEVWrUYdkxw3qd7V1RuXCJZHXcFRfTuiQThhEJ8/RPmGOnq
         jZXnJdxh36A4holeqzl4RmacbqgHAqLEZdwcWy3CII1x3755L7yreHhJQPvs7FXsy1U5
         ucypoD5mvtqTfcwYcK7046fz5esNepiATGiudetRgc8WcHtxSROggTU/YjCMPPfdfZHs
         AtTJPs2wi/Vv+B4hPGOV3aFGIfjuiMfMAwtlYvmqojjNVWYYe0GSA1TPuuwD7H7RbIgO
         c9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWFersNJA8t/2D5EiO32FMWkvDjMby2Ai+nIYz/YK3umezbz7bT99NJ4VkRQL87XycOImep3ck=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/5BJ4uJKzZtIQFseeyn8GwGleiKqnIBYEGuGL3qXwGhO/XrQF
	aVIm5X8TnqUwh1bfww27HCFd3W+7wmCLdsd6s1lLYXa/zMfEEZZKlimotA==
X-Google-Smtp-Source: AGHT+IEZzAuvgxedsOU+1T6K7D6fTNM/AqY31hE2IBYY5COd51BUbYjqHOaZY9tiQ/uC+I4m/Df1UQ==
X-Received: by 2002:a05:6512:3d10:b0:52c:dfa2:5ac1 with SMTP id 2adb3069b0e04-539c48c6d20mr835327e87.24.1728463518130;
        Wed, 09 Oct 2024 01:45:18 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691b505sm9846001f8f.43.2024.10.09.01.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:45:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 10:45:17 +0200
Message-Id: <D4R56HZ6VXK8.K9SXH6LDM5GD@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 00/11] wifi: ath12k: some fixes and clean up for
 monitor mode
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kang Yang" <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241008073534.1195-1-quic_kangyang@quicinc.com>
 <D4R4RHZM9GWX.2V6MHL6HW9YG3@gmail.com>
 <fc004753-2e5d-4694-9c35-8a4c4ccab7ed@quicinc.com>
In-Reply-To: <fc004753-2e5d-4694-9c35-8a4c4ccab7ed@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_014520_850063_8CDA93F3 
X-CRM114-Status: GOOD (  20.48  )
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

On Wed Oct 9, 2024 at 10:35 AM CEST, Kang Yang wrote:
>
>
> On 10/9/2024 4:25 PM, Nicolas Escande wrote:
> > On Tue Oct 8, 2024 at 9:35 AM CEST, Kang Yang wrote:
> >> This patch set does some fixes and clean up for monitor mode.
> >>
> >> v2: rebase on tag: ath-202410072115.
> >>
> >> Kang Yang (11):
> >>    wifi: ath12k: remove unused variable monitor_present
> >>    wifi: ath12k: optimize storage size for struct ath12k
> >>    wifi: ath12k: fix struct hal_rx_ppdu_end_user_stats
> >>    wifi: ath12k: fix struct hal_rx_ppdu_start
> >>    wifi: ath12k: fix struct hal_rx_phyrx_rssi_legacy_info
> >>    wifi: ath12k: fix struct hal_rx_mpdu_start
> >>    wifi: ath12k: properly handling the state variables of monitor mode
> >>    wifi: ath12k: delete NSS and TX power setting for monitor vdev
> >>    wifi: ath12k: use tail MSDU to get MSDU information
> >>    wifi: ath12k: fix A-MSDU indication in monitor mode
> >>    wifi: ath12k: delete mon reap timer
> >>
> >>   drivers/net/wireless/ath/ath12k/core.c   |   5 ++
> >>   drivers/net/wireless/ath/ath12k/core.h   |  23 +++--
> >>   drivers/net/wireless/ath/ath12k/dp.c     |  25 ------
> >>   drivers/net/wireless/ath/ath12k/dp_mon.c | 108 ++++++++++++---------=
--
> >>   drivers/net/wireless/ath/ath12k/hal_rx.h |  53 ++++++-----
> >>   drivers/net/wireless/ath/ath12k/mac.c    |  24 +++--
> >>   6 files changed, 114 insertions(+), 124 deletions(-)
> >>
> >>
> >> base-commit: b9545f4570fcfebe982439de7c9106e55b4bf756
> >=20
> > Hello,
> >=20
> > Two quick questions there:
> >   - If monitor works for wcn7850 shouldn't you set supports_monitor=3Dt=
rue in hw.c
> >     Or does it still require more work for it work ?
>
> Yes, still have many monitor mode patches. Will set this hw parameter in=
=20
> those patches.
Got it.
>
>
> >   - This whole series seems to have been tested only with wcn7850 and n=
ot qcn9274
> >     Is it still not supported on qcn9274 ?
>
> Actually, this is classic monitor mode for wcn7850, not sure whether=20
> qcn9274 supports it(I think theoretically it is supported).
> As far as I know, they are using full monitor mode.
Ha ok, yes full monitor is what we really care about.
>
> >=20
> > Thanks

Thanks

