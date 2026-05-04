Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D45FF885A
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=; b=by/KrxUKBjZ52mYWCf9yBXH8cD
	8dg12iZMy42zMtnvqk3GlYtAgkHNfkvQ/dYm0r6etfqAQMUAfk2XVph3hOO0q3nxJAaCffd5576qH
	nZBF/Iy4l76KfOAwZ2TcW0881elcxW6oYQeUYwjZrgi2fKq3zzeBbWooWAowrwpxB3F8+TvtD2vXA
	udIjF7nDyW1S08nvsAeI3PJq6HzB0I5RUWtz2gurOIz8gBbZ3/E6iV/iGHtc3Gr1khz9HdNlx3KHc
	dpeAi80VFG9eYzpU0tITxJulr2aPPpZydnysfY1/JJryZpM2jTPMFplcUCR+aqohcZlRGRPQvMKat
	hop7JL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJq96-0000000CsGN-1tq8;
	Mon, 04 May 2026 10:03:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJq94-0000000CsF9-0A93
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 10:03:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fLjh3846503
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 10:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=; b=blFGahv92s0HUYjT
	Ihj7OOX/CnOH7LuU5MlrBldveiHSlAs8JLotz5yKAVYzJHzUZNj7s+B7yxCABZQr
	MIeuOap/tRS5v53jzGhONjBC3KV+HTbV+7D6vRW/eLiAunSL1Um+B/R9wppgekbr
	MEUqeXNAyibnAYw91s8LSCwst+PaDxQLLi/30M6EKIHKDEoyTMDNR1eh+c3v0CxB
	wFIh6v4C/U9MaZmtQffoPeagpZF0l4N3OH3roV/REe8FlXEloX5t8SMrJggV/FkQ
	3AgBiYK4NzS36r3ZDhDDQ7ItYyL7R5m9fW/5iHrSm0iYokJjo0HQnTlVPGvxZXrJ
	gYLCuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfdj3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 10:03:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-364ef32a758so5383081a91.3
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777889001; x=1778493801; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=Y+sXjK0quNQGaf4Fj8nelj8SUJf7quEyIGxaSvW9xHW39Mg7oJOtLgcMkck0np7R91
         I9ovvZc5Ina1g/iTcW8P8Ch5peEEtEpb6Um6Qf1zlczMjDp5U64QsnZqkk3ZhtNJvgCu
         btdhDoy93ZZApka9eiUiLqlIuoBMCOSh72/fFfYi2uH7D42/4wlkyDY4fO65MrQFUfc8
         mSlyz54tHtPVBayNMteDLujl2R+9c6NQ3jqlGSM2JlF1q5Svif94WD0ud0a8OOgU0t25
         phphJOJKliavQ014WkQm2zlasxtzv3TpllFoHiUynUwNKaGjNxvCQDYA6yJMQ4ccwinz
         32Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889001; x=1778493801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIOaP3I+69NIYahYhn7ZP8dTcKbC+Rx4d1eqqv57oN4=;
        b=rEUuT80B4LqKODZYW/uZYzmkwvAfRZFYdbxhY+jbnQqgIFbPYkVH4TCEQ1k/SCwMOz
         6VvVsQKcEkpcufi4lLboGwcdJVRQETvjVfvn6vyEF3gdOhYJt1YPvEDeTJb9NFWWuT0L
         1EP8cC63pZIcXevZhZwa5ilk9jSympLlPm1kjUwtqiuf/u1SHtsstjbGrhhjvl4/LfGd
         67aicPOB9itCCHj26es9Q2rAe3mHuj+gLerc0p78JmmGEQuv0fWI03z5XES8lmVuJHaB
         vz6Y7wXo5lvLDVHQrz6/unkpaNQ8pJi8ULXiNI+8Exzpop7z0dYMEXicz+25NkrfZYm2
         35jw==
X-Forwarded-Encrypted: i=1; AFNElJ9B21Gil+rke5WrMyLd+tRPSn5O5h67Ym+BnNlVPoe5QZJJ3k+LtVgU0nRdcwQchG60maFEmlE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL8PG8VUADUfm9XEPeKxwyy1sCOGFptQr2M7a+bjzIU0QWZ1a9
	LmVgD3uNUq8peibocV5WJRMGBzqCGu1rfOTUa67ySMeGTZ4H7pvohoUfy0qy8sU0Hsh3KbZNgV1
	N+FQZhwl3gSaYPIZa6wgAcd3QhvecxVxGWyLPWh0Odf3rHtNuZiklx+THCRI6SV0Z
X-Gm-Gg: AeBDiev1xOVMgc4ny94oGI907EIjrwKWyhjvuB+Bq6Wq6EjmrV+YHRPWIeEP+MK1jSp
	Bbt4ms3BpLIPkOGg2Xr/QIMUAoI/2mRAgRfO5tAB6kNDvTqEmcr7Krp3amqUaADweZ8gQQK2ClF
	U/ymjzJ8tEve6hD+EDJOdXic6h19IYpQQRc/wE/nOwEvftmHzRy9L584E193cPBp0twp8QD7ycV
	IDZlERYTOAfy7XvJqehpMTjvPWyfIMhdjoo8BzLksNSHCwr9vCvicXODD6Bqbwr2bZVdGXmEXGs
	aZ8TESZfPGVAKTTqkky5pox17znc5EL1XwI/6y5+PHrlOjV+2mVo3HZ1wSRWZu2XRkhAKITD0Ce
	smBbwexlhOlrlZ5R8vu4T9/PWavpFyvjSUJeD068Ds6iWgsL+xs49aa486CZbsw==
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308969637.22.1777889000719;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3a1:76d3:c1b0 with SMTP id adf61e73a8af0-3a7f1cb3fc7mr9308931637.22.1777889000200;
        Mon, 04 May 2026 03:03:20 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba8fefsm8933909a12.7.2026.05.04.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:03:19 -0700 (PDT)
Message-ID: <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:33:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DgxhzSqDua90-BeWM9D3SFVHMcEoFMnT
X-Proofpoint-GUID: DgxhzSqDua90-BeWM9D3SFVHMcEoFMnT
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f86ee9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=6olnGIjaqZ5DSDVW89IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX0Kry/V5bIU59
 CmMmJeuLAKqSotq5uEbDCxIkXxVWPZocGqPEjCLccp8+ico9+yhq/CvqsxRos2j/RsgaS8JKoWz
 ZmNaYT1wD/bRyB13hRh7UroezPUN6WOByO5Ql99Eu8hXvoc3i0n43DgsUvcvtHzTSKkZVPduzBE
 oW63tR1TIgvWD7ERRcdLoYg8NxCA9FYct/RkQfrlyJqu1Mh4fqgJpiaTNVKnJsYVM3VWE0yWyWe
 CteaTbRltARd1cMO+L/n94Q33K1c67ktNU/f6037Habw0WFjUXVHbPPZp9Zf2X5PKs9fiFk5syE
 veFfE1FkLK2ta1O2xJkhP5AK+zAnPO1gvLJyIYlkCc+RDjJ2T0fQVSXytQ7cfZum+PFfWU/x+0c
 tmKYx6eDxxwahhCAqpqUxl2HItMDdjhF8CFMjwLX6gODxq6/ae/eU7x6cIMC3Qz1eiKph1EW+0D
 SlHllhsph1jH25iHP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_030322_165049_FBD8EAD4 
X-CRM114-Status: GOOD (  15.83  )
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

Hi Sumit,

On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> The TEE PAS service ABI is designed to be extensible with additional API
> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
> extensions of the PAS service needed while still maintaining backwards
> compatibility.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig        |  10 +
>  drivers/firmware/qcom/Makefile       |   1 +
>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>  3 files changed, 490 insertions(+)
>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c

[...]

> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c

> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
> +				  phys_addr_t addr, phys_addr_t size)
> +{

[...]

> +
> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
> +			pas_id, ret, inv_arg.ret);
> +		return ret ?: -EINVAL;

Following the example from qcom_scm_pas_mem_setup() here:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778

I think it should be:
return ret ?: inv_arg.ret;

This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
I can see that is tries to print this error:
https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286

With that,
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

