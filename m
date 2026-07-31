Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C67EC54F54
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=; b=Y+omT3a9eYXoexPKas+2e/+Lbn
	bVqzdxoOvN6XwLInZ9aqq6qSeyR3UOKsBIvEoyw/09ZivQ+g81C+kVcKcibtxLhebpXCnynXKFR33
	TrjrMhPorYXl0GFAtTUt1kdlWeO4Y37ydoC+TJ3z9glYhQrCb5i+SP/2rHCcDey+0m53z5p5wYeT0
	nImhJkk4xpfGajd95gKtscITwFSTXzHXddSit4SndENo5wIEGMTMck4ei+SK38F17yAblYCWMYpcT
	2MX6IOT9ACB3L/kr3Tf/uRY4CBoUW/cUxCMZdGJBksmsWgHIFchgHqRMXUzo/2SOyqsxj6lZXU0jF
	i7HBeZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiQ4-0000000C2fS-3rvH;
	Fri, 31 Jul 2026 08:16:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiPy-0000000C2cj-12sN
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 08:16:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vW493261294
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=; b=azIvyioV22BMdMnZ
	uSu53KqY6KaVNQbchd+zdzT0W7jWelZDKSWIjg2DwPv6j7nXblpUA3O4Hcimh3aZ
	CmanFPq7ql0bm6gydB/BXYmd9tZ4g4kEfWOsXdqvelwMPzOK+n2UNfcme/YRJnPh
	iy0C/5J0IiWEuiTT6cRpHQqOzedSOnKgTj/gj+4NSmijlDzd24EtWQgMTBEz8FQ7
	zMg31bS+eirtgjLVtqZ5UUmXxkpVehllIDlPFKntd9AF42ToPn/CEIBbiGHRQw9B
	+MS8eBa5DmbN+8NV+eWAchHrD5Gm0MouFVo/gz8uCT4kuUlUz0CwmWdezYxVc9Er
	7wXtIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqajr5f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:16:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e375d9736so1173926b3a.2
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785485787; x=1786090587; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=;
        b=C7xEPOomt+uvGsXbiAr9pcIPfrjPFLpvWHtrm4qpyYMhEJO541Nq/uBdjHZqN90wL6
         iHaVt7ejGGibqIrflBycSVtI5VrTTVhNVrt0NFozTMz4QUjh6She7PHngg9aTVYWKqFP
         IF0xrMvL6+0at71HXcI8fZxY8zfJoB2ypefQ5DN2HWtNkDI7LLqVt4gsKAQySaF9ur7a
         5kC5/xIwZ+yolWYMEAlq13K/gBmcu1MAqvICRRjIOoDYJxFBBdehfv1Dp9/kzZ8Iq3VE
         NHRzkPx8gRP8k6/oyx9vl28wJcOHmorDZ8cYKy11kq/+M99kKd9ONT/09w+JpTMm7QaP
         UiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485787; x=1786090587;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwN4m3GZszv7Lk8bq89AA1n4J6jRQ5eRfOtjYkSzynw=;
        b=flOYsdnISumNX8+9j+XJ2uttHAB/pCnYWjfi9UnjCGU9JjcQGG41K2GUBbBAHNutj/
         gtosU/GTauXVX6648YWfwAH/XZORrT1ussGVmNOiLVwv/5rYEOf/IcxdIKkd8y7gK8Dl
         5xz+glzmFBKAFh56RzZ1nTQVA6eY5rXLKJPhrfC4LwAO4icGDtpVziCh2sRYa+55pijp
         AouahIxCvWMW34TUqfx+CGZCxiBrxaSGTNNrhKQkj8uJga+Bvi45Ar4VTmS2HJyzbAFM
         NsZ41hf65JsQgd5sUU4h18XSCpHw7meco3J0uZOWQ3O9pJR9WsWa68CvOSgDankTmNjk
         Uc3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrvj0CaMC1VnD0nsaG7Gv1WaGUFGNo4m2tT9d11JgoK6CTDi9MwdvpnNWPPO/f836Eybvz2Pq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpY2bRJxYwzQ9w+lJqbY32OxfWNWIUKMP6RheTYchqh2QHSz43
	oWoHGS2No1/rDACVgplf2GYB1yPC3pSH4yTfpr+F3XMsA2Ktzji0F2IO/cqpGMT1VJKB9zd/96B
	kL8uxGJI13fx8h9hkVLw0m6RrrCyu86rjN6ce4Bsq8Lg6goEXDVLaD0IxjxDwlkIm
X-Gm-Gg: AR+sD10eQIuvIzcSAXTLYY/ILDjLuCmVIkO7+ni7EUlMMmh1AOt6f+fqp/TfRMs7Qam
	5SulrM9pMQokbVpkMOTfdhnQtT0a27E8kxjXKtRMoZPNnnzxCIIdIky5IdaQ1kFZjjLL7bZGF8F
	JTg2bz3fhqTHtw4B3ToAFxDSqo0QrfkxfCh1q5XqQSGLe55HWYcvnlD1O7WrINQ+9cRE08DyjMA
	uudfN3DxlUoB004KA+N/n8jnE4oddm9GI3IbCWyPKRCZOgvYk88yA8KBC1S5w60jXmPpTl/3SrA
	kXCnVZSnbFSfXXQNGZz0cJHm0pNw1FQZPi11qRWKmsSd64JVP5K3VGlP15jKoaBjpBm5dAKJ8R+
	PNWqO0Qhi96LPPovNMank1l5HmDGxoUc7gse7jq0a6Q4bzzOkoTiblX5GwQ+hluQ2ighlBWRl6g
	==
X-Received: by 2002:a05:6a00:4285:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84ed6d227e1mr908914b3a.23.1785485787272;
        Fri, 31 Jul 2026 01:16:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4285:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-84ed6d227e1mr908888b3a.23.1785485786626;
        Fri, 31 Jul 2026 01:16:26 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm140033b3a.14.2026.07.31.01.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:16:26 -0700 (PDT)
Message-ID: <81041a09-bffe-426f-a087-f6e48de93531@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:16:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath12k: prevent scan during firmware recovery
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-3-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IKiuxKs9mYuagsx7h2mkb6qm0Xo-5Jew
X-Proofpoint-GUID: IKiuxKs9mYuagsx7h2mkb6qm0Xo-5Jew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfX6+SVTW4JChiF
 8OQUoPa30/RZFu4Vw/tE8ARVGVeOQ4ug0dGamomMniVc2K/jIS+xmFbUbKriYc35h8j03U6rW4w
 +tRrJkgL9p6OUedoYZIqzNyCNaK2u2+JA5dZpB77k59U5H27Dwwrdn9zaPt/qa99gkaFg0IChzv
 mQls4BmNbtr6QjzGsTCdtUht67yftCWTzakcQSbcSBr59wul8xhAaIUBAucSBnV2qlsurEX1Tzx
 kg6cCyd5j1EslUtUtX43Av3EJ/au8ADY7QQgL1D9MyK09ZrIvclX/I3sjHznpGNyCBhFpj49JaX
 Fb1FnY2rPVCnh/FoYc2CJxFHfnYFRn2eirCnVv7yC68KiB9iLZnr3zETJxeQkFroTqOyJxKLW0m
 5ObPg9EmV77T1z/9oS8sgI9lENmtw9waam1d1AGw3qzsHUVJiNM0b2lJJVKZWYikM0hQW+78REc
 0sBi67NFUR6uGPba2Xw==
X-Authority-Analysis: v=2.4 cv=e7I2j6p/ c=1 sm=1 tr=0 ts=6a6c59e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=Ck2z4BDfFmx1ngdb9lwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfXxGLYJus0vJoR
 z+6xwwEYGmhrSmfVDx970N+rHP+H8NCJRWaDFAGewuTb5VpHyWEEE7a1WksTaW2TfzNyqgwdAgr
 rUx++F8vTs4ZrLDomVNH15iDCLU3pu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_011637_981397_F6F2841A 
X-CRM114-Status: GOOD (  18.09  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> When firmware crashes while wpa_supplicant has an active connection,
> wpa_supplicant may immediately attempt a scan via nl80211 while the
> firmware is still powering on through MHI. ath12k_mac_op_hw_scan()
> proceeds without checking the recovery state, accessing partially
> initialized radio structures which leads to a NULL pointer dereference:

do we know the exact structure/pointer that is causing this issue? just want to know the
details of the crash.

> 
>   BUG: unable to handle page fault for address: 0000000000001508
>   RIP: ath12k_mac_op_hw_scan+0x148/0x2b0 [ath12k]
>   Call Trace:
>    drv_hw_scan+0x88/0x140 [mac80211]
>    __ieee80211_start_scan+0x2bc/0x6b0 [mac80211]
>    nl80211_trigger_scan+0x54a/0x9f0 [cfg80211]
> 
> Fix by checking ATH12K_FLAG_RECOVERY at the start of
> ath12k_mac_op_hw_scan() and returning -EBUSY. mac80211 will retry the
> scan after the recovery completes.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index f33976fc1233..924c3c21ca78 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5707,6 +5707,9 @@ int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> +	if (test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags))
> +		return -EBUSY;
> +
>  	chan_list = kzalloc_objs(*chan_list, hw_req->req.n_channels);
>  	if (!chan_list)
>  		return -ENOMEM;


