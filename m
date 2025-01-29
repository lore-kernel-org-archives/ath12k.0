Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A4C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkVtFYf2MVcLNdpgF/1FM6AyzPrPgahv/4qNthU6GjE=; b=WrwiMHNjSYbFVYiccjM7Fek/LM
	Uk6k9ERhU8vlCO+fVrR3Ct24zTXxotX+cln87eaxueEgWYh/mw4rzrMmDrQJ9FdhF7zvZy7a9kM7N
	jYFbPp9sAa0SH23/V82HCrSc3DklnSkplj2mNsJgo//ADKiIb/7FGVpf97g1LkMxFNSwS/fNIuPg+
	oL31g/rwRbLjcRqWgZUIhxm9nPfUrmcrg5x3LYRU6/rs0m17GZXZ+PRIXPcgaB0FCp2h4smnC2i9t
	wSHkis2g1+p0ZUUeQ5NyOww74tOlZzQKSePSJiaq+hQ6tDvGtYbv7uAHwejtzRnZN4HvveYr4wBzj
	5OGCJHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4IS-00000006du8-49uR
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 09:23:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4IQ-00000006dtg-3LgP;
	Wed, 29 Jan 2025 09:23:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso762916a91.1;
        Wed, 29 Jan 2025 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142621; x=1738747421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkVtFYf2MVcLNdpgF/1FM6AyzPrPgahv/4qNthU6GjE=;
        b=AKZMAamtjrv/SfKOySuy3Aq+DCsnzn9/6GDH/ZmwtrDANck6lK+HBbMbYHjb0PHnvK
         fgD+kNH+d+yeBMBbOjYpSd3LRoAv5pMhCTJh5SOIrPAovNRj1TA5jaXTc2uKj6xFDj9Q
         cVFQuUNu5yVcULGEMEu4T8dIvITAq3BPufVggoK5luW5c/8lXMYEnbuKZWW9tv/BQBn2
         GYZVuZ9O5yEv1qYK9DLRYgo6WTF+VTtPJgLa1Raje7tpR04DnDw3bPqOjvVcccut38D0
         5JiE5fbVEaeCYHts7++oY9jJ86/lkXZaFSJvjZu4+An0d8Td827dbrOjugQSS0NAv5QP
         QS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142621; x=1738747421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkVtFYf2MVcLNdpgF/1FM6AyzPrPgahv/4qNthU6GjE=;
        b=uDHhPqng/sdoyYrBU4eUWyqKRt3DmjHSpNFfxzAdXHeCRVo+dFcPGQSUJbf6/PllDp
         UuxnqLYyuh8NYXVlbVtTQnN9S//iI8Se27SlwVPB8fgXZYsRCNTPdmAEbdyBW76u17J2
         HZnjxLlDbH0iNepjr8x2b4GXK0Kl2N5W6kJljUNl9VNmzLfNHXL25vGT5B/AYHYfTN9C
         ptHr5WvF4vRx7nRt043NkI+gAwpXYASHjI7tmcLwsYa4sIN/INDTy67NTBItUX674yI8
         bu/FDqspPos2C2n7PdV5w7re/w9Cy7Csc6ov6gO5009iKviFT2zorhuRf4McpHddZP8R
         JOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTQO8aQVvaFicJpn/nsH1bLFB9qjuQb7JVYyCx+ec2/JKrdHegHdVqgDZBWs857CSyufFknwc@lists.infradead.org, AJvYcCUPWAQva46aFWYjtGJ0qid9Yb1E9rJLc1KBhAXIbXIhps/ZGonOUs+CDjdj52/AUGnyAn44Wy8=@lists.infradead.org, AJvYcCXJRI23Z/zJPR75UTcK3Ehxds6YYHZy0Kdm+XO1Q8e0KKJ8i3FigWtzK3CgbWYeJrFtWAxFiLjI@lists.infradead.org
X-Gm-Message-State: AOJu0YzWdWesTbTQAjh2P6VxYTVxHWHz42oU/ApDt45xcAmuiCQrZOw5
	3/ktlVGUzBE4WCE0u89fcRQCJcHTUNTH6ZKcW9X6Zzr+9+m5VcZyBGWYxSaEXfUl5vWd8S+UsMU
	6G22ycI/gIFGqRuR1GeTrb7ZqnEv2IXwH
X-Gm-Gg: ASbGncv7ZpciLxfx4Q3V7Rx7xZhUK+elqdYkjoTLT4S51Osx0IM95IqVafgg/zDWJaU
	WnOH5OcDZ0Dn9vs/9cC1ueqXJo5SnUxFwkjS4IIPvP00PX8P52tX5AK6wfhHOtR64fVyFDgoewA
	==
X-Google-Smtp-Source: AGHT+IG0NT5+Ebjs5FpztVqBT9QwuXSYNyzgvElMDH+2iRgo6k0KnderKKdowGTHlRb3LEKlUYgj7jqgzgwCWWUfrYM=
X-Received: by 2002:a17:90b:4ecf:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-2f83a05c569mr3598722a91.9.1738142621531; Wed, 29 Jan 2025
 01:23:41 -0800 (PST)
MIME-Version: 1.0
References: <87wmefguqt.fsf@kernel.org> <e64c416a975d8fcc4e245db78f31b0daef358e89.camel@tuxdriver.com>
In-Reply-To: <e64c416a975d8fcc4e245db78f31b0daef358e89.camel@tuxdriver.com>
From: Emmanuel Grumbach <egrumbach@gmail.com>
Date: Wed, 29 Jan 2025 11:23:30 +0200
X-Gm-Features: AWEUYZnYaDjc0TciMfJF2gwFNzQ1rD_qqkGo6wdKEgYfWf7G52X1E5mNencBTLo
Message-ID: <CANUX_P3Z2qQC1+SwqqczrQx-9_EOBwDnh-KtvkGFf0heJ81AXw@mail.gmail.com>
Subject: Re: Stepping down as maintainer
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ath12k@lists.infradead.org, 
	ath11k@lists.infradead.org, ath10k@lists.infradead.org, 
	Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_012342_835564_67D3796B 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Kalle,

On Tue, Jan 28, 2025 at 5:18=E2=80=AFPM John W. Linville <linville@tuxdrive=
r.com> wrote:
>
> On Tue, 2025-01-28 at 11:20 +0200, Kalle Valo wrote:
> > Hi everyone,
> >
> > I'm stepping down from all my maintainer roles. My first commit
>
> Well, my friend, I suppose the time has come for you to move on to
> something else? I truly hope that something exciting and rewarding
> awaits you!
>
> You have done a great job in this maintainer role, and I am very
> certain that you will be missed. Few people realize how thankless such
> a role can be, but I do. I hope you will now have some some time to
> enjoy your sauna as you consider what comes next for you.
>
> Thanks for the job you have done.
>

I think we met only once in Seville in ... 2016..

I also would like to take a few moments to thank you for the work you've
done for us all. Just like for many areas in life, we take things for grant=
ed
and only when there is a change we sometimes become more attentive to
what people have done for so many years without being recognized enough.

Good luck and I hope you'll enjoy the ride of your next adventure!

John, I think the last mail I got from you was when you stepped down... I a=
ssume
that the equipment that was considered then state of the art is now under h=
eavy
development as part of your vintage hobby? ;)

