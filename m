Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AE8C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=; b=3LO6SwyaBvXBRPvWzvBC+p00zF
	vlmDNUwTOJ5aZ+qFPTWqDgNU2Qhbr0tPHyhp3TwuIlhpu4CGcd/MUjMZ5wYCkuLm1DJAXOAH+vMyL
	eYY5kLPSvSoOSylpw3UENqI8m7lQpdGuZYsF4q749v9HZ/WWSmL8GNCPl/DM9pOVggEAwgDXnwn6V
	AvBwB6X1lcTe4N4NOtun3Dkt8mUNu9EJGTGo0eUr2K+eQtQpfemFiS3ByxKPl9zAJWZvSNvCCbEcs
	40d2eRQisPIScTQGilwOyH1M9uh45c6UXv/QXBhPmhmUozPDdZMGVSxhu7M9pub0QqO8s0FPni6js
	t0WcHcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXXu-0000000Gyx1-3AP7;
	Tue, 30 Jun 2026 12:26:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXXs-0000000GywX-3zhn
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:26:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mncW1602555
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=; b=kEQp0xcloYmwQX4c
	kvEzpYrN1l5EVudiD7/Ekt1BdyifNskaaBNsuAayUDPXO09VfiZH3G9rkoNG/8nF
	W4/BwOAxCCgx3DbwpAchJG4MMTgpLsVPEbFPIPRLs2Cd0Rnf6XipGK9EutlPEc6V
	JIHMdAD8LSjmwjJfDtDtObrtEv2erqSfEgSdt0e7alfCGwS+PKE35UXxWJRKTloH
	pPJCM0IvNj4byRf/eUq5bFvN9q4FlvKbOO7lvX2ExBviaM+TU1onx7PIrbIURsdZ
	8/7ws8eoOAKm+tTQvmWPQoxGjl8N+jV0zu4N7hNqI8EQbch0h2TQuauam303UYl5
	ZjQcig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprv69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:26:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6415f279so17236985a.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822391; x=1783427191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=QRQaeGLsLIeXoFZRYOcwi4Vwjs0VriG+R/IXaPe4SfQ4dtevjdJxMDvqWYHuYcxsua
         qbALqmU7LQGyLuZv41Qr0xhKD7vD9jop2t4UZ2TUp4NCGHDcwU1k6BZFaczAHOxh2V9y
         ldNgKzWqPfdpXRlfE0xu7zB/73JytP8kukKpgvq+fF8NoGjfl9vkyYlQzYK0xvuNV39V
         XyNaA5fLxK0D6Qp1b3LUdc8auwqHXeM8yHCtBxnD78mK9s64NZiBLhuY0q+JVEZETZkE
         PH/IpZ9dVpD22DHnFeeF2nPt+qzt96iJXUp3rgvHeHyTvsiQ3JCngkltJ2X78dsXtWl6
         SVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822391; x=1783427191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=QKPx5IrjY14TSDNANyWTghQkgIsSvC3ZNcGouUGtizgXunTQsKQUAtf5/3tkWX496B
         YWk+FY8xsBWvV7APk8qdveDeXOLgNtPdRTMqMO19E7onS+F4ktOYJsZzsQFZVpH3pNGg
         pH9gDhr3U4M0nAgAOhP28mrvCYO9wKeAhzjckj2EV+ZHAXiiAeAq1qUCRqhqzWEvREQt
         mZw0D1/9nlmfVKXqSZgBN0sLsFSSM2XeSmW0L/j65VanhFUvvanfM8A/QKqPPFAt/Quu
         57SlI2rNcWlMjkPm1DnHsaa269COmTzejrznaObEjLTZUw9Ye9EMA9LZcuZY18qTNW5Z
         hVTw==
X-Forwarded-Encrypted: i=1; AFNElJ/TGYB1/mWzazviKKmVrYQfB0xUNYZmctHfeqXZzDuCkqA96FjpcG14ikpx+9oROZ0jGMIVMqk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjQuZS+4rDTNNMh+QVtOtMyg7it/+SjDkId7Dj3ysNBZUyG9n
	sDLOqoGzrfGCxy+gz+B/xILTPNQzn5v32lV5uEZ7QO6yBExUg1u7YzRn/RCAPg5yFoC3oy4r/U2
	nsl21Aul5/M9CrjaYwnK//MWLYjTjatEPA6yFaAWD3z4zcezaNZZLVR3JqrRC15sz
X-Gm-Gg: AfdE7ckLDEBBuUrUTCiR/7G4VXHXSIfBdGhxOaM1yBTmYFBfziJb1HIiICf59RYAJ/N
	tpJcaS8/By52+6snlEFYPY7pSUcIyxuN/WthaxbtCzpmPXfDpTIIAFRBg/bE04sEE7wcNlrEWuE
	V1rmgV5QA/6ZHYOR9Kejw3D11XNiWMlvEZh67fUh1ZVqRgnIhuhV8knFoB9ljmkaXRpm9l4WlWx
	LV6R8LF2dIgOydbUW+op7+HXXqsnCQjRR2AEuapZEE4XiWWNlKZNb5yLseF1CJKsnDxcj55t4xQ
	vpe3CL5TGCxEiCN0UDdrVqHRsZvYEnuRBZlCU6g2sIeym1AVnGHR89HP+mZ/zODkY21nDPbRTf8
	7DXU0oAsW2OEtd9hMuk2Zarz4N0qPV0S3kwM=
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367983585a.7.1782822391286;
        Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367979785a.7.1782822390742;
        Tue, 30 Jun 2026 05:26:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm116380066b.51.2026.06.30.05.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:26:29 -0700 (PDT)
Message-ID: <e372e66d-7df6-49f2-9530-0c61ad43a18e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rra0RLF8FwDuHTUOHZDVo2_W0kAttJIu
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b5f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TJYwRQMSshrBWr6rMVAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX0Tsp9PzpZRpW
 +zN16CUEtJQlokVZ8VuHl7qgcxiYE4IRoSMPXvaWiZTKgjd0pbnYIHOeZKhESLrKxNJClgx+I1h
 y9wcHwYHGkuAyKCnbirZgIVrpWijT+uyC1mKXTR62QKwQIjuhTg9cHSpv6qykmg4Q2LUS9pn8G7
 zcDz1VZVpAR9ts8EiQkPJxI3BMeqZLTkjxaYnO9mmhJKiytjQf6mhHn/4rhWR85ME6VOrsP3UCu
 koCSin77CeAkZndsSVEZCOT4qmiA60SIRweCrMW9JjYNxMXda4YW2lBfL5gkhWNLJZzh0MrXGaB
 hjuGbUwk3cDzeD7uKIOmXGMNw+fdicL9nVNF6bAnPoOiuFAJUjbCKdFg6CI4x1pK6clpPpPAqFH
 1+tsGtKkmLDvLe352czRU2TBpXMWrXqhn+AnNMWWbNjH7cLpwl/MrHI+BzOjEjyG7AZ9OEZ8DWy
 VEA1GzNBO1S+bwkJecQ==
X-Proofpoint-ORIG-GUID: Rra0RLF8FwDuHTUOHZDVo2_W0kAttJIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX4OY1nyRTpG42
 SrxMseeAu6HFNAhnBlP/EUdMQrNtXfSt4oAiSSanX0+ILTuxh2NmPiemHglLY6mC+2KiZkphHHV
 cOP9YfBCON/LHQ91y4dWJFBM1VeYjl4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_052633_111968_A38DB95E 
X-CRM114-Status: GOOD (  11.97  )
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
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  							     u32 pas_id,
>  							     phys_addr_t mem_phys,
>  							     size_t mem_size)
>  {
> -	struct qcom_scm_pas_context *ctx;
> +	struct qcom_pas_context *ctx;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -600,11 +569,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;

"please don't explode"

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


