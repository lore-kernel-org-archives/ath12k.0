Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5A5C43602
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=; b=GdBnSw3OfM/uafu4S3cMbCjtre
	479HweTtBJx5yuvJE1ftgCTbXrSO9//nuG8etkbsyXkFey0AID5BvXH4jXEcwfATwJe7gDlRZeKnW
	5iWXXPCtjNWhsaQXYBrLpZJiDUSu4Qzg3MXIvFDL/CM9zIK2SaWU2aUTpNfQWv3wDkfePFhE7t+8l
	eZtdlgzydXG4Ltt4UCboFf7q1mwPC33B6sc9U59Qq7sAeZ0biJjGtoxIvOlj8PaHjshdOq0GfFh61
	VweqHOqbqTmFgoTd/wgF89UzlfzEH3WEqVW9RFyl+jHsfPj3CD0dHYOUR6MGogP5U9Ms4TsRSphp7
	JmlOdtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGRs-00000004QoQ-2mmO;
	Thu, 02 Jul 2026 12:23:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGRq-00000004Qnd-0Ei5
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 12:23:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sLS14172555
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 12:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=; b=I4DFLHXVXlt0GoIW
	dfrRzLqyw6s67krAgqYSt6uR+IDOUqir3lJqb8cjfvc+WfrR06mPcdrVYhASsGpX
	LDWlAIsxrv6nUMWL7UFHqiKKddhfMNNcBJBnT2vbhL1lO1bmKk4ToK3uezaJLgfb
	vL/DWrGi/mTNnY+cPoI8dtbXSokmFzVNVuswHkJ25BRq2wpCA7pwiPvVjqAzsNuX
	FMcUjrXlY84iazu1GnGFSWFmCuDzcq4Psx1TfYpo+zOw7aAYkS173PQq47+nZpsb
	A+bVUvqbOno3MHvb6oI6bCLcJHH5JYvBxquO0tf15x74MISA0/9SUv10GZob+np+
	n23xWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrssx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 12:23:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so4287271cf.2
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994996; x=1783599796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=jMNIP04IsNeZ3hb7demRdymMiXNa3A06bj7JG8RzAD+Si3NJzx7NPy+KkljA81IAf5
         8d26Z57pTuMGneCvokptFY00cBhSCMk9FCc/rg/5YIaSiHt6COgnxsmkChB6NyNdJsSp
         GFLNV31Mws0HE7tZvEv4PsO+u+s32hhXex4dMbEgRIkxhQMl2gpCtDN3V+JmAEvBLnQI
         DLk6tu36SgI++pJVTdEt6lefdwXQTCdDsGtwNCZAzxiQLQ351KglxojcwANoeUvDgZcb
         UCaRLnCO7jGlxJlxyMeDB2+YFsRnpj2EfbXyNjDywMYLX6n9MO/Kjl5pNAVZFtP7PqXO
         Z3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994996; x=1783599796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3yAMBOi6v9eV+nAc7eVAGvVNWiyX5n7k7tofn0XxxI=;
        b=XGrjUVOnL32vLbOlb1tNukIKYRGvBDl5rYRlqjwj08cJTmnF0YVI0wBROFumt6/Gqe
         Sgky+ws/xmZNb7pSf9uBsZ2pY1fgkjsFBtc7o1fM5VQ1Ohh5nKD089QSZ8v1Ob19kNw/
         ikdTORh4dgZM8E2ZedqxmcLF3JnVLNV8V5j3VuJuT7it7t03TydhqKrv6q+K5KfyODZO
         e/VerbhiuAyAo1osqbUdFX4QnEj6FK8gh+tFYD0wLuXmIFfEuaLur0FeRdyGZJPEYPir
         ADMHJCbyNzBLgt36jJFzYWdX5xes4b2b4T6t93Wmgk1l/uumWgiY0en0E8lTQHoigqe6
         nv/w==
X-Forwarded-Encrypted: i=1; AFNElJ9bt0qdlV9VIuaBNcucAPGHT7qRsr5IXKEVCRbYJ1cF5Ul+Zavq++gWnfUB66NxscHwllgdGK4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxI1A/dkts0qya/E85HUALEoxoOiV0bIaMwpUAR5wsT6/3XbRfn
	DZ13CUc+MUZIqlh8IZc/U31MQXqGOLSL6L0zShb+KQENvsirKSXChvHq0rP3Hr06ULji5kua9CQ
	G2SOPij/yTQybfTg8pmWCcGx13c3gRxzQgmYhNdZ2XKVnrtu5YaH0SYLyqzoQohlX
X-Gm-Gg: AfdE7cmmJttdiXyTIOQ1troYGyIA7z0tKtdV9ap8dqJwkXLgllDVXT9u8G/nzKYoA2Z
	fXC/lLpZ0JMSGB3wueGGOCJENiXfm6sNkdxXmcA+elstzSue1BLqEhOOX/r+76X37wLNyTYEHux
	5PNNN8VGHOAOM5ltgDnCCETudICOPaHtU62cjffbZmLIQvZ/vLgWA6vnLHkpPGeqh+pmng8+S11
	r6vz+JfbDVNXslIhkaDd2w/MZVNWJW/ZsSwg+mQKBxA5UIrVN80inWHqZRxnbxUZdWZ0wvrG8k0
	Bv519v5woo83kVBV+7UMB/jlyDAhbVvwQtctKW9vVEQqv0E/zJqhQNfT6arTwKflAmapBl5y0CV
	6KxoPkLfCMQfJJC6A4f8iZTyWeICYUraow/0=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46801361cf.8.1782994996314;
        Thu, 02 Jul 2026 05:23:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr46800541cf.8.1782994995674;
        Thu, 02 Jul 2026 05:23:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60545dcsm122833966b.3.2026.07.02.05.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:23:14 -0700 (PDT)
Message-ID: <a2e5d6bf-e2d7-4252-8e91-1355c481d35a@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
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
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vmgkUOTtXDfFyboIqCREtN3M1wgA0Q_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX/2mjuQyq2+zZ
 DH465curoDyHjMLjbkg//XjhQ9Te1Psby3hEEPxPvzZ13hMX6d8X1doF9I+r9KyiDfHCkpQgWbU
 Ce/3pI3YY82YOG+9YySf47qHBJWg44XByOdDmlOhXxkK2RkM0k/k1GwseUKJelBzj7KmSxYc/5j
 hbTPZ6kyM+ECCd+sRXzyuN0VSNAG7DnxSxKdg6araZ3pfEFnqWbS5ufTvAN6KyXt6h829ebKasA
 NIvh8EPJiGAmuZMQI8AAqvueDeWovCplGH1UIXh0AsHAxA5hRQ3KUp2afOgFffumN/P6Qm4xC+c
 QxFqYytcr8xAd6iMp6gPdX321NGi4dnx4UvsgaTLef/IYkwMSHit3IWf5nyc4P9JQ1GAEex8C0L
 CfoLB/GaX0+eZmzNXvyNaRMFKwoM6sKZV3gQXSvZsqpkXV9Tub7d36i2XwmxI3A1N756T6p7srC
 w+/ZxVcrvynKb48yp5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMCBTYWx0ZWRfX/uvGUAYuraEj
 l1UE+hR85cO7P/m/6MYnnQsgIuNiwwkJ6aalQIoG5gyg1FyMHX0xTisX0fHxUmG+aUPJMD/bwPz
 P3wZDV4Paje/pvCldjd4UX0vNuB5178=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465835 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=d_vIauj3UwZ4nLxAXMoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vmgkUOTtXDfFyboIqCREtN3M1wgA0Q_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_052318_108857_E0EBEEE0 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.

It's apparently not ignored, but 0 is assumed to mean video for
historical reasons

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

