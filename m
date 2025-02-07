Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1374EC02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+V+JgQRCYKhXRFEasqcCrnMZZS1Hps/NSFCEiIsHng=; b=Rou8Lyhjre3qa4H0DYbQZrp1Nb
	CJurM06ZmbCjWxnzKoP9ddLv2OUYgbZb81gNS+L3kEKJbxzKPfAbADCUQSwSXoGOuKDZPeJuNWB5O
	IqMfacIsOQvyat7H5oQtFxpyoo6B9y4aY5/jNJjptFRelderLYQBF4FmCaGWHQ+GJp3ilRv1rf8xY
	EvUkCFSnODzOryFnZD9hhZQQv2nnKcF1xTr2+ttJ3kwRQ0hShJ2LJON6ZhiAj/2FnCm0WbOwqbOj7
	rmiEfQQ13ghxhgnQEv0aeP71M8hXefvsIoGD+3rOmJBixaAiQUP52j9naOU8u1/8R+BCmo9tN57nk
	EbQmLpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ0X-0000000A12d-35om
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 15:11:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ0U-0000000A12H-3lEA
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 15:11:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517B2kp7003240
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 15:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+V+JgQRCYKhXRFEasqcCrnMZZS1Hps/NSFCEiIsHng=; b=GcDIFUOQXQ/7X2jj
	qHiXCoqWefhgoxxmp2nwgUy44rNzTodGlt4zJfKr6Wc+zlxhHfdhEJeGNHkA4/79
	ozS+omBU3nNEU6etagUYuc2xOs5tfBkCNjUYmJKA83bez8HpuPKpjMrMcdYYAbVb
	vH3n3AwzMZA4ythBKbBMov6f458KHpU+qVf03dAoqluv0kYtcR0Kwyux6pY+66PH
	EoTpY6/DN4xDEcro1vDIrizlEm6cBnOfRXEtT3UauOzTjptSeRR2pRaQx67U4evF
	AOOoc2MjNJFOWMIa/ZdlCAnGo1RXrMeZrXUFOmLb7PPWMcuDoUr6+AL9Dj1ZEQMn
	TiH7EQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ngy10ke2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 15:11:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa1c093f12so3878319a91.2
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 07:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941060; x=1739545860;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+V+JgQRCYKhXRFEasqcCrnMZZS1Hps/NSFCEiIsHng=;
        b=nHYhokXgXpH8FnzgfCqesyjQyAr3s/xH3KwIsIZznxU12b0lO4F1UgRXVGlKfZUBfO
         19x9ly+4Bp5H4t2hppOnpt/X/Kju+HRoKqqCvWhR/Z1HG0/FCPWZklJtnWN91dJucdd3
         m06M8TWVgwafmooznVMnr9IiDPngUfzZJ4PtHcvxLFZAS7o3HT6Qa4Zf2DPNV871PiU5
         dJPW6AVZVmzYITXg6Uj1en0RnItGm0q/0aVrrBVG2UaXdGeNil+qcsLZbw9NWf8R0kv0
         Bosakh9AqJ4grUSxRjtwP/FZahZQe1ZlUcz9ZAaZrsZZKAkVqjQZyGjSYXqMAS6tO8tm
         mT3A==
X-Forwarded-Encrypted: i=1; AJvYcCU31wQ9O7lQas1xveQiDRZcRMLc9tOqBFjloiQRHvGWWGGnp28TuJOyozttontj1Hbzqvb8obw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1Xx7SY4ohQNBlBOKWeQ/KS8A6izOKN83e7osh8j5NndN0AYk
	Aikp9oppNKa37kNxPvUm62WyAHwrwYE53lshLsE5FSWg2PKy0HR2IqaHrWpm1u4CKj7jEICY4D3
	QbhTyQm/6yh3p6d/znCkXGQYlP3/9jmI59zYQS2W2+dJuUFoldVL27l7GrNvW
X-Gm-Gg: ASbGnct8WFro3bUjCAkLP7Kw2WGXYfeioRc8tg/vVd0myJerDZdaXFDmk5cW12adU+L
	pIDaV4DyqSu6u61lWINI4pAYc5AdamOF+b0HjD1w+ZMYtXTDVpVLkO4+sbZo5Ga+TAgLvyYJRpC
	QNs8I6eS8vB4zS1i8S/x3PeUeCQiMwMd4AhDBc7IR0Fn0RaxamX/qIxEgHLG+mtt9DRunXO8iKq
	v+VJXz+NyF2D84Yq2e5T/2USo26yYheMU6j52E8TjTgDN8k/l8qVEnOaqwT/G+yyAMh4Dj0SfVT
	9FxNzVudFOhr08VT+qCcNIUnZqhW4G5ZT7z9V8zKWt3fnEPOKrYD9kW+Fh22gy9Q+emKL30G8A=
	=
X-Received: by 2002:a17:90b:194f:b0:2ee:59af:a432 with SMTP id 98e67ed59e1d1-2fa2450985amr4857273a91.31.1738941059999;
        Fri, 07 Feb 2025 07:10:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErvSX5l9qRiKdHJ4TV8ECcN8WrvQ0HpuAnUPpHdTx3VdptMOc+XJf3yadFLmyIP/yfAMO73A==
X-Received: by 2002:a17:90b:194f:b0:2ee:59af:a432 with SMTP id 98e67ed59e1d1-2fa2450985amr4857234a91.31.1738941059579;
        Fri, 07 Feb 2025 07:10:59 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0cceff11sm3400012a91.10.2025.02.07.07.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 07:10:59 -0800 (PST)
Message-ID: <c9765212-bfb1-4b8d-80f2-7219bb4a7372@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 07:10:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix locking in error paths
To: Bart Van Assche <bvanassche@acm.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20250206221317.3845663-1-bvanassche@acm.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250206221317.3845663-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q3AYyLidjGgqs92cBx6lN9C_N0XLeqSk
X-Proofpoint-GUID: q3AYyLidjGgqs92cBx6lN9C_N0XLeqSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_071102_958818_0EAFF533 
X-CRM114-Status: GOOD (  16.64  )
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

On 2/6/2025 2:13 PM, Bart Van Assche wrote:
> If ag->mutex has been locked, unlock it before returning. If it has not
> been locked, do not unlock it before returning. These bugs have been
> detected by the Clang thread-safety analyzer.
> 
> Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware group")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c..212cd935e60a 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1122,16 +1122,18 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
>  		ath12k_core_stop(ab);
>  		mutex_unlock(&ab->core_lock);
>  	}
> +	mutex_unlock(&ag->mutex);
>  	goto exit;
>  
>  err_dp_free:
>  	ath12k_dp_free(ab);
>  	mutex_unlock(&ab->core_lock);
> +	mutex_unlock(&ag->mutex);
> +
>  err_firmware_stop:
>  	ath12k_qmi_firmware_stop(ab);
>  
>  exit:
> -	mutex_unlock(&ag->mutex);
>  	return ret;
>  }
>  

I made the subject a bit more descriptive in the pending branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=09a2421b6e5f617cfbeab906fa8037dda4aa95b8

/jeff

