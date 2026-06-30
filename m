Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5699AC43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=; b=q0dj79S9GweKR1FDxoYBP0M+U6
	J5hIWrHeY72W/HHWEQpHGzECfDQ8ZoDZIzsCvGrNNgv9gh6VbiQ8En6vBhJezcnUu3tVmgbwtMPW2
	8zWParghcm2b23ZqHTiJA6yy2Rt8U625e49F65pF7DvOs7uUqp64FwD63z23g6r36UO+gsAegKroy
	syjU5bf0m5stYRgWraZPlNbhvaYEKPQSzAxv6smcpZP9Mbu1l+1nPKuIn+2TrPNajhMb8D7NnceC6
	WdvzDDbcT51E9lgLA9nsAIEt6m5VHJs9LsHjxL2Ccp4Yj8T+dVIR0mowTGVo1y9b3KJ2RIcv8iM6I
	HG/QtIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXTG-0000000GyS3-0QsX;
	Tue, 30 Jun 2026 12:21:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXTD-0000000GyRR-27yF
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:21:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxkq1613454
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=; b=IQK1lL4oceipm8Q4
	wpDe0abCYCvbADeNXWX3gj3hyHy7jURTho8WgTcNP0wxHt9iM42a5wd1u/4ra8hi
	slQfbSxApQbzQkn8/8rw/U5Aie8gnKbUeQo73GyfSHmrz/dWJU0L41C2pCOKK+Ux
	eQKjyqY08FHK7bPN2E46E1JCFGqBqISg00TgsLFx+NiEjiPYYH01FCuafv6/DTcr
	zI2JXzR4UsSaslUZH89nqjJ+CIcWpYI258CT3uYhXgutcWX1OsKtcX3nMdwRsr1c
	6alJGvFylNA96g1H5P+qcJH/bFmFX/4BL4uCgiQv9zSHsVRPKJgbUp3dwNymm30A
	1zcuIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cut9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9691f63552fso154497241.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822102; x=1783426902; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=;
        b=iHQ27x9qCtWmvQuVK7nPn+iR4FmKg8Rxjcak89mdcQmqLIEckQfkB/Jmtc87XjHc0V
         KAbWLtO6KVORDb0UIhx2/hBQt9KRiL4XvGYW9hQ9c0rMzonGlBNR4JGk27njFJrfzp4P
         QGMxCGlbykwVjmdbXX43mcuZny3+JkKPCOcksWMPan1x70cfLFmQQ7cPF5DfTAzwYwwg
         nWEnF1/1eqh4ZVaL75qbHnAafo4FzQlPjLQ5Gx6CnuIOLjqc+QUogeNVE9R6pStN47Xy
         2Mtlb5lBho6DFgmSUKC/9ruObQGCwdHkQvIAn4nqjP1w8zEOrL+Rvtig9Czqw9spJhG/
         trpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822102; x=1783426902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=;
        b=ezu3vn9qmmQgAe2sZkUi8kMiw14/kihSe86gPdpuGJ9zQpzH/uLH4fJk22fLiRoTJ8
         HJJGdGktwktahNZ8hzoVVwZPCJ5TbwPWPQjya1NxIA2gsD+Cfu9Fc/uE+rmHMmqwe88S
         SoLATHaUySBbG8v4IVhFkbpSsJOp/XsWAk94a+R2COTTqxy3bUXMeuV+B4gOWi8CSTYX
         bX81xjG78yiB0Q7ZFqBbKYDfmRF9qzVxWpMc9iMuJUNRUzPI4/Kx82e1BgZDTXXYTH8S
         P8xugXhl/lJ/kO24uTYO2zmL54tEsKqneOHZNru0zo7atpG48r/jRPnpsJn06lhKI4mG
         ek+A==
X-Forwarded-Encrypted: i=1; AHgh+RoAyD4AH6BsPJfZYSAu8F2NEzn+o5636qcv8YAM28oTcjD4oFfXBbX30o2xnjoNQKE0QyuPcRM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJfTn0u8rdFy9RQp78ctOlmh2nMRxxelb7DvPghNysfbigTyga
	zcw6ii0aUyiZhbW2Ne5y8z7zCi7qOtP4JmjxSbWzBBQYgpr9Yn1QlsO90r4yE4tnkrvEP2sWIjS
	4GXxvf7A0CiT99a8KeE6lq69NmXnd1rW6/TC5yU2W1MDIa/c11vWdds1dunHJcHfK
X-Gm-Gg: AfdE7ckVrR15/Ey0be/X9IJH2vzDvRQWU+A1NlzbAiJPUXAng5Y+Gcp/mlUdUJ48frI
	2e5ANskwhHvnT6vN6sFn3tmKXXk/Rj/t4LwCACArMGyO7/V2EwOT+/f27eagTLtVpdneBHJpdmt
	qVkDsm6fCJiS5qbLyPL7zLvLXl8rsPQDnZDP3OCb6+Ibg1O4t6utFUpmyWMOWsO9ZZ/wxGeQg/s
	xXYNNFsA4nkCPSb3/NCepKlpzR4wMEzBkmeTDsvqxWVtQS8noREv/zdUTaiMyfTv/1lZFvLAJ52
	pXc96BPfvrSV+T/bpyueJrFjOBGRJ0XOPbM/MPSPDFRYEw/is9NTya9PdfU+ITTzxrj8SRDdFFx
	SyfVaHn7QWb5zdcLD/lPT4nZiD7aeicirWFo=
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr535065137.7.1782822101834;
        Tue, 30 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr535050137.7.1782822101431;
        Tue, 30 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c9503f5sm1104309a12.20.2026.06.30.05.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <bd4080da-0c15-4142-aca0-21bdeaf9eb33@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] firmware: qcom: Add a generic PAS service
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
 <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfXyTZdZIwAbfc1
 Ljiv3QdGVT1hZ11TvfVGx7Ci8btxnqoTTq69CGxgfopJRegJMHNb2V2b/3CkePTe6pl5BSOe/7M
 aeEGQcpO22VUpDDEmqcGgcuN0IING4Pbrsc/RroOc0eb4WftTU1osR9oAOmWTmXFqzPHJEaWvJ5
 wk5w2nRPhvPRy92niqGdIQln9kOoA31xlyRhrDpLIGGicXzV9pqNp+7jrf19H1PFBG9Fbzc3AeV
 cwFKKlwY0n479WadNGjd3M2+OTxORaRQVpGUou3BhYPOxuecTce4491x/uRi6cM5EqxJnoEs4uP
 vldfr55cY8gekI326rfelsNcRaWLeQ4j71JF9y4DxaDImn6m2dqoAwfHTygwy6Dghf7Fk/4tur+
 Ap9OuLxjUGy8nlhFODGk+6jfPnt9xM1zIDqMj3jx9jcJcK/Zt7dIUbFc7odcH11/jD+0cRDeZDu
 xlfMdlUCbMm+X8bKcfw==
X-Proofpoint-ORIG-GUID: R4rOVvtqdPF6cCCRJukivVNf8NOEuQcv
X-Proofpoint-GUID: R4rOVvtqdPF6cCCRJukivVNf8NOEuQcv
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43b4d6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfX+5NiUDMtZovP
 rUmAAmPuJtbM8gLop7VgZjqMUbi2f+ZJErJbUM1ZZfziYPi9i8TCP2kXNhoYgWAN+PbBklhVPI8
 DVMVIlSOUdwUCzA0S7sb2ySxuE+xTs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_052143_668186_6A3C9039 
X-CRM114-Status: GOOD (  17.86  )
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
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

> +struct qcom_pas_context {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	void *ptr;
> +	dma_addr_t phys;
> +	ssize_t size;
> +	bool use_tzmem;
> +};

Redefining this instead of moving the definition (this is a cross-
subsystem merge anyway) makes things more difficult, as there are
patches from another team touching this struct.. hopefully no kaboom..

Konrad

