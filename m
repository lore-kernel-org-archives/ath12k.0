Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BBECAC5B0
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 02:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hI59F6O8DsGa2HATkDAmotVnparsQC8EJiXTJi4YNk=; b=4T/TufwGM7b28j06yup8c0GLJ4
	SXDs+gp8VkqV1PesqQMY0+gIZgexu/b4DBPtKRn7ypg023LS63el+CeAx3L9mjvJ6xKHXh+t3UZST
	0oQ29g9SNN67C+sa/EPzuFdEb42EOwZpeyXvRbRi53C0s8HtxEpnfKyIRTDFnmQtbCaTSMm2jdUv0
	2eRW2rS0eLFQxLXXH9fr/KBgpjeWaE53j2pmFflL8f9mRCrrp3uywHfLXgjRbUom7ebOBAm4Of9rL
	bRnOFmqoR7FS6ActPhli/99YGcLEmnPG/fCiSYYJPVQyL0kzGnW1f/uTPqtjO9E6m1PMGTJjSmNAK
	EzFifxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q9q-00000003urL-2s4J;
	Tue, 30 Sep 2025 02:32:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q9n-00000003uqv-23YO
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 02:32:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI8rMJ016746
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 02:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hI59F6O8DsGa2HATkDAmotVnparsQC8EJiXTJi4YNk=; b=XpF3QcOCc5olkOVe
	LxbwOGoFXWyOCb1iNjJnvLREV/XHOuzaMLZVdPio3lZPfI6pfgcjt6/XtJMFOgpu
	bv8/9HRPFgNSgJ3aTM390fnuCZRT+UAak5cD1z8kzidQafs0DgZvs3v3aSQlHuWi
	nXnJT5E1umrgPOeilt8+Tk8QV6fuyZtgDpQphiWNAlb/HveByhqnqiBOQhQ7BlQP
	md5PIYKeHTrStpVWWi4ta2wsBOsBDszYD6nz1nChR3fNN0S3Rvy5tiK9a5XYZ+DX
	WT/ars22KLyCZ4EdrGCp2hos2nhah9tuNzpxP8vjqVmzuxBw8K2ePdGvys4KpxC2
	nIZhUw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcqmpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 02:31:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78117b8e49fso6081252b3a.3
        for <ath12k@lists.infradead.org>; Mon, 29 Sep 2025 19:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759199518; x=1759804318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hI59F6O8DsGa2HATkDAmotVnparsQC8EJiXTJi4YNk=;
        b=Uz2FXbrMt/Uj+4oEKGXWzESxLFLe5o1lpcthJiO7jYPxgiJhYZP/SmSzGroQrhx7WB
         qVJOUfneKAQqzrxcCk+GAx01JkLMj9EhdkuPQH4yWbeKdcimMmBoRhUOCvblVT8iwM6F
         ke37JjS3sXPnMCMmWp/S6/3Yh7NXfxbXCKLBCnUuSpeWIy1l2Tfn5bDRuduO1dMmRR1i
         YeS8Lweax0z3kkkw/FwL9infMFTUtgtQ4pRpehuPqK06g4/uX3OQYaA2hifzuyXrg6BP
         1KVSh0jrvT2DhUyczGEqHAZRZjo1Z5Yz64tVflUyRQuO+Kgei2tOKUTtYKurMWMGLHKi
         Kgzg==
X-Forwarded-Encrypted: i=1; AJvYcCU6aegvMHbA8kCcvzJ5sJ3OaoBOuZmU8QMAjW2vSFuWht9dWwSz+wykCc2eemsDsWDQrNIPp5o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrMGgejmW4L7skjbOafLQ/edpPnWdsTCMJljBWebQjSBO5U4dq
	GV3S3WHjlK80+Uvrc0R0KrBNFwYI4r+K/EnaTA1Wvbw02FasTU+2L5Q973uVSxwUfjY1V/0ZRis
	BT3J3ss1uAuUoro9WIfhYkutxNePg52Ds6GegdlikS6jCswuG0HP+E35oFGNbRBq8
X-Gm-Gg: ASbGncsFBgvsUaKSkLyl1uh5t6Jeqogl7xhHS91dGoOLOnQe2jD9Xf2FpyCv6TUUBQ2
	ndA2d2dn8CjqNSTrYNpOBIcUx8U7/IS/w6ThEWQNDsu3c/I/ms63VoshZkykA+yA/a7qyiHcvP+
	6HioWHeAwnTfSZAqqv3nPjH1Kg3sCSftRRnbPMb5H1rhPznAxOTQdKyu2gK1Zc6BezTODY2zXYR
	80uxUJJ0HpFKm7+efyQS6HNUUeJMpXRP0gQ+D2sv0EJ/7nMPb0oJJRKRAZp2lpb62YvhJdgp1wY
	UFh3ZdVHH6umR+2zhc7LqbIEDBOaHG2XY9R81sFqLQ8zg3KrzOXppWPeWK85yM/nd732RBc7lKB
	Tn81VvbhsxgAL/FYpAO3qTGiZoMrIGqTP0o6TclyXUMw=
X-Received: by 2002:a05:6a00:3c8e:b0:784:7275:837f with SMTP id d2e1a72fcca58-7847275a26fmr7405572b3a.26.1759199518030;
        Mon, 29 Sep 2025 19:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy+JqzBMESvQnVvyLIHJ3n/kdGu6h6H8SwNoYEVl1Yx4rIXVWHKdA2haUzkOZiqzGJ1p1+Ww==
X-Received: by 2002:a05:6a00:3c8e:b0:784:7275:837f with SMTP id d2e1a72fcca58-7847275a26fmr7405542b3a.26.1759199517557;
        Mon, 29 Sep 2025 19:31:57 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-782e36c803fsm5812092b3a.38.2025.09.29.19.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 19:31:57 -0700 (PDT)
Message-ID: <1b2b3e9d-2907-4902-93bd-c7d9aeeda841@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:31:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: free skb during idr cleanup
 callback
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
References: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68db411f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=iNz9HNjNQJPbPCLPB_cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yAg7DW0hTwf7Vx2nONUrTcYE6hcy7jup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX7fZxynapaV8V
 F9vM+NNFp543ZusNlErQzlZek/W0oy/+K571xpRUQYs0emguNlrvtt2A6wXMJHdy+ftrmNZHTV8
 2nQfuzoLKgc4Q0XrRe2PdR838ccVWUcUaG4l5JSFoZF2Q206NWzTEUnIpTqp0KjJ0BuA60WVbTX
 +i8IdydRY0HN39HE5nLiHAzlBu91TKDxhBg4GTkkvIztk7Zmyz4QguxtckyXzOyvbGI0DvDpifo
 9ayLvHDTyBICTTXKwWPZodvGipuyC/OrSHH7cgGwtLKlgr1LPc+5z+fDArUs181CyMRvZzTC5ZW
 o+hax6NhXGflXydc1fHc/i4sIXfJt8QSiFiOuOFSzgeoKLlM3aVJEdjEXZ1l694jWUhIWHcBusF
 k9GTtweyMPeRr3vvhCCXCKqW8MzoLQ==
X-Proofpoint-GUID: yAg7DW0hTwf7Vx2nONUrTcYE6hcy7jup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_193159_547461_E8C24AF2 
X-CRM114-Status: GOOD (  21.80  )
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



On 9/24/2025 6:03 AM, Muna Sinada wrote:
> From: Karthik M <quic_karm@quicinc.com>
> 
> ath12k just like ath11k [1] did not handle skb cleanup during idr
> cleanup callback. Both ath12k_mac_vif_txmgmt_idr_remove() and
> ath12k_mac_tx_mgmt_pending_free() performed idr cleanup and DMA
> unmapping for skb but only ath12k_mac_tx_mgmt_pending_free() freed
> skb. As a result, during vdev deletion a memory leak occurs.
> 
> Refactor all clean up steps into a new function. New function
> ath12k_mac_tx_mgmt_free() creates a centralized area where idr
> cleanup, DMA unmapping for skb and freeing skb is performed. Utilize
> skb pointer given by idr_remove(), instead of passed as a function
> argument because IDR will be protected by locking. This will prevent
> concurrent modification of the same IDR.
> 
> Now ath12k_mac_tx_mgmt_pending_free() and
> ath12k_mac_vif_txmgmt_idr_remove() call ath12k_mac_tx_mgmt_free().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Link: https://lore.kernel.org/r/1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com > # [1]
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 34 ++++++++++++++-------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 1d7b60aa5cb0..eacab798630a 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8290,23 +8290,32 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>  		wake_up(&ar->txmgmt_empty_waitq);
>  }
>  
> -int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
> +static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
>  {
> -	struct sk_buff *msdu = skb;
> +	struct sk_buff *msdu;
>  	struct ieee80211_tx_info *info;
> -	struct ath12k *ar = ctx;
> -	struct ath12k_base *ab = ar->ab;
>  
>  	spin_lock_bh(&ar->txmgmt_idr_lock);
> -	idr_remove(&ar->txmgmt_idr, buf_id);
> +	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
>  	spin_unlock_bh(&ar->txmgmt_idr_lock);
> -	dma_unmap_single(ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
> +
> +	if (!msdu)
> +		return;
> +
> +	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
>  			 DMA_TO_DEVICE);
>  
>  	info = IEEE80211_SKB_CB(msdu);
>  	memset(&info->status, 0, sizeof(info->status));
>  
> -	ath12k_mgmt_over_wmi_tx_drop(ar, skb);
> +	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
> +}
> +
> +int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
> +{
> +	struct ath12k *ar = ctx;
> +
> +	ath12k_mac_tx_mgmt_free(ar, buf_id);
>  
>  	return 0;
>  }
> @@ -8315,17 +8324,10 @@ static int ath12k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
>  {
>  	struct ieee80211_vif *vif = ctx;
>  	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
> -	struct sk_buff *msdu = skb;
>  	struct ath12k *ar = skb_cb->ar;
> -	struct ath12k_base *ab = ar->ab;
>  
> -	if (skb_cb->vif == vif) {
> -		spin_lock_bh(&ar->txmgmt_idr_lock);
> -		idr_remove(&ar->txmgmt_idr, buf_id);
> -		spin_unlock_bh(&ar->txmgmt_idr_lock);
> -		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
> -				 DMA_TO_DEVICE);
> -	}
> +	if (skb_cb->vif == vif)
> +		ath12k_mac_tx_mgmt_free(ar, buf_id);
>  
>  	return 0;
>  }
> 
> base-commit: 32be3ca4cf78b309dfe7ba52fe2d7cc3c23c5634


