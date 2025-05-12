Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B24C3ABCB
	for <ath12k@archiver.kernel.org>; Mon, 12 May 2025 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbjFbDL9z6EXyAD+gv+b+dQagMxqs55xDaA2iKBmiuo=; b=a0e+wo7muWzPXtjRFXF28h8GSa
	iuRLe/POd60nJEa0Mpdrumu4Gp4VfH2/B0EQZYBsfz9CQey8tB9dlwAZErrRd//4khmvlPgyE7Lwx
	Mor1+TdgIfNTtu9OmguZ1KWTIaOi718htXFZ8k9USBNUh+DIbMA4Ao5RJ4Ff+zrM8DD4z2edBomu+
	O1fytvNjG43hoQX85I9At5T6UQR/eTF8q/GHtWeIzWzjhyE6bRy06EIKChWa0c4Gk5XIbiepufYhi
	CVAn/wg2OT4+CFN6zLhC19xxXijhu8I3G5P/yedIQusi2bLrPCrp73o/OGUEY4p3CyKsYZSmkUnWS
	MOQ1rxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbbl-0000000Aq7s-19j8;
	Mon, 12 May 2025 22:26:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb7u-0000000AmnY-2uGd
	for ath12k@lists.infradead.org;
	Mon, 12 May 2025 21:56:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJtYl3014272
	for <ath12k@lists.infradead.org>; Mon, 12 May 2025 21:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbjFbDL9z6EXyAD+gv+b+dQagMxqs55xDaA2iKBmiuo=; b=hlfFWoqHiFp39aYY
	hY9d4bNQoD9790zQnCn6qBQsB+ThgaOdBzupnpPcKtjMjzIBh/SwfbueqGeLuWsp
	SLj8RpSjsGjDXFENQtEuxHz3THDkRS33N7vcM7D4/qa3pNlET6IpQpZbVzF5NZDi
	0JU5Vh9u11rT2JhezlWiHqw4xjUVf/SxeDcOC51K6dMxcFHAyzQBLuSDFijYT8cN
	CSYuugRgdsOZsaDcL+B1EAZxjTzmFIQdwlkq6xzuYkTiiL90OMY7eQY4Ci8rhtXm
	Q26xYsZjTO2F6mQjURdr/nRW6b4/o+zEZJpIlgi7tOmL72MGRzlDCeNp3h8h/cC2
	celPhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjnmg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 May 2025 21:55:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30ac9abbd4bso7710762a91.3
        for <ath12k@lists.infradead.org>; Mon, 12 May 2025 14:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747086956; x=1747691756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbjFbDL9z6EXyAD+gv+b+dQagMxqs55xDaA2iKBmiuo=;
        b=knhwU7FziizeFZouWz+s5NovPuVE/HmeHM/E6qMsN4BTKUzjmJIIO0/vohSmp4IHcV
         anUd9Sk+Bkpy/sJsdsEvJ/H3HYGGD2cDmwarJTPuJOWnXd2YkIFPNifmy3IUeMbLXtK0
         t7+VFf/XCyQXpPDs7K1+b1g3JTq4NHrzgAxjtxhBgXKAaI58n2BB3cy58f8itSGnDrH7
         uvWbpzOJcY4Mhzhnaj9KiVLmTHYNvjiJYWt5wD2Yx/ikfWNXxYGYwEGtcH538J2kFbrp
         odlOXkKCvZpgjEfJI0pTAGAhtQuzLRwFtIGr0BbP8eHB0NmPOeqriV9kzSrA0o7p+Vq+
         63zw==
X-Forwarded-Encrypted: i=1; AJvYcCXU1GILU5K7mctXnw9g/fDKU83zQ1fYq/BFuuERRlQnVgLz+WlQeUM1P6ZvSx0JZyk3r8TKDGI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4l2Q3J0zrMtYUhYJmppyVDck2T//iGCH4JykxePJIVnGJ0Iw
	vtJKaTt6nwmIQ5OXhdQqrua0FIB1nz57AZeR1rKnXguYLU0hgK88oaOxKUSQMcFtorSB8zAYcDG
	gg/mGYbXNSVphppwf0Z8l9hr1kHqf+7VsGUyfn1CFDfL/8H9dokvnIeVCZH5p
X-Gm-Gg: ASbGncs2w8ulplxE+XVgPKOa3sj7NdwYqJVWpwKtHFvqYuCwYqJr0IgiC3Cf7CPwdKJ
	8vYjwxxypIqCDHwIWOu34z25Uy4ySt0GhxrKPpZv9gfuHFV6wxR5ZWUYvfgMGCxd62//iuFi/1f
	RgLWdGtyD47ggKFXHkNQyz7PxIqdsdN97ZNa6Qg2DshsLCGJB/QzT90w/tJoGWAAFUc4bRlEM5K
	T5qBH3MLDEyMm2tAlN5xTfDeFfNXDBRIYLGdNW15gZcg0+flFgnlhFNLfoMMxjlokrJXC+47tMN
	+muhOGkcbaLgo8JRHJ8h7JRfBa9bKsyBelA/9eMn6qtMEOjdvouCzfyhbsH6XLiFqo7eph4oYoa
	fY+Hc
X-Received: by 2002:a17:90b:1d81:b0:30a:4f0d:a6e7 with SMTP id 98e67ed59e1d1-30c3d0eac82mr25944868a91.14.1747086956395;
        Mon, 12 May 2025 14:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJE6X2htOph09O3lnEiVt0+I0PpYcgKxpjL9LlU76n0IU0An4p0s0Uio5RdewmKUz54ZlqVw==
X-Received: by 2002:a17:90b:1d81:b0:30a:4f0d:a6e7 with SMTP id 98e67ed59e1d1-30c3d0eac82mr25944842a91.14.1747086956025;
        Mon, 12 May 2025 14:55:56 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dd4b87sm7245003a91.19.2025.05.12.14.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 14:55:55 -0700 (PDT)
Message-ID: <52ff43fc-160c-4efe-ba9e-42a0c838fb3d@oss.qualcomm.com>
Date: Mon, 12 May 2025 14:55:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix scan initiation failure
 handling
To: Vignesh C <quic_vignc@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250512065849.2833232-1-quic_vignc@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250512065849.2833232-1-quic_vignc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIyNiBTYWx0ZWRfX7wrbsEPSA5sx
 UsYYbzOVncy59GRrBTEan9hz4ArpRfBw9Atil+77dwWgiIyytbXZKvRK5QJvAqeWNJYlrIWpQhf
 63HdAfdf4Cg0AXrE8a7I2ooCwgjXr2110VeBDlXP3+SFOl8Op4qqitPQWvUu9AwgW1Fh0U9QXF/
 bq8W0TZVD4FA5GWLW1PRAXjLhqRIdns2AET/yGrfjyVw7U1lbZNYD1MV9Lc/oNBu3zhxJ1GrdPh
 GdjE53uIwFY50WD00e5NY1PAliuFOJEGztdD0uVyDq9ap/8w9dhUcxiOfQzDY25KAh8y97bYLKv
 y3uBQoJdECKqwLOamH97UWZ2g1X1ApD37iwodgsMkGtP3p/ohdLZiXu52bofwULD+zwH6Sms6+c
 sXDZNn/CjgIA0DUVHQxRmKiPGeo1+8bfllFoycez9R/AlFli2zJB5HlEGc/tS4wyabL4e2VX
X-Proofpoint-GUID: Pe2-qlcMtv57QAZWdve3KdoWn9lYd52E
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68226e6d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Llbn9g8lkstppoHvQ9cA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Pe2-qlcMtv57QAZWdve3KdoWn9lYd52E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_145558_754410_01707715 
X-CRM114-Status: GOOD (  17.45  )
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

On 5/11/2025 11:58 PM, Vignesh C wrote:
> During a code review, it is observed that in the scenario
> where scan initiation fails, the current code schedules the
> ar->scan.timeout workqueue which is not necessary.

Are there any user-visible effects?

> 
> In the scan initiation failure scenario, exit the code instead
> of scheduling the ar->scan.timeout workqueue.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

If there are no user-visible effects then I'll drop the Fixes tag since there
is no reason to backport this to stable kernel versions.

> Signed-off-by: Vignesh C <quic_vignc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 4dae941c9615..0cf2b3d06c3b 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4647,6 +4647,7 @@ static int ath12k_mac_op_hw_scan(struct ieee80211_hw *hw,
>  		spin_lock_bh(&ar->data_lock);
>  		ar->scan.state = ATH12K_SCAN_IDLE;
>  		spin_unlock_bh(&ar->data_lock);
> +		goto exit;
>  	}
>  
>  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac scan started");
> 
> base-commit: 3a64d6def8733e75909abcfab983efae92dc4102


