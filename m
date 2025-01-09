Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1801E77199
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91+Mr5Qhx/Ho4c5EAjIdwcMJKY9RDJdDvZClb53P1cc=; b=bgi4yQ1LRU7AAN+XpZwIHARbq2
	neJA00pDYj1R5lh2j98VpHfpl89+YS3+GndkJpSj/JgWL5MvBNHZYW1mB4CgS6P0ePsfPX5lwgPBO
	U0p7h5/6XORnkbHNtzb2DoBV0GJFq7vuOZII7xYkryzpL241rnGRBN6ckFEL/9lCnXcOqOWE2yc8N
	C5eiXdb0TyVxFArODTzALr/CzO0IThynzDunvQMd1ILu88Hg2EkLNrY5XmnzB5DYITN/MlXfCx8Jo
	kaHx5PcaOflsStzhHVyDwRV/H3JNBhJOT/7ZlRWWKQfDPTztL+cZ4MZuYq28MWOdz4KwJNmBhArkM
	CFPgkYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvgZ-0000000Cjsr-36wo
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 16:47:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvgO-0000000CjqK-0mG2;
	Thu, 09 Jan 2025 16:46:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43675b1155bso14038585e9.2;
        Thu, 09 Jan 2025 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736441215; x=1737046015; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91+Mr5Qhx/Ho4c5EAjIdwcMJKY9RDJdDvZClb53P1cc=;
        b=jVAM8RAPiolAjzjHcmL5gfxK1GBvvdghSmWZK7A7qModz5pnsfu+imah4mq7tweQB5
         ij5CyhdF3LyMmdj9rjVqpcL7n4efz5TzOu9dFGc+x6krgognnjMwOsBP3QGnguNlFHZi
         6PRb8z4YlQmKNKnsaVRVxemqkfZPSNLh4/AKEhQ6C1GuIDcuxZjpzAt7eZvx/q9ohANW
         +8mGY1hX6Fa8ge2rcnHxMRaybhB6jPSBiMdyAVmHeUaB1ClbDMlftPCt/Mno3u55J9bD
         YWtncsHkmURenXUTXViTQDo5HdroQ3eBYv5NT2Kc6ghXHlIbyO+3q5r+/2jAZ6u5Sdfk
         i2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736441215; x=1737046015;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91+Mr5Qhx/Ho4c5EAjIdwcMJKY9RDJdDvZClb53P1cc=;
        b=Wz3mB1i1BZ38nrcVBcFp3sVd5ee9EVXTyzxw4yLKvi+zXzjW+MdiVEolCmuHrQIKpl
         tgzVV0EfCg18g/0fIe6PNTbz4zBczx3lr12rAQDpe0bhc+K7s+tG8udtmqI9MJnNS7xo
         Owk/7xphbHI74+FH2vihgyUG+QlPyqwLtofYjEbcjaRK9lTpUqS9l6SxYWDrYGiasSPy
         bkQiYC3RjYNtpTj7maHtu+ZY/7cLsAM8SRq2Zil9tmMQE6icflPM0t0dazk9PlHw6A3w
         5XfyihXR+XGIeUcd8KtadzYhaXC6b5OgPd0KLGw5kJp0NHjtAmGvUsfquIGeXBXmzCh8
         LlFA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Cx+ZwT7PohqktR0lL/lJXLfaHV61XYVHSBlfkkMGxa/2nPCBKSFt/ZzyEtMcSWU9hMU7CBM=@lists.infradead.org, AJvYcCV3vyfhq0fQm2ertj0HtP8eQ7SuB0BFQo5bzRdxqM//zgIOlHIjTqvBSwsGEYaxTxifQWXBKLFm@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFufVecu2nchyp0cbCmD1dShB9Lx0a9GfhYSe9uUAGtrmKMte
	m1GhmTmn+qnq8X9DGcDi47LKeFPYs18WgmyVLYEwpcJ2Fh/8MWnZ
X-Gm-Gg: ASbGncvhuuI+OX0fJ1GgLed5nif7/QxWR04bkpMaWhjtX0l4ktN0KhEz9tiltYgg1mf
	gdjvB0MYuVYM/0Yp3RuT3i8tTaqNozM0V72jGxlJcjFhB29H7fHlQIyQyPFCcnbt4BKbJIAwN6v
	Yj+cSXgm3qfYISOztg4RtNgtd4CGRhE/59/5hXXIk1lOQD/fpKPSwEr3MpBmYPse80AvIlNKZpu
	y1/mY99cuwXgrtE+QNmwG8lx8GQfgrB6WIRvpTD5J5t+5lcpRFkpdeHNGwHGCXTvj4x2E0QNro=
X-Google-Smtp-Source: AGHT+IEDT4HuSjnHdgU4nVZcKdjTqhHaZQ/UzPNBgnSZZKSm/YS2gFuBdjBxoeT6zr/N/2KWLxiZeA==
X-Received: by 2002:a05:600c:4185:b0:436:ed38:5c85 with SMTP id 5b1f17b1804b1-436ed385d5fmr20801165e9.14.1736441214672;
        Thu, 09 Jan 2025 08:46:54 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38378csm2261364f8f.25.2025.01.09.08.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 08:46:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 17:46:53 +0100
Message-Id: <D6XP1D525IVR.1P8E45B5VW3MC@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
Cc: "Kalle Valo" <kvalo@kernel.org>
Subject: Re: ath12k & ath11k beacon miss detection
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
 <CZU8N7QWGITF.1DC5A13NM18UI@gmail.com>
 <6874f568-88dd-40cb-bf57-d41b2d7aa41f@quicinc.com>
In-Reply-To: <6874f568-88dd-40cb-bf57-d41b2d7aa41f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_084656_221778_91503FB8 
X-CRM114-Status: GOOD (  19.00  )
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

On Fri Mar 15, 2024 at 8:55 PM CET, Jeff Johnson wrote:
> On 3/15/2024 3:06 AM, Nicolas Escande wrote:
> > On Wed Feb 21, 2024 at 1:46 AM CET, Jeff Johnson wrote:
> > [...]
> >> The ath12k driver is still work-in-progress and there is quite a bit o=
f
> >> functionality missing there due to the refactoring to handle 802.11be
> >> Multi-Link Operation. However I'm surprised that ath11k has this issue=
.
> >> I've asked the development team to look at this. It would be helpful f=
or
> >> you to open a bug to track the issue. Please see
> >> <https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport>.
> >>
> >> Thanks!
> >> /jeff
> >=20
> > Hi Jeff,
> >=20
> > Any news from the developement team ? Is this something that got into t=
heir
> > backlog, or even better, got a chance to be looked into ? I'm sure if w=
e tackle
> > it on either ath 11k or 12k the other one will be trivial to fix.
>
> Yes, there is an ath12k patch under internal review and test. Hope it wil=
l
> reach the list soon.
>
> /jeff

Hey jeff,

Unless I missed something you guys never posted patches for this ?
I mean I saw the WCN7850 stuff [0] but not for QCN9274 right ?

[0] https://lore.kernel.org/ath12k/20240319023032.719-1-quic_kangyang@quici=
nc.com

Thanks

