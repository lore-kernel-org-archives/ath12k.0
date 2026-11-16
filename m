Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6357A606A31C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nB9Z82vb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ISb4SH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=; b=nB9Z82vbx7Wsoo
	QMNwf+2Yo4Exf+cZ7EXb2IGCRJ6jnP4Fki142H9yAYLqjoygLYff/SA7LxrS0uPMen6YCxKIyP66u
	gKlQTacxdgpqpA/BVmu56kNIsScrrS7qD+KIcmISyDe156u25YktsHRtEQOXHMWJU6osVEZWWUV7q
	SBUc7peVgORoAewDzVAINFAh0aEYaGThdFovUTNwP1pyfDJTA5Ofest+UYuiabXFWRwulAVCVd+Yp
	q8Dc/UjwCjTp7IQUAcsP66d8AIdnR8LcNviPgUy7bEqxI8PvwcVZUpFKn47qIf8d3E7vem9Kc1taT
	/g7JEK6FJtUn5qk036Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwTQ-00000002YHh-0dex;
	Mon, 16 Nov 2026 13:10:16 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwTO-00000002YHJ-0YAK
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 13:10:15 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-55b8cd4e2abso37687381cf.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834611; x=1795439411; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=;
        b=0ISb4SH/ohWHK1QNRwsiZ+t0q5cXp5EL+mQqDGI4BsbWGQCn49dikvNEo2DsJtO0yI
         lemLzEHbebcZtCo4diRcBMHx/oga5iapXkyaCoG+I0+e/2tAMMUfjbnLp4khdCAib5c6
         Ej6CSZeC5eAIDOWrzkLSpBzQ4T6pLpRiXVYt9gGkiQrZGsnTJewgzNw4WvLbafMO/DmB
         1fhbK/L8f0lmXdbKlkAyfx3pHEY5uDPaH/J40VgKvfmkEem8TobbcpLiM5f1SfY2OlqY
         4hdtMGcKL8RxRd+8bMqDAO7mx1SWIs63bk3MzjivvHQiGnx/SRrQ3mruh3d7+e7uNYjq
         cXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834611; x=1795439411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kM0UvzoijstUksjplMkCj1gO0fSeCed6wJBFK/eRQrY=;
        b=zzydhf1yTHm9E+DT31By0mMX2GOpNA+MhkxdU63nGLFD4GeUNZqb+w2P1jnv5uVVvR
         xNHOdps4xm2HLvdkrTFjb6Py3ZuPoIngLH+uhcpFma6PZMfY8ujvKJlBsoI0an05LQIj
         hOaoybLK8yi6CHHpTJqICjZYwJTFrGFIAW6IBKsNLp1b5UXSaZ6jqVwR5hXKTMfg21Q4
         Il6DJuGxnw6QIF7OmgVTNx5NMfgJT/fftgH/x+36OF8WkTUpNgWUgMWZbZeBdKuj8kQa
         xF1OQzUd29qxbi9GdCbT9UQDAaAb7vbIdszomHvC36BmjTRpumYtDcHi+IrXx9wDZppB
         GGdg==
X-Forwarded-Encrypted: i=1; AL+hErHuX71uhF2kR6HZPnU22N+1LBgJiLY70+PYDhVRNE9vp115DWDLpL8YEdZJyLYMm0lgNHJBR0c=@lists.infradead.org
X-Gm-Message-State: APuU4Z+kLo6wATGkyaJKJm1Xvk0rDSy1vwE2bUTIReN6VMJ+R/4fpkr7
	hvrKTttOWKNwthvoRjLoS87qqq3NIhtWCpxwzTo++KZfwQxyVfwdSY0R
X-Gm-Gg: AYBFou0pSFezmCNPBlgauUf2gKlVYLFuLKgbLZpiqoL49GpLjwmRc4O/HRy1iCWAMYV
	1TzSad0cmU/jkGscER5wGNIpBoULKpPaZFjNBYQ8ZtOARYwvyY8GHjwkBwka9/zf/pwTpb3uJTK
	wQwMLAGHTCyT51pSMZjlBSz52i0fJZPutgaDjv+Oa5Fm3w0Q5Cd7a81HKlsV0aZ3qz1/YY/Jd0l
	UVLsnCf8XsRe81P6FJtqm9a6mxQSmwUdyhdkvbhFGgdIiiuC97K4MEx2HcNUtLNaaj2epUD9yql
	Tgp/7B2Hw8qYwLr2SGQ+5qOFGXbDlFcHpyt9vptyfmqd0vLllFXIl/8OIZI3Tb3DV7fH+rhmVV2
	YfimO/0unqZti4B0uFAKmwns0m9zM59FtKt8SISqsJJsPwK6bi/H6WapD2lDLiC4yCVmG9bG4g1
	1BKDuwaSY2f/u3KviJA8fniCVk1WhdQ/G109Q3WddakGhFSCPaHmGGM/yo6Ow4EazfdLJxk5FHR
	fhCwFiEiWA7o2B5yUbIomkTXUSerBc7HFq4UwDXg0JNv7oyEr5eaWpCRwUixB/hrZ+fCeJtMgRl
	V/Js/5Tx9nnmq+F8jLkW8+RJ757Z33p8nMOnRuub+jTGzMkbPDwU47c7X1Rct5t099TGeKqxhsv
	x4Wo+IG+eHyg=
X-Received: by 2002:a05:622a:22a2:b0:536:52ae:d91c with SMTP id d75a77b69052e-55ac80705cbmr164197351cf.47.1794834611428;
        Mon, 16 Nov 2026 05:10:11 -0800 (PST)
Received: from [192.168.50.163] (99-7-255-95.lightspeed.clmboh.sbcglobal.net. [99.7.255.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d37daf422sm25492351cf.15.2026.11.16.05.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:10:10 -0800 (PST)
Message-ID: <261fd10f-8db0-4458-b7b0-a8875c37ae85@gmail.com>
Date: Mon, 16 Nov 2026 07:10:10 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
 <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
 <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Content-Language: en-US
From: Walt Holman <waltholman09@gmail.com>
In-Reply-To: <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_051014_182584_F3F1C50B 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 23:28, Baochen Qiang wrote:
> 
> 
> On 11/15/2026 3:35 AM, Walt Holman wrote:
>> On 11/3/26 09:26, Jeff Johnson wrote:
>>> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>>>
>>>> Hmm, forget to reset revision number ...
>>>>
>>>> Jeff, let me know if I need to resend it with number fixed.
>>>
>>> No, this is fine. Waiting for a R-B from the infrastructure team.
>>>
>>> /jeff
>>
>> Has there been any progress on this getting merged? I need the patches to connect to my
>> wifi on anything other than the 2.4Ghz band with 7.4-rc2.
> 
> the v5 version has got merged in ath.git already:
> 
> https://lore.kernel.org/ath12k/20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com/

THank you!

-Walt


