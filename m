Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6CEEB362F
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8gGfGh9B3w5snZD3iG3ZboXbr7w+9TzI4ylY6+0/fI=; b=CQ+UgFOo8YGi3ALve0N6vgU6XH
	VkLpvckKV+qksuKLGCfYgjWI5VYieVgxVnzeWlDZ4qw0b6LMtNx4+KFc+ZM1i8HpfcXPJEzb7jEOi
	9d3OO4H76CHnV3CAWWgH+F+oezsa5IZQythJfCR54ZYdDQFzLgLiy9OQF2lduqs5BqeI2pfhMKWaM
	3gNxPTUxzm98zn7WqjNoH6y74i0hzDJd/Qh0pumJpNNqMFXPqTHEJoGbxC10P9PJ0DXWxhztpdtV0
	/hyWu3/Y0GuNMVDbsdcKx/n9FTcjzNInwyy4FIVc6i3/7fA3ykJG+7AXSVKubF02fogX19R7zsG5x
	kysyAGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMuc-0000000ExNN-3bFp;
	Tue, 03 Mar 2026 10:23:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMub-0000000ExMr-0Eat
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 10:23:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48336a6e932so33839105e9.3
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 02:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772533411; x=1773138211; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8gGfGh9B3w5snZD3iG3ZboXbr7w+9TzI4ylY6+0/fI=;
        b=CbeOrf8siGRTlu6Y2RRPI/YD3ql25oWy+89Qdt6v3nuFJkUa5jAGs8QvX5S+jjkR+v
         ywDoxunCMMgyzGOfWXCeyFEECo6GzTNPB/GyDYJZMgIuNcg6N262SzDJMxb+qXuRHdOV
         aSAwAM54eSfuUg/oXjcvfHuLsKDnuy4YwXuRj3uPb4B8R/Se52OGc9KPyDQ7yauF1uSp
         Igkeg3M95p+tYIQQ2OS1lGcFJZiApBErIO0mPURe3B4Tx6o+H6XwZclXylZgOOvPXL2b
         /WbMBZza1J8fTgx9CjdUxIOt2glkOWLiBiDVmb1eb9qhVPDgdAY9HdScwmJJUWD9qgx2
         aTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533411; x=1773138211;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8gGfGh9B3w5snZD3iG3ZboXbr7w+9TzI4ylY6+0/fI=;
        b=UDq6WjhOCDLqbsTzGhMHj9rYubpiQ6MaclHTB8uaz477pO3tdNMOMpL+5kBpyLKN7l
         OkNERf2e7endShDXPHNf8Vfc0jA3VG98H/XhTzOGduX0+/9Rb1KoGPrOGm3GrjYTCDYf
         rQ7J1A+mNW7jHph9xzwDKCt4hL820SbM3aMp4bAIWgpmowmCyQpsFiKOs5ufP47wVYQD
         Ip2gjeR7zho2/7EAwqyfH7F0Jxbgexh6wC+p/iOudr+OYIJLYqk9eCy24x+rGg/Xf0kw
         0phcKP1vx1LLL2ym+GtvoKkA0Vokd0WeyZgH+ZYokxOAu7eCSrKy2Km8RcUy8s282PWM
         CXcg==
X-Forwarded-Encrypted: i=1; AJvYcCUCa4wVXLwkR8pt09KqLvJIIa1wSwSnMp8R/k4Y5A9s1HqzPh31pHFdMnLFbtUcr9cgZ7+146M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxvD2zufKThRINuIKwYPzEDXqTN4rignFo8FzZb+Ntx/1XNQ+
	DuazntJjC6l9/cR/Nug5K0KM3Yg2feZokyisYnRg8IqD4XEAeZbkgKEq
X-Gm-Gg: ATEYQzwTkAAGjDIIbIZqtUU8/q0WtkoNVsTwT3pVW280+pVCCnMdsAXHeqnsM4Qi3aL
	ImIu3zGsUPwF4fzjhucIpz+gGWv5TXt95i2KmfjrLV1IcmfUGseu6aX0rG+DocJVhfMKqEAvPVm
	DBYH2mHzgoipItXBzmnJstV6LTuWm5kvfpRxigWW1z23e2swaEjhpOs2TpioGUuw3SRPpdZB0R9
	kIKJn8aOUEVvWfvjTLwcL2sco/A3MgzD8McA5J+tdbeypjRPAaI+dcSGJ1IlUlLbgLyZNV/8tiS
	oDM/4K4unSyxUhXQaGh4+o3GYrMEgTWOeoE61N5IOMkxvmQ8nOOgFZPDtMPMgR1Mo2dIBUTcFsf
	DeRiT9CVANiskNfn50N60W96CbBdOPv5dC4y+NFNsI5c0ZosPQ76R/IYnV8i8h1eAVZgUhBlcvp
	95/wKyKU7Kryl86LH0flX4oobF8qIASfwsXoqdcly99A==
X-Received: by 2002:a05:600c:8711:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-483c9b970a5mr250115055e9.7.1772533410466;
        Tue, 03 Mar 2026 02:23:30 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485135b6075sm14433685e9.21.2026.03.03.02.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:23:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 11:23:29 +0100
Message-Id: <DGT2NJ0VP64N.2UEOAYM8PGVGW@gmail.com>
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
 <38281321-2d91-4dc0-a3c2-1f48d87fb0e2@oss.qualcomm.com>
In-Reply-To: <38281321-2d91-4dc0-a3c2-1f48d87fb0e2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_022333_116616_7F777433 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue Mar 3, 2026 at 10:53 AM CET, Rameshkumar Sundaram wrote:
[...]
>>  =20
>> @@ -2249,6 +2250,11 @@ struct ath12k_base *ath12k_core_alloc(struct devi=
ce *dev, size_t priv_size,
>>   	if (!ab)
>>   		return NULL;
>>  =20
>> +	ab->wmi_tb =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
>> +				    __alignof__(void *));
>> +	if (!ab->wmi_tb)
>> +		goto err_sc_free;
>> +
>
>
> we could move this allocation after workqueue_aux alloc and avoid=20
> free_percpu(ab->wmi_tb); in the label
>

I'll look into it.

>>   	init_completion(&ab->driver_recovery);
>>  =20
>>   	ab->workqueue =3D create_singlethread_workqueue("ath12k_wq");

[...]

>> -	tb =3D kcalloc(WMI_TAG_MAX, sizeof(*tb), gfp);
>> -	if (!tb)
>> -		return ERR_PTR(-ENOMEM);
>> +	tb =3D this_cpu_ptr(ab->wmi_tb);
>> +	memset(tb, 0, WMI_TAG_MAX * sizeof(void *));
>
> prefer sizeof(*tb) over sizeof(void *)

sure

>
>>  =20
>> -	ret =3D ath12k_wmi_tlv_parse(ab, tb, skb->data, skb->len);
>> -	if (ret) {
>> -		kfree(tb);
>> +	ret =3D ath12k_wmi_tlv_iter(ab, skb->data, skb->len,
>> +				  ath12k_wmi_tlv_iter_parse, (void *)tb);
>> +	if (ret)
>>   		return ERR_PTR(ret);
>> -	}
>>  =20
>>   	return tb;
>>   }

[...]

>
> and one more case to be handled,
> ath12k_wmi_obss_color_collision_event()
> 	const void **tb __free(kfree) =3D ath12k_wmi_tlv_parse_alloc(ab, skb,=20
> GFP_ATOMIC);
>

Sure as I said, this was whipped up from an older kernel to see if there wa=
s
interrest. I'll fix all usages for the proper submission=20

>
> Apart from this, the approach looks like a reasonable fix for the issue.
>

Good

> Another possible direction could be to define WMI event=E2=80=91specific=
=20
> structures (or possibly a union of structs) and then leverage=20
> ath12k_wmi_tlv_parse() to extract only the required tags in a typed manne=
r.
>

I looked briefly into this as it seems it was in fact done that way in ath1=
0k.
But as in some rare occasion there are more than one single struct that get=
s
parsed from one wmi message, I guess thats the reason it was changed to thi=
s
pattern in ath11k.

> That said, such an approach would require a fair amount of refactoring,=
=20
> so sticking with the per=E2=80=91CPU scratch buffer for now seems pragmat=
ic.
> Moving towards a typed=E2=80=91parse model incrementally could be somethi=
ng we=20
> consider over time.
>

Indeed you would gain back type safety but this would mean a fair amount of=
 code
change.

>
> --
> Ramesh


