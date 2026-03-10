Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5246EFCD9F
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+QDzmjxHMtTeBXgcnvJGsDEHOK57cB0KyxE1y787/s=; b=Pgpli5fyiZOJOW1UEN7zduUQig
	DiNxjo43ffPH5WAq3qm0l5d66ja3deMDEKy8F47HfpDmru54Y0PlnbD899aBNmWT9Aibvabv/wJU1
	d3W8n4icRvOFb+Zs1jg+F1zUaUSf55tEsCFuP5b7uA7dyFNvziHReCi8BnlA86bfRPwWU/Q3KVMGk
	QmEkMsHxLKz2UWJQTyM2m7EJtJsAqSP5cX555i32JBI/Hfa5mdrBK6yryrpVKTAvjmabRHsH5jHml
	EZNj1ItG4j+aFUPZlQKPbBNLjkWsUQqKdYcUcSd16bBQEXeMbEfYWhlh0S4pAd6wsBpzWz/qUtY36
	15v6cM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztpH-000000098pg-2HQe;
	Tue, 10 Mar 2026 09:56:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztpF-000000098ot-0ElB
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 09:56:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so9221253f8f.1
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773136587; x=1773741387; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+QDzmjxHMtTeBXgcnvJGsDEHOK57cB0KyxE1y787/s=;
        b=JD5OTd27ptLHGjo/+KHgtlebsTYVMmamRB4DKonRpvAXYHdHornNWVpKyILOT4efdw
         e71isiS5mvP8yvFhtEOFQDOysszJ8sltCxjTQ1PM+h6ADC/mjFPhxJjKv4FxtJ7pZbPx
         HJK0JjfvFfGbS6FysvhayyXJ8fSPAi58WrSBVIGRKEgf42ck/Jt+23illHgtjF8LWS4I
         YgxFbKXgqCVqQCryyUFbTUgQ99jETvodxSnekHaQPKqTIk6XAhT9m9prCM9QPQ5PyE7q
         Ss2SU77eZl6So8TZLd9ug4+sWKK0wQe+zZug5Gqtg2gOGTOlB1yrR6ke1cr3i7Xg7g/+
         VPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136587; x=1773741387;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+QDzmjxHMtTeBXgcnvJGsDEHOK57cB0KyxE1y787/s=;
        b=OxQKizPs+lTt0xi85QquYzh93TtZ7q7oXYuEXLkkKaem+uS61L/1MYk28+c1wX7T2i
         QlNYA4wUiscApDFo86EKGCCERC6mSJbsQRxU8ymwO5DyMKGhENoC93hGWA00y7IMfpSh
         eIkrRb9/aCU19bJdRziM29etbowjGiT2RZHz26K2N5kYdRcRB62OFyDN+NmioyJvuwrD
         y6NtDFGn3RtyDUfYYNks/uv7BfPgJoCPLHJ6P5rdXqTkECww8k+KnMAI5xeBnc65oNMm
         zxO5wMww1Xfse3Xw/f3AjlKNc6dzxUY+8pRGjeHOL2Zj+7W+UYoZ6AwcVYj9zP3lm89W
         +eUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsattIWU7axrSltZPJBCNn8J6WrSK5fBQrzflcFcPufIwVfDJWEjpixOyn3DNSIS5Z4/hazpE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr0uQxpgA9GPU7VR5pQZXcLBUJaqz2PNgg8bMif3PRjAlsgq9g
	4Yv8cmAGNrA0KsD/yG6ai95KgNslimkiku6zldWrNnxhbvNgyH2fflSR
X-Gm-Gg: ATEYQzzAbx8XPOTVquo+m9yzjk8YZJdogckjyD7/gwljxvOV8LImM45Kv5/rWVtWd3M
	YRawpGvPUTTefehNAh7ZPvL2mhUFg63DmxZ15sRyGYiEZhZlvjliZdZKGobzrvb+a4N2oolEaac
	jI2EKPgeOYhnJ0YRldW14wh57YBcdgO7ihUsEOTQTypw38N1I1o309LZELM+0dkCa+jj+AwHFeF
	q+NTqn0oS6ORIlwKOGI21MWli3IcBcxeiEXewrsNX/j6u/uhxqzOH2n57i/4u/FwWTkZ11pxwqT
	h28r2awD/FVMgJlQj7sgCxA+B+EyWMn1QKT4AnxwYzkmSQaW+W+N5o1Rh8p0hFenh5sjjF9I12a
	y0M9OPZeiJxYHpffFGEzINjDYWu3a4dyfXrgJwnZwD5OUV81GVCUur2kgLT/aGtlYNuQXfMNggt
	T7AZu9+eJRZD4oFL7UJPbZ4c+0Mao29HHWtuFdYAQTYQ==
X-Received: by 2002:a05:6000:40dc:b0:439:ba4d:bf40 with SMTP id ffacd0b85a97d-439da891a22mr26416182f8f.43.1773136586739;
        Tue, 10 Mar 2026 02:56:26 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm33931715f8f.28.2026.03.10.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:56:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 10:56:25 +0100
Message-Id: <DGZ0GMD3VS8R.2ZZLQNJGDDFLZ@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309152050.191820-1-nico.escande@gmail.com>
 <621ab5fd-206d-4cf9-b30d-cb9d6bc0459b@oss.qualcomm.com>
In-Reply-To: <621ab5fd-206d-4cf9-b30d-cb9d6bc0459b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_025629_145313_444BE05E 
X-CRM114-Status: GOOD (  24.15  )
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

On Mon Mar 9, 2026 at 9:16 PM CET, Jeff Johnson wrote:
> On 3/9/2026 8:20 AM, Nicolas Escande wrote:
>
> I have some nit comments...
>
>> On each WMI message received from the hardware, we alloc a temporary arr=
ay
>
> note that not every WMI message handler uses this pattern.

Technically yes indeed. Maybe if I rephrase with something in the lines of:

When we receive a WMI message, we need to extract the relevant data from th=
e
hardware depending on the event type. A common pattern is to alloc a temp
array of WMI_TAG_MAX entries of type void * in which we store pointers to
structs holding the actual data send by the chipset. Once it is no longer u=
sed
this array is then freed. This short lived allocation can fail when memory
pressure in the system is high enough.
>>=20
>> Given the fact that it is scheduled in softirq with the system_bh_wq, we
>> should not be able to parse more than one WMI message per CPU at any tim=
e
>
> add hard stop .

ok

>
>>=20
>> So instead lets move to a per cpu allocated array, stored in the struct
>> ath12k_base, that is reused accros calls. The ath12k_wmi_tlv_parse_alloc=
()
>
> s/accros/across/

ok

>
>> is also renamed into / merged with ath12k_wmi_tlv_parse() as it no longe=
r
>> allocs memory but returns the existing per-cpu one.
>
> note that imperative voice is preferred.

s/So instead lets move/Move/ ?

>
>>=20
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
>>=20
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
>> changes from RFC:
>>   - rebased on ath-next 8e0ab5b9adb7
>>   - converted missing call sites ath12k_wmi_obss_color_collision_event()
>>     & ath12k_wmi_pdev_temperature_event()
>>   - changed alloc order & cleanup path in ath12k_core_alloc() as it seem=
s
>>     it confused people
>>   - used sizeof(*tb) in ath12k_wmi_tlv_parse()
>>=20
>> Note I did try to move to a DEFINE_PER_CPU() allocated array but the mod=
ule
>> loader complained about the array size. So I stuck to the per ab alloc.=
=20
>> ---
>>  drivers/net/wireless/ath/ath12k/core.c |   7 +
>>  drivers/net/wireless/ath/ath12k/core.h |   2 +
>>  drivers/net/wireless/ath/ath12k/wmi.c  | 178 ++++++-------------------
>>  3 files changed, 51 insertions(+), 136 deletions(-)
> ...
>> @@ -3913,7 +3903,7 @@ ath12k_wmi_obss_color_collision_event(struct ath12=
k_base *ab, struct sk_buff *sk
>>  	u32 vdev_id, evt_type;
>>  	u64 bitmap;
>> =20
>> -	const void **tb __free(kfree) =3D ath12k_wmi_tlv_parse_alloc(ab, skb, =
GFP_ATOMIC);
>> +	const void **tb =3D ath12k_wmi_tlv_parse(ab, skb);
>
> checkpatch complains:
> Missing a blank line after declarations

Weird that my checkpatch (from yesterday's ath-next) did not catch this:
scripts/checkpatch.pl \
	mail/0001-wifi-ath12k-avoid-dynamic-alloc-when-parsing-wmi-tb.patch
total: 0 errors, 0 warnings, 0 checks, 807 lines checked

Is there additionnal flags or tools I should run ?

>
> Note that when __free() is used that this rule is not enforced since __fr=
ee()
> declarations should appear at first use
>
> So I'd separate the declaration of tb from the assignment to be aligned w=
ith
> all the other WMI functions

No problem I hesitated to be honest. And I think I prefer seperate declarat=
ion
anyway.

>
>>  	if (IS_ERR(tb)) {
>>  		ath12k_warn(ab, "failed to parse OBSS color collision tlv %ld\n",
>>  			    PTR_ERR(tb));
>
> that's it for the nits. the development is stress testing the functionali=
ty.

On that front, I can say that it has been running at scale in production on
around half a million devices for one mounth and so far so good. But there =
is
no need to rush this and we can gladly wait till you guys make the necessar=
y
checks so you feel confident enough with it.

>
> /jeff

