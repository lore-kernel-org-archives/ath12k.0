Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4CAC02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZAjJjL9qQDRRPSaaVZccUdHxjtJV8yhZw2hQGDUwyI=; b=udtKSKyXr+uTwM1rWCDu71JM12
	1r42nSMILJk8K//A6HIZ6vL00tAQB0eNINY4Rp3CAiKX9jgJdCh/pt0h3EHOJ9MEfGkCjupNOLioG
	YbQl09X30yC84bndTgZxxHyZWl6ZlFpdAzj4uaswK4utBKdjlUy0xXCWcoRXb/I8+l09J0e7GhE+Y
	AfpLwOdSvTE4aeejZQGPejKm6BZ7qhHksUGnw7QZWTo9eFCikU5hCYB4qsj1F1pIuUi9JOv0b+8ma
	gHX3uG8HzDOw0VfEUVcnyFu5ZhQiu4Gg9iASklyPGOLcErHiFupypHlWq1qdQVV6cQpGRnnInCwZr
	mJUbCL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAmt-00000007Rne-0o42
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 09:43:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAmG-00000007RkQ-21S0
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 09:42:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e06af753so2665819f8f.2
        for <ath12k@lists.infradead.org>; Tue, 21 Jan 2025 01:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737452551; x=1738057351; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZAjJjL9qQDRRPSaaVZccUdHxjtJV8yhZw2hQGDUwyI=;
        b=TREBuVv7B1HuZI8cwrT9FqJumXwa5bbbPJBa2wJN0MdvexMMexgNpBa0c4aDM57F0p
         AkWWM4qaINzyW2VlO7k+BXZOIs7HFNnWN8NKfSx3LHYOhLr1svHUytKvdZ3kd2CZ+MP5
         QM0fzjG3qLrc9BRuhGylkE68s48te9+IpjOjrECkdtBMu/n5ETz+ZjsjobjOOBfbOmQ6
         OxwUlBgPCm4odmw2SFil6z8wPf9CD++gLWifpDPT4KaakqVr6Qy4KDXJNH1uEKxeOVTL
         O8MmJNiciCnzEph1cUbdPVbhgWdSfPAXsC3fFZF7HvVYmMrOkLUb2M/kQRw7QA6HzTN1
         qgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452551; x=1738057351;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZAjJjL9qQDRRPSaaVZccUdHxjtJV8yhZw2hQGDUwyI=;
        b=nXR3nU11iTsCLorR89AuI2i14VVmxykyc1XQzuW58m+axgtNm4v+tfNyUP4P+oL/px
         VRonNtacMfwneiXTxKXTjd4879Zi5fkj/jmBBuhBuabjJr4lw3uzrHZR1Xy+VUvRF2Up
         aksW/G+nf+tL07OUEIkocyY+uZH6LtrBVuDgeqRt07CeEbaIh2Xgv7GRNyxrKDV0+UP6
         MTNVSIIoso0j23qZ5BD7wQLe4m0QnT/gHSJEmCc+Xxhrp5YPS8vXukwtqHPHOYi7f76Z
         QKOs0c2IsFEXqeOHZhzvizJriEgxO8gGOCwC36Mj+s37CkQXWIBEg2Nqrv7Lb7hua0Y9
         yngQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA8mq+q2vYMmY6vmAtId7aDE+ID/ET4Iv178RsB7KXRnZqthW8rqZzI9s0DCCmxIuMr+RR2u8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiNoE2V/S+5F9ccXqLV4y5qIqoEfx1fGyGznwdcEE+imB1+7sw
	W0IXvXCjQp1NKJzHCRdQAKU5H9NmEzjd4G9YkdjUT2+enSbuAARcorY4BA==
X-Gm-Gg: ASbGncvA5IBHOoT6lm6Gx3Pc2vOAWTJnbdYUHOGDDVaJejyhC8k/GA60FzqhTfuXuQj
	JyeyKkhEs+rTTSRtYJWT3pivPsWB9wuwtRMtxy3+kXtQECikmUhzt+e29f8ZcicwBLX80+L0pI1
	SNxVR78jiGPhlRKC561n8ykWLIaAXTkNtXLC2wyQsszfWmWGNh2LjHaS1jmbe7DT51HjI3tr7Sp
	9Er0hzgFKHWsyzad5YqXmXXqWwDhQmoCsUw81HEMtZm6EytUp5pFdH8oiD0eNROxKL9d7r8hoQa
	8aLuF3SGQ9Xf
X-Google-Smtp-Source: AGHT+IFzkNnW6b0iMTCoqCvVh44YaE0Zb4MJBHDXLxLoDLkLH7ZlaEsA/M6oKR4+cnPj+4z3meDpeg==
X-Received: by 2002:a5d:6d88:0:b0:38a:41b6:d685 with SMTP id ffacd0b85a97d-38bf564d621mr15132107f8f.3.1737452550699;
        Tue, 21 Jan 2025 01:42:30 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3215023sm12702939f8f.9.2025.01.21.01.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:42:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 10:42:29 +0100
Message-Id: <D77NIYIWDCDL.ZSULBU6766SX@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: add support of station average signal
 strength
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250117172819.3357534-1-nico.escande@gmail.com>
 <7bf33a7e-c77c-a99f-bffe-2501f0971b2e@quicinc.com>
In-Reply-To: <7bf33a7e-c77c-a99f-bffe-2501f0971b2e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014232_518998_5DA3AC1F 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue Jan 21, 2025 at 9:53 AM CET, Vasanthakumar Thiagarajan wrote:
>
>
> On 1/17/2025 10:58 PM, Nicolas Escande wrote:
>> This adds support for reporting to the kernel the average rssi. This is
>> done the same way as it was done in ath11k. A simple ewma (with the same
>> parameters) is updated with each rssi update.
>>=20
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>=20
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h   | 5 +++++
>>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
>>   drivers/net/wireless/ath/ath12k/mac.c    | 5 +++++
>>   3 files changed, 12 insertions(+)
>>=20
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wirele=
ss/ath/ath12k/core.h
>> index ee595794a7aee..9408d8a528580 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -1,3 +1,4 @@
>> +
>
> ???
>
> Always ensure a clean checkpatch run.
The worst part is I ran it but failed to understand why it was warning me. =
I
thought this was due to some existing problem before my changes.

Anyway I was stupid, I reposted v2 to fix this.

>
> Vasanth


