Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CECD25929
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 03:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3RWQmQy3MrLKV+NBz3/3Jxgy577wXT2KM2YCDEX4VI=; b=xb1Rkg0w7cpBSlK4h85xHi6GrB
	F30iDtIXFPIp7ytQB3/R4AGxxenX4OgX2/3HL/B+TKNtjGF+CLF6an0iqP18jf03FP5CMClrJsrdO
	C6c6UyUDZzR2ndbn+m1aY/fKpHArECfsPtegWw2ER1ZfAn5I3mWmpDXcwaYDw2+r7OKCv5xvl8XQc
	VzQZvZvzZYsxKeqjXcwRgNC0NMp1FUpjxsTJ2k5PmqaGj40rvUeGjc29JXocTPLTuuIMYgTd4EqJ5
	CHgbYW0KIZxSSLjbS0QCVmGVXw+5vR0ur54VG3sFxKz71bCaMsZjBOsHuhYtzDbw2o4sbqJUZh3Ip
	75rW874A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZjV-0000000Dap6-1QvQ;
	Tue, 27 Jan 2026 03:27:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZjS-0000000Daog-0Big
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 03:27:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QLW5N14101111
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3RWQmQy3MrLKV+NBz3/3Jxgy577wXT2KM2YCDEX4VI=; b=MdjZ4jMJcWEb7SKo
	xcTcxRjrtrH9FI+g94Hi9mLGj1r7P8Qq043FRXUIGBHqxpResiAhyv3TguMXWvgt
	q9kAPWbLDIktj/vAS3gUpKmQp1g5CNjiCY7vc54WmDUY6q4OMQ75CwqnLapkqfg7
	A01aK9PKLyinOlghJeg1LFzbVcUP7t+dnKhSwIZyDMWwSacq3dJgSnr8snCm/uHb
	gmDWcAOwpQYUHpvjCfNLdcNRMP3VLtGCTVu8ChpgiZdT8OxOtW5kLS/vvZ/Trvxv
	TUrWTe/aJ65zuxz0Qw9G7v7lGV5WSmiv7mgiNrovyvdfXz+/Hzrt8XU9O8A3CZRI
	RC1Y3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93gt6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 03:27:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7b7f04a11so6309085ad.3
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 19:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769484428; x=1770089228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3RWQmQy3MrLKV+NBz3/3Jxgy577wXT2KM2YCDEX4VI=;
        b=Ec6Dkz/YvRrKt8Y2Bk15+2wmYyp1mXLkf3uCQweOaf544oFb9nHXUrNFdoxeNW6teJ
         9bHNiP5AyrjEfOpBbqur41a0RFGPCb26rMMCsSjhsTHngGO+PRHhKpF1B2yoFRo/AqfK
         PZKjOV+YRvwYW+XBiG5YRixkV/c+Ce3Rzvs7oph1Y9qo6vY5UksYpfmrs2mn+OdvFzob
         XsCV7JNVZ91ty1L7JzV6iZOBNQBoEZDwuA85NuwdsuwrpqGmpFWyJ1k5SRR/PqBPxeMb
         IqFuikAHpnd6os75/GRb23fdrzepac4qKk8gJ8GblbaX7K4YxlHHNRGokmKeaP4Mqow1
         6b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769484428; x=1770089228;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3RWQmQy3MrLKV+NBz3/3Jxgy577wXT2KM2YCDEX4VI=;
        b=tnbQeVFNEUn9QGWoOrgFv7yHk7+u3aD5+Xh6QiLiesQI/8W6y+049c4LHqPDUAi+IX
         0gZ68ihqy7cddn5Wa8eu/wosuKNuG3o1fJVUR3d1gj/n6Zmdba9TKiao+SRxhRyFh/BS
         eJAx4kJIuyC3ofJkPjYh0+SvpSpwUyQoIeNdNcccikouzQSTzsgzjhGSYAvI53ovbFkB
         s+VU3iN0+WM0r+MON8PP4oF8bEuBMp64h843ELLvMnsrp3YB6mvV5liRare+M+jXrYwy
         hd0/tgEiYPNf4IpoOpwyfOE4lFs6hJbPXBppYcKwqizLP5dyXAfoC0UMZWQtkZPZNRPT
         lNKA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Nstd3uZj4+7nPIdJp5hA82yes1xYVei2vlnKik3SfvSpsIN9dNbbZ3HCJCf8vDlEuMB/SNA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkT8tpfiMdA/3epW2ukCvUVYqDCFRExXRhNXY/5o/QwbdD9v+4
	UNvIEfbgkzBHY87YyTxPQqOS8sg8U6nf0WBcK/XkhGsOFfk+6VJDkkzrntZaKvU49KV/Ge0bl/f
	tOREZ3A187lSEPOWNuswuOf0ReZB28EXR/nUKRj1nO9nNq36yDVQZBd/UjHL8H8XJ
X-Gm-Gg: AZuq6aKpYi1TL94epqIductPX5rnc7FNe+Y/GDcx8bc9d8dkpBkouNstQASKseJvfjl
	UlPEEe7XTE95f9h9jCP1LadY7kEjf/pIQFRnnQGeUUOYUA+KmHz4sluml9sPcZQ2R4l93josj6K
	p07YJCx6UsJTuEu9zEFHLaD2VUIb9/9T492QkaWV8efkmEFLMGqF0SoqDlP75zGeFW1fAKWvedz
	MEF/Qyz4EwRC+P+bWTxwIHg4yP9r7E5ZyCAR6KlnTo/GOx7ivzGMTR+OxIfrozUWaJq4Ihqmufl
	M1/hZXsL3o6xFDRfglQmFsSXjZF+iSnXdwgGgcrJ1KPxE4icf53JDrC7rMXX1zjDrwHP0QeVGWa
	bFe6ID8hz/DVqXAGFc1e3EFgEzAqbOXNLrj3tZ+7ez5MRVBucOc6xqYX1FLbLMMdyZck2U6s=
X-Received: by 2002:a17:903:1250:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a870e1878amr3829405ad.35.1769484427550;
        Mon, 26 Jan 2026 19:27:07 -0800 (PST)
X-Received: by 2002:a17:903:1250:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a870e1878amr3829265ad.35.1769484427085;
        Mon, 26 Jan 2026 19:27:07 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa46fsm98971695ad.21.2026.01.26.19.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:27:06 -0800 (PST)
Message-ID: <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-3-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260126095244.113301-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAyNiBTYWx0ZWRfX030zm+6ov4mq
 vZUYgmXb/NbnEIeJ7K5XKSLXA2io77ewjCjeJEs4eoc6Pitebei8W8rnSwxFKxVhdhSd6Je+wYc
 mQvh2+guaxXKKwESCpI+rh8akdU7fTKGDOX0mgo5O0bcurWLEiDVZMQ0H3JdsLWyo2Pe8iCzQN0
 OC+UNsDMZNIxKfBDN/tUv2sWpdthXpVX64XZPxBO+6T8vwbnAXCw4cE12SWR7KhaNOTL43Bar47
 bXgiDZf7Zkx24mqNkhD7CWo2JnS20f/Xr8ra7fp+YPqnMxC0VbENAkLBzBfninSNBVJU0eX1SGX
 3/bkQIOyea5sQSGf7gU/RkRYn/DGKJHM1+nPWqg/9jd85jO09BnqPbnNMSN27A8S2Efgryml2Jb
 uAhwue+jt9axxqPI20zUKD3KfTEYgfmMA6tGBNeSAJByE56e35Y9FRqlU3psxf+z2Ig8+eWXr/3
 tCawgYr4DE9PdyTmQUA==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978308c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=danhDmx_AAAA:8 a=pGLkceISAAAA:8
 a=g5N87RIAiJ8VJ6EIuL0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fuBv16upaqil5lxWTNSIHyuA-77-Go85
X-Proofpoint-GUID: fuBv16upaqil5lxWTNSIHyuA-77-Go85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_192710_217235_D9A797D1 
X-CRM114-Status: GOOD (  21.77  )
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



On 1/26/2026 5:52 PM, Saikiran wrote:
> The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
> to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
> after using ath12k_mac_get_fw_stats().
> 
> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
> but the pdev stats list is empty, the function exits without calling
> ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmware
> may have populated other stats lists (vdevs, beacons, etc.) in the

'may' is not enough, we need to be 100% sure whether other stats are populated. This is
critical for us to find the root cause.

> ar->fw_stats structure.
> 
> Without resetting the stats buffer, this data accumulates across multiple
> calls, eventually causing the stats buffer to overflow and leading to
> firmware communication failures (error -71/EPROTO) during subsequent
> operations.
> 
> The issue manifests during 5GHz scanning which triggers multiple TX power
> queries. Symptoms include:
> - "failed to pull fw stats: -71" errors in dmesg

still, can you please check the logs to see at which exact place is this printed?

> - 5GHz networks not detected despite hardware support
> - 2.4GHz networks work normally
> 
> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
> ensuring the stats buffer is properly cleaned up even when only partial
> stats data is received from firmware.
> 
> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index e0e49f782bf8..6e35c3ee9864 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>  					struct ath12k_fw_stats_pdev, list);
>  	if (!pdev) {
>  		spin_unlock_bh(&ar->data_lock);
> +		ath12k_fw_stats_reset(ar);
>  		goto err_fallback;
>  	}
>  


