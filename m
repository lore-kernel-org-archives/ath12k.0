Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8486ECD1297
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=; b=lgPMeFoYWVgP6ITq+MEkd8Id/q
	3sjGTFPQSkx3d3ALQ4ObkbLnCUgZvglcOnOXGPBYiWFpsiOf4B1ytc23Xjl0oHi+zYO9zZQkYaszV
	r8zVbx/pmv3iel+9ORJrnLo+HLZ6FJ2+fl2RNYWHQ3a5EAAiY4YV7dgtdMa+NFwadXSQrlXpcP7cV
	2yv/5gwjqRMj3N6d691a1gUWRuNHsbddHkD0+6A8LkRyM23Dwd7qUTROwzUnpwZl4xt2nbj1WreeB
	c3DKYbJmaXvKu7oIcJuv7STLmauZio6cyL9//ro6PhXZgPXEzcmCKDU+renx1lNshE4QUD+6ai58V
	+1V9RW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Lp-00000003hp9-1Fbe;
	Wed, 29 Apr 2026 13:53:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Ln-00000003hol-0FZg
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 13:53:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCedGx317275
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N9U0SUgWF2lcmbEYf0NBfn0l
	dEy8tcMY+YE7XgOzUV8=; b=opyL4EBS6uDORxigC+UcE9nHJcnx30GM4XkEiaKJ
	+EKqtzXUpLkVEyXvFEr+OwuSno+GiOYRHQD21jvxb2FquWGStamzVGChieH0Vz/Z
	tkD9WFYveNCeJLXqD89niR3bF1KWvJJqWDGIHTsM5zL2vgXim8F1CXJNrPLdIyE5
	jF+wZ40Obr0A7V0abVcLlwzHgr2W3AGwMYaPBKyX6wVizsjyIZA+knAKDfv8Pf9C
	Q+NWs/qQ2X+nP+ibrFzo9BzC8zWR2BbWcKjjxOek36vixHMAuF/9v8oCmSvRxohY
	wK0l9GILTkz0aGEXhyH5u9yBWIC+BbMaklBh3ow7gNashQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duj6t8808-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 13:53:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70dd30025fso16005565a12.2
        for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777470794; x=1778075594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=EXZ/Aou9Y2JXjqdeGi3bOtvyB6ALObWV+YVJ1r42n3+O1znjGN5Bh9qgdPp1mxnu2F
         x0FhzlIxX7Qv3jJkuYzEbXSJ+oyzbrw9vcpl1mveBiIzSORWS8WLNb3XQtY0KTE1IkOw
         We5uJkV6lw6Nm3xMiUk/Cf0bJO0PXbv4IDifr5XHHiVy1to7o6yXeoEQVYfEMN78Ezdc
         /XJ8CzPjp80DnqTCzP6Xy2UbclFodpODPWMMXhZLDZbYjl88S34Hx0f8sS4weZniAyrf
         TQdlL/sVjzUPraao/WAggwe5yIJ704G8ufm52M2BuyARNzuHOOw6ZY9Et1fOUeQd3o9y
         unmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470794; x=1778075594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9U0SUgWF2lcmbEYf0NBfn0ldEy8tcMY+YE7XgOzUV8=;
        b=FxihoOGKfJXVndnMK6pnAhEc8fC7F9PG4xwOOc7in/98uCtTdx9VIkexpzq6GFfYOa
         dh8Z4I9KPcmsiAWQ8O9x+w7vWny5SGXidW7SaAaVH/hGCtdIioF3n0uA93ZtAM8/rJ4B
         xZVUX/M5tFW+DWW6/MwfDvyjoNZibXFr+PZyxSK7+OWzCbfm1D7xVYZP/THEnXhfL79P
         XH5aMUvcAHnzwO2CqUNiUErwzDOwu/agoUXrP0C4B5FDTmh3W8MmfeBdK4hXbMK3xrZB
         Q9d9crM8GkGOMshU74KfiMU5NHigmljCxWNyg/kIPw0+cN5mBdKSRk8PmFXTM6xc5Wtf
         3hhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QMVLAM4v1BAXiYiIednHxkCZWIYwEX/7xllNQzEBUrYoFwH4tbJwJFSsClh2INh0GPU6/gm0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaLVI3Ek5zo1LBK+eEaAzSL8hZuDnkuD96VYQPCsYpsTEcgC/R
	yZCbNftqUNmv5T5kf0KoI9jCC/leIZFeEN7lN/Wa8Jn+eEMYbpcsW0OcjMALyWi3TxONjNTFmRG
	OzFxW07HiJdJFSaJxfcoPQPxObUmp6d3btLUS1u/XXp5IPGiENd/0DsA2DUdPa40/
X-Gm-Gg: AeBDieupd+dc8GVaBrzdQqtNyJat+gJoktXCleVWLR1lFb9axtUsIM5vbSQhZcbAgbd
	OC75O7tB5eVTPwwSURdYfYoygy1W3wErihvXwZAwVgsuy7NkUwLGobxDo5LU/iHM4kBFR3DIWVo
	mOUPV0Uug/miexi69hTiv/HV3msvqxXt3QVXzidtoi/1m0KvnwAAA1OlKcdkijJzClFkPxdPniN
	Vl8b7apBM3RoFQmp5bjM1f/MYN0XLTwNCfbsI42O+ZAVZx+XPiH34IGaDw0YwdrXWoeb+zf/eum
	zILkCKHW1bVlehyGSuOENs40kST2Bubxqzs0buJv5HyhV4Mb9oDFrxK0uW2HWd2hd3FMI5i4SwY
	hIgOOIx4vIHpQWugnLaMs9qeYDpOeZWBLb4sT13bTa1IYbA5+/1Syy3LrOiw=
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647878b3a.31.1777470793690;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0d:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834ddc2db4fmr7647813b3a.31.1777470793036;
        Wed, 29 Apr 2026 06:53:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cccc4sm2190396b3a.14.2026.04.29.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:53:12 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:22:57 +0530
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
Subject: Re: [PATCH v4 09/15] remoteproc: qcom: Select QCOM_PAS generic
 service
Message-ID: <20260429135257.utgighzczrbnl6cp@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-10-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-10-sumit.garg@kernel.org>
X-Proofpoint-GUID: vzwuGnFoSOdC52CfEDaSBVaIS0qekwYN
X-Authority-Analysis: v=2.4 cv=KcHidwYD c=1 sm=1 tr=0 ts=69f20d4a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=L7XPiZuQ2t1DW7kJCHQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vzwuGnFoSOdC52CfEDaSBVaIS0qekwYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MSBTYWx0ZWRfX31T4OYpEM6hB
 eCQxyFFDVxrKgCX44hYQOT4DVz8OfIiL2qLgt4dx62NjTo5qw+xUYVFzkqtcViQ6YpN3brbCTNS
 gNmcWkTJR9m2A1L7XPoP64smvjmMQ8az5QKezT8wsHl12dB50syJfmG64k6SKYvbXvtb1SUDpNy
 d32zZsjLG5BK1PnEVJKKEppWwOQM/CQKIIswF1MwJO4gJIPKZckJxkdIvJGC5HlsAH60kxKJSJV
 6+zpm5HWKQiruEkiIe+bFmQYa7VJu5FQPf/IBLNJKS4cqjYIfhQH6LshzFjBv8dKrvLuIMh+oKQ
 dc8xR6NB0QqK5KBqFMQkA4x9ng1inEfJsv4Li+WsLmnO3DGAy/MWRctbengs2TtpH65hAsE7VW0
 clBqNPZBS1ZYGCXdD5mV+ePk1lNdvPLoxUx6GDoB9mPwpLrmpggCjxhMWfqGLM5hC+4kNbUgzSb
 4PTI3yriIDRLSVS9e7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_065315_101074_35293BB9 
X-CRM114-Status: GOOD (  16.97  )
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

On Mon, Apr 27, 2026 at 03:25:57PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Select PAS generic service driver to enable support for multiple PAS
> backends like OP-TEE in addition to SCM.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index ee54436fea5a..da3c5d9562ea 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -230,6 +230,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM

Check do we really need SCM now ?
Why not the change for WCNSS, MSS ?

> +	select QCOM_PAS
>  	help
>  	  Say y here to support the TrustZone based Peripheral Image Loader for
>  	  the Qualcomm remote processors. This is commonly used to control


> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

