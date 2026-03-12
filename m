Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333E106703C
	for <ath12k@archiver.kernel.org>; Thu, 12 Mar 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmxvI1SLG5cByO9nSwPYtnzFrEf/m/FI7xQbZ3puZxc=; b=zR6qCPOSBf9fPPWMmGEGp37l+6
	M2S4AWW1BIJKO6Og6wB+etNbuPsHjVGgvX7NIgAHrcYFlv17AiTN5Zs8MzzzF1RJpW5j83DzQo4qI
	EWdGKm+VquTQVlgbnM7AYa8vLPNlYTMRsjGGdSV/VlRhMxscNzWzHqYJ99d7tZc0vGPe0HNsVT5xl
	hYfKR0waoeRyzmwTL7gxm4hM6nW6IiqXjoNVbq1xU/P/VyAySckD4EMo0qn3O8wkxqSAKRM7mSd+D
	18gJCQtRpuEEtSXOYSvCiXQ9n7F454LbTU87mWxOHbd2891Obgq/4Sd3t2AdvAjhVqO9prMDLLV45
	/KWKZv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hvk-0000000ENDX-33zI;
	Thu, 12 Mar 2026 15:26:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hvc-0000000ENAn-26gy
	for ath12k@lists.infradead.org;
	Thu, 12 Mar 2026 15:26:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48532925a4bso6361615e9.1
        for <ath12k@lists.infradead.org>; Thu, 12 Mar 2026 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329180; x=1773933980; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmxvI1SLG5cByO9nSwPYtnzFrEf/m/FI7xQbZ3puZxc=;
        b=dEIR50dqe74avWrxmyZliP5mlQYhJE3UQZQpWVz8CoNSt5Xn/EZzg22kfoaz4WIQmM
         v7hO3FkPmwIjun9dnbuaMROhEt3cz1GzhdPOmDOfHCNwWG++ecdDGKO7q2vwIPmhSi1x
         R5MMy21UnJGsAYWMuXLRgXHULo/SJxByOyq5Vfi710w62UhAGwnDn73ifUzaSGVAcECp
         MvKAJAR60HisUT7wcFtJTXmWGhnruDOLHX0XUdArjYk+TlLT91VDVKPMjR9qPs829N7b
         mF+PtK8fk7KjE72DCzXBfzz2P5BamQoDDE3xDkPIZqFk1dt8V21VNmuXRkFRZDERNVkF
         nbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329180; x=1773933980;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmxvI1SLG5cByO9nSwPYtnzFrEf/m/FI7xQbZ3puZxc=;
        b=hxSb3o83nI++UDSFLPByVLtTjyhuxHiCV7cXGB7IkUIGKSVl0UHFFfjj37UDhPJN6/
         vB+9ILmIgFKAxHiIvKUBooOfi9VKMdcWQH3wNVHMB5VUET8VbOnC0HqYrMNCDpo2lSAL
         VrAgVRUHxP5Ex20EK4ggyqq4B0wa56Os+wcy6SHGi2R+WPpQLr13bwdwSn0UqwTV4PwJ
         V994Y696k7AnT9L1K6SuvxflM7pJ/tKBIBlNYWadpnJOusxaletZtYwW9zSwSMVKp3jK
         mR/D3J3CIPyMniJJYwCE+5FI9HmN6BOVq0tgT6iJAhigjLKcNV/OxpBLBsCYfOUPR9yM
         yShw==
X-Forwarded-Encrypted: i=1; AJvYcCXG8Sb1cOfyRsgP1JIkyN9dcL91iw+yeJRdMbGwin9MsNdrM/AKhJJw6bqw1NJHhL3l373zSaM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy4J+7xsF8oudCEFGbIWGaYWxitgNBhEq2/HPk6LI5kz7mqxc7
	pL64Ue1CP6qECKosMzediJx/9jKWrVWUSnuTQeN5TyDwm7AigvbRhs9J
X-Gm-Gg: ATEYQzwjvwMbciFgKRgoDVFP7MH+8NfSgqz9CdWrE/bk0x8YsxP9t15qZiWTcdnuHwK
	NlNuANzsHbq8q+rNd8CTjZBilouNUdEWc3wiT4W+DJph99IX5AQEOcPnFjM8z6/F50Q1RZcaKQg
	MMuiJke0Yj0tFfpW4ByldYvRVszyjybJiORQUYeaRXIeYXi5Ebjy1gBW3lQekOxRX8ODC/hHh/X
	aOVaIZj6jsblXPc9IIsXTvdkMONbVb9bW2J5hJTUQTGNyEVl8bfX0Aktetz7qe7HQ4q9JsdMhB1
	q+9H7/28Hn5WIEvjzpXurfXhtuiZdGnf02jaPktEjwZl+wsGh3Wnx45azZ7x2febkrhxwuQGaIJ
	SECaokk/fVKSK4iMqCvMQhhp3rIJ+7AbLYhCKTtYtRv3Hhn268kMP3+MIzXL8B95TwAZ/3huIWj
	C2ombhNiT9/NrOddJAuodVfljhzYeV4FE+KDyGj5QL4w==
X-Received: by 2002:a05:600c:3e10:b0:483:badb:618f with SMTP id 5b1f17b1804b1-4854b11694dmr101953265e9.25.1773329179659;
        Thu, 12 Mar 2026 08:26:19 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm130000105e9.11.2026.03.12.08.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 08:26:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:26:19 +0100
Message-Id: <DH0WQAE5UP5T.3ND14AH29KR8A@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309152050.191820-1-nico.escande@gmail.com>
 <04d268a7-8f6e-4aa4-b366-0dc38c355de7@oss.qualcomm.com>
 <DGZ17385SNYX.3149KUG92UUU1@gmail.com>
 <adcb0245-6514-42f7-a47d-f6d8b3f79dff@oss.qualcomm.com>
In-Reply-To: <adcb0245-6514-42f7-a47d-f6d8b3f79dff@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_082626_139006_B20902EB 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On Wed Mar 11, 2026 at 6:46 AM CET, Baochen Qiang wrote:
[...]
>>=20
>> But if you guys don't want it that way, I can rework it. Just tell me in=
 more
>> details what you think is the right way and I can modify it.
>
> then how about adding module init path to ath12k module and do percpu all=
ocation there:
>
> in ath12k/core.c
>
> +void __percpu *wmi_tb;
> +
> +static int ath12k_core_module_init(void)
> +{
> +       wmi_tb  =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
> +                             __alignof__(void *));
> +       if (!wmi_tb)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static void ath12k_core_module_exit(void)
> +{
> +       free_percpu(wmi_tb);
> +}
> +
> +module_init(ath12k_core_module_init);
> +module_exit(ath12k_core_module_exit);

That should work, I'll try something along those lines then.

>
>
>>=20
>> Thanks

Thanks for the review Baochen

