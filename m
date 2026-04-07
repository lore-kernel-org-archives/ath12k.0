Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B88EDB7D4
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHAjC1BSiOb814N0275KqQhW8j+aFugf5PShJf7FEDg=; b=IQJvfpuGJfk8RaV0NK+VBCkPm7
	sFAksvejMCLPTEUcPS8wa6Hont80o+n+ysUrFmlj2DxMNJjQkrdeHu5saWSkUlrLcKBIoyYnmu6nT
	3C340BQNHyHP9bLhI5Hwtm+Ajl1NGrYTYu6fl38vvADax5iworjOIC8w/sqbogfVrLrtJ0a7O4sNN
	mdPr317hM8QEMVsHA1gBc/ESrkVyNxuJ+3cX8Flzmf9oSTsbj4znHwdx7LNY13BizZQeZb4TespGO
	+JextBm/TfxABbKdiOaRKa2EDoK3Hi7FC2PmEIZLO2mHHRRWignshaVIKZQfZ0HE3HixxkSXgx136
	nhSI+F+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2xk-00000006Ey9-1XGI;
	Tue, 07 Apr 2026 09:43:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2xh-00000006ExI-35V9
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 09:43:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so4368704f8f.2
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775554987; x=1776159787; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHAjC1BSiOb814N0275KqQhW8j+aFugf5PShJf7FEDg=;
        b=KgUnubv8y2uPLWCPeOYlYU+NcM6ppAD4WnMPLmbrtk3nPAOZeejipTyidns20x0t4U
         lEcqmxrvAAPJSxWfzqVx0l3w6OW+qNIIpCbbFL3WPlNDaUNqPzRCtiLqhhPX7ZbjIQ3L
         U68jXM1jkB4Gfmcln3birGUcX+6VDfPj6Vbf4p3x3nmvK561uu1DJZAOuUeEktK0Uarn
         BwMy7x3lQjv0Gsdmdig9TV5bN6NLM4HLo+UTuVXKSJFHxWrZghEAp4znCzjiXkSAw3wp
         BxUOjcP0hGv5Bugvuc4SM/rF6ZbFEpDSOdZ78xkuM8bWvCmDpuUEMDsEccj1jRLXPrLO
         /Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554987; x=1776159787;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHAjC1BSiOb814N0275KqQhW8j+aFugf5PShJf7FEDg=;
        b=jaN43v+7MNTCPqVuUxVwdUbacjovwYT2F6mSFCyIDi/2wDA7wtgibu0BSFs5Tk1YCM
         QPdLvJkTiH4/r6xQQzMoUlx8+Syzww/7fLGwLiCrYfNdk/Okz5WfmhcU0W2UEwjclqDX
         lyxs7Nmht045/w3wsJmbrhmIPAScMgktvkgt6NaqHz6IIT1djBCgIx6mvrAIkDyjSkqN
         U9tN5OMLrzhd0W6HFLYixKGyemudzP1hsg1VghpFtHay+ufhFRrYhuBSLLO7c5NSHsYZ
         98JyTc3MPsDqwdmBoWaPnkCGXHvjl1K2J5rZnCK3H0+LH7pY1+z0xQog9LUuYP/WhGkK
         H6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWDnIF+vXoSPdN94ySjswHrHBKhDHujlOj4fKc0y34J70CFfhbuMiutB1CbSg3uS+h2PjAVnJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUXw/Lb/+dTOw7ZXfM85qjllHNI8iJ6BWEgtq3IRP958VjusAV
	Cy3P9LKtymOZkHWEkJXiatFsp3cZDYYxYyV158bs/B/8IjdbQuNjt5VCQO/gaw==
X-Gm-Gg: AeBDievTwExMe1EvUXeMq6wSIICTs7XS516PB7GCtmnHwK73zje8LEr8Wia9PSX+mx+
	HMEUnzU44C9k1YJo2GtsZuhxV5HuFEfKfRmipI2kUngyDDJshMDUwh0zPTNSbkW+u168ARapU6d
	88UKRt+IxHtqSTXlBXTU7oOFj8zyKYudDEr0gTchgezWMHXAzr6reo+wjgVzralw6O44iSqREJ6
	YFAY0QuhzEdqxnrXT5Jtse4FNr5DV/zKad3JCmQt4yg04RDVPBP+0XzRxZ8g3ZM3Z+sy+iq6ZJH
	NKXMxRdjoFpGxHu+O7yBTepKGhsuwQI++xY8+SktcplGlDvP8VmbqqXNuygclYHVs/Hd9ZSsfIR
	kt8OP2eSGuQFHNYI+V/tODrWaSIT9h2PEmWEBgfD0H+A7/YLCbKAU6/QFUolntVk3sHgDFCWS1H
	5tADRH7ZE4YbAfJalXxnje8LZANXj5E1gxD4vNTwlXrw==
X-Received: by 2002:a5d:584b:0:b0:439:b791:f920 with SMTP id ffacd0b85a97d-43d2927fccdmr24084487f8f.17.1775554987110;
        Tue, 07 Apr 2026 02:43:07 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm46769190f8f.27.2026.04.07.02.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:43:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 11:43:06 +0200
Message-Id: <DHMTPO1TBBP7.TBGIZJFOBWZ3@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v6] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>, "Nicolas
 Escande" <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403142841.1105780-1-nico.escande@gmail.com>
 <54887455-3ae5-4dc9-a0cf-80726a1d8465@oss.qualcomm.com>
In-Reply-To: <54887455-3ae5-4dc9-a0cf-80726a1d8465@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_024309_788843_0B447FD4 
X-CRM114-Status: GOOD (  12.68  )
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

On Sat Apr 4, 2026 at 11:48 AM CEST, Rameshkumar Sundaram wrote:
[...]
>> @@ -134,6 +136,10 @@ struct wmi_pdev_set_obss_bitmap_arg {
>>   	const char *label;
>>   };
>>  =20
>> +static DEFINE_MUTEX(ath12k_wmi_mutex);
>> +static refcount_t ath12k_wmi_refcount =3D REFCOUNT_INIT(0);
>> +static void __percpu *ath12k_wmi_tb =3D NULL;
>
> Checkpatch complains:
> drivers/net/wireless/ath/ath12k/wmi.c:141: do not initialise statics to N=
ULL
I forgot to run checkpatch on this one.
>
>> +
>>   static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] =
=3D {
>>   	[WMI_TAG_ARRAY_BYTE] =3D { .min_len =3D 0 },
>>   	[WMI_TAG_ARRAY_UINT32] =3D { .min_len =3D 0 },
[...]
>> @@ -11239,3 +11150,28 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(str=
uct ath12k_base *ab,
>>   	dev_kfree_skb(skb);
>>   	return ret;
>>   }
>> +
>> +int ath12k_wmi_alloc(void)
>> +{
>> +	guard(mutex)(&ath12k_wmi_mutex);
>> +
>> +	if (!ath12k_wmi_tb) {
>> +		ath12k_wmi_tb =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
>> +					       __alignof__(void *));
>> +		if (!ath12k_wmi_tb)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	refcount_inc(&ath12k_wmi_refcount);
>
> With ath12k_wmi_refcount initialized to zero, this will trigger addition=
=20
> on 0 - use-after-free warning in refcount.
Arf, that a bummer.
>
> We may have to do refcount_set(&ath12k_wmi_refcount, 1); on tb alloc.
>
It seems thats the best way to go forward indeed.
>
>> +	return 0;
>> +}
>> +
>> +void ath12k_wmi_free(void)
>> +{
>> +	guard(mutex)(&ath12k_wmi_mutex);
>> +
>> +	if (refcount_dec_and_test(&ath12k_wmi_refcount)) {
>> +		free_percpu(ath12k_wmi_tb);
>> +		ath12k_wmi_tb =3D NULL;
>> +	}
>> +}

