Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E0C78837
	for <ath12k@archiver.kernel.org>; Fri, 20 Sep 2024 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ita0D8YFfERtlRUbb5e1tlbXbt8U+n75gBzvQtgEr8M=; b=WPN94bKu8cfKSvnUdqwt52bl5T
	ACUQ5Pp3zljWkcZPqP4xxKnhABnzJTIqW/VR88jr6K40QL3CmYCDdKh/AgI+4o4wzYRP5I8wlW1pN
	4MXlXLU1SqGkp3kXvIUH+6xyYaYIsC7BT7IQmxbxNDIEYnFYCYvReWOLwv9YnGPimP1ec1neyy0vw
	H76iZDWRkb3gTlIHH0+uPxMLpSv+CGT5mf0G9H7UrpxVBd9yakuM96aDnPGuifkzMTI8fAoSpHMsN
	0n/VQle5vTgGUzRnNvtC8e7MoHFKsolMSXPTkW+Wjxzdt5mOF411+tdW+yBoLV8W2kqlWUgjx1iuz
	73vXwO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srd24-0000000CC2z-3iAO
	for ath12k@archiver.kernel.org;
	Fri, 20 Sep 2024 12:46:44 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srd10-0000000CBjs-12gg
	for ath12k@lists.infradead.org;
	Fri, 20 Sep 2024 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1726836330; x=1727441130; i=dknueppel@online.de;
	bh=Ita0D8YFfERtlRUbb5e1tlbXbt8U+n75gBzvQtgEr8M=;
	h=X-UI-Sender-Class:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-ID:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ijkVn2tcjfnn6aJa87h0gHhHHoRi+qVvNj8IVrVXP7tT6I4bw+rhh2S/ityv9cAV
	 wx4ksO9e2YX1n9v/1p3Qd7P6WogmvTXeR3XCeQCL6ENzYrRfadMvRwrWM4dPIlivm
	 l/G12i4MuTWuyL4lrpp2RfvFRyn84qCKRocFnlK+P/Zu0d/B4xfEiIJ2SajNsoJk7
	 S1WLDW7ILLjGXCAuJG1gpzw1tUHlc+HpYHPOjMAbdx1VlAmfkPVqJOwldqUZB7c8h
	 kYRIPtxQ+WAP56xjA3HCxJcetIDk5s35qVS0P2ZsFWq1bBtpjXA4e43dPqgvt5WcB
	 JN5nXf/HbGqOzUhBTQ==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from xXx ([87.122.99.196]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXHBo-1sSmKS1zhe-00YM15; Fri, 20
 Sep 2024 14:45:30 +0200
Authentication-Results: kalliope-7.home.xx;
	auth=pass smtp.auth=dknueppel@home.xx smtp.mailfrom=dknueppel@home.xx
Date: Fri, 20 Sep 2024 14:45:29 +0200
MIME-Version: 1.0
Subject: Re: ath12k - HTT timeout error with NCM86
From: Dieter Knueppel <dknueppel@online.de>
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Dieter Knueppel <dknueppel@online.de>, linux-wireless@vger.kernel.org,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
 <eb1c8576-bf2f-4ec0-8651-62e97446e940@home.xx>
 <2271e7e8-2e25-42e5-a162-e79f65ee8798@home.xx>
Content-Language: en-US
In-Reply-To: <2271e7e8-2e25-42e5-a162-e79f65ee8798@home.xx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.10 / 6.00];
	BAYES_HAM(-3.00)[99.99%];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Action: no action
X-Rspamd-Server: kalliope-7
X-Rspamd-Queue-Id: BCE5E418A8
Message-ID: <1N4h7p-1rrEib2AJr-01163u@mrelayeu.kundenserver.de>
X-Provags-ID: V03:K1:rEGZ/OAO1ToqEMdc/aLHY7ydx4FhN9t+grX9lVgpojFhdC5OrMJ
 up8KbENl+ISddgqJKg8JvX/ZhVncuvdEMxnMFLYIDFlxJs+NZbCi49WdBS1Kt96JlqYCi2v
 PtoVA1WSJaqycFKlFmqHq9ZdDnR200gCNlgAp64jMYm3p1OWJ8rqmQRuD3aTOVjx3PJT8fm
 60VI2GVUSw+xlLv2atcJA==
UI-OutboundReport: notjunk:1;M01:P0:BcGcGO6sRfY=;zk5m6zvk6M7G52BwNTd1q4d/9aj
 X2tQoxBFmJU1Ew5uu0n5ZodQ2m54oQeqcIae0MLjQWg5T8M/mErlnt1VjMTdLVOezhH+Av7CA
 2hu/ujuupuo3vCOvDe8heU9wp+EOXrGP1sbn7FrYfNYl+wtRL1bHa5s/o0sJcRExoW+Rxdjmg
 +JdD2gmb3f6d4catyskGDyvfDvHPiUALSpOIo+kw82iwhJXBaLGFjABD4bIjmYlZgpgwLj7zU
 DH54B3w4TgLdaQcVhCy6fvE/iAydVlWc7l0OVQ/62Qka7GD/EnceRHDml6zD2lYDIFH6yHgwK
 Sk/kpJS0sDmCC3lcFhqSwU9XLX+RsY4l9upmxmAQrq4uPMa8PGr/We0liVk4m3wzL3v5cxCCr
 TlRSnAxqzDBnH0bnEf4jj6K5KCZh/3e8yl+Ndi14x1nyHTAI86Vwg9BwRe3Vl+CfaQrXvc8bR
 1w+wtIHKEBWgKpAArAsLF4wR16IbTHCkhUkH0Y36y7QtgCdlt2z6zsXG0PTo9tFCMMaLYPf7s
 pjd6AZMtlm0lC6ZckISncrFdp/ysXNuhAHojkuMqqgLnqSmfznz6bJQnh7/yE23vJ07dkkqW4
 +ZrpohjO/Ady3KBCghI/A6a4yjf7BpSxbEDab51ueN121n8qZIe9XGnAYXoh6u7f5xwjMy3wZ
 TkZYuZGHgFMgP1Aow63Mom61CMZGeXMEwOS15X6bjAsFPIQCAnukpUZ1Kqh3eNFeYuymx6CfZ
 AIDN5lOWqcc9/D8dSq9WTU+Cphcl+TXPQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_054538_689430_BFEF19CB 
X-CRM114-Status: GOOD (  20.24  )
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

I'm wondering, is this the correct mailing list for my questions?

I know you are all working on best effort basis, but at least my
questions related to supported HW shouldn't be too complicated to answer.

The information I found so far are almost not existent, stone old,
misleading or even proofed to be wrong (e.g.
https://wikidevi.wi-cat.ru/Ath12k, 17cb:1107 equals HERALD-BE as well,
not sure who maintains this page).

I'm almost at the point moving back to my legacy HW.

Anyway, I would still be very happy to receive any feedback :-)

Thanks a lot,

Dieter


P.S.: Due to my background in mobile networks radio interface, i would
have a good starting point to contribute myself. Unfortunately I'm
involved in plenty of other things and don't have the time for another
job :-(.





Am 19.09.2024 um 11:41 schrieb Dieter Knueppel:
> Minor update:
>
> I just figured out, that even the physical machine with std. Ubuntu
> 24.04 server (before the VM gets started and PCI device vanishes on
> PM) reports: "Unknown hardware version found for WCN7850: 0xf"
>
> Hence the earlier question, whether "MSI HERALD-BE" or "Gigabyte
> GC-WIFI7" is supported, seems still to be valid.
>
>
> Am 18.09.2024 um 19:54 schrieb Dieter Knueppel:
>> Hi Jeff,
>>
>> thanks a lot for your update on ath11/ath12 related vfio support.
>>
>> That's actually bad news!
>>
>> Do you know whether vfio support vanished per accident or intention?
>>
>> I.e. I'm wondering on why the ath11 patch haven't made it into mainline=
?
>>
>> Assume there are no other 802.11be Chipsets supported by Linux, which
>> can be used as AP within a VM?
>>
>> Kind regards,
>>
>> Dieter
>>
>>
>> Am 18.09.2024 um 18:13 schrieb Jeff Johnson:
>>> Resend since I had a typo in the ath12k e-mail list
>>>
>>> On 9/18/2024 9:05 AM, Jeff Johnson wrote:
>>>> On 9/18/2024 7:40 AM, Dieter Knueppel wrote:
>>>>> Dear developer team,
>>>>>
>>>>> I have to admit, the earlier post "HTT timeout error with NCM86"
>>>>> is my
>>>>> fault, sorry for causing confusion.
>>>>>
>>>>> Due to earlier tests with legacy cards, the PCIe slot was still
>>>>> forced
>>>>> to Gen2 :-(
>>>>>
>>>>> Putting it back to <auto>, with "MSI HERALD-BE", similar to "Gigabyt=
e
>>>>> WC-WIFI7" i
>>>>>
>>>>> consistently get: "Unknown hardware version found for WCN7850: 0xf"
>>>>>
>>>>> Which nails down to the question whether any of these adapter is
>>>>> already
>>>>> supported?
>>>>>
>>>>> The M.2 NCM865 card as such seems to be supported.
>>>>>
>>>>> I'm wondering about the difference, as there seems to be no
>>>>> additional
>>>>> logic compiled
>>>>>
>>>>> on one of the two PCIe boards, just bit of glue logic.
>>>> For better support on ath12k driver issues please include the
>>>> ath12k driver
>>>> list (I've added it to this reply).
>>>>
>>>> In your original e-mail you said:
>>>>> I'm trying to get "MSI HERALD-BE NCM865" up and running within a kvm
>>>> The ath12k driver does not support running in a VM. Even prior
>>>> ath11k-based
>>>> hardware doesn't support it.
>>>>
>>>> For ath11k there are some manual steps that have made it work, so
>>>> if you are
>>>> adventurous you can try doing something similar with ath12k. Refer to=
:
>>>> https://lore.kernel.org/all/adcb785e-4dc7-4c4a-b341-d53b72e13467@gmai=
l.com/
>>>>
>>>>
>>>> /jeff
>>>>

