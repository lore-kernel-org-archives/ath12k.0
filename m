Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786C8CDD54F
	for <ath12k@archiver.kernel.org>; Wed, 18 Sep 2024 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1EuZ0oKo6MzfawFJgiJdeuRuDAthQeQ5wmVKo8RjUo=; b=IzEyazaxNINIjj0oc5iG8jfZOQ
	uu+pRgtf9Li2DNH9w3yRuG2xbPnc1/IIHGjraprVNwzTWdbYqkZ8YlY0gysaUHz4CLVkECyusV7Ru
	T+tetZxtBkS4zUt+sMFc61y8JQiOmQuSU1PEumZiWDdBj4Rpb+2/ToGh/ElE1OwOJKfbtS2C7hqJt
	okuJHoDYaB+BjSAGP8dpz3Q10KCIP22OavRVNnLQKiDW2I/8AX+Yke88tYwwpc6C87110RTZQoUS7
	+AKINTBRDWEiNcdbQzD31P3zNAzBkZMbYsJzxoG/xemq4tMGC7jDdNYfS85xEldh34+GqT++BG324
	aKOB2Hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqytl-00000008mAV-0TnK
	for ath12k@archiver.kernel.org;
	Wed, 18 Sep 2024 17:55:29 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqysy-00000008m2d-1ECc
	for ath12k@lists.infradead.org;
	Wed, 18 Sep 2024 17:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1726682072; x=1727286872; i=dknueppel@online.de;
	bh=G1EuZ0oKo6MzfawFJgiJdeuRuDAthQeQ5wmVKo8RjUo=;
	h=X-UI-Sender-Class:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-ID:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ckKAuNQyV33ohyp4rNtLZx34ZfJJFAEh1//dZcjMZzUvXNcN9HMJeS0AXBJaaPrN
	 XGCCj8mxhUhXPYOObu0QYtdMqKdIv4Mx1D+ZG10Veo6XHW+AdBQbaNWiZkI+zg4UV
	 7/+EQqCJI3M/E1hDV7CsbvM07QIfcTSXEOJocnQNcpsIHd1xVvktWYmvlZAaY07oa
	 Mj4o611aJsgGQ/H2Akkyr0dW8x3sTqcutPMX9mkuv2yMHBEIUMEPC2xxhmSaLVd8t
	 fwUId2X/oJ7hoPzfVwCxTFKMEXu8Y5v/JBHHblmhrBbVS8bN4llGbhxta3yRrt3VY
	 JIDioag21/2HXCotBg==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from xXx ([87.122.98.153]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MbRXd-1sFS8f1cKX-00mhvx; Wed, 18
 Sep 2024 19:54:32 +0200
Authentication-Results: kalliope-7.home.xx;
	auth=pass smtp.auth=dknueppel@home.xx smtp.mailfrom=dknueppel@home.xx
Date: Wed, 18 Sep 2024 19:54:31 +0200
MIME-Version: 1.0
Subject: Re: ath12k - HTT timeout error with NCM86
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Dieter Knueppel <dknueppel@online.de>, linux-wireless@vger.kernel.org,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <14e17e9a-638b-4bfe-8a2a-99b524a20acf@home.xx>
 <1MvJjz-1s0CoP3EEz-00rhmL@mrelayeu.kundenserver.de>
 <7488ed13-82dd-4b41-97c7-5692cacfa631@quicinc.com>
 <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
Content-Language: en-US
From: Dieter Knueppel <dknueppel@online.de>
In-Reply-To: <6d3f1f33-2a9a-4b62-a0a0-02e65bd1b461@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.10 / 6.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Action: no action
X-Rspamd-Server: kalliope-7
X-Rspamd-Queue-Id: 02B863F908
Message-ID: <1N5VPe-1rtGQU1log-00rQtq@mrelayeu.kundenserver.de>
X-Provags-ID: V03:K1:8CqDCZc83ehZeXS4rnXCRZIOw+jhZJgjni0spoIrmckB3d4kITj
 wwVLK3styHIeDK80OmZHjpV9K/nhU6HNticdLBVH6d4zPrKvlXfS+rQmt4Z46u3RnraZnID
 NsOnQlqD7MTA0Hslbbk91p5CZeIqm1QoS6xHakjncGJntwbq1Ju1Du/qu9hrbXuNg0qEtUG
 on2FX3v7WB8jEFti+1VAw==
UI-OutboundReport: notjunk:1;M01:P0:9m6TN2PT0Cg=;q8LZeZWrNKgLmo7qziWB7vpWHLM
 WIaFQgGxnHzJEMFUMWu8AV6nkGOA366BIR5N8GEZTFPvngwvxGL8BASU2qVVhvez2ybKEg9Zh
 wztYb9XMYjaAEBdFk6YUN1YOt99H6/i0LAGNi5nElHaLToDNh51DcMCUncaojwOMhphMr2T5q
 V7JdLdq0TDztjA11vF1w2uYOgL72ggxD0eeC5weef6ERJKu2TsZhIyTloCPx58rsy95rgH07q
 gNDkrYCN8ZcBeBi078mD0aMTOwVtfrAGfLlu+b4iz9ZbdXoypgt63AqaQmuP3Plb5jis3idi5
 FrHQdVFJ9KJJr9e/oOEZ6CDaIjz8JhxWnesOyh50TbsZ1z+REX9qOs2YCSaU75j4Uvo0dTWtz
 CjO/c/DOnpLNPRkAY2afUrV3n3WusBawkTbZzVyvGevsk68QJoxL1buzQ3Wv2VCX/rz8uWNsr
 YtXupJ79fS0JKb+jW2UYqRyfbG5JL6xz8IkC2ZhPbd+hQafVs50n0O7Nfbo/sZbC+OvLrouPP
 nendLeIzd45OmTbxq255lO4Q3ND/8P0sQ/seGEQhF5zARiWkvXo8ahzr/40x6BEzh5j37uxBh
 OGglUwXOJ1leGg9aUcA6C/wdnHJgHA98KitwUfGlaUd87wWag312HokHBQ4+MfnIHfoGCX5Cw
 45ey2bY1CSCLXES5X4DAqap2R9nnQce4tCeGniyWuc25iiwW8OTGm/gbXpi335qg58dMokfnu
 oRb4ThTDuB6GsyXQH1Xe2IoVM4iwoY/vQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_105440_723800_017B28A7 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Jeff,

thanks a lot for your update on ath11/ath12 related vfio support.

That's actually bad news!

Do you know whether vfio support vanished per accident or intention?

I.e. I'm wondering on why the ath11 patch haven't made it into mainline?

Assume there are no other 802.11be Chipsets supported by Linux, which
can be used as AP within a VM?

Kind regards,

Dieter


Am 18.09.2024 um 18:13 schrieb Jeff Johnson:
> Resend since I had a typo in the ath12k e-mail list
>
> On 9/18/2024 9:05 AM, Jeff Johnson wrote:
>> On 9/18/2024 7:40 AM, Dieter Knueppel wrote:
>>> Dear developer team,
>>>
>>> I have to admit, the earlier post "HTT timeout error with NCM86" is my
>>> fault, sorry for causing confusion.
>>>
>>> Due to earlier tests with legacy cards, the PCIe slot was still forced
>>> to Gen2 :-(
>>>
>>> Putting it back to <auto>, with "MSI HERALD-BE", similar to "Gigabyte
>>> WC-WIFI7" i
>>>
>>> consistently get: "Unknown hardware version found for WCN7850: 0xf"
>>>
>>> Which nails down to the question whether any of these adapter is alrea=
dy
>>> supported?
>>>
>>> The M.2 NCM865 card as such seems to be supported.
>>>
>>> I'm wondering about the difference, as there seems to be no additional
>>> logic compiled
>>>
>>> on one of the two PCIe boards, just bit of glue logic.
>> For better support on ath12k driver issues please include the ath12k dr=
iver
>> list (I've added it to this reply).
>>
>> In your original e-mail you said:
>>> I'm trying to get "MSI HERALD-BE NCM865" up and running within a kvm
>> The ath12k driver does not support running in a VM. Even prior ath11k-b=
ased
>> hardware doesn't support it.
>>
>> For ath11k there are some manual steps that have made it work, so if yo=
u are
>> adventurous you can try doing something similar with ath12k. Refer to:
>> https://lore.kernel.org/all/adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.=
com/
>>
>> /jeff
>>

