Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA16D116F1
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=WOAP+vykfgSWHIBYkgHxxFg+nZ
	qL/Jn9gFnaCjhyVUHWiskSM2I9bMA2CJKMNPfTrbilTtPzdXv63fVenMNxp2Wh+k0QZH0eFrhyxwt
	Zwy2Y/ABA2mz+RyXtN7v5q5TIl5NQ6DZSX3zbJTIw+4MFTHxmBbliHicNVdQLIOHjEur+d8thD2En
	N+m0LAWZmaDsXJU14itHxtc3I9OWvMXdmxjcOerUnKojbD8bzOn4HLWnGQEDt9ds5Rwf6EEsvJfrL
	JdnO8A9Zkx6s7Cc1UgfX4/ITFv9tgR0METMrtGjwszXS2C7R/c1BohQSOAeY0fDEQR2IyMeiTME3/
	8VR6rboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7td-00000004My8-0RpN;
	Mon, 01 Dec 2025 17:41:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7ta-00000004MxF-2sQW
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 17:41:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B632p397475
	for <ath12k@lists.infradead.org>; Mon, 1 Dec 2025 17:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=ZxyuzaXv6A26qiRW
	3ib+4vKjJnwB99Ulmz3+RRb3QOIt9IEjEBZ2SK904Gsv6nMU2UluCtxKVvgbRPW5
	aXIV0VxAUSTF9gt+hZmetm/hPC3OkeqsVaPFydPZLYXkVi6jmR1m7IIpi7WMdh31
	G1p/Mm5LYsJGCX7rhrWPgKhgo7vMYyzGcSbUtkJSFYm8z2SL/nbgk217ze6jfZvJ
	eC0pkwM6QvoPRK63MsxQXNL1M+QTG01ljbQaMRJVju5uvMdOjxXBsAqaxu4C3s4H
	/zjOeRaj09yH4rJo95lgrRbtjeRy5qN6DQvXd2C/tC2nj88agyNrKRoRmpFD/Fpd
	eNuP+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug15as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 17:41:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa148105a2so3964742b3a.1
        for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764610864; x=1765215664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=hSdPi/6osfbrHUbKzyUbK+Zj2l54EywD+XmCkti8NkWksWEcorbHBJ2zczMmNN2caE
         BV00+M7yraRE/hga2jsDw6mq1mfD1A7vJ9Thqj1kNL7fY7r0bRLgtH6VfobprhVld268
         b/08s7yK+JW5KlqwtWxgPaJtfijKPyq4nwh0avSlc9yBPWNlhWSrxlkRRiwLDjt1O70r
         lpIupROZ7i0/X6LdlcfAld1YmkEQK6J2rixswjZfqK8q6mnVBWxRkrNIoraI7z8IQqck
         nNwXBIqN4NvVUAz9KOGWbZaB0liXPKBYnn+o+0Lb7Y/MCg9KxUtzBgzkqEZRJMXLUiGl
         yHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610864; x=1765215664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=ZcOOYK6GZrWJHuPxNF6L4rFArfyvUvuGtMibxsqmkvJgWbIwJXNtpymSc8NX+CMdZC
         aGj/eHv7sJ46YrXvcqCGhLftkkjFwh2AAXAnTmUVtJctuhuPBYZ6+p6DUoNlq+uI7dxD
         GBU4mqKyDQEmsT3gYnBevMbGdLntlnTDCJj8bUSvJkU/cY8C8jmfbVRf+KGPWZincEkL
         8ccHQDF7o/T6Ivyd12YW/2CfG5XF1SwIWX1HU5YVrVqZsT2FGGJrF9afwOrpiO7e1MEg
         lSZ77CNAqTmQ55zgJcHyyHpoANcV2w0LW9zQXXkjRseXwnVeA06jmiH3qi6zKYoil7zf
         z4pA==
X-Forwarded-Encrypted: i=1; AJvYcCW7kDD1Kaf5lexwtrj6MPegfoC2mo2m5TyEk5EHZxSOVfQIgOgi5K2qL3Iwu3b1yUitRI1IMe4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBe2W+UpO+a2Rsm20PdEybisduqKf1AyVqQX9Okmlu0gEfje3q
	w840+BwzPlNMJJqGTIItKqHdgn2z5neTLVzHiOZrS7eRhVBYutDhdjZIuTCvouWk+Kixpoeo8C6
	InrX0EjSPh4Wgqa7PLswXWWofl/JLXwnK+ii3ytPCLiFI3ZsYSvAyiR7PCyBAcKwE
X-Gm-Gg: ASbGncu4J08MghPKitrCqIEN9Fl7IngX0l1vn3mMX3JLmAxtv5t1A/KwEDYoukZNUHH
	zL7YG3lk+R+0epg8xVVAtQpfftqpP8vJIQoljyCK7Xc7t52fwt+OXe9Hjlze/cV0faJhCZAN8Ff
	37dPsF9xDIdxdQoGc+FCzd+10KgPVAEXJLl5NYYSNjFUQ4eKgS1PGyFCHVIIDXv6o0qBffx+l9W
	+mmJEmgw6gUMOF+T+6SeiL6oYcfLEtnhA/1TjGIIqtlI5bRzX5Ze29DsiXbziuKl94VV11o1MvV
	Bv5+vUiGsa+0TqHbECWFXZ0ouQzBZ0dNIazF5HiZI7Ii7CpHbq3EygRUJiG7ejgdsn5r2uRvGgr
	qUBPBSrZRpaGdD/9OJgpD66qkTrImftHYTjR9lFbSTzE7uYQR3QsJ1OBT
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315561637.17.1764610863742;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuoKHcI6kog7ZiSeUimSTc1QQRfMcR0gyLQvIhQiA98rGJvDjNieYJ0dzMpSwyxYjBOD4K6Q==
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315517637.17.1764610863190;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm14245014b3a.3.2025.12.01.09.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:41:02 -0800 (PST)
Message-ID: <ce68d28f-c737-402c-9f6d-f13fec4d2e82@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:41:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Lew <quic_clew@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfXzUPANUPWwUiK
 ZV7Cxow7Nf/NxEULtIDM3ZEmU1PHliLZBk8HEDa0UkPZFGlzC3MOLVJhf3yGiv73qqf8ff9rHID
 XVhoETWONDD1Ar0kgSASxptuS+RxcDBgSxdREvhCHgoVnOFRM0OE5BxKeoJijhopRICFBUEXxLS
 V0PFjwlFGcNIvziluMUzRZ9R9nn8NJh15122+o6Eb91eBx2C0UI13IuI4YPCE2VIJ8c0ZUfYx+1
 Brj1uWSgJRQ/uSz50zSBBig9feLOhj77ELA9iRON9OcBrDBEk9SadiHjfrgsblKNy7EHAUfrIMX
 hp7VQShbiJf2qmh/wdtDCteHQR3tr01rJhYy0T7WcztcYViX/orEyfkdC3Y0w9xQMpbpDjRWlhQ
 f6Ql0UGAnViTvzFyXazwwfG9VcuslQ==
X-Proofpoint-GUID: 4LR5GjrK4-sQ4HBvJ0q1PXZsU6XZvIWk
X-Proofpoint-ORIG-GUID: 4LR5GjrK4-sQ4HBvJ0q1PXZsU6XZvIWk
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692dd330 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vwh-6NgWTdBnnHhUpCYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_094106_868470_ED92C144 
X-CRM114-Status: GOOD (  21.86  )
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

+ Chris

Do we need to consider updating client driver (net/qrtr/mhi.c) ?

Regards,
Mayank

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.
> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/mhi_net.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/skbuff.h>
>   #include <linux/u64_stats_sync.h>
>   
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	struct mhi_device *mdev = mhi_netdev->mdev;
>   	int err;
>   
> +	pm_runtime_get(&mdev->dev);
>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>   	if (unlikely(err)) {
>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	return NETDEV_TX_OK;
>   }
>   
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>   	}
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>   		netif_wake_queue(ndev);
>   }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   
>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>   
> +	pm_runtime_get_sync(&mdev->dev);
>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>   		skb = netdev_alloc_skb(ndev, size);
>   		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   		cond_resched();
>   	}
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	/* If we're still starved of rx buffers, reschedule later */
>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>   
>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>   
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>   	err = mhi_net_newlink(mhi_dev, ndev);
>   	if (err) {
>   		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>   		return err;
>   	}
>   
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>   	return 0;
>   }
>   
> 


