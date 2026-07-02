Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCD7C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HVkKpzQdbeQaZnyAkJaHwqYV0JX9ZR+ROJzieyYOnE=; b=djjQWXcHdpRRAj596W8BZsZMqY
	3NyBCxMC8DrQFsHdlrNpjHICykG/2bE1+NMI737rWHasdTVnR1LTgJ0i8BphDANCeDb0+iBWJJ9VF
	QjOun3QIaHz7CjxevO3WwR/2vVPS9lNOAdFYOVOGw6Qm1qyMpNRsi66lNLtCPjU7i3ic0dXJ7Djcz
	vMfcKDtdme7wqEnmgMNaJRrSSX+Vq0YTtEmcMXuISeVQR4iDY6URsFTP/p2adllw2SRBeH2SxiESo
	3tkGaIJSLAWuazRMMgY5VwH3MayBfkRCUFjp3JIFEkrXetiDueQZtTDpEREly7sGBBb67X+xw6JUE
	WBex/wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCm3-00000003riX-02Dl;
	Thu, 02 Jul 2026 08:27:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfClx-00000003rgD-3ZSx
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 08:27:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624jHwB3594415
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 08:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HVkKpzQdbeQaZnyAkJaHwqYV0JX9ZR+ROJzieyYOnE=; b=cSKnM9B1WyHdngTC
	fjt+oN3laX3gp6i8AAUSLqfeS15h/9eP02nXyfgH89pGxW3FWBkfVXu+a0A7+loF
	aU0CSMYNYppaXOQg8Ua73+svfTsCf6j39bFsPyoMGB8qbr6gJSo1/ml9Ity4h4q5
	rooV+DkrBbnHaUXY+Fqc4LY/9WZG6AwXTDp14DkU902LHi4uAmCgXFhRwPPgleC6
	j+3nMg/GRYYx5DJYyIxGWQ5N+6RgeSMf3pMR+slNVs9kAHPwrD3zOuIF1IwnUub9
	IDn7KPEXNPUfprW7haxToUZ1CuMymnCmp3lpqxNrNQB7dQ7O0NSBLaMIP4+iRxNa
	c+Z3VA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8sca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 08:27:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so2423225a12.0
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782980869; x=1783585669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HVkKpzQdbeQaZnyAkJaHwqYV0JX9ZR+ROJzieyYOnE=;
        b=W2PcNguXSH6tTeTJTZz79Qu1ZyRs9kWe0PPv4bn65AJOl95UjVAyncYvZ2AxN1A+QB
         wRDyaIOWScSOAWYy3UUhqGObYwM+Vg4vgEcbxF/kwQvCaBgUszykjRzz7Orzh7BZl+yS
         w8AChPp1ufyM0pAJsN4WEQ9bWckI2jZlalrTGKZdAKaHIJgodTYk6AMRx6/6gsHXzGE6
         UrY+w7i7gk+s86wbKqwD/atjnn5MEFustjs+mn3hFdaFeZUQlOwMuWN26UlyizYhkz9I
         6ojW3yHWjIEtACxJ/gzfDjPagwmp1rYeD+U1WTXoNI6n4SzVLhumDzMwzwB67jR18mJM
         h0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980869; x=1783585669;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HVkKpzQdbeQaZnyAkJaHwqYV0JX9ZR+ROJzieyYOnE=;
        b=ICIDX6rHBZK6GDulcZZvr5VbChkhgyWQSGfb2nA21k3fbuyXiZ1DBDhGfceoFtBlKD
         znI4F0uwcPL8uRfSIHCrapX0BSOUobfOjRpCwWNNpI5ByIS4hUOr3f0vMMmRUPwaGQ0v
         eBg9MCk84Q+tviPs1grGTqcKKBBLVtxAXt5qa0xPbGCHydttyV/hbmy8Dbz3nfwqik0h
         GvymHehiRFCl9RXEqNvYrHkA/2i6CAFzG2uH/4e2xUs4cUhKFJjHvmNRxOct6DbgyqU+
         Hlz2puOvkv9tHnuDb7UJxmARwr6u2ANX1Uvzd2P/LbP+zghzYbV0TCkRWJJ9Lbtti+Ya
         +SrA==
X-Forwarded-Encrypted: i=1; AFNElJ9EqEueCvqhxDjo5OaZLa4JkdNDL+PFJf3mrQWSUdTdc5vvg+GtQgIJPVRaTmKC1B1Tk2VWMwo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIUJd/hhGVIGQ1XoEoz3fWMBAV3RgMlFKlxMMirTz/bWv7q7Ez
	SOTa+O1yapxv6yNYWLzY7AjGUw8Pdbas6aglMyKeNqbb0iFAk3csD/nI9mIT8iJAI5ChnLRGlvB
	vyR0bI/yAjE5rGg7nEFsCf+xCuntIToccxQ2o64YKtbEvJLYUrAz6jZWyQmyvYVdE
X-Gm-Gg: AfdE7cnB6VouQWCxSzO5PKfnhIc5jp25GchhMlebIAiXhFcagg29lHwrQCtudHG5tuQ
	xKSnwM38X0kPxbNyz/mf8kgfwcScbzuv06mhrxQ9OU8JYk7PGaJKhck4u3jeqstz6QsmDF+vuSn
	u6gXCVQUUWmYzilW23knd8r9uoT25VD7Y5zVlGMzsXojh7egMhAYofwRUxUHO0lhBX0MmN31Eti
	rRfWJ2mSHn7yrSUGBx5TZ6sa3HR63fZjWTxJHcwVkeSpaj7iXBvNBZfe7DJklCe0m01oIlB0DRX
	NJaGyeUpvkHQuhu99aaiWmF1wyMxh/FnZy3JkiG4s60ltj/w91eViiXTZZCA2hzEGtY33gtJfPB
	qvBP2KsIcZ0YXHPTF2mm0A/lyn70+lfvLIy2pOjCTX6EmUKR0VVAVmKlFaGN24uH+eAQm4x104b
	+SG0+adHJi
X-Received: by 2002:a05:6300:6713:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3bfed471c52mr6055783637.31.1782980868655;
        Thu, 02 Jul 2026 01:27:48 -0700 (PDT)
X-Received: by 2002:a05:6300:6713:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3bfed471c52mr6055757637.31.1782980868273;
        Thu, 02 Jul 2026 01:27:48 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f5c2836sm899047a12.13.2026.07.02.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:27:47 -0700 (PDT)
Message-ID: <8b29a6f4-0742-46f3-bc86-defa6e0faeae@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 16:27:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix channel list copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix-channel-list-copy-v1-1-5ab826c46d7c@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-fix-channel-list-copy-v1-1-5ab826c46d7c@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4NiBTYWx0ZWRfX6i15MC7zppFl
 /3Ebpfa4wx8EEx5jPExbsiqpBnMuZGvCkmBVF3bFqczAv9bzQErPTSVXvA5aNconO801I1iLbpo
 BdHWreh9tw0k+8pR7nmIQLQsxnGAs30gJju+dNAeLUC0WXposoVSg+CW25UrYNLzqSyIgF286zl
 UPK1bBUeR0zMI4SiNb1VohJ/T3alKwBRtpOth0VPDaeFypJNTFGZtH1Aopxo5D4LiqdAp7wG3My
 js09jjmcTTcTzvNTNx6AxJF1+fZOHhj+17tf9Ku4SJNNob2KD6HmAyO93M7lkX6bL7L0OMlz1kK
 zYrOSAHa0eNUZ0nEIUYudmgCOPmMPrLWjrFGGCNZLZ7OruBetMSQjVqe9SAxku05pNbnbHehW/1
 g3iV+xt+dZF9P8qcVtEjJ+LnN8Kvm2qC1g55iM8oategyDrmawU3d7zPN0XKhVr21gZikFIXvJS
 5YTsz6RwAGS+Bx9TVlA==
X-Proofpoint-ORIG-GUID: 7xl8NO8EvkjuIfsx8qKt7p6Nab4nMOdb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4NiBTYWx0ZWRfXzCgkw+vsd8Gb
 R/7t2O7WK/bqE7qYdc+xutGMnwAvpPzHLOjBcW88m8ObmGu09zki59XoBt+z1DaaaSiRXQbusFW
 IFiDKmCwmJCNe6up/oFMD6ZcI+epszk=
X-Proofpoint-GUID: 7xl8NO8EvkjuIfsx8qKt7p6Nab4nMOdb
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a462105 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=N9GNhs4bAAAA:8 a=ywX3x0iTvHv4trEmZJsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012749_896885_7B1192A7 
X-CRM114-Status: GOOD (  17.57  )
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



On 6/29/2026 3:46 PM, Alexander Wilhelm wrote:
> The ath12k_wmi_scan_req_arg structure defines the channel list in
> CPU-native order, while wmi_start_scan_cmd expects the values in
> little-endian format. The simple memcpy causes the hardware scan to fail on
> big-endian architectures. Set __le32* type for the tmp_ptr and swap channel
> values to support both architectures correctly.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 65a05a9520ff..9e1d3c662852 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -2571,7 +2571,8 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  	struct wmi_tlv *tlv;
>  	void *ptr;
>  	int i, ret, len;
> -	u32 *tmp_ptr, extraie_len_with_pad = 0;
> +	__le32 *tmp_ptr;
> +	u32 extraie_len_with_pad = 0;
>  	struct ath12k_wmi_hint_short_ssid_arg *s_ssid = NULL;
>  	struct ath12k_wmi_hint_bssid_arg *hint_bssid = NULL;
>  
> @@ -2656,9 +2657,10 @@ int ath12k_wmi_send_scan_start_cmd(struct ath12k *ar,
>  	tlv = ptr;
>  	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_UINT32, len);
>  	ptr += TLV_HDR_SIZE;
> -	tmp_ptr = (u32 *)ptr;
> +	tmp_ptr = (__le32 *)ptr;
>  
> -	memcpy(tmp_ptr, arg->chan_list, arg->num_chan * 4);
> +	for (i = 0; i < arg->num_chan; i++)
> +		tmp_ptr[i] = cpu_to_le32(arg->chan_list[i]);
>  
>  	ptr += len;
>  
> 

seems hint_s_ssid and hint_bssid at the last also need the endian conversion?

> ---
> base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
> change-id: 20260317-fix-channel-list-copy-cef5cad24fb6
> 
> Best regards,


