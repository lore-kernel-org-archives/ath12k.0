Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E290BCF45CB
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 01:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9HRL8DYnJZ0Vdy3N+epIachOpN2+uBmJ67ZbFp+eyQ=; b=Y+Ypqb8ERRYBV8mu48nhzi5ce/
	2ycIksUkyOeb5fQGnkPBgynNWyHjNNFD2XbbLEk/Zl9MWFEg4t+kicxGz2YVlQGlHrA5Fc6XpPesb
	ZOCVQ99dW8vPWFuoL4bS+UV1/FYz7nMobJphw4Wy4ZXY8XSEw+QzgdTjwrgTa1FAh5O2aYPCmN+0Y
	JisuuaCeLJMD7EedQqf3E2RWU2puy0kLitA72O7kTaVPlKlU7DshlOcpZxYN1cI/dcxHXXlqPAT1E
	02Q9poNystQIlKiOwj3QzNG8WonHlvHZDCo3+KGr+eX/IbhimQkjfpqVZLury+B6ThD1NOtfAUO2U
	mrFdxqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTIp-00000006OEx-2jKq;
	Tue, 13 Jan 2026 01:34:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTIl-00000006OEc-1X9v
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 01:34:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN52mp2965337
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 01:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9HRL8DYnJZ0Vdy3N+epIachOpN2+uBmJ67ZbFp+eyQ=; b=XLb1uq7OQJ0PmKU7
	oFZv8c2KfHFCX/tcweA92o0VUJk2Mo8D+denqLf9p/ZqnOWaeas3p3g8Ag3sbnXK
	epT1v8WvJ2PG/OS7jT2Bv8y3P/BBn8nUEnAmCbU1yzGYCYkp953iU4RlRWbCbZgi
	6v5F9ateTGddivh3EETVmxrfdDVjcxitBcdybseZo8TBI3xJaXCfvJDqOCB00TTg
	6GBIUXwIQwQsoYffUt4AHkMgwXihnztZDXJu4/P5m//guclMo0QyofwUJe+TU4h3
	ZFTwPAPqzdZnfJTzAe1zbf+DchHNPZyZDio20YAQ+mx0RmMl2ddOU1dz3y5pNPg2
	Aylo1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hjk3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 01:34:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so2637178a91.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 17:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768268070; x=1768872870; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q9HRL8DYnJZ0Vdy3N+epIachOpN2+uBmJ67ZbFp+eyQ=;
        b=GH6CgIPWlK+m01i+EOPQzrUE1ivErRfeeMUFkxlV5JNEyCz7p/2af0hAToFY8E1rPI
         zWbuwX9qTT9OmkDuctYXv0bnmfHBaH+OtY0fH3C6jes7JyfTvibfELjMHvIbo5iYXXCv
         cRwOEXGSoMP7ETR7wZE7c2UTFoC6zhaxrXofYY/Suh8HPdpr1JhWKdagI8pwJun1/X8s
         BfZIiDe8WwrHejAhNVPXJg4d/Py30nJwDe+lpW6heX1VwNHK2gaRWGqI9PIVdV8niKLI
         HVcmK4t7UChzHVXKcBRXpAz8GeW9qKqzsczTEjmFaw1zCi9NBm4eut/PVKMbDZ98msFB
         JNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268070; x=1768872870;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9HRL8DYnJZ0Vdy3N+epIachOpN2+uBmJ67ZbFp+eyQ=;
        b=QnjiGO6CwFMGmv2+QIQo6b12N5x6ZzdbSxnymILE6idwpIDNvVNi0eGA1OhqDkkkzU
         Akm3bEA4lGOSLGfIzONHSFFygT6vCjxcK198DAHWR06MkCXiuh+m+734OvdaXpFNUXuf
         CsuvzErqGP4167wPKdTmx3RfkaacTZ/pgo9yUHWIaNfh/TOLbum9eoyinerIscVXLqqv
         xo4A4F2/F7mgZvOJcz9c+CfudlvLDwzgU7gL3TsQqsuX/A+NvSAewThC04YAa4uaC5Zr
         3hrjLlp08KTeywSzMtRZtx1COCsEpBawLu8WUDk5z+FL1ksevnOGXUADKx3eKZFWAEKz
         IGFw==
X-Forwarded-Encrypted: i=1; AJvYcCW7ol68P+Vyn5SHyiymv+OcbnWJ5O35aNedfSkLsAOSesQEQccoo+4UqVtn/osQHXJ5Zc9aZJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvpnoZN62OWX6K2pjLMQwT2Pd36j9aE704KpSPnd1Fp4ls/Ea
	ezCxslE+XvYQWLw30o9qYz26ZIewT4BvPpWeqBolPz3MXaSl1ntmrsY4M5XvSc/EYWPaCUlyicn
	NLp8Qpm9FhnKSgOERQ7cWY8eK1JPIJs/774KzrvbHECt09AIye8HBt0lZV/kUD7vV
X-Gm-Gg: AY/fxX7fp02YcISJlj+A7YHMlI7etooPwhcNWlK193OwrsWChAQPEZU5iFfxFMFz5Xf
	M9IrvUFX/UROyM5OprZ+VRdakzw6Uwphle740SJAAaMguVRokx+NV0JH6TP+6bHBT0b2nZG7HCb
	7f8VzTq7DYz5PWvIODNxQdT+SMM6Ja0hE9Om/2DHv62CLhN47T/HJqQ/wjV7WddRWnDxphXSXfA
	7RmcxDwk6K/k956O3bs9FNP7jlhh3Qz5+GCT00+zLRFq8mOJNjZ/wIC2f3ArIv+HvAR0FVjKLs+
	uNhQxXmzKfc5zoTQhjSCHEcn9XjkhAh/aAX8RRgSHjPByJkGQyA5y0xSo/BFV4rSrqqzjmvxTJf
	y5mz9tcefkFzXYX6u1LfoGdRmxpPxPYMmYSUPfYEkU3UuCnR2BvPmqbrlufj91I48piEAFpcl8U
	fhwBvDGJA=
X-Received: by 2002:a05:6a20:7353:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-3898f8cadb4mr16290156637.9.1768268069904;
        Mon, 12 Jan 2026 17:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH5Md5MJJ8H47dOGI1ykwikUJ0+mF9/NRK3jmEyXA7H7rvx5qRlPHZReOZh3wtrbD4D+yr8Q==
X-Received: by 2002:a05:6a20:7353:b0:35f:5fc4:d885 with SMTP id adf61e73a8af0-3898f8cadb4mr16290138637.9.1768268069389;
        Mon, 12 Jan 2026 17:34:29 -0800 (PST)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c50347bc321sm16124280a12.18.2026.01.12.17.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 17:34:29 -0800 (PST)
Message-ID: <3ac48d30-1ea9-4019-b95d-8e84fa928ae7@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:34:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix scan state stuck in
 ABORTING after cancel_remain_on_channel
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: etqhpKpbcmsDFqrER-CL4wVFKkW2DYIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMSBTYWx0ZWRfX71Or4TtxMPs+
 eAhHadOQIbyZvOVRadzE5yXZVxEhP/9n2Ab4EXKLynH/BdQJUYaBcq2IAOJo4y1HOb8rqqsgi5O
 gsIIR33h9hEYRiaGLH1hrsI5aGxK8QUTgYbXlvOPjg8Vq3JG3yhCwCmgEdcOzQwRj7hV5BfBgWC
 jRQHREb+qtaWTb40vEWU40PAeiSjJUqOO+3YjYIBRq06Sr84NDZk2XfUrxqAppU+xNtKjRnsM0b
 YHwTOlymW7CH62oN76D1gw1BpligWOujxnijv33O1qR7SN2+rHavtRwu7O56dTv2CJARcdm8xQW
 nJsBhMNSNe8H73kyWQM8RYc2uVfyihBMJVSdWDbvD+MZKtJ+yZgfKrypPq9nhvi37zEsfbjewmz
 cM4YKSPpLAUZUzv2RbAmdt7uCXFdj8/FONUhJtu8FXO+gyLA69pPYdB2N40zWaIfH7rkU3bsvT3
 g3aDkY5IKVpKXJIwC/g==
X-Proofpoint-ORIG-GUID: etqhpKpbcmsDFqrER-CL4wVFKkW2DYIt
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6965a126 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-X8cQwupIys0bDsp_XkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_173431_421024_4A4BB8E4 
X-CRM114-Status: GOOD (  18.03  )
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



On 1/12/2026 7:55 PM, Yingying Tang wrote:
> Scan finish workqueue was introduced in __ath12k_mac_scan_finish() by [1].
> 
> During ath12k_mac_op_cancel_remain_on_channel(), scan state is set to
> ABORTING and should be reset to IDLE in the queued work. However,
> wiphy_work_cancel() is called before exiting
> ath12k_mac_op_cancel_remain_on_channel(), which prevents the work
> from running and leaves the state in ABORTING. This blocks all
> subsequent scan requests.
> 
> Replace wiphy_work_cancel() with wiphy_work_flush() to ensure the
> queued work runs and scan state is reset to IDLE.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 2f4daee9e2f0..7b72db3193d6 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -13448,7 +13448,7 @@ int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
>  	ath12k_scan_abort(ar);
>  
>  	cancel_delayed_work_sync(&ar->scan.timeout);
> -	wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
> +	wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
>  
>  	return 0;
>  }
> --
> base-commit: d0309c054362a235077327b46f727bc48878a3bc
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


