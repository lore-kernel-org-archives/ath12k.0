Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48107F46436
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gseK4icojgYbBuoL5AHgGpLJevZBa1SV0g5b00g6iUM=; b=g944wUu3gTE74B+5PVJtOSwODE
	RUPHKAyKfh1/dEXnLMoegnVz0TbBRZNvPJ44vd+B84eJ/0lazkgy+UroPgQnsE9SqgFg6mqGNIUWz
	mx9g0pe8IgMAcZ+RXhITRJraPkH+0Z881fgECR441tRuWZIbDkItbU+uUBxgvolg2Jli0Y70wG+jY
	DJZ74hawgIGgwPThbhn79a6C2YW2fF7dzzc5PywQwJog8KgEu7qGyXZQEH+Pro55vjPH/jvHmg4Rt
	o3rH+yLE/A909QedVj9/5kN24bj/gxQmLbEB2iwpybGWYlOEAqu8347gBAbBYA9+keCFUB/WrddmK
	9MMa+94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Mj-00000003eJx-40c7;
	Mon, 16 Mar 2026 09:36:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Mh-00000003eIw-2de5
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 09:36:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-439ce3605ecso3231771f8f.0
        for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773653757; x=1774258557; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gseK4icojgYbBuoL5AHgGpLJevZBa1SV0g5b00g6iUM=;
        b=dod1GFtgxXGrnfmcmQ7HYxj4LDcN5VXTtq5UEOK4ksBW6lF7bRmR9OYA4SYvHdeKuC
         HWVir3CvEnFOjVgA7Dxn/ZvrBh3hc8YLOL4psz6AUE4ezbCxoqAQn2PN6ek4xZsOOEBx
         jQ8uK/1RB8cYwSp90uqU7EAyEg1D3a+ulQk5EbyPdUGOkBz6Z15lURhfCbpW8yfckmMN
         uUC8/ELzIaLC3HTqxfI4gO4JqpadBSAlO6kqoU85WnyRMdwq430JnxDRY4RtbvNhZQqt
         OW19DAwhjzvuPpO2IwCNglWw8WatiJC7q/6iTvbDRBkO/G2Kuhu88F8KHiSM+E3mfBfG
         h6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653757; x=1774258557;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gseK4icojgYbBuoL5AHgGpLJevZBa1SV0g5b00g6iUM=;
        b=Y9GR39HjtGxlXP184OQrXHLqcjBXWyCsyuDL++TzSR6sOsrUNOKsAxRsTz48qRPStB
         2zoa+YQD285FiHhbnMqINxhn8bN1rZa+fV4IbzEFcrCysTh8WdhqHCieUGUvPlhP1v2y
         YnTDZS5bVycYRuqfFzzja9k0LwG+/iQyLJmSZAWBtPUTGMNUG9GknhoejC7OhNm1D5c8
         B9cUjwlYT9RBfOEKbD61ZLPPvhEYSHNJy3cGabN2rrJlNQEkRTJntjIuNWReo85+Zxa1
         OURjFYAbhYciiTZFphA7zmNI9QsjXi03rpQAAASxd1ySQwAKgNDMOmKPd6+Ywp9G2T1a
         9poA==
X-Forwarded-Encrypted: i=1; AJvYcCXLWDn9cLO1V+JEWh1f1GRxdtLFpvUQ62VzF/C0WE+L0Vzbj7/dPK5LkkhR7sqGShPdJONmFRY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDSS7gYiD9jspEebKeuIURgDX7nsC2HO01Ng85ynRKJ3rSlSq8
	VsW5BYr3nPSiOoA3z4Ltm2rIAbwoSMQtJ1Hl6plVyZYwXpiUKTz9aBdXr9bgFA==
X-Gm-Gg: ATEYQzwsCLw4Y32rI5LC6Tu3cK3Eih9/1WRjfZFeJuAZOJ3fGOsWeEKua0/h7lYH2FS
	x+Pzd/OM9aKjQofQcnpOg+Rv8/MzOOr9wfnwsGM5HUMNYQfyqDwPZ9DzVurgrHqkybtXmRmV5Y0
	xRR8tMV9q4RSZcMdGV3qdWBdhYhh4DcsYibKdgRVSFlfYRQ6qAPRO8GWjua7EKNldHOZ1sgln/Y
	RhXxTnyltEnG4m1jopYliQ77WHsPJiAziRRtrwRwwm9mwMNEU07xLG/QTtHVwp9s2KUy5XEi14W
	82uhzUuOJFFTge7Xny+Gz41oGiTs04Osm+P2Ot+wH28K5+KjfBLxLnlYxQTiVYW3+C0h8t6wY+v
	aXrEPwPMYldm3CnWeMJRi9S4SVF8yRIrc90yL37vXdZ7+Bd9tNZ7ITdv3Vwfsdb7So5rCW118fI
	B5UmthDyAIIn7USaIb18D5MGlNN7YnUe6Bl+3XH9NcpQ==
X-Received: by 2002:a05:6000:26c3:b0:43b:44e6:6e46 with SMTP id ffacd0b85a97d-43b44e66ec6mr3691884f8f.54.1773653756733;
        Mon, 16 Mar 2026 02:35:56 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm41019061f8f.32.2026.03.16.02.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:35:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 10:35:56 +0100
Message-Id: <DH43S71XJZBS.1C40IOTKEXO6W@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260313113831.3053586-1-nico.escande@gmail.com>
 <55358f82-f0ba-4671-90ed-8061f6ffbabf@oss.qualcomm.com>
In-Reply-To: <55358f82-f0ba-4671-90ed-8061f6ffbabf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_023559_671843_A19A9979 
X-CRM114-Status: GOOD (  10.92  )
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

On Mon Mar 16, 2026 at 3:27 AM CET, Baochen Qiang wrote:
[...]
> or alternately you can define ath12k_wmi_tb in wmi.c and add alloc/free f=
unctions in
> wmi.c, then call them in core.c. this helps modularity IMO?

I'll add new functions to wmi.c and make ath12k_wmi_tb static to that file.
>
> either way works for me!
>
[...]
>> +static int ath12k_init(void)
>> +{
>> +	ath12k_wmi_tb =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
>> +				       __alignof__(void *));
>> +	if (!ath12k_wmi_tb) {
>> +		pr_warn("Failed to alloc ath12k WMI tb\n");
>
> generally we don't log memory allocation failure

sure will fix

>
>> +		return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}

[...]

>> @@ -9215,11 +9127,8 @@ static void ath12k_wmi_event_teardown_complete(st=
ruct ath12k_base *ab,
>>  	ev =3D tb[WMI_TAG_MLO_TEARDOWN_COMPLETE];
>>  	if (!ev) {
>>  		ath12k_warn(ab, "failed to fetch teardown complete event\n");
>> -		kfree(tb);
>>  		return;
>
> nit: better to remove return as well

Indeed this slipped through the cracks will fix

>
>>  	}
>> -
>> -	kfree(tb);
>>  }
>> =20
>>  #ifdef CONFIG_ATH12K_DEBUGFS


