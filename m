Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58DCCD343F
	for <ath12k@archiver.kernel.org>; Thu, 21 May 2026 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=; b=RMzPIXwgltrTI9Gzsc+bNzbj/L
	DqbWTZDB0TpvO3KxEYyJUaCRZIgWXUqoyVObNVIBPtLt1D14URC806DxHkf8NxYwqcsD06jB7lGev
	Xw+JbdpDMqmdUK0lnEsigYqY/wiY9n023tX5PzN13Q5/V1+NxxJFqowllgM7cmBMbAE9UQ4O7DFao
	G/LSqVg7pXJjKqZwSoFcv1hyl2eMpg0kAv/1QrhzIOOOaCj6tTuIqoVuruxwvBXAt8AVu+yXmwC9U
	n0oOPKlp6XZ9LW79H6Wqklcw1zYo57XUVXn1FfzcEawJFg8jx0y1S6Wulh2aLfXAvib8s3ug6eFki
	Ddz2dglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPwvN-00000006pBd-1jSS;
	Thu, 21 May 2026 06:30:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPwvL-00000006pAm-193b
	for ath12k@lists.infradead.org;
	Thu, 21 May 2026 06:30:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0cDjr748388
	for <ath12k@lists.infradead.org>; Thu, 21 May 2026 06:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=; b=g7k0N3xxmtSzuTP5
	5D5t/X8ZeozBD6m1DF16BcKLvbd8VFULNoVRu3uRU43O+y7D1vZNfucCYlLcKJFc
	vl8fgFjDHUizBRQxRNmKP9rssOaKgSyHgpZh8HHzK+rTyzCjDzMwwK1kWDdqnGGr
	RZI7xXViQQI/bw1w8wH+Pm3wj8bhhdrR9zkLFFEE0g1Y3FXaID+SiKVJeDeihTsU
	n7YL2XKftFfGTCJSwgkijIzC05xOMpqTZr0mTHTaXR6UpEGEdecBbazHnwENBMoP
	qEe+rHKVfhZhbu85Ju9OiX5jOjVCKaDdoTrdDSJIggA/Mmr5UBtvw5l/STBp1VWl
	QsWIYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6k1mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 21 May 2026 06:30:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso101845415ad.1
        for <ath12k@lists.infradead.org>; Wed, 20 May 2026 23:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779345025; x=1779949825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=dwHzVkBD00tOw70Ay+sbKfSdIM1XMEeSjjd10V2i8ox3xKv+YM4pzva6xaJNGwKV2E
         BSoQWWCz6dMQwmWf1tnPtEhQxR1rimvvI3gbDWiZncxgkIUymi5M/tT9PT6Ib3n1HSix
         +mSfpLvcXAjxv35802a4IsP4eMvIfnEp6douBajiF9B7tK3LUeKARYGnFTINTiAbRNrP
         DGDbQhHN/cr6XonLCTqq7y/Cv0JnFCMHbdrC2j2WyW2sDtRXmioqKV3KOh1Yb1XQSp8I
         FKZPAiozbYjLMH1lfh9srZZbcHrE7ACH8NMrtUwW7mAKZ8CrC9eVEbTTeSZE2yPHzqHa
         2fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345025; x=1779949825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=hPvrb2B5nCsFgyKyXInAlOeMxL+zAXok+4tpK2Yh8wEi7OBBOaT7/VoPg8lB+BQDpV
         LwbXZgpH3p19YdolZFH3utmflXNFLv+WBE5WKyoiJQjXVXY5VGb8S9vXmozL4Ph540M7
         6xR0GhvtF/2GuV3Lx7ZemCvAuAIKF0Ds5RtZz5NzkOalEKtliVxsfmPZC4xn/mMYIuEJ
         KBwRIUdmCZ2mRUPpnNr50c1QkE0kCY7cfbUISbviYpMq4Bcx8YSVPPA31970zRs5WB4x
         w21mtn0Y6Md40YePPqMt4/F+f/xmJRQ0mG7uscFbG1k94Bd2xNK/HnGJVy/I3c0xTLCb
         HZTA==
X-Forwarded-Encrypted: i=1; AFNElJ+l0IQb/0rkx66e4yu0sWK+y8JzwPUdzn5ozbPnF/YUNzkvsb6JwpOfHj8ODK+LApB1fLZw37U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgjCDtdRtRS5RamT0orCI5nT8ovoOt9XdLqP8TN3c1ItAiVGv
	cZsWq6zcM1Bdklw9rJxd0IvfoXtdzKERQgk05hiW3EheoVVUkiUyDzLGe2p+Z3US4yZlfh6FqA6
	ej6J0HN3gph+nEdbe5KCfRh8WzWLapeyoP/uorGUhH4U+ygGW0PtYTyxzpogo2sHX10y11v0F
X-Gm-Gg: Acq92OHssp519L5bxgqfunChg+BMZEUgqLpHzUa3A5lCfkWFQ3o5iF9VBvoVqOI1e5z
	Jv75cVqFaZhixD/BkMfLHnlE5nod1NkliVSi3+yYk4m6JeLE17H6Qs1LEWSUcB1j/m4FOWnOrla
	FePsFRvEO9DlTwcd1h4FCKcuhVHlXjNl3Lo6aYWMOs/ebOVQkuacAezBafP53ySyrqwh3ZYNUhr
	MM/esct4wtKomCrlXZPim17DkNuJRPrmJJ3w0/7yoLiSK8GJDMPUCfvQqB9VlnWxgCc+7cvIUEq
	T9E/orkwsuNfA+xar2UN5L39hNpfNMD9flTDLGd9B6KGiK0akyhx0HffQnb3M1OAhw3hBTS8cP9
	HkmPe9p39EVv/QfOkRQGBx6P7ZlAkj+pVPgYvGAdkQ2mpK8mLU8WWUK+t
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16911115ad.34.1779345025342;
        Wed, 20 May 2026 23:30:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16910625ad.34.1779345024887;
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c263a0fsm241748305ad.37.2026.05.20.23.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Message-ID: <b62c2a16-9e73-47a5-8bf7-3878e21c3da7@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:00:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
 <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ea682 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=X+kW/DRse7pI7A4riirJBw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Reuo-bjlSNWgIop-ackA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: AwV84jWC9AXA3o3d22X71laup4nvnZ79
X-Proofpoint-GUID: AwV84jWC9AXA3o3d22X71laup4nvnZ79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MCBTYWx0ZWRfX2gbIbOjOf2+/
 05g5DybTDx+4xUDHX6tKcjQ0bk9wBJr0ZAjBb7jgjBjHlBGckJlBJ2ybxkrDhYp5zwHJPYmmoxQ
 ojy5yc4go8lperv67hCpTnRoh34PVdnSXWBjBSEKa7hdDJcuWEwfKwDZ2WVN88AYOLIozVSpWvX
 hwr1Mf9zXzQ9Tgb7aOVM8VNMFqRdrIXyHlTu2nGrFQBCppLx56YukcgFPoQCFDTIi1+h/s7L/MJ
 sKm7tzJy+hwqZr1ADClmvE6HvFERRftCRxiqW4WI3MmP+EZXQJ0hBLviLUNLfjbZ1PIhlQix5wK
 gBZDDCqMMR/bEyHyKFISZLgfmQA6CVVh2VKePBkpZTbtC8jaMJoyXgr3m4cfzLiRpGCLuoO6Jb0
 8WYz4VuTCYc3DauSv/bpsGxG7/lTUOj8UPB4kN4+tC9SmY4yhyWQmL6+MRjB0RcQbYrJrY2/jb1
 ATT3Jha2pp/VqSCURyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_233027_340660_7838783A 
X-CRM114-Status: GOOD (  10.85  )
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


On 5/18/2026 12:58 PM, Sumit Garg wrote:
> From: Sumit Garg<sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg<sumit.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>   drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

