Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD48C3DA4A
	for <ath12k@archiver.kernel.org>; Fri, 16 Aug 2024 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bktqQayWYWtMAKqssvWuw4y7zQFT4lfZb54Csz+S70=; b=SLVGKEX+AYXTa9tAh2wXHkLM95
	txwWDjjBDzxuSVOKpE41iPGlo60jzLKR7uvUSScBdumBF5JbGp49Pn3/mY4DU2WmrYOZDs2aqcwSF
	2y/HNxaWf8ENYDrd7anyWxY0c3bOV3djTrm1gzmWQGwifGQpplqxR1suKlX4Ut3l4XZ1zIBsbrijX
	yvVm4Q5gRvuYnQQzpFcetUu5vKe/kwqg5OPDq+y3kr3AVw5aUldyZmoEg3XD7Oa2sB8r6ey4zhOjl
	h2HhjanVIbT9yz7o+LegvXmE5aDRi5+33oyhsoVS5jKTYju5BuI7pVPcSXfAMHha97tJEenDg1ajL
	eVyYje/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevCe-0000000Cm7a-2MyK
	for ath12k@archiver.kernel.org;
	Fri, 16 Aug 2024 11:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevCP-0000000Cm6R-2ob1
	for ath12k@bombadil.infradead.org;
	Fri, 16 Aug 2024 11:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1bktqQayWYWtMAKqssvWuw4y7zQFT4lfZb54Csz+S70=; b=Bt7syVxU1wDak7a5gWPeUNhOPv
	BBe7own69MDU92DJgYrzjbyIM4OPpVYnYMZN2m+ABUbJlb8urasYQxB1UB9+qTZS8tbjZG9F1CD2j
	zd65a3J/qs1aG2jlnlu3NfbnZF0+CDKjmN3rVbdq7k+wDKDhM2INdz6jzvhvIYbYv+GkaMejrE2mX
	EngCM5Alg1dMWuFlpQ5v8EtDLWdVsu82d6st9sgBDr02fI/8rN77sAuAD/6/EpXl5FJLJsqjsTZ2S
	j0LcFwENm2uh2/nXb6zCWR7zF5K9FaTc5k/zyvzkr+IjA5FSLy3jcPHcHWaZtIMRSTLxlJibXBx8g
	SHIz+VWQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevCM-00000008dbq-0yIC
	for ath12k@lists.infradead.org;
	Fri, 16 Aug 2024 11:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723807959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bktqQayWYWtMAKqssvWuw4y7zQFT4lfZb54Csz+S70=;
	b=gC1oyIPOJNDuINvU6LB8EoJiG02L4PJfZK/al08Ht5+8FIQbjm77P3Ks7NyPGsDh5lmZO8
	T55NfztGCE8N7/PBKOVmfxXySQmGQGLEqAtUb1rXfmuhSdWXIn/UVaPdj8o3kGflCOKL83
	rwEjUrUxlEGr/6lT3iXjQzBx6kDR5yI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723807966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bktqQayWYWtMAKqssvWuw4y7zQFT4lfZb54Csz+S70=;
	b=HxK6WbHr50Aw0sbkw4d9VJtBij/2SQp/dU7UFUa4ss0fCX4SRreaiwvoaYfd44L8eVs98l
	b+bzdj+D9wpSB1Os7o4+xNk82JYkVRY1xStuCNxfSEFjzDv+LRm9Fy2+UAGzZ7HOoAuLSO
	xwxwLhK89ghK0AIp49L/zDyJpkiXMT8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-bPMkunF2POGjkjbUlTKDjg-1; Fri, 16 Aug 2024 07:31:04 -0400
X-MC-Unique: bPMkunF2POGjkjbUlTKDjg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3719ce5627eso122850f8f.1
        for <ath12k@lists.infradead.org>; Fri, 16 Aug 2024 04:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723807863; x=1724412663;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bktqQayWYWtMAKqssvWuw4y7zQFT4lfZb54Csz+S70=;
        b=Kx1ZyS65ZhjLnq6gf54zY3Bl0cJ5Q6FdZkaNncFCwfUXoxJYcRiE79x0tj11PZCy0S
         Gq6n3ziAZfqDOiFPPs6EMvTg1vGHQiShVdhZdY5u9jqfrNWXtmSfbdIFlyOei7xdxSbi
         0lj/qGkesGvVsHNsLWxCGmz45wrmAmSFdtcK3JmJ7+D/iqHLCyccLw+ulzXZWIse+QJ+
         36/QQ0gGXjNIYREAMXsmTNiy38ixnq7oy+1kY9vvpzB5e2/TY5iehdGDuWaOy2xizIvJ
         RDgcjGyBiC7EDdMJlAdOwiOsE93EP23RYn+eZeBM+xYdrZ2CU83rgDUX0C90jtJsylVz
         ARug==
X-Forwarded-Encrypted: i=1; AJvYcCWUxaMDaICYi3hiUdnUcGnO0ERTCC8hwKHY47dD9OAfh3qEz5tmgOFQupHaGo50NbjTKU6UFwkHxR+30bA4Pen7Uy03Ij1jxJFXeg==
X-Gm-Message-State: AOJu0Yxl8Zx6hykvwVtX4nSyWLWIyGoSHusTBlVsxEfExCIt0Qvg25J6
	ji1Pyn2tSphdR1YQ1cYj4ycA/OUAKeJl0qizoZbqv6c9YDlDv7z8/offe8z41ezu5/IId2KLiFD
	eT+e4iYi6Kag/khiDUJFLIStftdmT1/AbTyzB02IFgcKFWQDWxe9WS6iSEOo=
X-Received: by 2002:a5d:5110:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-3719469531fmr1542920f8f.41.1723807863421;
        Fri, 16 Aug 2024 04:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSxwNIUjnAJ8rcUcO6moPhGgsuq5H2/SGprZmmZkrEska1ZBtlsqGNAmMt0ivJktdwkOTeew==
X-Received: by 2002:a5d:5110:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-3719469531fmr1542903f8f.41.1723807862844;
        Fri, 16 Aug 2024 04:31:02 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7dae0sm74202835e9.44.2024.08.16.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 04:31:02 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DD75114AE084; Fri, 16 Aug 2024 13:31:01 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Johannes Berg
 <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Michael Braun <michael-dev@fami-braun.de>
Cc: Harsh Kumar Bijlani <hbijlani@qti.qualcomm.com>, Kalyan Tallapragada
 <ktallapr@qti.qualcomm.com>, Jyothi Chukkapalli
 <jchukkap@qti.qualcomm.com>, Anirban Sirkhell <anirban@qti.qualcomm.com>,
 Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH] wifi: mac80211: Fix ieee80211_convert_to_unicast() logic
In-Reply-To: <20240815-ieee80211_convert_to_unicast-v1-1-648f0c195474@quicinc.com>
References: <20240815-ieee80211_convert_to_unicast-v1-1-648f0c195474@quicinc.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 16 Aug 2024 13:31:01 +0200
Message-ID: <877ccgd7re.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_123250_490688_9C92FA89 
X-CRM114-Status: GOOD (  12.99  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> The current logic in ieee80211_convert_to_unicast() uses skb_clone()
> to obtain an skb for each individual destination of a multicast
> frame, and then updates the destination address in the cloned skb's
> data buffer before placing that skb on the provided queue.
>
> This logic is flawed since skb_clone() shares the same data buffer
> with the original and the cloned skb, and hence each time the
> destination address is updated, it overwrites the previous destination
> address in this shared buffer. As a result, due to the special handing
> of the first valid destination, all of the skbs will eventually be
> sent to that first destination.

Did you actually observe this happen in practice? ieee80211_change_da()
does an skb_ensure_writable() check on the Ethernet header before
writing it, so AFAICT it does not, in fact, overwrite the data of the
original frame.

> Fix this issue by using skb_copy() instead of skb_clone(). This will
> result in a duplicate data buffer being allocated for each
> destination, and hence each skb will be transmitted to the proper
> destination.

Cf the above, it seems this change will just lead to more needless
copying.

-Toke


