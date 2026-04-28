Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369D3FF886D
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v2MbDPTy9gk9OluevpeqWGnrf+zZgQf7rxJQUu5J4c=; b=nnZiHEYS8ULN1mQjVq9V0JkavJ
	1Wn1xV2gVM3S1QCuNnnYkZ3YL3GQMfhrGrDOVXkB5rMwUt8yr1X78PmsThU/XNvZ1YMqoaHtyUoZZ
	rtGbeCON3nZyDNxCB8VO2ufwNq4lj06o/E99or72Yny8n99QKxgIYS4WRV7/etZfNklkS6yF4KxVf
	1X0eAVHgL0D/mxNplrJcxl6VAsMMSHgKKZvAQtkHCS7xchbCDwkiw0mJfizImhUVUxb7HUHuC0aVx
	lKDkSl25rAi28kRz2JFICdxlVP4frHxfC0no48Dho7+KPPYbbMnnGb6xErHTxEOZBoVoWU1imljHt
	QM0uA8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoFU-00000002AVQ-3U5l;
	Tue, 28 Apr 2026 19:37:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoFS-00000002AV5-0YSd
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 19:37:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsChA3634377
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 19:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/v2MbDPTy9gk9OluevpeqWGn
	rf+zZgQf7rxJQUu5J4c=; b=O6hhO0Q1fGugTxYhCMSUUbDUN5t2Pdu/vKOlaThi
	H05CGGgHaQdwCuYOV3aP47RiijriQEj6C00oAGaMD+Fm7mDAtK1aQXGpI0PX9sWe
	kPdGM7eCACgtfV7xSphqQ+Ar+jTEq2fQMIL4tQe5rSsT8jeRo0eB3jvyilJ9qIOL
	AO4gllsWQN1CIqrPA421U9tED5JrR6lO3evdfyxNp3NOaBZSz6pn0EZMapUMptnI
	ukV9df2ig8AE28JNOW+I2an4sq7TnGa3FJ5K/Uq07rGAToyfFCw/VF2Kp3aI945B
	ZTBn7lq2+1SLRgpd9UiJ6hoFABuSnlSJYNjmA6jKVcsX1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dty87s1q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 19:37:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso7956133b3a.2
        for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 12:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777405051; x=1778009851; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/v2MbDPTy9gk9OluevpeqWGnrf+zZgQf7rxJQUu5J4c=;
        b=HXbBwsxuz30ML4ZR7KkbGbs3WT7jSyVZkYDeVKbaHAgG0Dv2hg/GmtUmPZQj/jZTD+
         A7gfN1UGbiBBeH/1sYUtr3O/qSBAGhQsXkfzRayKQpSlO1qUkk7GIuIERNz/te4+7tOA
         12qKZE7wgE7BdDhm7QmiVWwk5OhLl5VTwNpHtAm/OZ6YgwUf2tiynzKDc9QyJcDDPYxx
         YZDuKo7yaTxDQv+F8UIs2O0/uJEx91I4MbrLwoHsjMCJkbGDzgPLNr1ibTkJFBkfqNwB
         atWKLyiHHKmMCJQGd1u2+K4fzTUoYaKtDTkCKHUUQd9tOYbNbFXmsfL+YKpKawT+zuzS
         4dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777405051; x=1778009851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v2MbDPTy9gk9OluevpeqWGnrf+zZgQf7rxJQUu5J4c=;
        b=XCtUdTBqVNWsxBFQvCr/dVSogxOh35DgfS8+0bRUaEXAtvil68VGTcqPAkGx0liq2I
         skMCtE4ASwRvTcMKtuEkMzj3HXCd4KtbqWQTIjb1XGgwEw8RbalvzOxq6OZqJVeuLX9P
         YLOT4rpIwD/DGCw5Cn8ZA+7gHT2sgZAMwgu5B4vZmDafN8p8NXELxgk5GrWFkvX19tr/
         MTaFOUGdwNUOdIMAQTrp2OQTnOD6ozyH5v64EaMCJAvRFBe9NeGrVu6/aWV/nhtLhTr7
         3/wvyVVCoC75qV7aX7TGbY/Rvj0wbNiGP4sDPLAV0F8Sj5g2Xj9WekdYwsP6Z9NFpmq6
         GKgw==
X-Forwarded-Encrypted: i=1; AFNElJ/JQX/Z8MAPmDK2enu/pSoIvEb6ruY3lJLiTWzPapoVXuq06ANmZD1oDe+vr6TcBA/S6NvT3I4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9iaSi/dFaO2F6M3kfja5eoLStLYuNRJJok6oH66ea76jiwdcv
	E6KxJKDHwSg7lPWhDRV5Dh64NMg6nrEPtMsUAsy5JhOjLJL/6y+H/EZrjh0P625QtqW7dr74ekQ
	1UfcFhOL+yIb5Gz0+clPLHGkxfEf2kyQ9hw13ZpsTSbM3ft5Vm1CyOD2JpZnC77pS
X-Gm-Gg: AeBDiet8K5NPukhS+9xRwsan+OWpE5lRwnkzcQFfqS7NHq1l0Vs3WL2G1rm+t9jHPSR
	1cJB6ZObvO14cNayHcRjvgj5tN0mw5gEbJ/0xJhIVNVdAm6Bc9uMvOohxdw0iK1F++VQW++1sX8
	fLncRajgTpWSKwFCsdKm1/U2ullAJuv7OsnqM3Wfe876de0L87E0YsfFjlhoXPoEi5VJ/ZPw++C
	MeXENLXlfmVtNp1ggQKLGbDISH2Bdaff28v30+kntxxZAkTUliQNvdNd9SMuI1PH32Is0o9CofM
	xclc9513vnBp3kWbm/1Vn7AsSjFRVm11Ya73MipDNf6YzChocqYYEOL6/VrWaQS9H7zCFLYs/Wa
	MvIHZ3HPBY5xkdP3fL/EHSr42r+feRL/BVGp9emF5RPvEqWYoUVJuqH46pEw=
X-Received: by 2002:a05:6a00:a804:b0:82f:761:2b49 with SMTP id d2e1a72fcca58-834ea81252amr598129b3a.49.1777405050705;
        Tue, 28 Apr 2026 12:37:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:a804:b0:82f:761:2b49 with SMTP id d2e1a72fcca58-834ea81252amr598078b3a.49.1777405049990;
        Tue, 28 Apr 2026 12:37:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf35093sm3444849b3a.28.2026.04.28.12.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:37:29 -0700 (PDT)
Date: Wed, 29 Apr 2026 01:07:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
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
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 11/15] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <20260428193714.sg5n3tntww2nuquu@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-12-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-12-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=abJRWxot c=1 sm=1 tr=0 ts=69f10c7c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IA_ug8NyWMwr6sB50gwA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _YNsQZqWYviLb1qRzfzXnoUJ-Vc2Uhr1
X-Proofpoint-ORIG-GUID: _YNsQZqWYviLb1qRzfzXnoUJ-Vc2Uhr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5MSBTYWx0ZWRfX2Omdr+PZtOBK
 AeftG7X7hZqhtnAgkr4+MWy52EQ25wrEToTd2mmUupTHS2Z4qf/59d8HKhIGLOFsEN/av+SgBMu
 t8FEqnpvUGXcj615jiauGM2eClQSfsYlwPzARSZihcCtqSTSZAGspSY0YS70DigXD1hEnpaVG/w
 d0O0msYS5FAr5oyyGH0DRTqQ2fK7yp2hjPkByiOHH7KZ5BfdVKTKeApZirrX5+tFAfJjUTxQa8h
 pzfqaxPcBh2QEgsFdNLfbTbHLBIZgOs+et3o/yA9lrAXZ9e4AGK1sAEArn6xUtmU4CYjtficrV0
 +s6J1hd7qHqUkxB2If7RVa9noepOZhxYDrg7Cj7YQBjWS8FKmyX3DLqmHKiod+oz9KdkL/o4Imv
 F4xb5fN1L/2GjvfxFnIagcyAvZJKDj0P0Wgo9ngltmHKUftJ0AGMnkj03CRYkTUpKicYtex6ffM
 lbMDeR9CWy5tCMh2Xtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_123734_293314_15754EC4 
X-CRM114-Status: GOOD (  26.25  )
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

On Mon, Apr 27, 2026 at 03:25:59PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Along with that pass proper PAS ID to set_remote_state API. As per testing
> the SCM backend just ignores it while OP-TEE makes use of it to for proper
> book keeping purpose.

When we use 'Along with' or 'while at it', patch is doing two things and
not one.

> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 25 ++++++++++---------
>  .../media/platform/qcom/iris/iris_firmware.c  |  9 ++++---
>  drivers/media/platform/qcom/venus/Kconfig     |  1 +
>  drivers/media/platform/qcom/venus/firmware.c  | 11 ++++----
>  4 files changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..f54b759c18aa 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -1,13 +1,14 @@
>  config VIDEO_QCOM_IRIS
> -        tristate "Qualcomm iris V4L2 decoder driver"
> -        depends on VIDEO_DEV
> -        depends on ARCH_QCOM || COMPILE_TEST
> -        select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER if ARCH_QCOM
> -        select QCOM_SCM
> -        select VIDEOBUF2_DMA_CONTIG
> -        help
> -          This is a V4L2 driver for Qualcomm iris video accelerator
> -          hardware. It accelerates decoding operations on various
> -          Qualcomm SoCs.
> -          To compile this driver as a module choose m here.
> +	tristate "Qualcomm iris V4L2 decoder driver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select QCOM_MDT_LOADER if ARCH_QCOM
> +	select QCOM_SCM
> +	select QCOM_PAS
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  This is a V4L2 driver for Qualcomm iris video accelerator
> +	  hardware. It accelerates decoding operations on various
> +	  Qualcomm SoCs.
> +	  To compile this driver as a module choose m here.

Here, Space replaced by Tabs just for one line.., should be fine.


> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..856fa6a79064 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  			return ret;
>  		}
>  	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  }
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, core->irisi_platform_data->pas_id);


Should be a separate change for qcom_pas_set_remote_state()

>  }
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index ffb731ecd48c..574172724e8f 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_QCOM_VENUS
>  	select OF_DYNAMIC if ARCH_QCOM
>  	select QCOM_MDT_LOADER if ARCH_QCOM
>  	select QCOM_SCM
> +	select QCOM_PAS
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	help
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);

This too..

>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>  		return -EPROBE_DEFER;
>  
>  	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> @@ -236,7 +237,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  
> @@ -259,7 +260,7 @@ int venus_boot(struct venus_core *core)
>  						     res->cp_nonpixel_start,
>  						     res->cp_nonpixel_size);
>  		if (ret) {
> -			qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +			qcom_pas_shutdown(VENUS_PAS_ID);
>  			dev_err(dev, "set virtual address ranges fail (%d)\n",
>  				ret);
>  			return ret;
> @@ -274,7 +275,7 @@ int venus_shutdown(struct venus_core *core)
>  	int ret;
>  
>  	if (core->use_tz)
> -		ret = qcom_scm_pas_shutdown(VENUS_PAS_ID);
> +		ret = qcom_pas_shutdown(VENUS_PAS_ID);
>  	else
>  		ret = venus_shutdown_no_tz(core);
>  
> -- 
> 2.51.0

with above change

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 

-- 
-Mukesh Ojha

