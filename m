Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE977FF60C6
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 05:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV4etoVuPtlENfSDF3QJ/+hh0lBOV/pehR1DxChF+u8=; b=tS/uWtUO4lKe3W4PD7e7YQMRaC
	fll7KTDKIYN6fHA9O4LINF2Mjdz7Z4O9Wlcd7DAEB02VYr5dvl4C8PNZL3I0tIkmevzoQylbJEDap
	wZSZc9UiBmxTtIkNmBuxV3Dd1yf7QhR1Al73dI5l8qU9GiG5Hj2wcfENTHiSdBtE9rX+SJQuUwG1d
	QzyrhK7XITGB3oFdvG6TaDZt215r89viaL5UqyUEyx+QKyRhdD+21qpspnXAO3mENCLee5XiFvWr2
	PZsiRRXVxLdE8ZeuXrv5jZ/G1j8eiBfp90vuHXiXKi4kj0NTLRSuPhP6sJUX7ZjewCcLOaGp7QJHC
	uq+gXaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RGX-0000000CIJN-2uLj;
	Tue, 31 Mar 2026 05:03:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RGV-0000000CIJ2-1qyK
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 05:03:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMSIV43722183
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 05:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV4etoVuPtlENfSDF3QJ/+hh0lBOV/pehR1DxChF+u8=; b=SzhXr5qTskaOKvIy
	l33bvaz8dGh3STN2x/turlbIOS6CcVBS3DMhv37Pq27eWsFm9KAJ0OFko2BCQHX8
	cihT/MoN8C3kR/MaSoc6NJyBYsU3pTyQVyaz5C3FR+XqWKIfJAg55Bi2+zFyZJVQ
	QH1gTcQfyvnczE9SAeKG1g4zrNFghRSMHqwBRMX/svV99iKKRdAh+r89Ztc9daki
	65XNLUPCtGWbuSwYcvGyHK06yPCKXltOZbhE5GCcOMd6vOTfXBfuvbGZYI6Hlri+
	X0Th6j/1fyPr+cGc7/Ybacq905FLbuTT5dfQZCsz2ErvJq0GN1hxqDd3CrkuEowB
	gqM95g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmuuk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 05:03:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0b0aae381so69421475ad.2
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774933425; x=1775538225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV4etoVuPtlENfSDF3QJ/+hh0lBOV/pehR1DxChF+u8=;
        b=dtah2CcAXyXIdzwlc39f2Aw4VfKK5ohoA55/KULeuNMYaf+2v+8PndDJ2q+ZTEdYTw
         OQUKJDUmOVPcs3Nb3n711d+442Gr7uVgFf0cGk/U9E0S2Dnc4DxdVDFPdmNgusNOww+N
         zFbYnOA20DeWqxDGDcFATVzcjkIX7J0OntDX/KO5I5w2JxmCB0AS3Ijv74EafWULwXJD
         izbA7+z5lfC8CKd4cxCiU7jUPiUNq6ah+TluwTVOadGkqsvUN4jAqOYcbpQjUqAwAj7Y
         /c4+tb9wr1witIjwcDLhJzl8zK9qgIUIsPcZJRHJ9U0RRdf/MyyYqO16iSwJUirq/Wow
         NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933425; x=1775538225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV4etoVuPtlENfSDF3QJ/+hh0lBOV/pehR1DxChF+u8=;
        b=EirLw5Cw4lyYLpGflKCqxxbYaHHH8eBwE7YF4qQuczkbVJUrI2pb9RPgOFx/YwUyU3
         CSLSU9REoGpS3AkkUN9pkvTXsLyYwGq65u7ZfrMZi8y/GdVQZVQ1wCAvLcOpOn7JW+1W
         B/N5kb/AcLKcUN/vG7iBo9EIwcrkx9ZahwtIEXx7yLGHcadFZRRNr8WtB0TDO0P+lSB3
         JX4zkAm3cDGMLSsRUeUMvodqeOBng1h4CmwyiOUKAoPyBDoXmlhNl7ZoFxncRrIKwoJu
         XjyqXf/O1dvK95oV958jyfcx/sMnJxcFIebYowZqK93bwJi3fcQcoQchcqB5Lh+Y3I6r
         yO2g==
X-Forwarded-Encrypted: i=1; AJvYcCVXa3RmxAsOl+FLRCN8yx/K+KxdI+mKkp5ETGHBDc3SgyT1lTTF6J8e+uXVYZG8XifzpCYv3PM=@lists.infradead.org
X-Gm-Message-State: AOJu0YytB1o1TrUWTtNcInCO4ekT+RriSaXS2iukkucFYGgp4jE7CKtu
	IT+7lAS0+MlvHYxnT93FJ3y5zwZIjkcLiDjWS5G0CPsF1Mc4/X5mSQMPVSi0b4ThP6UfWwATC6W
	2JJ0yH/a3J3xtj0ogUse0Aq0C48aq6IFv5GL/cIn+1edhL+l7MzjIAM4cHuSnkHuQ
X-Gm-Gg: ATEYQzwWGzvB9MiCcAMpXuCUbX6SprgkkuxnyLhye0Enx7SOz6xzxxXmQGUjQlvvDH8
	F5pZL0KlgD3RjolSfvHCKFswKHEeEcIPKEMsKl+PLi+nNCA/52jh8/Di71qpPOuuScED3irYYt2
	N0IJHV+UALBPEHva1scVIkx4IOZbSfywUB+XW9/06OTVa+yPET2qsHOoIe0N9NJkpY56izft1iC
	Lwileey+GlFGlVTMH83swfgN07INYz9wHwnzbG1e2pAB31fwAwbjwfL6j5C23CHtLDWyKpzm0oX
	+be4kd1pmX8O0YuRtqLYWzuO0TK0LeTEVYU1r7WvJ3SpLA34dFvspvPV6blz2aaOiq8I22+X9AF
	MSZGx6PfeEwnqYgVNjY2KIR+IkeZuWnr9wVj3MdDHFAx1pMOvrhOetFXcsSM5Hw==
X-Received: by 2002:a17:903:1a07:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2b0cdcfb995mr155306875ad.40.1774933425251;
        Mon, 30 Mar 2026 22:03:45 -0700 (PDT)
X-Received: by 2002:a17:903:1a07:b0:2ae:aa16:acf7 with SMTP id d9443c01a7336-2b0cdcfb995mr155306615ad.40.1774933424749;
        Mon, 30 Mar 2026 22:03:44 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277fb3asm104745115ad.57.2026.03.30.22.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 22:03:44 -0700 (PDT)
Message-ID: <14df48d4-61d6-454c-b946-dbf5f5679eb7@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:33:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Rename hw_link_id to radio_idx in
 ath12k_ah_to_ar()
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0nUqJFSKkVPVvFykl2fZRM8_VpPxM2Vd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0NSBTYWx0ZWRfX2RPNkXAXlb0Z
 WvE+7RUwPDk2+u0CLHjOFa90VUIRn9gNMSiujuFncbfjUh83gkTHurz8kXRGRdjcmPeQebp+xCk
 DN2mmjyp7p1KRjt4fLDnFwjEeVWnvg5cpnRh7dtbu3PZ1xbEOEPjtw4lZrSIV4V0qLnXxTz36uu
 M7GcEzGMhLTwrwaLi28uFgDLgdGq47Wsjyi/4qBDgZkATkw6sFgT+zNo0Cxohab1DFWXSlG696o
 4yF6uRHn8U8TlM4Og9XiyiDAwBwuyLSbZYzWhVYeOayqKOzS5/cfVlDkgfGMNcgSZzInKN9y0La
 zfSVPBuO7CAthuAdS8HUxEzUiUYBsQEydezZF1gr7un2dfTOmbDvVaPdTVFb6s7eCvq71aJakEB
 G2W1cdtryoaiNY3qtI0HThyY/3nQ7Jys19aZnt6vLforegKTwfIf4EmE6vvpX/YhdTsUlOhmhfE
 TPmimbJcVMi3yNYhlOg==
X-Proofpoint-ORIG-GUID: 0nUqJFSKkVPVvFykl2fZRM8_VpPxM2Vd
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69cb55b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qJTBxiSCcKiInWsf5WMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_220347_634198_CFB95A61 
X-CRM114-Status: GOOD (  18.30  )
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



On 3/31/2026 10:28 AM, Roopni Devanathan wrote:
> ath12k_ah_to_ar() is returning radio from the given hardware based on the
> radio index passed. But, the variable that radio index is received at is
> wrongly named 'hw_link_id', which points to the hardware link index that
> comes from the firmware. This affects readability.
> 
> Resolve this by renaming 'hw_link_id' to 'radio_idx'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/core.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 59c193b24764..5eff86827e9c 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1366,13 +1366,13 @@ static inline struct ath12k_hw *ath12k_hw_to_ah(struct ieee80211_hw  *hw)
>   	return hw->priv;
>   }
>   
> -static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 hw_link_id)
> +static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
>   {
> -	if (WARN(hw_link_id >= ah->num_radio,
> -		 "bad hw link id %d, so switch to default link\n", hw_link_id))
> -		hw_link_id = 0;
> +	if (WARN(radio_idx >= ah->num_radio,
> +		 "bad radio index %d, use default radio\n", radio_idx))
> +		radio_idx = 0;
>   
> -	return &ah->radio[hw_link_id];
> +	return &ah->radio[radio_idx];
>   }
>   
>   static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
> 
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


