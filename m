Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F946D3940E
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WTteIQaztLkVZaaTIy+MnZsjCmlbwYzSyNcOxN/wuc=; b=S5KkScbUzqevtToJ11gfGDKFmF
	wj46tRp31OnJ1RNhF2R03XkjJBJ5fSMwKfkmQdF3ss81S3Vg6c4R5lEGHyG1bv5UKReLVj+gpGvc5
	qUdHETYeqddbAsn2q5qlVuF/pKgWdXOkIyjp4bMjy6nHp9IvklRuRgS+vzF19j9DhkBh1W0FXRM9m
	kH9o5959uUm5k/PQIoCOg589WPYEzEGJzR6QQ3x6eZ4aXtNvJwCuhP+tWyE7Xo56mAW+tmahawKh6
	G1lK+vN3ErP5KaYQKkHBLh1cIiq0GAVlfTOmv9yioq5hTaBk9y1UM7luVLn+/u06VrLrPaKhhPuEi
	Ryy/hX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FX0-0000000HQNP-1MOm;
	Thu, 02 Apr 2026 10:44:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FWz-0000000HQN9-0zey
	for ath12k@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7WTteIQaztLkVZaaTIy+MnZsjCmlbwYzSyNcOxN/wuc=; b=jy5/oBT5moR+hFcYIW0QJaAykN
	WPZh2KfaJ53JWIg0O+K/i8Z7HUFWznDdAmwbw/XzigS9NW2G7vA7tDfZIEdg1Fhwt72Hruehmz05Y
	HYQ/M4BNuBX+hIV3Q+Aqx1AYmQUddkiyrZ5Qom+pR9cj1UgKgyzZJ/hAJHCDIOP7xBwl5obwZeNPE
	UB1BfoMprYr52ILPJOSh06qYHYmjzZm5iPvZJpRb67L91X/0XAwLOE1Mh9fowAFHThKl3YC+Bdgmc
	BM5qOapo113LPH+ROr1FgadSrGusTtBCldLbQ++uLCto5RXOb8Klpy8e+WTVom8EwLe3ZTWVLrF6A
	Qaep6QCQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FWw-00000002Fjo-0j0S
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 10:44:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so7389695e9.1
        for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126644; x=1775731444; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WTteIQaztLkVZaaTIy+MnZsjCmlbwYzSyNcOxN/wuc=;
        b=Qk4lUPsE6IrWhIi0jabbVvTaHn5sGXqqrxt2VKVlf6iFk6R7QGZdy2L5+zUotrhfs3
         mNdHVZFYoOfCTM1fhDGo9qLiD0MD3EQF+e4UWbADGESNxO2UJc9RkKN6NTAdFQhW/KNp
         tJHT1/YjNGYx8YECjkIRfpzhNzUUwng9/RrbSSfbxRuxIyfLSgZLCJZH1tC69zI+5jk2
         D/pfBb0lopBTAN0ydVbUxifpt2VT1dYqMjXESDAMGkWYpGxpGIlS4Kn/hks5IUtuCWLa
         8WGKFESuZKqQQ6Y1/7an1QgWSw2TUzYwBfd/gQ6KlBek+A5jO6gtEqENJ73FC1DAu8kZ
         DubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126644; x=1775731444;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WTteIQaztLkVZaaTIy+MnZsjCmlbwYzSyNcOxN/wuc=;
        b=gGJAQkRsGT0xQqZnwLXZMijXMH7DaDEzbrrRpHQMy0yFOd5kOSQrB9dO0hWxtE1Jxp
         iBzt6/rbrdQfa+0bdT+FTKqi33HqrGkS6CCZu51Df8CjpiSPZf23gzs+9pRYOGjTdU/F
         L7C1wxiQZs1kYl0cO6xxhBDNrCNSr+r48Gd+0uYsmwyW9UrJf3e0df+kOU0mB6IVQ13S
         ueCXw0pSQLu1sI7FGYfAJhFbIunTP/OpGMB9J6mAx1ASXN7dD4A27+nqEWcElvr/+6ey
         3c4FNVY7t4D/lhzoS1gitK1RsRXZ+DwicDSOHpZDnnDrwR7OmUoDBvSGm0cK/BwKEy4n
         Zkuw==
X-Forwarded-Encrypted: i=1; AJvYcCV+7zDlbof8CP5UQkRPxLPEVjG96Pqsr9l1VXmK4UpmHyRHmIFMdp6UoGQlQUp9O3M/kMCgUn0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62EMiEDN5tZKE+pEagWDEU4Cpm8TsNbX+08EAxY5ospVFZW37
	7HkUg2u5lgVMPmkxjf79shiaoeSRxnY+rZm061W7YlUotDJZxcu8bVpw
X-Gm-Gg: ATEYQzw8ttHRlF7e+0LqMI2gzA0fC7YgqUGvkVGl8Di1ro7j4Fis6bKbMzJqYZ+McgJ
	4pMsunBJRBWoJj0jxAVF/Uqlre57OOYD1Bjmkzmea+z6OdEtN/xHO8kFAHYOO344XqF7WQxrypG
	OJEdN0xtXVQvJjd7pzKd+OCtvm/wScR5yjTe0g1o81Yr6P7gccmeId5FZMu8M7nN6eGBEPnbzya
	aUZVRS1Oe1zA/QaoF68xbdvTVjKRKpJxUInVzEZ7Ai7GrLTsunvkHNGSaC/K9bA1a+zNdi358R1
	87FksDrM3nI8GTSGLjO0cYNhER2yPRxs2hj5I2Cy2r7OT8wRQ2YRKvC3hkbKhcaQkfbYwolg0HZ
	HLrZ2hl+gPRAV9hklTnpZ/a7sQnfpDYmd9549JZpRE2kxjRlaWh2Yv7MMgE7scBNHwauZzmx81a
	2xva8tXvxu4VIruRDQ4boIt65tII8BNROp5hHYSfqSow==
X-Received: by 2002:a05:600c:4f12:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4888e0bfe43mr30484065e9.12.1775126643813;
        Thu, 02 Apr 2026 03:44:03 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887adc5690sm110565405e9.2.2026.04.02.03.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:44:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 12:44:02 +0200
Message-Id: <DHILVLV9Y722.2Q7ITX8PL4211@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v5] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330102434.13136-1-nico.escande@gmail.com>
 <a124d5d0-ef46-448b-b226-8642da61e0cd@oss.qualcomm.com>
In-Reply-To: <a124d5d0-ef46-448b-b226-8642da61e0cd@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_114406_503427_13A274F8 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon Mar 30, 2026 at 9:38 PM CEST, Jeff Johnson wrote:
> On 3/30/2026 3:24 AM, Nicolas Escande wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wirele=
ss/ath/ath12k/core.c
>> index c31c47fb5a73..76060d448920 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -2258,6 +2258,7 @@ void ath12k_core_free(struct ath12k_base *ab)
>>  	timer_delete_sync(&ab->rx_replenish_retry);
>>  	destroy_workqueue(ab->workqueue_aux);
>>  	destroy_workqueue(ab->workqueue);
>> +	ath12k_wmi_free();
>
> nit:
> the order of init is ab, wq, wq_aux, wmi
> the order of free should be reversed: wmi, wq_aux, wq, ab
> which matches the init error path
Sure, I kept it as revers xmas tree because it looks nicer and doesn't chan=
ge a
thing but lets keep it consistent no problem
>
>>  	kfree(ab);
>>  }
>> =20
>
> other than that, this looks good to me


