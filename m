Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE41C3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4E55ukJvZi2AfCTEU0jeudlb3F/r/yjzt5Nm4mz7yo=; b=4FgNStKgjWXOlRZQWKBcMQcJsG
	sZYy+rcoCAxIvgXN19ns4veJXSLYZ5KxUMpydNmYyIwhInFP2HK7UKx+2/CdUOLaXPntQc2s7JXjU
	h0YkY5mng6mOlXZqgL5sxTkQdDo0yXsvezHjlpnn3i1H65XZJf+4mFqZ+769JMEsbvh7D9etr1Drw
	rpDELon/RMp2PqccEewcGiZWh6LlFSQ1p5Afc07wbBlfDP5cx/+U8W033sSH6NbzsmiE0WgOhoTVC
	49FT0APSJYbOVw6ac0yWeUgs3cJZk2920poO7/R26HMBzlm4QLBII91ZqC2afkJMsiqJ4lg9F14Fn
	IC/mWCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTiuB-0000000Ae4r-20rC
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 14:11:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTiu9-0000000Ae34-1YPu
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 14:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721139103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4E55ukJvZi2AfCTEU0jeudlb3F/r/yjzt5Nm4mz7yo=;
	b=YjrPhBPBc+1dEvi8iVEw9VK+DGYt04Bbpi6ve8cFiIChb3fKrv3NdK1zy6IRgkO4j2D8/c
	A/Nf/A6we7Qmo2bvXkZ/B5Yz1LYL9NXVzxu570SPA2daLR+Z+uTsNSyBeQVdCHScVjBy2E
	hgxoIgoQK472Q1EvBQRNFbNgzrb1dMY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-D1J8oYwpNb2SobQwiFkaHw-1; Tue, 16 Jul 2024 10:11:40 -0400
X-MC-Unique: D1J8oYwpNb2SobQwiFkaHw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4266a5c50fcso10403405e9.0
        for <ath12k@lists.infradead.org>; Tue, 16 Jul 2024 07:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139099; x=1721743899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4E55ukJvZi2AfCTEU0jeudlb3F/r/yjzt5Nm4mz7yo=;
        b=Ezv/2AsQNLyusr/NNmCaYiYzokwvpZ3I2x5B3wnHwBISd1BGZu/OHDtz+i8ayeo2we
         dB/17tY0MF4+bXEgQHfbvE8tkxqFafKSJPb9aB9puHLVvfQUUaMXoOmKKsk8TL5qopRq
         65OXrxH62uaQxKyR52m0b89eLH7dzCFnK2Jx+TO/tD4pq44T9WAZVGNeBQfu2CnmCIEI
         OLLLkl70qi2ylz9ei8Q+sx7X7v63LoVavufQoBwOSM2vFan6ZYRk3w088h7Rp0LWPZE0
         wcRDL97K1VOkD5YRSZSqUUkd+ag7LTliYDbMw1pfaqmXxpKK1zpUX07xa4KhvEwoLtWA
         JYkw==
X-Forwarded-Encrypted: i=1; AJvYcCWe6h8jYYIz8hvDfBDE8LEa/Hnx6Yh2DgigxmWNLM+TzLz8qU5cKHFg+iNiu2Hrh8yIjFow2xY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyodPgtPrV76kTDi4Fi+gOR92TCg+R/Jqi994ebWfQUjKB6783m
	Bxyh4divi3F8eGkTBhoyl8PCXXLR8ahtW2qCEIxBVTxqCGn0peODeDLPl5Hyxz+Dx6/jYeDkjUy
	nV8OVcIp8nd0VZSGU/L1GpHWZj6KcAvZOQG4ictPY+V9+QSDH4LDEYvCkEkmb0jCqH/g=
X-Received: by 2002:a05:6000:178c:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-36823e5933bmr1404480f8f.0.1721139099049;
        Tue, 16 Jul 2024 07:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzXeJwZ/ZNaq+GxYF4/gYYba0c9mNQjn1rw0lUskXRQRo9+weQB7LDATIGB5EApqxIOvUDHg==
X-Received: by 2002:a05:6000:178c:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-36823e5933bmr1404463f8f.0.1721139098706;
        Tue, 16 Jul 2024 07:11:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1738:5210::f71? ([2a0d:3344:1738:5210::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf128sm9144812f8f.40.2024.07.16.07.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 07:11:38 -0700 (PDT)
Message-ID: <23e63003-5c85-442a-9489-68125664b479@redhat.com>
Date: Tue, 16 Jul 2024 16:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: fix build vs old compiler
To: Jeff Johnson <quic_jjohnson@quicinc.com>, netdev@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
 <a7950e7b-2275-4b6d-b8e1-4f50d0bc28e6@quicinc.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a7950e7b-2275-4b6d-b8e1-4f50d0bc28e6@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_071145_514088_0373FC99 
X-CRM114-Status: GOOD (  11.87  )
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



On 7/16/24 16:00, Jeff Johnson wrote:
> On 7/16/2024 4:06 AM, Paolo Abeni wrote:
>> gcc 11.4.1-3 warns about memcpy() with overlapping pointers:
>>
>> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
>> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
>>    114 | #define __underlying_memcpy     __builtin_memcpy
>>        |                                 ^
>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>>    637 |         __underlying_##op(p, q, __fortify_size);                        \
>>        |         ^~~~~~~~~~~~~
>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>>    682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>>        |                          ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
>>    190 |                         memcpy(pat, eth_pat, eth_pat_len);
>>        |                         ^~~~~~
>> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
>>    114 | #define __underlying_memcpy     __builtin_memcpy
>>        |                                 ^
>> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>>    637 |         __underlying_##op(p, q, __fortify_size);                        \
>>        |         ^~~~~~~~~~~~~
>> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>>    682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>>        |                          ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
>>    232 |                         memcpy(pat, eth_pat, eth_pat_len);
>>        |                         ^~~~~~
>>
>> The sum of size_t operands can overflow SIZE_MAX, triggering the
>> warning.
>> Address the issue using the suitable helper.
>>
>> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>> Only built tested. Sending directly to net to reduce the RTT, but no
>> objections to go through the WiFi tree first
>> ---
>>   drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
>> index c5cba825a84a..bead19db2c9a 100644
>> --- a/drivers/net/wireless/ath/ath12k/wow.c
>> +++ b/drivers/net/wireless/ath/ath12k/wow.c
>> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>>   	if (eth_pkt_ofs < ETH_ALEN) {
>>   		pkt_ofs = eth_pkt_ofs + a1_ofs;
>>   
>> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
>> +		if (size_add(eth_pkt_ofs, eth_pat_len) < ETH_ALEN) {
>>   			memcpy(pat, eth_pat, eth_pat_len);
>>   			memcpy(bytemask, eth_bytemask, eth_pat_len);
>>   
>> @@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>>   	} else if (eth_pkt_ofs < prot_ofs) {
>>   		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
>>   
>> -		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
>> +		if (size_add(eth_pkt_ofs, eth_pat_len) < prot_ofs) {
>>   			memcpy(pat, eth_pat, eth_pat_len);
>>   			memcpy(bytemask, eth_bytemask, eth_pat_len);
>>   
> 
> Duplicate of https://msgid.link/20240704144341.207317-1-kvalo@kernel.org ??

Indeed. Anything addressing the issue WFM.

Thanks,

Paolo


