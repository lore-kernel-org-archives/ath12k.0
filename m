Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5959E9462E
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 03:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCvZKli0Aao8G3OQ069vZ3CA8WH0FQZqZOD/rpVWq0s=; b=NQhRIwIgKxjmKAQ3z16rSEE8iw
	ukSjtzqjwKJXSMgSl22Kh5AT+vP7r7Je1bXFXIfvWq3D4dSOUiKt2/JsfYZwtxSlWj0PP7KRSTonD
	1hklMLBiHfCYPwvWFNlXkBN146ob2BWUBGzA/2gbWwl2m3GdCxWP0YeMSFJjNfWPszfGpCkWsYW0C
	lJCRwA9iEtop8Nmok4BXut6lB9qQi7vqsxhEZyKPZrbuo6T88mHboV89LZ/zwvYxGvlDfaDpcHZZ4
	PxSWHYau8oIptlOuEQw0c4giccD3CRYuq5o6ujZORQE3QPz9nr1wY8znwEEn1WcN5Q0KIBmkvNvcg
	xaUdaH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeZL-0000000GNyH-2i3J;
	Tue, 10 Feb 2026 03:37:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpeZJ-0000000GNxj-2xMX
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 03:37:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619HovoH3699944
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCvZKli0Aao8G3OQ069vZ3CA8WH0FQZqZOD/rpVWq0s=; b=GaQH7BMs9VIMxx5Q
	EM7C4gAPiDtgqIrVXiorTgPJ/RKXwlicsm6xS+kk/pqUBG1/b9yk+YR5xWkWzjAH
	0WknMZ2qFcgrGT1wK7w+W0M5XqYiIuqc2m9g+v4lGB0rr8gNnzNGjenF9LraBsuO
	ZWU4NaxL69fDVYrSGAG/1PolAg+Jq8guMJ3mTnOPk90upTbGftAWPyHeqanoamdV
	5qDVJygPwsZUMvUgbS1UFLJIe41v+ygyBGFY6gb5mRM0bSxizvPEfHI6X6VXgOAq
	xMwBMgNq6rDQCx7tFv653z2cqavAGdGcOtXNfu6joKCysr0D8X3g8tfuN+f3VGFp
	gbLB7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4mb2g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 03:37:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so4935424b3a.1
        for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770694660; x=1771299460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCvZKli0Aao8G3OQ069vZ3CA8WH0FQZqZOD/rpVWq0s=;
        b=dGBnrjqYFUd78E0XZ97ReGxwjWqkQLp44Sap96/UFx2msqw0eGe/PDKxEcPd/afJNK
         LSFO8q+iukxRiDs5F5a0fxVfG/8BVt5eTqvChb4HdgyJeQw2TB9x7FIuKhUGScvww4mM
         eiRaijajX61W6Hpl2TxiCRXMGprDTC/sUAvIUFO2CoT3gOncLl2oebT7lZHEiXBy/Jmo
         XAr4XyVbH+aAQAwOKDvRnCKwMXitZQVap2Lvh/CDMGqz5ChgJeJMrejnv/+d/seasjPd
         1WwtUJOXGiqU03CWT3BHNx0VUyZD7fF0zk0OmMPPVBizKzXStLUJiLklpbv3o7j9inxu
         GFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770694660; x=1771299460;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCvZKli0Aao8G3OQ069vZ3CA8WH0FQZqZOD/rpVWq0s=;
        b=riBTXmaBNvt2q4yreI1l1kP03OGSazUUbwBgOwVkCTXvoEPHE18/yvMeIvy8G+j28q
         GNaBZDE5+5IA22ck8EB/dEwFifMSW/7BLZz3QTf1e4DUySc2up3ObwPT9JeK1a8ZJlr1
         /CmmVUFAUnyMI5PxVMcL8Z/lBFOCse+1k/Jyqd7f4Fh6U5Gd9yA7nJW8l5TTStv5dmb7
         dsX4Zx6yLW2+OZcpEQ+n/fux+2WkyBucfHuoXeRWhDuBDlSNyvNqq0QPYHA/m6V5ooz8
         3GSwmGGdJSC/9qmjBa2YYTAnr3EA+caORc78AkT68KN338JyuTq9mB6ZjzdeUL5aVDXW
         W5lg==
X-Forwarded-Encrypted: i=1; AJvYcCXoLGU2bR3pV/+BZdR7F3a5ouXJpSLQuzUav20Jxds9V7VjZ6z2e2CEbLw9SYTBndfTMb3rNjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj9Kns34uupc+CX9XKDQg1drFuARBxaSqQJyrosHtsM87752ed
	rV5fa8E8qQ8YdWZeBEi9M92elnp+MVZtSFdMym2pRZnKjaOstQn+U5TcnhxfOGCSoPf1gBK0cji
	obWGWjmaEZ37Bx8v9mAm+QNC7iwoY92yeEFHxBc1mvTo7GtsQXwWGjh9hHj6m+mQdp3kdeM2Z
X-Gm-Gg: AZuq6aKBuFowofQ1ubTRYMF1wfNqDS78nzQ4Nl6HbTxja9w7UGbMUlwVBhUtOvo6E2i
	061QnPae9tPNo78v/gkDwCBzcluDXZIP+l8wjmAkn6CDtosofmgybSl9UhCYhFNang4RkYFKQe5
	XOnKsRw2ffWAxgpoQNy2CS/tMatpuuHQn8IDUE/ZrnqCvyBNsuhZq+bX0lmI7ljddMIKxSKEwoq
	6TFoW6soGxb1RW16EtatqdwtMxAThpArsNi32wtKgkV8hQ8WKBo/BqsJ9pT+jhbBhlMF7jpRnjS
	50xibLkH75EAdvWpFWXbdsZj8OXz+wTm34YUfPlJ8s8mgNRMSe9afoJPlfJuewEZ7JsE+uf2eeX
	HBcOXmI421t/QEAznBlRF/Sysk3R/pMyGXnxzYeuUNRWEfRLVwag/TrPWHIIVMtBGTS2r2sRDMa
	nCptGaiWxdJ2rnbUSJ0w==
X-Received: by 2002:aa7:9a8c:0:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-824879b83bamr1028632b3a.22.1770694659777;
        Mon, 09 Feb 2026 19:37:39 -0800 (PST)
X-Received: by 2002:aa7:9a8c:0:b0:822:f928:fd97 with SMTP id d2e1a72fcca58-824879b83bamr1028606b3a.22.1770694659311;
        Mon, 09 Feb 2026 19:37:39 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b842dsm14149370b3a.52.2026.02.09.19.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 19:37:38 -0800 (PST)
Message-ID: <a4d404da-c8c0-45c5-9097-42280c4891d6@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:37:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/4] wifi: ath12k: validate survey index when
 frequency is not found
To: m.limarencko@yandex.ru, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260209030243.1530075-1-m.limarencko@yandex.ru>
 <20260209030243.1530075-2-m.limarencko@yandex.ru>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260209030243.1530075-2-m.limarencko@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VLn_w2tjYwp_QmkaI7RELqwt1gomPkdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyOCBTYWx0ZWRfX0Inp5Qhl2pRM
 OLlpxA4xtqbd9uIHW1Ad48tTTlxaX0T3+pZSkhpnrvZb54YbMbfMXi1PlEyttFu8LlzJt1JAiH+
 6BDYPA/BaL8g7ceqO7iJvf4k08gRtQ2XcoZCgYWGC+4aAFdOr/2hYFH7QKTJBpyq4UTK80Sm9jc
 gFpupuSuXksSjlGq28KgLVwxZS31AZVNGwk1D/jN4JdblsZr07pRTCAhml3AFn6FFXOeZFFyIlQ
 gJ7BMWZZA/9rzmUHXcbwix7+pbyLUY9vvE567lCWP7wmCgjFwv3UD17yGk+50bOHTUl46moh5kI
 fJX+O/gJXZxf2vKUh3EPMTZScjNsT3jo/6L7ss/lQ+iYuLGa6K+Pl7sb5CcTS+shb/SuzSLz50k
 6Zr86tVaf9uZVmAJDUYpPwexv3b90dyLKV+hB6m8A0HnddCde626vje51syTrAVj/6QfOLCBUXB
 EbUItXu4YSYfDOQbikg==
X-Proofpoint-ORIG-GUID: VLn_w2tjYwp_QmkaI7RELqwt1gomPkdj
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=698aa804 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=vaJtXVxTAAAA:8 a=bbBjNLaf5w195QMG7moA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_193741_756322_12BB67F3 
X-CRM114-Status: GOOD (  19.25  )
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



On 2/9/2026 11:02 AM, m.limarencko@yandex.ru wrote:
> From: Mikhail Limarenko <m.limarencko@yandex.ru>
> 
> freq_to_idx() currently returns a monotonic index even when the
> 
> frequency was never matched.
> 
> In chan info paths this can lead to out-of-bounds survey indexing

how can out-of-bound index happen? there is already the ARRAY_SIZE(ar->survey) check there
to prevent this, no?

> 
> for unexpected frequency events.
> 
> Return -EINVAL on no match and make callers reject negative
> 
> indexes.
> 
> Tested-on: QCNFA765 (WCN785x), kernel 6.18.5+deb13-amd64
> Signed-off-by: Mikhail Limarenko <m.limarencko@yandex.ru>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index e647b84..422e3f8 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6520,7 +6520,7 @@ static int freq_to_idx(struct ath12k *ar, int freq)
>  		if (!sband)
>  			continue;
>  
> -		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
> +		for (ch = 0; ch < sband->n_channels; ch++) {
>  			if (sband->channels[ch].center_freq <
>  			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>  			    sband->channels[ch].center_freq >
> @@ -6528,12 +6528,13 @@ static int freq_to_idx(struct ath12k *ar, int freq)
>  				continue;
>  
>  			if (sband->channels[ch].center_freq == freq)
> -				goto exit;
> +				return idx;
> +
> +			idx++;
>  		}
>  	}
>  
> -exit:
> -	return idx;
> +	return -EINVAL;
>  }
>  
>  static int ath12k_pull_chan_info_ev(struct ath12k_base *ab, struct sk_buff *skb,
> @@ -7475,7 +7476,7 @@ static void ath12k_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
>  	}
>  
>  	idx = freq_to_idx(ar, le32_to_cpu(ch_info_ev.freq));
> -	if (idx >= ARRAY_SIZE(ar->survey)) {
> +	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
>  		ath12k_warn(ab, "chan info: invalid frequency %d (idx %d out of bounds)\n",
>  			    ch_info_ev.freq, idx);
>  		goto exit;
> @@ -7550,7 +7551,7 @@ ath12k_pdev_bss_chan_info_event(struct ath12k_base *ab, struct sk_buff *skb)
>  
>  	spin_lock_bh(&ar->data_lock);
>  	idx = freq_to_idx(ar, le32_to_cpu(bss_ch_info_ev.freq));
> -	if (idx >= ARRAY_SIZE(ar->survey)) {
> +	if (idx < 0 || idx >= ARRAY_SIZE(ar->survey)) {
>  		ath12k_warn(ab, "bss chan info: invalid frequency %d (idx %d out of bounds)\n",
>  			    bss_ch_info_ev.freq, idx);
>  		goto exit;


