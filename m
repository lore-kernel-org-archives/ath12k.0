Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D3C98328
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 05:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=; b=0Uqr3TouCoobF/hDr+K8hbHfdA
	4biCawzy7CgBuw7Pf7gcv4L1Xjv6fkdSD1GAKnwmCrDnrBOIwzmSaNNasvxkmnvs9FszJkz4E8zcr
	WEL+yKVQP+eDRQvNibWoxm1njDLlzlvaFHeupPOis0Qfv/QN31QhEkU524c9jcuw3OK080T20jN5h
	1VBdvjIJ1EN+dDKkBrLXc/umwa+6iN4RW7BOuBy0qIEQT2UkKwFbspzIVYlycIFs46obsq42n+ljw
	lTzgCdx2W5HONtsSFFZiIrH8mjjTRsMozVHohvLYjim4Wi5ZsvikuDSEBAZffaqpf3K05u1Ve6Xeu
	Qn7bO1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Fb-0000000HOT7-0sRp;
	Mon, 28 Sep 2026 05:50:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4FY-0000000HOSh-31l7
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 05:50:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5Ox8Y673909
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 05:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=; b=FbnMUt3ycDfdq3q9
	9ofioAT2dYyptlav+P7LhQ/qoXIGdVgq4LhtEi6hF370NEvIhDT0vdCwSQ8nSF3r
	2NNp26XPFUgw7Z9FnOCpjy13eC5HVsM2kO1KmcFyrniVM2YoK11mypVCfQhlBN2u
	dWOxKUe7DijOn9g02ZaD3D6xrcsNZZojBmB0RMEsgLarKOORs35uloCuec7UPW/T
	W0jdrYrVakHDp5KhgbSge83XOWl+DUJmWDUDqzS2LTEfljqc+QLczaRPGdhh+PUS
	T+fUhat3F3C0IVtFsG5fUQCl4VNxQD4biLgEHAnRHVD23OBNdbXuNzXDXqXPo4xg
	QQnYJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s02bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 05:50:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4800083eec.0
        for <ath12k@lists.infradead.org>; Sun, 27 Sep 2026 22:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574601; x=1791179401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=;
        b=kgwi63EoMu2N0LbYJqFFu+LKWAcNgOOlHcr+VZ+W87QxWj86POQzbEfZ+xO8Wka1N8
         BMYwcy9Bo4GvmT+fSlPhb5pRKQP9dyNfASZSX5q2WJhbJpcGyzFXqkyq7axp60/XV9ka
         ktzV3EORPy/TbqEAvai5jjoqUpw08d6obYGK+k/j13WToLR3szsvVeIdHPEMt30D82oT
         FSYgjYLkIFQPkyP0u+NPvlFyaXV+UIbkVsgKCo7K1Svn3cnd9P8yt2v2u3ndD9WwTpPZ
         KEOrM7As83tcBsHCtPe2eoTauA5XFBrCUqk4/h10zYU/TcLlp4uEDbAfBR9h4rzJS7lA
         coIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574601; x=1791179401;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJNlotP/6/HHnZicU2LMqHCQHPmviWTeBFEUH89dLfA=;
        b=fgJ3kEDwqKhCEBiYptBrMsb14e1Yjl8xzMoq1vMlmpkhG/J+WYQq+/HJsaBpAb4r5F
         qWbOpfn6fVFu+jY56FV5gNqFeUmh9hXawKAj+sf/S+gVJS6683IlVrAOULysKoldHmqv
         GmSbYvznLNc2PNFgFgytiszqIh46wALZOYc7DDw0oPAab+QTMttc3H2XExeuh0YjfulJ
         I+o0nCECwQ5LI35voaWDb1aZklk26OXhwnmEkUbrqqn7OtqXyZQEr77fJnHaW+o2wkcb
         l821BVDWGROBoGb+9FfebLGUPO5USQYmb4XdqTOJP0Nwatak0SzF/cBmdEtkYsOSF7uS
         y/iw==
X-Forwarded-Encrypted: i=1; AKwUvBxZEysIz6qf1QzjklcDxsqhXdeCTulGOdSKWa4wjYJnAlsqDaN0qbZcM/Hkqxmt6jicqrqyK90=@lists.infradead.org
X-Gm-Message-State: AFq9FYLtg/BpnDbhgoT/m1ATpvrfOwprVtqUZnhMgl9PpOW3k5TAZ/gT
	08H/bLFF1dUgHpYOpySvVS+3vPXQ5gnxqew/0GLeqQOHliygnaIrMQECFzJjoDWcHf0n0H/SBmp
	7/Wyr58MH21E1z3YrEBO6+zW0Xx1xe6eYLSXhHGJwo1A2cd1BnQI/ZFyHJdaWPLtw
X-Gm-Gg: AYBFou1bj0T9PO+pb7Ft14LspysG+MUGHSr0CQopTwEoFXzzMKKLvgjKPrlH4ReXmaA
	RXG/mJlEDVMRV8oiptmdRc5f9CzSz4zSEgQzAREZ/ucT+EID/dxvfll5A5Kw/B7b7EYIDKXCVMG
	RCeO3MphsJzhfGT3zeK8J3/KMb2gfLZu0I/xtSNKvHXjiLvb4/QIkeZNClB79eDkdBNZwKt6eGn
	gTV047TxC4dmI1F/JT8U79RqraIezgmxI9qGWlE54JldCgs04c1HDUXWdtAxN7zs+8LjVy0MnKF
	81CdF6d9xVqFbAyLtj9AS2223kGE+vlz+KzaEF0pSBF/XzULqW3LmBkIkKs2HIw9XTWbkzkRuzm
	7vTzF/2xAZGRVbTaGBr44MnpWrxp87db6+M41iQgz
X-Received: by 2002:a05:7301:678b:b0:33a:f8c8:1d47 with SMTP id 5a478bee46e88-3427236f831mr9001082eec.28.1790574601437;
        Sun, 27 Sep 2026 22:50:01 -0700 (PDT)
X-Received: by 2002:a05:7301:678b:b0:33a:f8c8:1d47 with SMTP id 5a478bee46e88-3427236f831mr9001051eec.28.1790574600831;
        Sun, 27 Sep 2026 22:50:00 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm27014719eec.1.2026.09.27.22.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 22:50:00 -0700 (PDT)
Message-ID: <773e57da-a9d3-41dc-805c-cb38b38b1dc4@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:19:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: avoid IDR mutation during pending mgmt
 TX cleanup
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926154824.75224-1-yaojiale02@163.com>
 <20260926154824.75224-5-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926154824.75224-5-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX3iQfZnzm3QST
 F17yguwacb73x3ZVkvwqqjGbhO1l8RXYHblFr7lCS42L8qn+r3dZrqHHk8tWjUz4ad4cYI6icXQ
 qar6kR8Z9QHT7MQXuG/A88kQv4k33ynSA9BuUb2nn3hNCwXhFfUyz/RE+IxHx5npmD3Vi1bEGaE
 YfZgxH9f3BRifjZ8ZAaesUrbxhRPRaY27YKlpsKHUwPfaoSbFkRET86hGc8dp3V6U/kOlUi2p8O
 vSPlb9WjCoPT46UMsA1RkQybKBA1EL2C1kh8hGa13dxAEFwy5wzec58zE1wbIKYGRMot2rMSXPX
 zFBIvpcQlUp0k4iVEc1xW0LrW3eKbsgJwcaC5GRLQn/rDhM2QptUZgayKIkOcBzG0/dQivvRrLk
 KuY5ZccKy9crFSn1mHwAmyn5qccguJAN+FTehL7xKCnWYkGwFUw6ch//irtl38VW4QMjxG4GB5b
 sTZPR+sg/qUrjwTZUWQ==
X-Proofpoint-ORIG-GUID: B7UiRvx4SatwjSacuLXxUPL2E-6xqLHC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfXza0o3Z/ds01B
 c6G5X7yF0OUU5MQmj3GF1Yp6YAd9k3E/TEx5s02+384eVWTWJhdLdOfS6O2+55PHIGIaaPStF9U
 umvYCc+y5EPMUSQuTc9ot0MCtzfR9/A=
X-Proofpoint-GUID: B7UiRvx4SatwjSacuLXxUPL2E-6xqLHC
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba000a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=X_UHSqtvQJ_SCcS1l9EA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_225004_768919_7DFDE174 
X-CRM114-Status: GOOD (  19.85  )
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

On 9/26/2026 9:18 PM, Jiale Yao wrote:
> ath12k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
> callback and removes the current entry from txmgmt_idr. This can
> invalidate the radix-tree iterator retained by idr_for_each().
> 
> Both callers destroy the IDR immediately after the walk, so removing
> each entry in the callback is unnecessary. Split skb release from IDR
> removal and let the callback release the supplied skb without updating
> the IDR. The following idr_destroy() tears down the IDR itself.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 99bf5cf79d10..7695b21149d1 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -9166,18 +9166,11 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>   		wake_up(&ar->txmgmt_empty_waitq);
>   }
>   
> -static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
> +static void ath12k_mac_tx_mgmt_free_skb(struct ath12k *ar,
> +					struct sk_buff *msdu)
>   {
> -	struct sk_buff *msdu;
>   	struct ieee80211_tx_info *info;
>   
> -	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> -	spin_unlock_bh(&ar->txmgmt_idr_lock);
> -
> -	if (!msdu)
> -		return;
> -
>   	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
>   			 DMA_TO_DEVICE);
>   
> @@ -9187,11 +9180,23 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>   	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
>   }
>   
> +static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
> +{
> +	struct sk_buff *msdu;
> +
> +	spin_lock_bh(&ar->txmgmt_idr_lock);
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
> +	spin_unlock_bh(&ar->txmgmt_idr_lock);
> +
> +	if (msdu)
> +		ath12k_mac_tx_mgmt_free_skb(ar, msdu);
> +}
> +
>   int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
>   {
>   	struct ath12k *ar = ctx;
>   
> -	ath12k_mac_tx_mgmt_free(ar, buf_id);
> +	ath12k_mac_tx_mgmt_free_skb(ar, skb);

this now keeps the freed skbs in the idr for the whole time 
idr_for_each() runs as opposed to previous implementation which removed 
the idr entry as well which looked safe.


>   
>   	return 0;
>   }


-- 
Ramesh

