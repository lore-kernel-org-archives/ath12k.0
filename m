Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B31CD343F
	for <ath12k@archiver.kernel.org>; Thu, 21 May 2026 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=; b=wOzVQr/ma14fjJ/rpwilQFQsJD
	zHZs8t2Qk9V0ofq5WuNE0+oDjABoYfUCV15kFTW5jZ2K/dxFMx/cJra6mbn2iRT18ldsGZdamHJDr
	GfKZrb5tDsR2JcRfKT3Gp6JHYJ3FCwe/w6OV66VuANVmX+EAj4i1e5jw63apAsqUMaInxs0jHxcYQ
	d9j+6PVojJRcTtvcOBHZxshj9EsQ4Xla3LUgnUqK/fO2Inb+P0IS3pMr5khFSvMvGwkXJ1/EiNn39
	U9ki8YhZq5ce0lVvac7i/Tgj4DgjRcIEapvOdqaob4eVWmz4gW/pOaWhvIuf6mMQBLeiVxvWSDX6R
	a+uBFr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPx5a-00000006qf6-2YrL;
	Thu, 21 May 2026 06:41:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPx5Y-00000006qeN-0jfL
	for ath12k@lists.infradead.org;
	Thu, 21 May 2026 06:41:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2SwLr3815908
	for <ath12k@lists.infradead.org>; Thu, 21 May 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=; b=pGbvrLaL78us87ZC
	qoWvxsv7V2INxu/+LYewLf/Dj9+tEUXahR+lOB1X0Jn6fABWHOWTXz9IjuiptX63
	LDHkSGIRTxjXwrGYwGXEnQeETck4YSzpAKVmctSzjxA3Q5MHR1sSW2h8P3AO3uIB
	olClDTEjvs2c6UwO6AWstv3MzUE/DaqWAMcx/rbLwes0tAHjMYdL9Ju1yvFsH4td
	FamEMvDSnYWQQAPHrWkbljA26w1wV12BpCN7fks9DapiFsrMUxOlofal82eKGD9O
	y/eg1qOLPXIDCixysfptgpB//Pt+S6sQhrBHY1FLK4Go4EQ8hqIV9bfHbMLRiMF+
	EAoVPQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0t4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 21 May 2026 06:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so60661085ad.1
        for <ath12k@lists.infradead.org>; Wed, 20 May 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779345659; x=1779950459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=;
        b=eQKkxJvHMu6JbEz1mVr7JPymmCuZLcr6qe3Behq/NLUtalvCFLFNdDoTzY0w6lNA0d
         TCuRl1zKKo6goF55lWhbG8USWbTfmJakRpPZhT9nnuN4b+nUQHD1FA6k3y6STKGXuIfQ
         54cuXPxiGXfuEMoQjazAHArNcNSocgtFWE5LUnxXGID3lzsoJ68t3o/LFnZ+2dZ2D7os
         E8EYyf4laPxOYP/QJ6iBoUpC8y37wpIq58PSLr9adFgNao4vZJTrT6qGNE1Fhz3OA9rt
         81K6uAX3Rg8DU+CzhryTDFcLIKXfMq6TfgkSWrPQ0iq/2HbF6jN5H9xr/A8+VN3lR56o
         lxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345659; x=1779950459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gufQkHi4wZzoYH8TEPzFMkNzt1iU7P3JLBUE34HUhQ=;
        b=aiv3wI/LKAatGKD32q4l5ukkVkKHur5vPykRYoDFBDFbMbou2Xb0bIUAeQ+DzY7MVB
         G1W+1zfBp9YRh1wSiVwxh1YMI021BM33k/QrnAPpDwlZH9TRHrHpwkqfCX2DtTugqVgV
         c5jYW86ShxDpoZogfunNtfdy6rKPVu1MQRbiDYOHA/pcOCNgf6cSldIuQfhf8JaE2Ybz
         TFrtHvB4lh+O04WPPPzcvH71HWbeioRBoFMLI3LIpiuOA3B/5Ot4vFah7FmbL0VkMn+e
         oqeObB+IUp2yF0RUojtiSJ7x0SWl3M42kqTuduyafzlGaZ9F+G21M0YdZmcBsxfU7clZ
         rHRg==
X-Forwarded-Encrypted: i=1; AFNElJ9v6XcLMow486P+phk6v1GqTxfCL04mrbLUtTcWnEOmmArvAKXu1WNmt60gx0i7iiJHn7aDRbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVDebuhD/IgJtS9cyoSL0SiQ0GRyoRPGSoSYznnbR+igljvcEE
	2IsKpj/ByfdPVhs10uCIxQxrMMIp2etNDm/4ttj9j2M9RIGKa1eBEWLjcu+IHpzC2BXIUOdbtqA
	eCKb5Nc6PngEJXdfgHMYHUyPM2KqhEUVZAoI0lz862ERy6kbebCsx5rDk0u03pcBf
X-Gm-Gg: Acq92OE7TANB1H4Kznr3hx8/NJU1iaJLkTUkl0ayjUaneKSlMi5A/YtMDuU8jUpsUPo
	7aMJYPdBrqQ9m1y6gUnC7VN8Crwu5uEMulvFe+F88+XZ+GHeukw6yoq379sME3wJqWLl55V9wSL
	IuDzfag/BRuY0jYwexv0JLoUHf67nlqugoaVCnA1dZ+7zAd9YMdprIa+D0z/rzecKM9UEXuK8DD
	uR5iR3Qm04SmY3/XDTyUk0JkrlTKNv+bY4kWilwBFC3RPujt5N3vb4nJSGCGezCm/BEuwFHY84+
	KOvjtTb3DB9Wd+aqKalqp30ciAk3qRSZ7YjqZv5fmJo4xV71TsVlO4S7ixHUZzyVU+DNnVAzVY6
	RgN28ZMzSRCUqx8ZfOmnoIf26HbgrzjUG6nn/aorrQrOZqXNMDxhcSDWC
X-Received: by 2002:a17:902:db07:b0:2bd:9a27:70f1 with SMTP id d9443c01a7336-2bea3367915mr15247015ad.30.1779345658518;
        Wed, 20 May 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:2bd:9a27:70f1 with SMTP id d9443c01a7336-2bea3367915mr15246705ad.30.1779345657978;
        Wed, 20 May 2026 23:40:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm234673925ad.40.2026.05.20.23.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:40:57 -0700 (PDT)
Message-ID: <07cdbd20-f0c5-4be5-878a-ef23dc633767@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:10:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] media: qcom: Switch to generic PAS TZ APIs
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>, pgujjula@qti.qualcomm.com
References: <20260518072856.22790-1-sumit.garg@kernel.org>
 <20260518072856.22790-12-sumit.garg@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MSBTYWx0ZWRfX3UYco+f5Z401
 3dlj1qHIf+mgBC+rOLxDcZEPaa7zZNJ9IFxfM8ozw2wI07TGZisZ9WFUoP2nhVqzmKZLJZrV1U2
 WWlMRLz+/+Gsti+/VprtESw7dTqVxvGHd2AbI31aZOkFzWpDmYlyVXbAiPD7hgDnH06IoHlrH1t
 pFMRNnbhubWHr7vOulrOEOHASIoJzy1oPNssdKEr0uRQFDdIDYlvZ6bPdBgg0ScELbn/Louk0Bt
 DH2rYoQcVM/VgqG1TYZGswmVy+dLisTzr1dEdAw8wWKS5D7u8RwnzCwrI9xTYzYclKVOTD/8pj4
 CxZHiuP7ZZL2TfRzbzfQOBpPb+bwpX4DFUYm75IKVSu6ke6k2VeU9X6PTvAamYEql79HbomWtWh
 upKKBixg4zIEswMee96zh8swEdbptiLYaODZg2zK0b2nnz7bjsh/JCgyuyj6TfFauIRjuBMAfav
 yCMSlG0CL/12WkVHhvw==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ea8fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=X+kW/DRse7pI7A4riirJBw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WXTWxIQM56r_4Oy2wpoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LkEvZwGAM9d-SSa0fa5oA35INPZVHB-L
X-Proofpoint-GUID: LkEvZwGAM9d-SSa0fa5oA35INPZVHB-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_234100_228153_FF36B424 
X-CRM114-Status: GOOD (  13.94  )
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
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/of_address.h>
>   #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>   		return -ENOMEM;
>   	}
>   
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>   	if (ret)  {
>   		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>   		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>   						     cp_config->cp_nonpixel_size);
>   		if (ret) {
>   			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>   			return ret;
>   		}
>   	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>   
>   int iris_fw_unload(struct iris_core *core)
>   {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>   }
>   
>   int iris_set_hw_state(struct iris_core *core, bool resume)
>   {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>   }
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index 63ee8c78dc6d..7997b8aa427a 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_QCOM_VENUS
>   	select OF_DYNAMIC if ARCH_QCOM
>   	select QCOM_MDT_LOADER
>   	select QCOM_SCM
> +	select QCOM_PAS
>   	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_MEM2MEM_DEV
>   	help
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>   #include <linux/of_reserved_mem.h>
>   #include <linux/platform_device.h>
>   #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/sizes.h>
>   #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>   	int ret;
>   
>   	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>   		if (resume && ret == -EINVAL)
>   			ret = 0;
>   		return ret;
> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>   	int ret;
>   
>   	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>   		return -EPROBE_DEFER;
>   
>   	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> @@ -236,7 +237,7 @@ int venus_boot(struct venus_core *core)
>   	core->fw.mem_phys = mem_phys;
>   
>   	if (core->use_tz)
> -		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
>   	else
>   		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>   
> @@ -259,7 +260,7 @@ int venus_boot(struct venus_core *core)
>   						     res->cp_nonpixel_start,
>   						     res->cp_nonpixel_size);
>   		if (ret) {
> -			qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +			qcom_pas_shutdown(VENUS_PAS_ID);
>   			dev_err(dev, "set virtual address ranges fail (%d)\n",
>   				ret);
>   			return ret;


API "qcom_scm_mem_protect_video_var() would also need this migration, 
any reason not to consider that ?

Could you please check, if any such usage of legacy *scm* APIs, like the 
one i pointed above, can be enforced to err out at compile time ?

Regards,
Vikash

