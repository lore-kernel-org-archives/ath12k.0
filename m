Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6943FAD3E0
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWiDxia8+21/EnLpUDLYxaappdjnTVX+sv5Q6Lm37J8=; b=H+36IBNAE0+BKkBiYcQmw8wC8M
	EhvITp/X4x5AV5+lfpiP7P7LycDcbaBd5weB6tJr96j6Bv4gIWG/lX6xD5C/zpJcs6GJhxCpJPXpe
	0NYRPO6KECk8bWLlxqllRWRH4ld5vmUvSxeoaKtNYVCzAcLNWokaxhzJqaYGV5Li3ysgRZ3jubSe+
	nLAJicDjVFPuEFP51gJQzu+ZoMAzzRrUaGtqsx3ok4ud3fFzj9UgsJFNvbWOoWflAwFbx7UXU1Im1
	itZ4BqA8zjTYyD4NGTOdqXcVZfCSSqONuVw9UUfRRmTmHqRAW6O5zuDvLjJdmwWSV22uxowHFD2P3
	vep4VnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFhcx-0000000ArkP-1kdI;
	Thu, 23 Apr 2026 00:09:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFhcv-0000000Arjc-04ju
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 00:09:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGqhd31218628
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 00:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWiDxia8+21/EnLpUDLYxaappdjnTVX+sv5Q6Lm37J8=; b=oAjAijl2V/B6zjKU
	JdlIPbGSC8Z/KacsqJymS3Tos/sMGQcfVIaaazhcnooh6Gbq1ajsGO9ZrCnqPSvQ
	OJlY9DpAujICd3KhexKCzxpl4GWSliQ6hnNkw7xUjwf4CZgEPFQa435CnUhiW43Z
	DwG/m32pun/9xK5yecilxH6W1xnX0QswkZ7ZIcYEG1M6TQFUc5+GRzmapFBNtBCK
	ZcgUcRRx1jmTuvBn8D7rkhN0/xS8Qorha1ZX+3SJ3Os6olxrj+TOPaFBgiICOFaN
	QTKqoCkx0vXUDUwd23Ctxwe8PMgRztMatsDkjEIxu8BmkjvoS7epcI4VfPq1bQXL
	ReWLyQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282sb3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 00:09:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc75e79b97so14725714eec.1
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776902942; x=1777507742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWiDxia8+21/EnLpUDLYxaappdjnTVX+sv5Q6Lm37J8=;
        b=Jsioa0z4arXX78tf3yL1vSivkRZmE49YqhsKe7SQPq52TRgvPtYAKgnGG3muSHx2ow
         Niv8En70VhZosJAL1tHL29xr1h1LsHlS9nAcA6VPCC7haD1M4o2FyCgKVFYXsvhE6KP6
         /9TtjebxZ/uLoiutsUG/Qn9ao1f5DJLBuJ6anT52WL9p/Yk5b1lYALyd1Khp4/ohNfr3
         ndZx3SbDPCAJAQB8vJtudYcr6uMQ5jTvfcJm7tjzhI58hmOb6o4gJMR6s4co4Ue9g3Cs
         tN1OkXEKV3wr/52zEwYOnzVvQvPQOmIhj6ESUViKPPC6GXpKuhoxCxx6HTxo9N0zzHAM
         L1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776902942; x=1777507742;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWiDxia8+21/EnLpUDLYxaappdjnTVX+sv5Q6Lm37J8=;
        b=n0K0p7aQDMkHAB1M+oXCdfiybuD2jL01Su7ushyij94yRu1ncsiWg57XJYXaVPZIwY
         hOoD7h5vwzYuc7MAOu10B0D32/ZCQyZ5x3PpOho5yAgdBp+qkE0XxBOAaLa0jeBdjhxm
         IequDwkvlczIuLZLrK1Z1s4wpsgwgxSmT4nOFo5mHb4f1qpoOPbrKw1LZQ2yCZWxajqm
         G1nFJn2CrPqiFUp5fkaMNefsZk/vNQzVrYAxN4iC/Er/7Txak0idPYRJhU3skpMFf7bw
         DdozP8HviwTAnfVMy8VnzdXoiYydo1dibD/b9j8dRPV5lK0XSCHwFCk7U12DIwNlWguE
         XWhA==
X-Forwarded-Encrypted: i=1; AFNElJ/R1/vitSXQA498Yl59kKvyyYGruMbkyQQulzQFMKSdkx+godASMHB/vKK6br0BcAl7QqRqWV0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFjFdaaycugqT5skrxxIusvBgtlgtiTrFz6jbOSubFkciYE+g
	tByaJuuz9JRunTvEyuOhYK53MMsNEkP3zpfH1IXtcsDRWxNIFp1EWuQAW9S0MhfxsEn+E1Jed3y
	UQoPuGfm/L3KL9+Y/IPnLBnWUX3QnHWnYGZPZd6NeMEjpQPZFVDMFgqbEiVzwMgLm+Dq6wDoo
X-Gm-Gg: AeBDies5/x4BQhw2FqyfNS/Zj/jJIx219dWuT6uGy9gahXxG22gqble5GrQAwOIoa4N
	52KTQVghFkS9VgyVcmrU8dk/w+yc6R1+INbJWUzh2A+hQ4AxwS/wdogYjaL5sgg1kQkJ2IGAb8O
	GuMerqbKs3UmypYTTSg/lD3WHYnuQPkptehVNAxInMmiRTO7xGyO7ckTM+2RRKvcMX9mR92H7Hg
	TxIbRJU41g0URTUuk1dqqEJ894GuW/pHAtdLu4WFZaV7C1JiybDkE2m8zI5bdTYJ5vqyUis9dZb
	j9GHRUalP/iQSIU+6zDN4No7X7xf86B+Obvbc6NyhxVh47HW0lbnB7Ta1+2v29TdbMMXSR77z4a
	APFExVQyQeJv8B1lFyOej3GEJN99iISPN1wZpjXLtcSYFC7dr0Us5ZaojQHomHnb2Y45fIP/R4+
	M4PynHsiQfw9JTiIXwcSM+2u3A
X-Received: by 2002:a05:7300:2203:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2e47951a762mr18013159eec.28.1776902941772;
        Wed, 22 Apr 2026 17:09:01 -0700 (PDT)
X-Received: by 2002:a05:7300:2203:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2e47951a762mr18013135eec.28.1776902941163;
        Wed, 22 Apr 2026 17:09:01 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c86sm30774921eec.1.2026.04.22.17.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 17:09:00 -0700 (PDT)
Message-ID: <0456ecb5-130e-481d-97d9-e88a7aaca02d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 17:08:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx()
 functions
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, stable@vger.kernel.org
References: <20260422163258.3013872-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260422163258.3013872-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDIzNyBTYWx0ZWRfX8emXHf0lybph
 qoUwvOGszjEJfT+bdGCyxvX5Tvu6EiG+/YKPTCDwve+a0cUt603fO6Z+BsKzfhgKaiPD+tb7/MT
 h3pg/UnRlH4rcWD9vDMb+3ScA4KqpXFRW3/qHqSEo/1umYDzMcYqpSveHpmE0pAFyUZICXHkGrZ
 cg/Ce22In8skdDX7DACbGOJgBPPjw1DrGqCWB87uZTL6vsFJxrzw7bZl6ONUdly3fHxpBtP9WTW
 Im7mhJZ+ZsRr8SkkzgMy4WMQoPuYBamtTnjQi9hTjvAB5oBmfLsMk/GmKZ50LyllEXNGkn8ptEt
 nO9dhf6N3qxqMQNCwhPxO/yE811OiX2UbGhA7jf+90Kk3OVw0q7/Nu8V8G7l6tkvktMLetwXvW2
 eD5uPZiEjveXXO5Zs3fQ2CArAzYs6h0dmdfh7GTrgD/kOdtmSGLpoLg6AJL4GMIrECTpMtjZijY
 V0UfjPALZhwr3z/rZcQ==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9631e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=BklQrkN0B_13ZYhzje0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: L19iOc8QJjdw15tNbVG7NTcZYCrET-IR
X-Proofpoint-ORIG-GUID: L19iOc8QJjdw15tNbVG7NTcZYCrET-IR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_170905_091973_13E4BF02 
X-CRM114-Status: GOOD (  19.64  )
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

On 4/22/2026 9:32 AM, Nicolas Escande wrote:
> Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
> without explicitly handling the error code. This leads to leaking the skb
> in case of error.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 66a9448b1b89 ("wifi: ath12k: implement hardware data filter")
> Fixes: 593174170919 ("wifi: ath12k: implement WoW enable and wakeup commands")
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Fixes: 16f474d6d49d ("wifi: ath12k: add WoW net-detect functionality")
> Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
> Fixes: aab4ae566fa1 ("wifi: ath12k: support GTK rekey offload")
> Fixes: 7af01e569529 ("wifi: ath12k: handle keepalive during WoWLAN suspend and resume")

@Stable team:

are you OK with one patch that fixes a bunch of places, or would you prefer a
separate patch per fixed commit?

/jeff

> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 103 ++++++++++++++++++++++----
>  1 file changed, 88 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 65a05a9520ff..75c87edd2a8a 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -10251,7 +10251,7 @@ int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar, struct wmi_hw_data_filter_a
>  {
>  	struct wmi_hw_data_filter_cmd *cmd;
>  	struct sk_buff *skb;
> -	int len;
> +	int ret, len;
>  
>  	len = sizeof(*cmd);
>  	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10275,7 +10275,13 @@ int ath12k_wmi_hw_data_filter_cmd(struct ath12k *ar, struct wmi_hw_data_filter_a
>  		   "wmi hw data filter enable %d filter_bitmap 0x%x\n",
>  		   arg->enable, arg->hw_filter_bitmap);
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
> @@ -10283,6 +10289,7 @@ int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
>  	struct wmi_wow_host_wakeup_cmd *cmd;
>  	struct sk_buff *skb;
>  	size_t len;
> +	int ret;
>  
>  	len = sizeof(*cmd);
>  	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10295,14 +10302,20 @@ int ath12k_wmi_wow_host_wakeup_ind(struct ath12k *ar)
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow host wakeup ind\n");
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_wow_enable(struct ath12k *ar)
>  {
>  	struct wmi_wow_enable_cmd *cmd;
>  	struct sk_buff *skb;
> -	int len;
> +	int ret, len;
>  
>  	len = sizeof(*cmd);
>  	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10317,7 +10330,13 @@ int ath12k_wmi_wow_enable(struct ath12k *ar)
>  	cmd->pause_iface_config = cpu_to_le32(WOW_IFACE_PAUSE_ENABLED);
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow enable\n");
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
> @@ -10327,6 +10346,7 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
>  	struct wmi_wow_add_del_event_cmd *cmd;
>  	struct sk_buff *skb;
>  	size_t len;
> +	int ret;
>  
>  	len = sizeof(*cmd);
>  	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10343,7 +10363,13 @@ int ath12k_wmi_wow_add_wakeup_event(struct ath12k *ar, u32 vdev_id,
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow add wakeup event %s enable %d vdev_id %d\n",
>  		   wow_wakeup_event(event), enable, vdev_id);
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
> @@ -10356,6 +10382,7 @@ int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
>  	struct sk_buff *skb;
>  	void *ptr;
>  	size_t len;
> +	int ret;
>  
>  	len = sizeof(*cmd) +
>  	      sizeof(*tlv) +			/* array struct */
> @@ -10435,7 +10462,13 @@ int ath12k_wmi_wow_add_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id,
>  	ath12k_dbg_dump(ar->ab, ATH12K_DBG_WMI, NULL, "wow bitmask: ",
>  			bitmap->bitmaskbuf, pattern_len);
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_WOW_ADD_WAKE_PATTERN_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
> @@ -10443,6 +10476,7 @@ int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
>  	struct wmi_wow_del_pattern_cmd *cmd;
>  	struct sk_buff *skb;
>  	size_t len;
> +	int ret;
>  
>  	len = sizeof(*cmd);
>  	skb = ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10459,7 +10493,13 @@ int ath12k_wmi_wow_del_pattern(struct ath12k *ar, u32 vdev_id, u32 pattern_id)
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi tlv wow del pattern vdev_id %d pattern_id %d\n",
>  		   vdev_id, pattern_id);
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_WOW_DEL_WAKE_PATTERN_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  static struct sk_buff *
> @@ -10595,6 +10635,7 @@ int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
>  			      struct wmi_pno_scan_req_arg  *pno_scan)
>  {
>  	struct sk_buff *skb;
> +	int ret;
>  
>  	if (pno_scan->enable)
>  		skb = ath12k_wmi_op_gen_config_pno_start(ar, vdev_id, pno_scan);
> @@ -10604,7 +10645,13 @@ int ath12k_wmi_wow_config_pno(struct ath12k *ar, u32 vdev_id,
>  	if (IS_ERR_OR_NULL(skb))
>  		return -ENOMEM;
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  static void ath12k_wmi_fill_ns_offload(struct ath12k *ar,
> @@ -10717,6 +10764,7 @@ int ath12k_wmi_arp_ns_offload(struct ath12k *ar,
>  	void *buf_ptr;
>  	size_t len;
>  	u8 ns_cnt, ns_ext_tuples = 0;
> +	int ret;
>  
>  	ns_cnt = offload->ipv6_count;
>  
> @@ -10752,7 +10800,13 @@ int ath12k_wmi_arp_ns_offload(struct ath12k *ar,
>  	if (ns_ext_tuples)
>  		ath12k_wmi_fill_ns_offload(ar, offload, &buf_ptr, enable, 1);
>  
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_SET_ARP_NS_OFFLOAD_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
> @@ -10762,7 +10816,7 @@ int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
>  	struct wmi_gtk_rekey_offload_cmd *cmd;
>  	struct sk_buff *skb;
>  	__le64 replay_ctr;
> -	int len;
> +	int ret, len;
>  
>  	len = sizeof(*cmd);
>  	skb =  ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10789,7 +10843,13 @@ int ath12k_wmi_gtk_rekey_offload(struct ath12k *ar,
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
>  		   arvif->vdev_id, enable);
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID offload\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
> @@ -10797,7 +10857,7 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
>  {
>  	struct wmi_gtk_rekey_offload_cmd *cmd;
>  	struct sk_buff *skb;
> -	int len;
> +	int ret, len;
>  
>  	len = sizeof(*cmd);
>  	skb =  ath12k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
> @@ -10811,7 +10871,13 @@ int ath12k_wmi_gtk_rekey_getinfo(struct ath12k *ar,
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
>  		   arvif->vdev_id);
> -	return ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
> +	ret = ath12k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID getinfo\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_sta_keepalive(struct ath12k *ar,
> @@ -10822,6 +10888,7 @@ int ath12k_wmi_sta_keepalive(struct ath12k *ar,
>  	struct wmi_sta_keepalive_cmd *cmd;
>  	struct sk_buff *skb;
>  	size_t len;
> +	int ret;
>  
>  	len = sizeof(*cmd) + sizeof(*arp);
>  	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
> @@ -10849,7 +10916,13 @@ int ath12k_wmi_sta_keepalive(struct ath12k *ar,
>  		   "wmi sta keepalive vdev %d enabled %d method %d interval %d\n",
>  		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
>  
> -	return ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
> +	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
> +	if (ret) {
> +		ath12k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +
> +	return ret;
>  }
>  
>  int ath12k_wmi_mlo_setup(struct ath12k *ar, struct wmi_mlo_setup_arg *mlo_params)


