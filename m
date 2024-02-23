Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02250C54E4A
	for <ath12k@archiver.kernel.org>; Fri, 23 Feb 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldkorrO5V49rHWcwXcMfoKdpKrCIDFvOVC6j++21hqc=; b=w5sfT726HfusfJCXt8tlLut2RZ
	UpK1CgCb7Ftv9vU/WXNoJYPjolYc05KQ8VMWS68f5TqI5uKQ3bGDrQbEBNcX+3m9vZk8hZfYrAU3V
	VomJULT7kKsZrKydtsG4lmzyjSbrggcEvXZL0XNOaxn9hJB/cui5fuM6E1FSZO4rIsKvghW0V1PuY
	EPcUyqMTpG4LVO3DDHWfrhQQg7KPCtYXIYOWov/6QfMsMFBN2KYbWyotH9WMCxzLNc54l95pJ8VOe
	tSLHUimejyOI8WceXdDyfpnUov51z1T3kav/eYuzeHObo+OauWiCR35/eP70eJsM0/pUdVjiCogJJ
	+WoZ/pvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdR5v-00000008XGW-1I8M
	for ath12k@archiver.kernel.org;
	Fri, 23 Feb 2024 08:39:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdR5Y-00000008X8Y-0QUU;
	Fri, 23 Feb 2024 08:39:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4127190ad83so3934905e9.0;
        Fri, 23 Feb 2024 00:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708677554; x=1709282354; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldkorrO5V49rHWcwXcMfoKdpKrCIDFvOVC6j++21hqc=;
        b=bVMDDFrUMPHSiVtm6bxAmTHmeneDmrag9j2d68aRi4gJjlD+BG2sYMn50RwCaFLYb0
         B9pMZp5qCrik55WQm0vCgdITtX+tlvl70JBJWWba8+Kv0d8V7vSUjO3Jbe0bbk7KHaka
         03X+8Q/7mOIafeZALgEjP1ppPRPNj0Pi6W2UPvVRCY9zZ22TykDdOdoC78lKLOTyclqV
         EqBm0Aka3BM6FooywLBlFSIJzkJqQsi00vo3ZBDdwhMDt6jDRRB9iPMmWgm7G5B5HGv1
         EIw7Cz8r314QGYZEoKSTNWbdtnBtx0vTqzixC7439H6dFGv5ekG4hidklETrgDyhzYNe
         fo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708677554; x=1709282354;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ldkorrO5V49rHWcwXcMfoKdpKrCIDFvOVC6j++21hqc=;
        b=hE9O9da5eV7m+0fyuKh4iWbXGO4RiKYa+iZyghXWhFNWmmb549ZkC/dLSkc0yZry3Z
         6haKJ25TL6THHLugfWSbMYY+2hMaecBYWsXUekSvnqkxnCUWZUEMMoazaeKzaPRowpCf
         WrZbd0tc+TwL1HjlPoalD3AWr3KvCmX296Sxkj7gP/Nta5m/lPtpQE5+u9ndtjCPKaSq
         7ddahUTCK2ygq02RMVFCpKSCboipVJZP/w1iiBhnQiQ21d66+K6E0JZe68rtukiUsrBy
         pXLhle5WeVWrHsZbZ70LJGal+HuYsdGE6THS7QyvS/ADpG+W2J3hS++5Fzo8mBVaeI97
         Owpw==
X-Forwarded-Encrypted: i=1; AJvYcCXKfTJ9thtbSXiGAuDzOaiNHJY7taNsjsXn9E/RqdShJMtwdhGlpFv+dkg+YWbOQsqFWmsgL1AHd7VJkU/Wt+4eHxZi1450xLE9ONu16NGIsCWc0pQeYv5FnS1Il7lse1+39J1/5/k=
X-Gm-Message-State: AOJu0YxiHYHXQCbxegPVTrNAYVqBhy3aD02dzhTsEFaszFYflYtcEO5v
	RrzdSWCrCrSU86wHKtDX9JolLKOd7gusDq38q/1hEl73Z1ZSaDnF
X-Google-Smtp-Source: AGHT+IHAtGeQB6nxsIpcnBJg+QhKvo5hAtwf9Z7of8zmaY7bsNqPjZMaP1syY09iPYFFIhNDk/3xxw==
X-Received: by 2002:a05:600c:3c85:b0:40f:b45c:85a5 with SMTP id bg5-20020a05600c3c8500b0040fb45c85a5mr804794wmb.22.1708677554171;
        Fri, 23 Feb 2024 00:39:14 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d4f85000000b0033d9ee09b7asm1902509wru.107.2024.02.23.00.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 00:39:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Feb 2024 09:39:13 +0100
Message-Id: <CZCBN3MIGKZS.2DZMAGUD4RS59@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
Cc: "Kalle Valo" <kvalo@kernel.org>
Subject: Re: ath12k & ath11k beacon miss detection
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.15.2
References: <CZA2NS7J83D4.18SU6W9R96KPY@gmail.com>
 <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
In-Reply-To: <a35eca5b-e6e6-46e8-85b5-dbcbda0d2f04@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_003924_783301_D6764C27 
X-CRM114-Status: GOOD (  10.22  )
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
>
> The ath12k driver is still work-in-progress and there is quite a bit of
> functionality missing there due to the refactoring to handle 802.11be
> Multi-Link Operation. However I'm surprised that ath11k has this issue.
> I've asked the development team to look at this. It would be helpful for
> you to open a bug to track the issue. Please see
> <https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport>.

Yeah I fugured as much for ath12k so I thought I try to do as it was done i=
n
ath11k and that's how I found out it wasn't working either there.

Thanks for having your guys looking into it, in the mean time here is a lin=
k to
the bug report on buzilla https://bugzilla.kernel.org/show_bug.cgi?id=3D218=
522

I'll be happy to test anything you can throw at me on this

> Thanks!
> /jeff

