Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F407ACD343F
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=; b=sGdVTYWNWXlN1FAtZ6P9xA+p+c
	xe3jGT2b8iwsWB/b5rCDAiTAdmZkd763eH/wl+y1nVJn4OL9zu7GfMegCuaGdpWKyQda4Mo1Rbela
	+QEFwQjlmkA16vuaByVrcNymF4IwkubIrRCV+alADoV34k8A35cV3S+4XopZnuAZOCchHC9wY8YXC
	/eYdGVqKja6ltrFV14eKhmUZm+08In6YYc5C40aiKys8ptNutT/3sMnGPVa1nX6tRpPnIQhohsrEf
	x3wNoacmOlP5f4Y6tLb4UJDVesRbDqFVQJpIC9zT3JdVeP62oNkCfycCMoOB11KD9g0hL0vDf5hzc
	gEu7gftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGk1-0000000GVUg-3AgO;
	Tue, 05 May 2026 14:27:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGjy-0000000GVUG-40MY
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:27:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CE2FQ2187468
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=; b=VElEevCXAp/4eN7D
	j1foutEYx3Vr8neaXKIuICKqkE91uo573myvYqdDi3F5IXBbLooVoYNRod044YSw
	lR5mKzu4rIzdWRx2d/JbjvPxo63qQzGipzt1YBAOZDb5CwgrEeUBk9SQBK7yl7Op
	RnlGVj6RDVf2ezLny5rvOLp51ciXeHa568S8WVA1PeQpTaKKwley3XRb2f4jQskS
	Hmhv3KZWzdQeiQy5aE63//4swak+N6C1OmAAB5qmJA/QhPhJGZUGiWR296GpH8oC
	jGb+vyiCVHK5mJH+jvYSckZJgpYqawQ3A0oPr2XYkR5r+kxenrr5UZyU9vAXrI3h
	JzsaVQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce0gh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:27:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso2908952eec.0
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777991233; x=1778596033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=emv984Gcq+8IFP+Wec5htQo4b7X9jzDvNiQhRXXYMAosYtfrYYss32msCqxrDpOdt7
         CKMLjdFqyR4VAWWle2iNYLom/fvCzynKuYnRp7P5P7CQUe25lCUZuh1U7cOnKCuZ/gQY
         Nekl/eZotZEPjSOheOuWrHFgZaHKBhhjJhAJvHAhHkSULfhq/Y6cX2KuDrPBhyH+s/Gh
         gk8bg43PPlxNQoAM24+mqbe9jRqOhTANg42U3WOlvXSApo9pa0fdmhvFQh+lqjEdibXV
         8clPOng7SpBofUUR+5u2m0Jj9nCumzXzG0DZE8GOguRw2OTKT4+A3zx2/19QCVacXi8W
         ac1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991233; x=1778596033;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=EpyOQCwC2lzKtasN7+VmVra7WpYFqzNAVcwYW0C/Jbv3MCNBdOMcR+0yFrnj0JzzB6
         Zvz3umTc6ZzhloNBYRoZzttjrha8KTd5CH89uZUCjob6X1p05dR6MZsCCfw0ag2EDmpj
         Q/eqMIBzmWZLFMOCIBw78ikRvDyFSsPQs3Yv1oVlMBhouhoTYgXzGS/Xqd+I/ZFqNFrn
         Usfaf3GPZ+pDhuENWReKdhwM56wvF1TIuzTkZGJSQ6zT8QmBCmBNT1XiKP4xbnQkJ2wE
         Ej/tH0lIXQO4I2PNbqUdh/SJKd5m8M3VxL0IbkKtOszYlrQF3W4HXfbeB6+tOxMNoFHt
         /G6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/rzdQD3m5JND5lm5kCYg8wgDrYALZnYIsRqRv7lkf8wVduH1u9EAPlZMOwJI65VvkYVQQvBqA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9ESkHDB6uPklF9MO4vpWLVumsmgc86TI1OgNMAgqOixJw3ZN6
	8yLZgmx5eJgZOgCsa4dvey/aE2eOSQmgvEehWMQKm3MD8jfOmZICS3KwBJouumOWcvTwq91xZQ8
	YS+RLCiMtOvtZFr4V7r1vHMrLlcQGOhrjdbrTvUVquige95gbLlJPnpxX6KxEWY34
X-Gm-Gg: AeBDieszin54RxOYMepmLFiABmdfYeyWk7rsKaMkaJ//lv0L51NtC4iNO4CWCsbX/l8
	QuAn6n9IxnAV6G9jWVc6qPm5NlOCJbybcSR/wIbbCjVr2uhyoJTdINBi94mQW3wBTZ73/z1wRZw
	+9AA5TQz5FTOji6IZUWrJgS5KqnRAEIRezpN1I53Fv3oyQvupjeST9LN2UZDf9nV0jLz4cC2Alf
	FY/1F19tBugXJTDaQFNI8vr1+WJSEfLjLHjXId0UYMwxuix6pwPNSnncSTAR7w8i9jAG7hWwbz6
	BqnC0eEYqasceCj2H6PFfRRdMr7WfXQ5XyBE9nlFmFH5ZvmT7CX1y5y/VR0ztPckayM/fwOr0qI
	+PZLj4Z656FmUoQBt1YNpivlZTVmGSBwqqsTAskfUYS2ywBud4JCcUqUZ8npuXJnlv9EIbfCIXo
	XqMb6iNL86XuCBCteP
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020199c88.21.1777991233074;
        Tue, 05 May 2026 07:27:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020185c88.21.1777991232530;
        Tue, 05 May 2026 07:27:12 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23637548c88.10.2026.05.05.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:27:11 -0700 (PDT)
Message-ID: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:27:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
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
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260504130603.1474043-15-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzOCBTYWx0ZWRfX6i8E482wLMVs
 fWLS1e6xwJ4W1NZ2NUIM5QkXFh6HbDDn9ou/O1/20P9aNRN81+hpdwTpsQ6u8Hyg5sVUv1powy2
 wXffmdf/2KBBklC8QF8XuiHjJekgMMdMV5dYwPB/2Ug1ASpZspWRCp6/kQinr1ZVqowMnJVab3O
 PQGQhdprI0CvMWtRyQJzpxZSwqTMTck5rjrgvXe8OXCcai7N9vCQPKJYn0XonVg421tovuWVf87
 200pONym4DCiEE4RA7VoeFNnlS0lsZnVnPg229z9wwBx+3WC5lHjs4jXo0AronM//S6ZmbXAnLH
 yk/4VmknPZSpNA0TwIcDZV7eqIOEzOyawX1Qw3q4zTHoZwgsmAtwwMr674D2Ucq36d9esaEbBXF
 tQQOtF5RguXazTpOOyVJnhUKYt41p7TRc/AFA12ChDIWsVSkukT5a96yJWYLGp4yD4AxXVkBfY2
 px677UzJK4N4yzyORjg==
X-Proofpoint-GUID: 5AgxUAiOWdpGMLswoxUfSBQfjifbUm6K
X-Proofpoint-ORIG-GUID: 5AgxUAiOWdpGMLswoxUfSBQfjifbUm6K
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9fe41 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_vM1m9lfSBLZ1nnPSXUA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_072715_003814_C78C1E8C 
X-CRM114-Status: UNSURE (   9.41  )
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

On 5/4/2026 6:06 AM, Sumit Garg wrote:
> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>  				   ab_ahb->userpd_id);

at some point the "ret" param was dropped, and this now generates build warnings

>  	}
>  }


