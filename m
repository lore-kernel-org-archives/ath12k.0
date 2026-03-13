Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95B8106FD91
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=; b=0vWgGGT5i95ZGZand7mQ6sLLv9
	7Lb63pQppSlevSRpaJOZxI9nDpSrvdd5/DkusckGtd/JljHPVCTWrVqUw+0pM4WW79Y3Fdx08mjmF
	qNE4C60Yq5KrwpE1KSkzDjr0QP/iGnT2jr1+77gvt3WoGVz5WbIj7D6B4NZOlylFPKGOKtA0WGr3K
	k6dfmBOCam8FOpsxKpanUruzHzylkDTv+uZeOUeLxs4wT2V5TjlHLhfGlwAfANyPr8todKHHI4kX/
	Bhpib40zlKKvQOK/EYHkULKsyEQn22julRE4vmlqLnbhnJwIslJzlp9NxFrINmI2Ih6oCJjAVw0NE
	B0bep5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wkx-0000000H12b-1usL;
	Fri, 13 Mar 2026 07:16:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wkt-0000000H10e-2uZw
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 07:16:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcZO3466816
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=; b=kYOta4Hp6PVm9IEo
	z0kzYQ7SouURAyJ6rUTTvPIoClsZXCgEpgm9eIegOOHN5QFlkHFjyubBt7hd7hyE
	cbOMlzo76yJn1yxqMtA+ZqwPGfS3bCV34TogNZSJ5/VCPWu5j49ux1+sRj+B651n
	QGMQiDz/iJd05KRzSFJVg/BFBYj4+WjCDwsdxWkF38g0A75m5ktyIstd2V8SbjET
	zdzuNBkA1Zws7sfX9UWbOnpwy2H1OrCtQuJG/DgGhjZ0x0G+e++0ROoTnPyA5xE8
	L1G9gTSRqrfL0RXA+uVzBkq+8GWOL5dpt1EhWOIeq/L6JCiZfHVex8W+W5phkdJb
	rpJ2HA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60mxts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 07:16:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae3f446ccfso19494975ad.2
        for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773386177; x=1773990977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=DtcyqDsr2cacgI7psiV4R4C4ALOTLx01gJ+fJNX0Ms1ClbxhEqtlSX8KFbrZYKpZvf
         CoOorLNDZglz+xQ3R8Lg98icjBgObBKAqfkw4CmRa62GbY3Jimdl7XE49l2ipPKLO1x+
         jvi1itVEWDbSJa2BWLa8k9ujiIwCy3kwhWXEk1tFU4zQKWXLwGYHBsd10b4hfKDipfJ/
         CJdOaFdoaMWTYTDQjOpMxu6N783Uw/Kf8EjZr0y5xVFb3U4LvjCQHkq7XZiukFR9ld5g
         SN63sMrGXofN1WqCWZqCxHbStGkaus0X0jd4MkHuz6+QkOl9MaqttlX89QCFI/9J4oSF
         o1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386177; x=1773990977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=A4eKGBBtfBzBFiMQ+UZzwNyBplBeh29rSzj6BwJqwwtxMCEx1LdzDRycsTlpiIR3lh
         gfkjrc2x3t0aA6/tLyDjJ3iFfoVxRL3/YpwHhJGpiszK9rHQrjWzJDsnfTOfao0qjNss
         w5NAaM5MfGUFQXUXFL992uYiWj5RtXlmxEgpY3KTvOAngRWzXRHT1ppyEknuQ3Yblblg
         7N+N8Tng8DC9elWw1VVI41bdFGm7NXoVl+Gyg/0YitxTLgGxCxVQEmOD32tpKlzcI9gH
         IY15V9v78Zxf6O+XVd5ktLRsX7nk0OjRXKAhGkT46pmwFQZxKnRY0QMI869PecatEq5p
         V0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV6hG7ay/ocvVBhSV56igCBY8X3v8de3wlCOYg0WNlqZaGnPtxrbtz2vT03cwqf7gqarpvgUO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPjSlkmVpMgXWL8Qa+Df008Rz1pc1YMVxoFr7fO8lCP1gMvXVd
	BzcRzcZ3vpB6otVP1rU5jynnNdmpEZ3DusEtsz49vtjkenCqPcDDxldp8nul4WJUmiAFBmtkRmy
	Bt/+dgCWBUeAOMZ61m6qLFkD+TwjTpUPjG74RrKu4ysaqAnCw1GgFONsBPPK8JMIy
X-Gm-Gg: ATEYQzz+ys2uYtRY2Eks86fs9wgboBEEDmV+Tzl8btWP0wL5gWaxKyB9BuNde0eUwFc
	i8UURI1Yhiwofn0UrshTAs2JjGZDBIv0/GFEVKK9GWK0TEJzoivG30MBger2olqh+LlgXPZN1XM
	AB0xQ03YhLvw+B8joXSjuh3xR/K2elQi/HO1U4zGRsP4BkXyTSJW8uLZAnjC8PRodq69J8Or68Z
	oCi9WGSTpXnHS5xVAwv9e8uaR7yRQ0c8a9UqMpAPDYERc7MyrpzHyiXWpt/LIU8YggkuhyAXMvP
	Mu26CTQ7yzsAjtWMVFWW3YuLKf/PNwgZ6aaaWVXGhPEBwcfRBZz2F8zYAFpMLsRyglQjvdBQq5n
	PL4+mT3xxO2GHrNLs1aeyD0KVW1OTiQXMQcvuwBtdQrr3DRNaaQ8F0Q==
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528775ad.37.1773386176728;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528405ad.37.1773386176268;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c733sm16610105ad.35.2026.03.13.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:16:15 -0700 (PDT)
Message-ID: <a17e4c07-1f00-4b0d-90e3-2eeb1e71a248@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:46:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
 <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ALA_7MPzL8EyRlw8BybZR_Ozj3IeaWQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfX7/N+uulOehle
 xVGXyg6hltKJAC1x5kR2OjLQe1UZJpRA9XR7hVSsd408teGfvoA5fYennE3YqWtLmXTNO7DE7UG
 9cHBHmkkifZ/9OBJ8EVM8rc49COrH2mwufvo3bXIl2e3WF2zCo3neR/mrnaM6scNLZftZNLINjY
 YEtW8Tcx43lJ3IiAJLn9iocmZLW1SCgv35uSROjx3XKrVNFlfzmzIwAnsPyGFUKI9AjT/1wh+8F
 tdtIE5j9QtBP0ixF8jPfzcaoOiayJF3y04uQSEMka5MMh5wUdYdnE4Rdiy+sAOBtL0yFsPkvi26
 rebtA9LfXHdeN69R9pML0+9PuILT7V5Z64Jx6gJfFQHKKABwaiztWqN4197j5akYgsGWtAdZ5/3
 LK1NxxjWsMZioWpV7y9GskbrQgwZJitSY6mEg5U9WGC5KxELzMKO532HOtGYHcJdpNwPbFPIEjl
 LN9uE2kCisfTFqOvbFw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b3b9c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8pif782wAAAA:8 a=EUspDBNiAAAA:8 a=BRVcir-zca08BhkZB6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ALA_7MPzL8EyRlw8BybZR_Ozj3IeaWQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1011 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_001619_851145_AC7BEB5A 
X-CRM114-Status: GOOD (  26.45  )
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



On 12/3/2025 3:07 AM, Bjorn Andersson wrote:
> On Mon, Dec 01, 2025 at 06:13:19PM +0530, Krishna Chaitanya Chundru wrote:
>> Add runtime power management support to the mhi_net driver to align with
>> the updated MHI framework, which expects runtime PM to be enabled by client
>> drivers. This ensures the controller remains active during data transfers
>> and can autosuspend when idle.
> This last sentence hints at there being an actual problem with the
> current code. Perhaps we do this because it's the right thing to do,
> perhaps we're making this change because devices are crashing and
> burning?
we are doing because its right thing to do, with current code we are not 
seeing
any issues.
> Start your commit message with making the reason for your change clear.
>
> Ask yourself https://en.wikipedia.org/wiki/Five_whys when you come up
> with your problem description.
ack.
>> The driver now uses pm_runtime_get() and pm_runtime_put() around
>> transmit, receive, and buffer refill operations. Runtime PM is initialized
>> during probe with autosuspend enabled and a 100ms delay. The device is
>> marked with pm_runtime_no_callbacks() to notify PM framework that there
>> are no callbacks for this driver.
> This looks like an AI prompt, does it add value to the commit message?
>
> It can mostly be summarized as "Implement pm_runtime in the driver". The
> only part that's not obvious is the 100ms autosuspend delay, but you
> skipped explaining why you did choose this number.
100ms taken from pci port bus driver reference, I will add the reason 
for 100ms
in next patch.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/net/mhi_net.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/skbuff.h>
>>   #include <linux/u64_stats_sync.h>
>>   
>> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	struct mhi_device *mdev = mhi_netdev->mdev;
>>   	int err;
>>   
>> +	pm_runtime_get(&mdev->dev);
> What happened to your error handling?
ack I will add error handling.

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>>   	if (unlikely(err)) {
>>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	return NETDEV_TX_OK;
>>   }
>>   
>> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>>   	}
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>>   		netif_wake_queue(ndev);
>>   }
>> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   
>>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>>   
>> +	pm_runtime_get_sync(&mdev->dev);
>>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>>   		skb = netdev_alloc_skb(ndev, size);
>>   		if (unlikely(!skb))
>> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   		cond_resched();
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	/* If we're still starved of rx buffers, reschedule later */
>>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>>   
>>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>>   
>> +	pm_runtime_no_callbacks(&mhi_dev->dev);
>> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
>> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
>> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
>> +	pm_runtime_get(&mhi_dev->dev);
>>   	err = mhi_net_newlink(mhi_dev, ndev);
>>   	if (err) {
>>   		free_netdev(ndev);
>> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   		return err;
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
>>


