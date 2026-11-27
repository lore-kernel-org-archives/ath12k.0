Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A499606A31C
	for <ath12k@archiver.kernel.org>; Fri, 27 Nov 2026 05:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YKATV8x1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QX8AIqDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LnAYAeXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=; b=YKATV8x1ZbyCuj
	r6g9si/NMPfkbwFyxfK1NkWVyfQa1qs1lUGTce29Z3VPzVdT9hS5HGTZl49xm4qzKbraNgigVkiMw
	7BtTnslP/1c/8bHE8BvlBBnGVJkLnhRWi/8Adv8AXSlIzhu+O3lK6hJ1yExFU0KY2CcfluvEaEmxs
	fF6+AFmHZL8/4x8yB5+baXWmnTEbMnUyzR9zwNvAavT2Lr6lkQttM4dIyGHg5fSNZCPwvUHRQzYfO
	PKFsLQICi8uKlILZr+7AtX98SumGE3SlwK+QrV8SNn/Nob5W5qulCo0XdVF7bjEH01vjpKz71BAzt
	rEuOf1H6atSh8sqWjgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoml-0000000Ez57-21lg;
	Fri, 27 Nov 2026 05:46:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWomg-0000000Ez4T-3iVh
	for ath12k@lists.infradead.org;
	Fri, 27 Nov 2026 05:46:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw7AY2354090
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 05:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=; b=QX8AIqDw9EUpdayh
	pMtKkspjplitviDn8nRK8PEpDaxbZmLwQuGe3WeBYgQmmeWJrHvzb4oogJ9jRxuc
	74ySR1joHvzYxkrrzgq7dVBL6VLB5q00rAK5TZmOeb9ez6PRKJY3Z+PRWzTtBBp+
	Tp2OcWmgpN7+XpMMbwD3eN6F2c4t8QsD23zyXd8gZKDsJsrgpprtLHnxZ1LAx0t0
	K4KunrpuzT97TaWDaRR0XZ51x41UjrL9hYWDdOSHUTHuLOmQfHic9Bq4IsrOgyMb
	PoVbLnS+Vx+1aDeSc65PchQB6P+m6rb7WkI2G/G22yEKv/Ryc2W9r24+lKSXu7Ps
	5w8Pkw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7uyn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 05:46:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9417223eec.1
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758368; x=1796363168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=LnAYAeXHx07IuElg2LZXia4UYMd9eEL+1/+LzhGRsJCgBrdSIKi02gmda7AGGGuAqe
         AGfWfBCXf4pFaQwuv4WE3+y/rXQ6FX4KLvuRTubStNmrcrw9PR/goqu4iOPu/gtU4Fp6
         FIXUIyODse5hVCBT1I3Q65l2y0C11oD9APsnQSV0Yd+4MI+hIdkYNWwiTS3eT0B0PKos
         +ZRNBEEyCB3AOabdqjG8ABsOcY183JMWsikEj4F3lb3yrm1jBh0x1u4DgNEbhtoDgY/a
         6xjnMTWLLff8LfmRA8HV4UIuC74KC6YIOv6YkEO7jkFSRqpXvLRDw6/SFLbzJEk3ckGP
         wKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758368; x=1796363168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDlK9GKcjYEMxaF0sfeGvjQcAHw+mwddDsieVONEUbI=;
        b=21MJyH/JRMnI5rn/wDXSKMfzdhL8iTpPPJ3G9HlaebqHLUqUeDdNsqUapqIxSUeONj
         BKcEF14Q3kVfC/00pd6dg0s/m+jGnK2pGwA1DRllic30CP4iMkdde9ycNLC59a+ykLLU
         0ay0hG7MRLb2oI5RyYgE4JNeovqnqdHLZwTRA5uM52vUPs/8a9FVHudUGnADIzKwQpHV
         WoZ9sE+b3fpPt8vsH+w94kwpIiGjZrRYH925YKKe8h9E+GCzqSbr/SFyJSfsPIPk2DmB
         nJpLKpNXLRvx2Dm686w6gP/yBR5Ryzk1v3otvVpJSvcrtjYhaTsnauW0UlRt64AIioNU
         7/yw==
X-Forwarded-Encrypted: i=1; AL+hErFJ9zohyEFaKRfp0YuKlGbp4jg28t8jVAbCHOJcFho3xqeaxv+Vifq9u+6+C93xGi8KUtFZMCM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9qKYSG1i/KYbeAevXEdnZ0T7xyccfKnFSUA+IWJlh4g9gmMsjv
	umBmZcs+LnsW+uihmqvuAq687OuqP+CBfUcKpCfiA1UA7b7guh0LgHH6HiHdh1h6IVb7+B4+sqH
	U8FLlJ6P3dn5fVd/ZEKA1+7ZbGu6egGZAoVfpaI3a4j4QaCJ65nZeihpOSRR6t7cQ
X-Gm-Gg: AZFdTZf425IeoIyPXIYaa76VmqlWf0zoDjzrLk19PvRdlOptSVEiJysRyKZAH2l2Vfz
	InXputW8O80gA9Q90D7f7ohvcPziLdLxva4D9OcRIWBO27DjNhlCoOYQy8/bWNqpw22lD4B6k03
	5tNp35PXhOnsU1nygQflasNaU17Qr+x29hdnqsy4ZsixbR8+ODLE8jx0GDXjsXeifIqiGQgTQ+X
	7h1WL4KDJPZpNgNcZ4v8a7kGig/nSPKxIS4GsRx4l4WeXsqzhG73uyGjOphSkSC5I1bL4lfrI6U
	IBNXdcKmKqgf/EEBRYe2H2PzpZrZD+hq4/fZY47dRYfdbaALNwx8UaaJc/wzz/E+IrMq3ivOh4w
	aecvKV+LwUWXHWEO+e+Y8kjAGmtzN2BVa6ys1sxjSXRXcFVngo/7XYU14x526x2Ke0NMWXGyjzE
	G9deBr
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911644eec.20.1795758368009;
        Thu, 26 Nov 2026 21:46:08 -0800 (PST)
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr22911611eec.20.1795758367484;
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm77109128eec.24.2026.11.26.21.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:46:07 -0800 (PST)
Message-ID: <f7c526c5-78ae-5369-ab22-2d6f93f9bec4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:15:55 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX5OcYEtwEg7K9
 xEd0gDUEkScHM664Gc2CV1d09SpaD4UK8WgVti37RGXJmqpAROfbUBFL2QofiM050i+vHIHWutV
 iua3tr1JXK0QKKk1LM25msCbOgbcTv0=
X-Proofpoint-GUID: 0jKGvJvPwOIetnaooSWiBsZsjOGtYsH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX9kcqHPM8ARnL
 HzAXCbxWRTFTx7Hh0LdwZnNc5StcNZDu0H0uqLnyT6VCHgIdTR5rrh0WjSqmT0++4lauoODzhLd
 PIRwo6gWzT/m2zjoqa1dnNcizVxcPcPJaTzn1vrRdt1hoK9k9SYfSHzH2jOYx+Bx9bm3u8K7tLs
 5LDfcCnQtr7SuNaJnM8j1sKd6tmMjmm9uNIK1dJO3veJp4J0Ub2tN8O02Ob94/lagCULHnB0ti3
 Ke52leOcFLIDnTc1rnmH00poApoQm/FNe6zmscoXr7RQy9W38AgypItXXR/XkEQ9oDPG0qJ5V5y
 FejCBz6CL/4fFu+QwBnP7rgTCy2IO3VaVyq6yeRjvdTr9PuCwmEZFKqTiX+grZKYRiPlz5Ad399
 feUgqUEdMLvKBAVg7nnj9zqfrxkEmTGKdZdXU451G8VAvecHiYdVG9Po81Doy4u8yTMkyowB+XG
 GjEhGMMjEsatEdurnRg==
X-Proofpoint-ORIG-GUID: 0jKGvJvPwOIetnaooSWiBsZsjOGtYsH6
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b091921 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Px1Cg1egfbfzpgs1NNIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214611_049396_EEA5B92E 
X-CRM114-Status: GOOD (  25.10  )
X-Spam-Score: -4.5 (----)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
> metadata initialization, memory setup, and segment loading into a
> single API that does not expose a PAS context.  iris_fw_load()
> calls qcom_pas_auth_and_reset() for TrustZone authentication,
> which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with
> a PAS context and can handle everything qcom_mdt_load() provides,
> along with additional functionality such as shmbridge creation
> and retrieving memory from the shmbridge buffer when the same
> remote processor needs to run while Linux runs at EL2.
>
> Embed a struct qcom_pas_context directly in struct iris_core and
> initialize it with qcom_pas_context_init() inside
> iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
> with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
> with qcom_pas_prepare_and_auth_reset().  The
> iris_detect_firmware() scan retains a separate memremap window
> after qcom_mdt_pas_load() completes, since it needs to read back
> the loaded image data.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39..ac73bda072f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -129,6 +130,7 @@ struct iris_core {
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
>  	struct dma_iova_state			*iova_state;
> +	struct qcom_pas_context			pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..b701a7f43514 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	memset(mem_virt, 0, res_size);
> -
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> +			      res_size);
> +
> +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> +	if (!ret) {
> +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +		if (!mem_virt) {
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  
> -	if (!ret)
>  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> -
> -	memunmap(mem_virt);
> +		memunmap(mem_virt);
> +	}
>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

Please address sashiko comments in the next revision, as they are only minor.
With that,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

JFYI, depending on which series lands first, either I'll rebase accordingly,
or this series can be rebased on top of:
https://lore.kernel.org/all/20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com


