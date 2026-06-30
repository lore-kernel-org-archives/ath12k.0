Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B76C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=; b=tpIrAagGQjsV5J1KB+wdvTLfYX
	/OGwFemW7koB4NR3Zsnytk55d7mNZD7AcEX4f9EMmdfFx4C06u8DGZinctJdNWJ1j4J7gJWbHhWZZ
	t5DiBJlOjFxXa/fZBS6QRls5gvAuZqj8/m1lh2o3W+74R+YBF6Kct+SX0g4yu+DQXrgyl8RKKrOL8
	6o+F9MkORxnoFmC101bZZt97izvejFKKsSSqpRRVzRei9C1l25MJprUTB+uR8oV8ma8erNLYQvku9
	Ox5PQnTyKSMxWJHQYrsD2x3lXYnJOsZ7RpFbUrrw95woxoPp6v4AacB9ulIKZFHGgPUXyRh+dX79B
	RsP0NkMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXp8-0000000H1g4-1UOW;
	Tue, 30 Jun 2026 12:44:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXp6-0000000H1en-0uwQ
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:44:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxRM1604773
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=; b=b6o5P/f4dub0N+sh
	VloUIC5/nznDnJpdi25/JuyuvwG2UEzSJKKvywHK0tZrtZT9KUZ/5rxDpzkAbK35
	dsnM/t9aZuxSxU2dRGIZe6jSc+AjUnNQpE9yweYJ2AHh3rx+0/GCQrqKHV9iLFJd
	l0GX/TT5eBf9LEmr4iI2JoKQon7GYA3eQBuKb73gMscfC3mX6KuyV7kA0Qrm0VgR
	Sx/9IGVhVELkU+ss5iFzAVhFhfcrFPin/yM2k3woV5wD5lCojLKYMgWCTLttw8p6
	JC+Z5uAr7lpj3dOpru9IIxbKchWQWwxRHb/JJjqzOKMn80zS9LHcEIdrMlIPnKRX
	7BmsvQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fj8m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:44:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7376ea4bcccso81708137.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823458; x=1783428258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=YuDxJZbWveF4IlGmJv+CdGD232RqAKc5HlAioudOcLcA0HvJZpUFERXao1Hwrqe13Y
         a+9v0ISmQvXEsRjNhqABeUXvm4Ayaa3JVyWSx4PEDJVQcch6cje002X6aZwbquo6wku3
         DcDukQ0hxiZ0su6SdFhSWPfyfslHm5ila+mG9OxVnZKL+xDfJ97AsqDgnHJolgJ217nn
         UlkqF7bNPtiRa/S77/xmIoulVn4WbqXGb82R4QHuAKzMulW7gt2v6msl6fTxD+1kZhHs
         gHOJD9V+n0d2FJT+D0k6XM07Mre15fiJE82cAqFCyCW68JvOuwhmuHXFHyJE4WbSaAnq
         rNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823458; x=1783428258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD9g9o3wLVxWkvqZBA0nQ7MO4qU/Lgf8nSjItSG4AmU=;
        b=J4HYRO3f+4sBqc7//rh3X5ptnnKMSgcxLmY5PPzHvbIFlYZqQfQYgo5Q8ChzFDMkD0
         2Mxx19rf76/v2t+8Z7rpgqLINdvwetRXHJMSzDE0kCmup7BrQLH+e9AzjY1+epAkVTJv
         m+4ukVohII0IMHHuwsRhh/81/0LwiCf4a4rhueJT50HtG+JE3f5StIeH/0y53iMwdAwK
         nbiCoizWg6fpuSWsD7Yxp6ilbfovhjEo/QOZC9UaT/RFxtZ3tISapbzw712kfUSAuhtt
         Wz0d3l8oQ9efy29cAjHRh8G5G6yxRA5URHYJ4ZjT7sf3FCIYq45hgVGRfYBXXx010OOj
         2WIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoANXsC/cRilbMeAe8GAs53NHIgHU1lr7foTzqP3914yHEhvjo5kMcr6aQOvZ4HnjFpz7Xdq7k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKR2EsE6YeL8G333eBOPBZLIktqdVWt8FfvQm708MMMV8Gehg3
	tB0Qwe8/qhYYnaf7dbzlCSkKovX8Oja+o/XjH42Cy3nBBjtEtUYtEKtN9bkcjV5NBLvVjtLpzj4
	2G3zIu5mgyrwfDNmVZrYmTHZrNEVnXBKYUSRi07dgahX9wOMaUPbcJfzeCnYitKoX
X-Gm-Gg: AfdE7ckOtcspsKNJkxV9zDweVEvkEXBbf8KZVgCHXlXFYXyg+jGKKrOR2FcVcT/wzXD
	14KZ1LsRHLO9zOdOC6kNhxxhdYeVtl7JvsOPzPlL4wgxRyGtS5eXTKsFI9KmkTswvOrSN7lKAJm
	PBDYO9CuZm/M4NH+OZKLQSfuyNOY1gfcGmmyy1fkFEs8hj/3nndaMuEF8XUfCfkwWHF6GPQGCWJ
	YVLKbpbMp1ZGe3hYWq1D0Enhbb88glyg+gb5oBZFFNypt67E/VXwXjCSUecqbW+oUwcDCuYpAE0
	YN65LVFMazKVg9qD1LL1Utm/Wog1FAQl9+B78Y01GJdH70md5SjTkl1TzRKUFsMG4IfumSWoU5z
	JYYJCBXcfbruT422pjG9HtGRajlInLs3TCRg=
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524335137.5.1782823458297;
        Tue, 30 Jun 2026 05:44:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8082:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-73a38a37b21mr524326137.5.1782823457846;
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c950732sm1117239a12.22.2026.06.30.05.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:44:17 -0700 (PDT)
Message-ID: <ae6518f8-bba9-41fe-a97f-de6001319c0d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
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
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX/Ep3IVfuarRU
 Y+mLViEuX+3ZkHEerUvlK+gNMsccgJSQ7tFrAVWQfMNOXWZXzhPKv+TVrRUTDtDOmDeHArKI3Y8
 dsLgAWtWEzmM0TANgC3o2tKjMe/iTs15zBzSheLpsZTASjSUoZLCRBoB+qwmxsWUTcta+IicOKs
 1+jNtWFhm4QCHnXjePL2PogiuPBgp74jxQkSZtzx0wPeqGN0L8j31bBcOQrYXnQn7qatHWdtWHU
 miyGEQDLCcfp5aV63G8FBG/vke69sam2qM2B0CUxm+EdSSxpnTOa2gZ7UkZTOaAEztRXRddgbng
 cRUQwks2YKBMX4+5Xe0v6BaIDvGFnI5OAUURR+eSk3eKJLIbnzTXwnW4BfAaXSF1CHFApUWIXrQ
 IaDZvhDpjXUAIA1w5zQv5UMHajceAHO64JlMNdNn8F4nnw8XrZHEdloWXXtBVc8FFkzt3qzVANX
 Ekvn/8FcgKZxhiMNuHA==
X-Proofpoint-ORIG-GUID: xwEnZEDFgUcwtRIA7TzJ__i985a8PtFN
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43ba23 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AoAzlOJtnLSqI_VYGEMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: xwEnZEDFgUcwtRIA7TzJ__i985a8PtFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX5ANaDaQoYqYY
 Das+yDEhzMms6pjLhKzRq517k85htz0HDfeEebujWbMoPtqx6JTZU3/mZUfFaDkzkv2igkqdtQI
 HNcuJSrrCoQsV+uW4LdaMP+s3pIkftA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054420_631330_A0D3A0C1 
X-CRM114-Status: GOOD (  14.98  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4a2b240f967a..0d5d1c55bfc1 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,7 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"eeh"

[...]

> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",

"PAS" - it's an acronym

Konrad

