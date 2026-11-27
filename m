Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BDF606A321
	for <ath12k@archiver.kernel.org>; Fri, 27 Nov 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nJeyW1YV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaV/RRhH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pvn/4ULT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=; b=nJeyW1YVIdmeu+
	/UFcxrtBEoqwVie4w94xJ7GeuIAdDPXvPP/bRKXZyeW5u8mHu4EneKkFUZ9CbC7v88sI/lElX3wLl
	PKuJkwzGbyw7SxSBHKQFQ6aERZfK1K61hBsaYqB56l1DGjEoreyNYY3tqaZNtlqrUYvnPs9FfnrU/
	W4OBrVnrsarEZgYItHn3j/44LSW9v2O1D0RgFESDg4/wzyDL1Ff/5VOCPoldfCwLetwBBI+wSIOGL
	hdTBaH1h4PBjEcHR2NILSvVOHTsZlO8iNMIN44wJQYRHl2EWH4aKq3nlI07HLjssjTyFxe4zGzAHu
	OlR5F8lz6Z9azzeCk9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWstO-0000000FWTQ-1sW8;
	Fri, 27 Nov 2026 10:09:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWst2-0000000FWF3-2HjE
	for ath12k@lists.infradead.org;
	Fri, 27 Nov 2026 10:09:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GgU53759136
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 10:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=; b=EaV/RRhHnPtzMO1X
	UWWTdxaQV4xaqoCvSX9qEt5LlmEHCdBKWOCsiG8j3j1H07pLiOeZMg7e31DqTGBf
	Z9+E5o0GtaIJuwwVdYIO1ZT2oyUOivgKjiGNngR0fr9pw6jRlL07YRmowvBkJ0jO
	wUW9N6vRxAHMgk3fMq1wqLapcqjNQ+BPK0ABIiN+/HUmf01Q/UxH2Tb6HgIKAnUE
	4VyjhwSdhjeq7OmUFv2wCa+hTL/qneYSocn10A8YRL8iKE7Gv00MxkON6fR3Skjx
	6zmk6/holfwIU+zlIJAHwJKxy/8AzdqduY9ZkDAWgHH9jZYPzDL2cmGPiVsmguVa
	fg/d3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rw07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 10:08:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so2644635a12.0
        for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795774138; x=1796378938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=Pvn/4ULTS1RwXxrIt9NCehbSpuO3BumkZSTtARd99xsieQShezaGsVu4hxp8qx5nlj
         ANSUbnFHqBT+86LSLKkKaQlL3cYzw7GDGqAayJ/udyRMigyR6Ru6lyDL9ORWibnmF63s
         c33YnCYqHv7LDe7X9hr3CZ6s52MJljAF7fBbhLEOhiLsKxFIMzHNNpi8XJFrqYpZwFog
         SanVOUly6d7LZuwup3i9vNYuYw10s39TuMOUwCWSagT0MWSO4udgS2g8ZhUdwyBPOgji
         1rOJFZrUOhyVOiKE07LJbS3FeT5j1mSDYrNeTpXjb6r5hxuit7ICNCIxI3J8ps59Ib4L
         KuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774138; x=1796378938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=m+DLlwgr1cOknGfo3bnP/+vEyUUKwq5ewd6qusHFaC0jZUuWVKVnTJP+tilSFRblqO
         LHKahtua8hsX/fLpvuYfcHFlnDYkDphApUnAb/+AdEA18Hn+Tg4NNMxCB7peJ17an0sL
         /k/B0DkOldK1fCu6hUmY80SPea8+ZoDI3Y/mqjqa8dfNXQ8MjCpugVIa1Ax0W/rxLJvH
         uJWNGskl1kVJ2lzj3Kq4ACF4H2J7ZV73yn2fGmu0zlRslbk2OJt+SZhMKz46XBVAfa70
         fq7TQHT6eWz2o7u39V5jUfbZYlDR0NZqXiHA0uciJ1g9idrsBlkUok+rvMRNEMNy7geV
         hmYA==
X-Forwarded-Encrypted: i=1; AL+hErHDrKrxtHlgxF4OQeJKprEf4Mb0qmDdQYtDI3vFPiVJAarzW0+zjoYupWCK4YBp75ieB4zAOWw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+CbZWHcrCaEqLCOxcA1/2kA8WKBBRHNQoY1/PWd206KXLHNgP4
	S4g93nEVtTKW1g8os82GqyyedqvyfC4llQ2v5x1hbrVAHoDlSKAc6aimkhYGD5RygvKRqtYVKap
	KuL7mxf1k8afmivS4WZWlKkLHPAyTvwxc3b9S3dRNKIvhaiSLxhsEyZein/R8F+9V
X-Gm-Gg: AZFdTZfeiMfr9cjnE/izADASFSdvyLsuOWnBUWVghScLTk0hXwUpu7KaHW6P8KD74j5
	Ggu51CuIMheFyxITFLVFXKwCNqgPYs3zvBCmlmLYWY+4Q4Us/9drQb9Rxc/OtE7ud9EtBVieEx5
	sg7KkEphVNr9+DWzmJilrMNc15x5wqADxIhRzTGgkwnyxdKsl1zmD4ZNR17saZcSCRlcMeBVHua
	F7/wfPbl6xALI3TSRw6hHGFxed60pleJ/LCpygDTqdCDha+JL3fiQA8LQeBs9MTVoNazn155b14
	CQ0U3tlmJQFt7bItlHYevd8LjhFsvmAZDeJd1RFgoSajF3+ikRES2rtxUMdZzl/o8EXFnGB1knG
	Iu4kMgpxahwzrvgFNNYM8iqgqp4ry6m0o4OEW1GVDIpNhR+W0zZzbbcyvuPHTtBC8jMe99KHY19
	kWuTuH
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73777215ad.42.1795774138352;
        Fri, 27 Nov 2026 02:08:58 -0800 (PST)
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73776695ad.42.1795774137878;
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm115589195ad.9.2026.11.27.02.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Message-ID: <a07186d1-2c7f-483e-ba02-74e4cd078b1b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:38:46 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vYWoGiAzixVJESUTZNhQX8btj8AAVd3W
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0956bb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F4YNwraytLJjv4g9V0YA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfX0QqW08IUDtfb
 qpwhIKkv16qJxbpcenioLCYTbqk0/yWG4nEJeeB0JIgdmzMPYyt3vzJkwdqgmJf/P6Keq+axxmP
 Ju5cb/18qY4W7HOuj4d7McLLoq7DwpU=
X-Proofpoint-GUID: vYWoGiAzixVJESUTZNhQX8btj8AAVd3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfX8S2Uc5jB8pnJ
 bT1wG6EALuLqTQcbXPYn/M7KjV4V38xdFkajz8LW7kKWeDLRDt/tR0RaafndTpOsnc+BsFrmLx5
 UqpHJuKSO/q6UgT4uLXKiZHOf95FXRlDXHUVCemWOuNw1FwrGHQ/hqf81oXZkI8ZiE5ejjAhXNL
 2+ZqkY8l5bAD01NMbh60V7Iu/Q/P/S4mO53DGvjfOQdBue/AiYzn7lhSmy13GyJPhdMAU+w91LH
 ewea9f4Kjw7tU8BzngHNNdZ31j/VSGKUXn3F6BxPso58gCCmNjkNmD6wV5M4qspuVLl/YyKqT4O
 HUP+BJ/bFxNqXnkNLABWw8hjaXQiaeylWzVqCd/37/evZC8DBUcb88WL+k0ON7N2BSM0MEZuylZ
 sj9YdsE7qShR6WWcpHhPndNeSAffZTUY7PeUKhqLdLiDAir7xpAUbkj3I8dl93whPLcp1K7amDP
 uJsdIWdjVJZHoHgTPFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020900_747385_4A4CC941 
X-CRM114-Status: GOOD (  26.63  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
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

Restoring memset() is needed.
iris_detect_firmware() scans the whole res_size window for
"QC_IMAGE_VERSION_STRING=", but the loader only writes the firmware
segments, so the rest of the carveout can hold stale data. With a
firmware-name override on a platform that has both Gen1 and Gen2
descriptors, this could make a Gen1 image look like Gen2.
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

- Gourav Kumar

