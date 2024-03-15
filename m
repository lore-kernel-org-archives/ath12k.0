Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB90C54E69
	for <ath12k@archiver.kernel.org>; Fri, 15 Mar 2024 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EycPRNpGd5ArirfZ7nHkWtu72QhnrpdJCbDg7rly2Bo=; b=Aw2qBOkNfNFecoP2H7pWvbvX7F
	cTvzHdhRKvnPq5AVDLpMXQG6CDMTCbamr9MW9gjvHkGbDi6qKroZBHqGsgymha4ouD9rs5fy4tD+T
	vcq5pxB2zrIm8GpStq+CXY2i8ittXrwoVSDfq5R50SMoIJYYebOg5y4kFuXeuQFkSpTLgKChk28CN
	kWBFiF5HhaevdCgx9wf4YRlI5eQuwSz9vpllx3UOaR4QJXcrmNQ7lNxxscTdGlm/zS6LXEqbdGi8o
	jkwcCX3S2+vmyZ9Y7x+9p4ImXxspM8QQacI3/qM/b+50Ri936UVb8Uuh3bB80cC9dB4oDQnoAU6fw
	eIKa8D1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4SK-0000000HPCT-1HHS
	for ath12k@archiver.kernel.org;
	Fri, 15 Mar 2024 10:06:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4SG-0000000HPBM-1tVU;
	Fri, 15 Mar 2024 10:06:25 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5101cd91017so3048954e87.2;
        Fri, 15 Mar 2024 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710497180; x=1711101980; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EycPRNpGd5ArirfZ7nHkWtu72QhnrpdJCbDg7rly2Bo=;
        b=EW62ZiqmAoZp8UUhWDmToV7jIyFS+3NIVOJ8jvGmvV7VbSBd+wK6tjYh9YCqS87kFN
         BkFdx2xKr1jfVo8/5oU1D7qzRoygqwFQGoxzMee7efhuin32nFMPbioCV/ktfodV8XEJ
         9ttLrYH8EO9oCDju41p0JlosYJwzFHJFrsppiWKI/ITeXA3no1WF6ZkWviuooWWJUg+X
         luIWMzfraCSN+KDa2Qfk5bEShENgqWqh/Ki0pXOP0AYy4bQcSWqmJFxkj5P00tYZxBoe
         YdDjZNtclwo5mR3QnW2QramdMUgbywJdxpP4qSPGUd7V0Nhq00WvaQYN1W579gwagYgb
         mrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497180; x=1711101980;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EycPRNpGd5ArirfZ7nHkWtu72QhnrpdJCbDg7rly2Bo=;
        b=YO+dSreRIawhWUM/Mf9fZooFs+d5fGMKTBXF+yU7v+N5zKc0ZTV788P6sk5bGVXkZC
         NAxgb7SrfcDAnOGwC3H2DgZMmAnfhe3trAkMTJYTm+vWTRBFqa7ZoyYCbdIqSS384izX
         nwKyDc/vltkDOM1S/IewKUFVuUZ5jaTVFOmfPnU7oOBqYhDzZ/pHfO1SP2VGiZzwPPqL
         Vy7P4t7zJ7sJWYvFcLiu8hj6ltPNhCh89lwpkFjFHKwnhxv+BF8MmJzQqTem7aIpiEDN
         QnLXAwV9u7+KUonfBeiWmEw9vxL4h+MQwjqvBDtYnJ1BTb+SAJpfAI+bUB5jgx1pe5lO
         iG7A==
X-Forwarded-Encrypted: i=1; AJvYcCWFZlN+9vShXyEKdcQ69PEKgtDR1wOyi1rRyqv4ULBMdrW8RwR30XRqffayZEWOQhSE7zYtXVV5Gru2sBgSTQzdXBhSOnYEr2twy6859CWuzzGRUTywE92yi0f9/NPh7Oj53IP5knU=
X-Gm-Message-State: AOJu0YypjH0LH66UqfiGp61ytBA23smrntfYU1OV7463DKqihVb3wJza
	ljSd7H2wNY+Vb5IUdkbohRMtnpv6AvdNpgF+nDNRahCYbV5+Jsugk5NA+wNG
X-Google-Smtp-Source: AGHT+IFzTRPCSzqZZx3JS29KdDSF4QJSTxOfwZWsma25ij+vsOh1tYG2yvu5Mt2BXGmpWoORNZ2Xiw==
X-Received: by 2002:a19:3808:0:b0:513:a479:3ad9 with SMTP id f8-20020a193808000000b00513a4793ad9mr2938343lfa.55.1710497179561;
        Fri, 15 Mar 2024 03:06:19 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id l12-20020a05600c4f0c00b004122b7a680dsm5342155wmq.21.2024.03.15.03.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 03:06:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Mar 2024 11:06:18 +0100
Message-Id: <CZU8N7QWGITF.1DC5A13NM18UI@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
Cc: "Kalle Valo" <kvalo@kernel.org>
Subject: Re: ath12k & ath11k beacon miss detection
X-Mailer: aerc 0.15.2
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
In-Reply-To: <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_030624_532818_77D4D1FD 
X-CRM114-Status: GOOD (  11.60  )
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

On Wed Feb 21, 2024 at 1:46 AM CET, Jeff Johnson wrote:
[...]
> The ath12k driver is still work-in-progress and there is quite a bit of
> functionality missing there due to the refactoring to handle 802.11be
> Multi-Link Operation. However I'm surprised that ath11k has this issue.
> I've asked the development team to look at this. It would be helpful for
> you to open a bug to track the issue. Please see
> <https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport>.
>
> Thanks!
> /jeff

Hi Jeff,

Any news from the developement team ? Is this something that got into their
backlog, or even better, got a chance to be looked into ? I'm sure if we ta=
ckle
it on either ath 11k or 12k the other one will be trivial to fix.

Thanks anyway !

