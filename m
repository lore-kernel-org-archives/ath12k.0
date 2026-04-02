Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651A0D3940D
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7weI9og6Q0lyNx60wu/+g5SxUcLYMdf+Jn1DbxQ90k=; b=WtXTWI7ZS1VRx3hvVdtwIjxwMQ
	FrGb2n0POxEaiYQB0u5AA4E45v/L7il47GwZKVxKA4EYwLLv/ac5Ex+53ldzTaWEcmVgZwWFiYKkC
	wQv/yZB7xFGfBqYwThTo5FCKTobZjMdKLjSdHK1l11cmRvyZSC3EEUXi7py4R8lkZGLwuf/OYLJkM
	SfxUqo+IM+TRI6oh40o3DeyyQFXliK5YSY8WV0iciz2uJ8y/f8Wai1mjxYRqeyPcWoUHZGpaX9ezi
	ExOlRdsGN3EW5scMAoKGNBRAG8YyBqdWHWg5nlvLkk96U/dkZPuENTXlj85VIPxtggkWYzbmvzJjS
	3/BrZ4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fa8-0000000HQlp-0a6T;
	Thu, 02 Apr 2026 10:47:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fa4-0000000HQlQ-2OWv
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 10:47:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48891776099so5837345e9.2
        for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126838; x=1775731638; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7weI9og6Q0lyNx60wu/+g5SxUcLYMdf+Jn1DbxQ90k=;
        b=Gzoq+m+I7h6+rZNNLSEQ/CLvW8qnLeqkgHFA2UpwPNNhjLNPsE7SHW7X+SkvA8xtiW
         flgZ7LQqe1XzOmR6AUaO5BnFDsDkNtkR2emUan7ZZ9do/xqdYgSoYFXNL01g+iQEXjuU
         4OQXUtPCNTraXgpDTvuLaMb4N2xthOkZeuA3qD0TpUliQMzXhWzT1JAGG0kqo/Zhiswd
         13Uv5wZOBtciM/eUIiGeHFWZT5EDPdCj4Yqe/lKZ1QRsrRWxGrEB+RffFiCTDFR9oNFT
         Pimkd/vMIusO1rs2XHBBnjX/3OHqJG/YOCWlAp89wQYdbPAh+aEuw2SqnKxLpDUqBGGe
         kiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126838; x=1775731638;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7weI9og6Q0lyNx60wu/+g5SxUcLYMdf+Jn1DbxQ90k=;
        b=N+J5Lo2w3Z68pm21aduk+xTTJ/DUXK5AViDbx1B/EQhWqi/jv7d1kAElEGhQrIFTbC
         PGt9Iy5qhfQEUI9pgO9Ptt4mD0BZMD/AATXS8hTzC3NQkzKMXvyGvpz7+FJqw9ST0NSs
         R/VnA6xXJkcPf+IVvBIHdCggt1b0BGafZUd8U/eac+027UOeg17+wng/TIA+i+6FU43p
         FRpOq8EvtJi0wtxHwAfBIce/wkxBEv+xpqCC9Rnuhql96la77BRgtpj3o+yulNCO0UPI
         bp3guj7fVwLDCABly5qXIpDPbsyeV1skauR8qja+C/cyDqT8EYFft6+9eVJ52f2xGxjV
         8krw==
X-Forwarded-Encrypted: i=1; AJvYcCVdfit+pipxbdqv7j0+XUPkYjIerDd2bvZ+rUy7xC0A8l9AUPv+Vkmqj5t81mqFYxNCA/hZyeg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/VgyRUMgurkRtobZhO4uXqEfT4hngZQqrpxdQygk9L7mWyLZr
	P5x0zIML7Q6Y3xSbLtO/K8PQnmMsljAjHaTL+KoLkG/XZOFGLWqaL+30
X-Gm-Gg: ATEYQzzzZi0TtgEqqQNFx34Hj9IMAbd2NloRYekpZ0jJDm1JvEKQ/2KuYKb/x94UbJE
	QC/35ktjIPDLJkA62xI0+/f46Np3uOqsd88cvpYXhpLYw8b4/KErGwAb3oOequuafaXNeoU9Log
	5jFcQiqa5uCrohgvalt9s9FeImRLBc37h2FfxaTuins/25kNs8UwQEN/z+NDicbJ0gCwTQkF45z
	bYwHVdOR/qBKF+KYEqZ0HmDW8RsuiUAZAuEkGwGhaFxmQyQkVsQl4N6Qn0Nm5NpMp6JU7N2v3vH
	D5u7t359sPM6KL7cLt/NaPrdGYeEIp77y/qy1deZgO9yZuz9cjrldUSLQ1iD74WndAnk/y248DS
	zPuPlyb9oZIUcCOX1uM+By5A6IfzxWYz+99aPAAE020YNyZHsFMOZFFC/CpquvXThiEWgXL42nq
	x98ECWmjNJGNB92vc6bcJHx1T/tOUBd7j/mS68rNTFmQ==
X-Received: by 2002:a05:600c:83c8:b0:485:2c61:9457 with SMTP id 5b1f17b1804b1-4888b70fbaemr58487125e9.10.1775126838010;
        Thu, 02 Apr 2026 03:47:18 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c751158sm95037345e9.6.2026.04.02.03.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:47:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 12:47:17 +0200
Message-Id: <DHILY3AU5IF4.QIHK6RI52T93@gmail.com>
Subject: Re: [PATCH ath-next v5] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330102434.13136-1-nico.escande@gmail.com>
 <b066de0a-71bc-4d03-8ce1-c6ff22eddda1@oss.qualcomm.com>
In-Reply-To: <b066de0a-71bc-4d03-8ce1-c6ff22eddda1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_034720_618438_2F162CC8 
X-CRM114-Status: GOOD (  11.30  )
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

On Tue Mar 31, 2026 at 4:44 AM CEST, Baochen Qiang wrote:
[...]
>> @@ -11239,3 +11149,30 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(str=
uct ath12k_base *ab,
>>  	dev_kfree_skb(skb);
>>  	return ret;
>>  }
>> +
>> +int ath12k_wmi_alloc(void)
>> +{
>> +	guard(mutex)(&ath12k_wmi_mutex);
>> +
>> +	if (!ath12k_wmi_tb)
>> +		ath12k_wmi_tb =3D __alloc_percpu(WMI_TAG_MAX * sizeof(void *),
>> +					       __alignof__(void *));
>> +	if (!ath12k_wmi_tb)
>> +		return -ENOMEM;
>
> better move the second testing inside ?
>
> 	if (!ath12k_wmi_tb) {
> 		ath12k_wmi_tb =3D alloc();
> 		if (!ath12k_wmi_tb)
> 			return -ENOMEM;
> 	}

I tend to prefer not over indenting when I can avoid it but ok.

>
>> +
>> +	ath12k_wmi_refcount++;
>> +	return 0;
>> +}
>> +
>> +void ath12k_wmi_free(void)
>> +{
>> +	guard(mutex)(&ath12k_wmi_mutex);
>> +
>> +	if (!WARN_ON(ath12k_wmi_refcount - 1 < 0))
>
> better to use refcount_t and its APIs?

Indeed I'm not familiar with them but I'll look into it

>
>> +		ath12k_wmi_refcount--;
>> +
>> +	if (!ath12k_wmi_refcount) {
>> +		free_percpu(ath12k_wmi_tb);
>> +		ath12k_wmi_tb =3D NULL;
>> +	}
>> +}

