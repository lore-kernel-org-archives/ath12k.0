Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE5CD5BB1
	for <ath12k@archiver.kernel.org>; Tue, 26 May 2026 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=; b=3c4p/aET89NDXReZCze9J2HByb
	2A18xJSw99A7bBLsmq9LAvmBpnVbRLeSUhwUsaKkukkgh4hpjSwmRjreifOhAvBdLz/KKreGbX2uu
	m5IyQGNBlyBWkZeYweCM+asFRkshO00axo6Uso07rcwCPvqpMEIsYfjhya3glrUTeexhcA8WqW3Ii
	kc79k45l2lVFl6LRoCemw7nFn+loF5RAllq0tV3Uwh7pbf+SiQRgfG2Bl7TdffHUrwyJVqhxruZPq
	DfXSphBEcctyp1pQF90hCCRMKMGlGRfGfwc9CJEy/1Fp9h1NWPA/7vLnpPQrdjzrUIGgFXokygSAT
	svRSLxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq3k-00000001oIQ-2zbq;
	Tue, 26 May 2026 11:34:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq3h-00000001oH7-2Px8
	for ath12k@lists.infradead.org;
	Tue, 26 May 2026 11:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779795292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
	b=DdKpm/UezA3KpMPxgHlp1Sn9g6Plmp6vyALmeK7Ri6QRFhbU6voF0bN43I6wZnMVl7Ao7l
	ZpWSCSzFCljR+2N6Y82uwT3cy92SxTEqAS3yrwGihdb10KjsdLlM4TOMJxraQSYviRiAX7
	1ENHpaEmYJD2guIP3GbZo1J4JdEbI0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-kBSRP2GOOh-ueDPZme5vsw-1; Tue, 26 May 2026 07:34:51 -0400
X-MC-Unique: kBSRP2GOOh-ueDPZme5vsw-1
X-Mimecast-MFC-AGG-ID: kBSRP2GOOh-ueDPZme5vsw_1779795290
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490479c2911so44523005e9.2
        for <ath12k@lists.infradead.org>; Tue, 26 May 2026 04:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795290; x=1780400090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VD+dmiG81dGo1mjueRmNr772xEYjIurIakGJoB8fU4s=;
        b=sdrJxt6BILLWRv2NsPxPSM+X70vSex8hPgbi8O8icXV+SFaYnIjTSm0LZwbTwmWoVX
         modkz9cSl/ahpK8ED1FotID6JKqTNvAwmglXLNvcZFq04Y5eumLMgbzhkXjPPzAsetUG
         IxNImtoZd6RU/N4ofqrQHhQRGdBQgkhQ0EF7rMS0hlZNkQ1P7+XwZSExHY9Gr1UCpkuH
         ra7WC2bTIuhbYOaD/dBww1B+kvtx1pd7Gx8Fm7apQ+/PVPKZ4FUT7vUFTCeZAn4PLvYl
         7GCu820imb3fjmU+JUrJBZ/d5/m6BjFboGTR406iP1sheVZCMJCOAvDFV3urtMz8B89S
         YpeA==
X-Forwarded-Encrypted: i=1; AFNElJ815lPsBqjEaV5O0YXHrHj83im5il7uRNMBHHxxkPd82XPagVblcCIkaPuJB0VXXHp5RvXmefA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+M6gN6dQFhMjQhbRlLOicLE1u3WLpV6T2pPtiyDNg/nIyX24a
	WNUNTq0WO94j849zACoIWoime3/kCfCspbm/bEnRUYBnHB+5dsePuOFwNqkjuuC0EtKTdVace2o
	p5G0zeZN1j2AShayF+U9TExqjVr9bbemlF3iNlRWyxwQkj0tAxtAyunw7VH5DLVY=
X-Gm-Gg: Acq92OFCu31lWtxekC2Q0fj5lg9gmbGOjk9YXeN5tW4X6CbFfHQvFRWrMWr9W1MPylH
	FyGSGNSPGfnfWrfOj0TmkX9LI7P3rViJY3q+zt0XCuhuX/Yuyi979tvFOgi/lIPUqSyJvgVOcnZ
	oQ5biIi/yp+Sn9Gw0Fik22eNeJHjRJTRy/4/7PnSap5CA0lOsBA7GB3MqUKVvTOdueU6t56wNiP
	jS/tNwICcwEb1FhHbHUO4l7hrsGWsAunl895MIB+stpvG9FjW3o16PCyTsV8l4LygaMC5K/FB++
	syHEmuJnnQdVox5DRNd7QyKfVqN0LV0X02Lq2j4Gi0tfq3V8y8JXyfEx0z8yOJRvT9YE3N9jq9B
	OBPDfC2BaVgtdCZvQM9+ftfob4gzn2DUkpR/2k8yUErITwBVWBvLYE0HnuQ==
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275107555e9.11.1779795289594;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-490424b3c7fmr275106815e9.11.1779795289064;
        Tue, 26 May 2026 04:34:49 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm565711385e9.1.2026.05.26.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:34:48 -0700 (PDT)
Message-ID: <5a54d307-0b8c-468d-9183-6433f9daba56@redhat.com>
Date: Tue, 26 May 2026 13:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
 <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PCuunf8wk9ejgVhrxpkfM1q2RN3V_FjO35xD2T1vfcg_1779795290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043453_699646_5CA9F34B 
X-CRM114-Status: GOOD (  20.50  )
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

On 5/22/26 10:09 PM, Loic Poulain wrote:
> On Fri, May 22, 2026 at 12:01 PM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>>
>> The mhi_net driver does not coordinate with runtime PM, which allows the
>> underlying MHI controller to be runtime-suspended while transmit, receive,
>> or RX buffer refill operations are in progress. This can lead to stalled
>> transfers or failed queueing once runtime PM is enabled in the MHI core.
>>
>> Add runtime PM reference counting to the mhi_net data path to keep the
>> controller active for the duration of TX, RX, and buffer management
>> operations. Enable runtime PM during probe and take/release references
>> explicitly around these critical paths.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8..5d7f9ccdb17b 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/skbuff.h>
>>  #include <linux/u64_stats_sync.h>
>>
>> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>         struct mhi_device *mdev = mhi_netdev->mdev;
>>         int err;
>>
>> +       err = pm_runtime_get(&mdev->dev);
>> +       if (err < 0 && err != -EINPROGRESS) {
>> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
>> +               pm_runtime_put_noidle(&mdev->dev);
>> +               goto exit_drop;
>> +       }
>> +
> 
> I am wondering what the value is in pushing this PM responsibility to
> each individual MHI client driver and requiring every MHI operation to
> be bracketed with runtime PM handling.
> 
> What does the client driver know here that the MHI core itself cannot
> handle centrally? It feels like ensuring the controller is
> runtime-active during transfer could be handled generically in the
> framework instead of duplicating the same logic in every client.

Indeed if *feel* like the MHI core should be able to put together all
the status needed to correctly track the PM.

Adding PM tracking to the NIC driver network data-path looks quite bad.

/P


