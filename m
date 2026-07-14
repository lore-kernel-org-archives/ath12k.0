Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3829EC43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/ZP/NLJuU34Qnz9im12DTJ/ZIfKJhQvmYHzhR/bf+g=; b=H/t4H68YnZYSSWZUn143fc01n7
	FqC4ogBNUKgdaiD7anwHJ+5Eec61AEQ1i+rtdVuz+K2okC0ILbQbhmDBX8L5JCK4YpAv0IDk2c5rX
	mKZ7NjhnjN5uNm1bawvZs9SJwtwjtrLvFhSC40pfyriSMXQiQWVjvGJzxUpFwy+BbkfE4aKrEd09r
	UP6RhjS0wJdX+j/VFH1cmQjAHyjHw0OFymGUHHcdatIavaAJlwGotDXYsbjxycgm0OUbZ+gzopNPr
	qzD8R8KUfcqHB3NB5BkEHmxZ5Pz7bYU9dxHFtrorVR10ncQTydpkhliI1jqG//1pU05YFD4vlPCjj
	YEZzjlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYWM-0000000BJ6F-3gxY;
	Tue, 14 Jul 2026 08:29:42 +0000
Received: from smtp-24.smtpout.orange.fr ([80.12.242.24] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYWI-0000000BJ5G-1ZHS
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 08:29:40 +0000
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e] ([10.64.95.99])
	by smtp.orange.fr with ESMTP
	id jYNvwvJAxREGsjYNvwWKt9; Tue, 14 Jul 2026 10:20:59 +0200
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
 ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id jYNswQfQaajQCjYNtwI5ec; Tue, 14 Jul 2026 10:20:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1784017259;
	bh=R/ZP/NLJuU34Qnz9im12DTJ/ZIfKJhQvmYHzhR/bf+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=hH4NZUNPqlzQYA6nExHZ7RByXB997hb5lmB2rrI71E8Xwy/poMLdtFEwS/QATlJcV
	 3Dr//lU7SDtCyRkZLJzaR3K9A1YLTvPbfb1SQJmJMLoxpNxWS5fEv92/uMe0SL9dF8
	 +wezz9o8g9npusxGIERR2JhXpwsuMPfRCrdzb0hZn/AjYlnOIAkaI1FdF/Yz7PqNas
	 kBRQ7RoeyOBVB8fnoLVuvcu9PhcbN51G5HTfTSgVv2vWoiHVt7qnyFh9BlIWezkmeI
	 6LB71eU6nVkBaH/sJjgbKpueJt8yuQDIRX1tDYPzLRJEb+HMpAkFnuevC6TeGVnjjj
	 tQxvrdMaf2TvA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jul 2026 10:20:59 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
Message-ID: <04521906-da94-466c-b7c1-7d119eca9508@wanadoo.fr>
Date: Tue, 14 Jul 2026 10:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Constify struct ath12k_dp_arch_ops
To: Ping-Ke Shih <pkshih@realtek.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <469d732e2c6f159e1a05e89c7e417c3a10db5fdf.1784010931.git.christophe.jaillet@wanadoo.fr>
 <2efa694140ce418c8d83a62d3f7b5309@realtek.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2efa694140ce418c8d83a62d3f7b5309@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_012938_560686_D3F4A7E6 
X-CRM114-Status: UNSURE (   6.49  )
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

Le 14/07/2026 à 08:57, Ping-Ke Shih a écrit :
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
>> @@ -139,7 +139,7 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k_dp *dp,
>>          return tot_work_done;
>>   }
>>
>> -static struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
>> +static  struct ath12k_dp_arch_ops ath12k_wifi7_dp_arch_ops = {
> 
> Did you miss 'const' here?
> 
> My bad!

I reverted the change to compute the size before/after and forgot to add 
it back before posting.
Sorry, I'll send a v2.

CJ

