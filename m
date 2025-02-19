Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573AEC021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEtO0cik+G6gR6+YV363V80pVWuJSHz7ZQS+dRLkseA=; b=axQb0zC48ypneKiq2IrrkBQ/za
	b5HMhOFe0+DnwcQVxUWYgx+kpJBX6GrbkRNkhKQ/AYvfnK200MJdrW4E2Xd3aZm7iU267NH0eqEfN
	AzRgRe4E12P6QipSzi4zxgdKrOWqZu1XVXmUAMbnI5vGYRKjUOFDItPCnbQ5iWiSGwFyCidet0Ch7
	/c/8vy0egcQJtiIDmoWfCRkWhUzakZOu0b9Vje/g7XXb+GeUEWwD6HCpl2PJ0/puhgzuQLBSY2r7A
	pF1YGnSrF86JgZcFxUKFr4zCoxeNEC5QgZ46rRaek8q3i2/f2H3i4dsbyF/SwSRy6/0o/6W30eJHM
	7lzsMt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkosv-0000000EO47-0TzJ
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 18:33:25 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoso-0000000EO16-2s0m
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 18:33:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso2170823a12.0
        for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739989997; x=1740594797; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEtO0cik+G6gR6+YV363V80pVWuJSHz7ZQS+dRLkseA=;
        b=MilRnOSSkCDI7vEulGyVV8tTkT8VuLA4vKMsRESQ3oHU4qCEWDhWjLJl22/FL0q2/q
         gDegvjGwtE7rHUJb+oDhvOiwJUrWa7KHXPYgxo6CiIqJh0nk2UxLbcg7HZRE/eM9Lkxj
         yB6JnGr4d3bwNtm5mo9amBB50z+acF5/LLGUa2PUVepHV9BsvFTmtLUbRkCtVqwM+P0I
         da3wrHMhk8cZoXyArxaoH0MD1wlZNiKeKN/f+S9oBC10oVcIb0tf2QVXksPznl6ei5ro
         olibvs+bEP4G3DwjzOavfaCRqMElnsD4UXHmkbYORlsOzXuzq6PHg74EtdBz4f4HxDBL
         IQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739989997; x=1740594797;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEtO0cik+G6gR6+YV363V80pVWuJSHz7ZQS+dRLkseA=;
        b=k8KyTzKPv/BagwFx1FfSmvvtlqD5ow4v/OVvwV679L2D0m84rkIcjAc3a4BwmkOnho
         UpQFo7enO+upchB56MeNBWY0JJyhqNabZImswokdehJ0388HagTSYqLPAcJhOOThBZql
         +QXjf1fR24rvdNBYW1yyqWHT3ndEJQw3NcW71u2SCNTPRVF7WiWo4vb7H0dJo54JJ1aH
         xR1WkulhabMxbCTNqnf4UG7zFLzs5moKRpTVZIWgce0p8rAKZ+O2pfAyFX9M6H+Sj0nO
         kiX9Z5CbWOTQ2PUd89oaAG2T2QBSLjZLqitxDnStrVt3X0VJE1LPZ+KvLpQr6bhU/zJn
         aTjA==
X-Forwarded-Encrypted: i=1; AJvYcCVU+9wH9GYdhCo5OW/nxz8B42pYQ5jwf+qJjkYp6PjQs7wYnHUhV7ZVlijDqTlfz6+fkAXPA54=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg0ZWVcTuXwGw2lwTzNgVuVoWkb8LWL0CcAJBWcwGgPjFCOuza
	OR1eZA53o885XXuB1Ft4lSr55edi52aPpSLafwUcQ0fF6f19NnI2YaSBFw==
X-Gm-Gg: ASbGncu9mSNbgWOhlb1Sz5f4/rsFX9bcCaiJKLJwIb5oL6qNHPlm8AWunPhueqrjl+t
	xPcKUUpBlDdOoupIMtIXt5xLZWoWP1GW77rutcwTQzwHBLP/YF+GuLu8lAEWkWdr8JZwRDROy1j
	ltIovC5pvXlOxn8HaIN7EjQY3bcaR3GHbOq9dlnbS77WI1rCc1rw2d5+3uXKcm05AMqoPu6IyFc
	zxdZ78iK0cHPK3bmgmdXBiODd5VqNyWvFDVa5Y8bVpauXpAW2gZa/1jzoidw9O57O1gr8uR5r7i
	J+96mmHla1JSif71b1FzNFCPgdVeF0MRNQ==
X-Google-Smtp-Source: AGHT+IFEV6bKzI8csoMKmAIqDUO1YBIluo8x/jVyBAB7G02y4p1KEM6EDmpOT4MQXE8OSEN3KF3Dsg==
X-Received: by 2002:a17:907:86a6:b0:ab7:f92c:8fde with SMTP id a640c23a62f3a-abbedf43d4amr27254666b.30.1739989996292;
        Wed, 19 Feb 2025 10:33:16 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm687074166b.135.2025.02.19.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 10:33:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Feb 2025 19:33:15 +0100
Message-Id: <D7WMZ4TCZKPB.2GBOWXBN8WKF9@gmail.com>
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250124113331.93476-1-nico.escande@gmail.com>
 <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
In-Reply-To: <7e120d90-bbe6-47f5-bf72-c1ee681c97a0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_103318_721111_8BEB4264 
X-CRM114-Status: GOOD (  12.45  )
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

On Wed Feb 19, 2025 at 6:58 PM CET, Jeff Johnson wrote:
>
> checkpatch complains:
> WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5e8a373c8699', maybe rebase=
d or not pulled?
>
> And I don't see such a change in kernel.org
>
> Perhaps this is an out-of-tree change that should be referenced in a diff=
erent
> way?
>
> /jeff

Indeed I didn't realize that was not mainline, but just in our internal tre=
e.
My bad. Honestly surprised this has never been pushed upstream.

So the corresponding patch I was refering to is this one:
https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.w=
lan_host_opensource.3.0.r24/patches/ath11k/207-ath11k-Add-support-for-dynam=
ic-vlan.patch

How would you like to proceed ? I can respin it without this wrong referenc=
e if
need be. But if one of you guys has a better fix or something we can drop i=
t too

Thanks

