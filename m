Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C49EC4828D
	for <ath12k@archiver.kernel.org>; Wed,  7 Feb 2024 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzYI9wCP9UNjJlug1qt2cn2i7UTWEFZheFJR3s+NH5Y=; b=GCrDIoJ08brMRad29oSN5Uirzy
	7tgyypbjUnnG5sMMJCTb9JtA2HcO8wPzKUr31Dpa/RGnfxOxIYEO+Ezm8Ezdjor/gCpjox+4TOqEY
	UbA3Jmyb5ulWopsuoERhCN960qIbrGhZhz0pN4hF4LYBaPFqlDTKM3Yyx/L8TbbzTtW8jRsNp+5IC
	gS1m6+4RkFeStLF6YMuUt0HyYmtlsmkoDPr+gGTtNlctP/kEEIls8Sz3YJAZVpO4g6M03EZgMRVel
	Yduo1bHIhg2DbDC9HJknGmclQQyfbaw+dyLR1KKeWfqEUv8mVIfKS0b9f9OKW0w328h6abNWEQKp8
	JqBSCw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaSW-00000009kBE-3q6V
	for ath12k@archiver.kernel.org;
	Wed, 07 Feb 2024 05:26:56 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaSU-00000009kAf-2iLF
	for ath12k@lists.infradead.org;
	Wed, 07 Feb 2024 05:26:56 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso215926276.3
        for <ath12k@lists.infradead.org>; Tue, 06 Feb 2024 21:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707283612; x=1707888412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzYI9wCP9UNjJlug1qt2cn2i7UTWEFZheFJR3s+NH5Y=;
        b=RPrMYYnRD7LT4VxdYxhJhV+PEVgKzw2bdeLYZKnRU/d52rJhi0lpFkRe6pNYDR26dg
         O/owoYSsi2WFQ2Ukfe6YiQklP4rpk6qp9By98nLx80jVYYV5BK3pNQCmBxlvGxaPMaiy
         2fr3tGwieAqXv9BBynJPBkkGhjQ35qCT53oVhuEvMyYOvY69JUb2+oUFTJvco+TS+Ztl
         1MNqCz4IUc+2ULmSqN8KbXvxSe0aHUWRKbu4CCPlCV0OzkAu2D7aw9YjvjXJ3zQ+thVV
         lpn6NWekEaBiNmMuT0dYuCoGHNk5RCe7GGPB/4G58VKMPw1d9npL73KbSs/k8dI619Jw
         24uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707283612; x=1707888412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzYI9wCP9UNjJlug1qt2cn2i7UTWEFZheFJR3s+NH5Y=;
        b=bc+3FP7/XLoNGOOv0+dy6hZvc7opA2y0/jMqxnDE+BWQ35GsSJFbihbGD5vCRJk5i0
         lOxyJWIfPo0FeBhTX5snMDQg95gO75p0KkbKTgSwc7L1LW3voOLJ30ibo3kg4NjQXK2l
         eS6hD0jZoEyhEO6zqebYwJhUIXmpZmB1b2691AHJSHJtvfewE01ktksEOF8CLoePdLu5
         loviYQda+8drs/DpDL7qyYjrGPcB/xlx3inv660SSiFtGy0kK67i+tH5HnS2dq3BINy1
         zRxBtFkJKMrupD0o86nkyb+5XSmW3hU1Yk2z4BjX13bDjXROQfoxWMuBl1JYOUGUUE0I
         w/NA==
X-Gm-Message-State: AOJu0YzsDtTxIH732EcKg5MZ7D69/MRnOPx98VVAs4Ud4os8TrtxjuTN
	T2RzWvIpkploMLwH3xORIOuQxlKfKiKKJJNM07nZabS7DXh9n31iyfGZ0/PBDqeKwxY9QIyOa37
	gDRw9OV/E3tOZhePCrMLW9jYSjNSNQdLqxfQ=
X-Google-Smtp-Source: AGHT+IFFGtVdtUfN6VEby03sk84TJmM3E150DFytQlPIB6SlIdpxPEuS0feT7hK6nOoyp5JUm5is2me1wzWHA4xe5V0=
X-Received: by 2002:a25:d387:0:b0:dbf:164a:e3b2 with SMTP id
 e129-20020a25d387000000b00dbf164ae3b2mr3708033ybf.33.1707283612589; Tue, 06
 Feb 2024 21:26:52 -0800 (PST)
MIME-Version: 1.0
References: <CANf5e8YuWEp-NdF1+nhtH6t2KLac8MqMX8HyiZgUE=MvQBiefw@mail.gmail.com>
 <87ttmlrc8l.fsf@kernel.org>
In-Reply-To: <87ttmlrc8l.fsf@kernel.org>
From: Dave Jones <s.dave.jones@gmail.com>
Date: Wed, 7 Feb 2024 13:26:41 +0800
Message-ID: <CANf5e8Y9P3Jbefvz_BVgVUA-q+gX9cVpTn8kTfjFddK_s8HTgw@mail.gmail.com>
Subject: Re: WCN7850 doesn't work on Linux kernel 6.8-rc3
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_212654_729326_1C709750 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, Feb 6, 2024 at 8:47=E2=80=AFPM Kalle Valo wrote:
>
> Dave Jones <s.dave.jones@gmail.com> writes:
>
> > Hello,
> >
> > I tried to test a wcn8750-based wifi adapter under Linux kernel 6.8-rc3=
,
> > it's not working. dmesg below:
> >
> > ath12k_pci 0000:02:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]: assig=
ned
> > ath12k_pci 0000:02:00.0: MSI vectors: 1
> > ath12k_pci 0000:02:00.0: Hardware name: wcn7850 hw2.0
> > ath12k_pci 0000:02:00.0: qmi dma allocation failed (7077888 B type 1), =
will try
> > later with small size
> > ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_=
id 0x4017
> > 0200
> > ath12k_pci 0000:02:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-=
12-06 04:
> > 05 fw_build_id
> > QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SI=
LICONZ-3
> > ath12k_pci 0000:02:00.0: qmi failed to load regdb bin:
> > ath12k_pci 0000:02:00.0: qmi failed to load regdb file:-2
> >
> > Should I need regdb.bin? If so, where can I get that file? Thanks.
>
> regdb.bin is for developer testing, end users shouldn't use that file.
>
> Can you try ath.git master branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/
>
> We have some patches in the pipeline which didn't sadly make it to v6.8.

ath.git master branch does work, thanks!

ath12k_pci 0000:02:00.0: BAR 0 [mem 0x90400000-0x905fffff 64bit]: assigned
ath12k_pci 0000:02:00.0: MSI vectors: 1
ath12k_pci 0000:02:00.0: Hardware name: wcn7850 hw2.0
ath12k_pci 0000:02:00.0: qmi dma allocation failed (7077888 B type 1), will=
 try
later with small size
ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0=
x4017
0200
ath12k_pci 0000:02:00.0: fw_version 0x100301e1 fw_build_timestamp 2023-12-0=
6 04:
05 fw_build_id QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V=
1.0_V2.
0_SILICONZ-3
ath12k_pci 0000:02:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems

