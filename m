Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E6606C961
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5AJRKDHv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNk+1EAY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EczmJi0o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=; b=5AJRKDHvs5Kl5t
	+7JcpIHb+Xit6pp38pFBdQv7ycmJHgRiUWonMSStcrvvoqaGx3lN7qKXFqYJY1ozvHM1i5wGVm5Nq
	Y6NutCElARTkwBqsmZt4SHyYqN9fZOf2/YYlMj3VWVArCaKbWuObEr4n0q75rTJD259f0KzaSZ3OJ
	Ovt/0a0qrQyH1hoN+NceC/vj3zN7QdSRMFx40shML2QVUqYreXQBSOV77EK61YcOVEaxF/UYW/49o
	WNuZB0gmeOWuXL5NhUCljnJkCKjWqF2iYzxFcbOGTwqq7Cbh5Yf+kLboxwTjfvj3227m3S22/46Gx
	sUvs73rpSIGCTKlMroUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfvb-00000004ZBp-0BmB;
	Tue, 27 Oct 2026 12:05:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfvY-00000004ZAc-1Hfa
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 12:05:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2sF1973857
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 12:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=; b=dNk+1EAYHKu1SkT5
	NZaJqZrSsebaw/pG8/B8UGFtpN04c7sFTDsnVYp8VJeNtOAFONCavKky3Jw49gyZ
	HgiALa8r0pqhmWwL45lfha85g7MsIGCUCbSFjxZeCp+Bf/N+nnBY8TAy7eKl60om
	TA7lSbQt5wScaYf01w6pRO4jth1T1b+/rBPyGUwBzErUIhoFQVzjHViiLdJ6hNLN
	xE9B83B8TojrqLhC50iJvii9sJ3v3bd9NnasTdvctEL3eR+GyIlEi6rtyex92rs5
	fmjhwM082dn9r20UfvaQEvC4yKiaGn4M2aF8JO4Pl7UOhLMkw/6q+JtnLxw5zI5I
	YCr/GQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gejy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 12:05:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd67466211bso2535003a12.1
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102715; x=1793707515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=EczmJi0odpC1gds6S/qMajEPkNjZLHKnJEyDhuA3M1mlvAJTTs4c5oVE6nLx6YhsE+
         VaSGReIZEY8GbRVjlj1p5QZyWCfp714s+6svttYWTZ0g7ULwK+Sp8LKyy23kDnJrzkQ7
         ogQEZOrOrpD7Mfq0GLU7EfC+dyqEwxwT3U95NPBc56pxnUvRn/9gSGFNIRuvnwDI8UfS
         50A1iYuZX9g+9UncjkcNDkbORRmndH73nXKAhlbd6aKMr6nlWK3bL3caqOMD1tzsB2jS
         FWqNZU+Ajv9f2I4gP5X9M3oM4UwsNxw3ONbDe6PcfbRo+nMfajnSjfBtytAX56FizMkI
         6Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102715; x=1793707515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=ZFA9uaOE83MG5961si9tyqN+LQpqPzxxQJxDh5giKq/T78d/WMPMfglOm5HuZ1rSDf
         EtorXupUlXJ07JyWjANM246qIRZ8us2FAVtkK3OCuxRu3DVTjhOL8af4zNSevpOwNHSu
         jrz2btedGnt4smLJuiOS4f6WLCilKRzCv1I21HuwkY5l2ChoaA2120jj39CSJdqjQ63d
         Fwqm20cxQcWCc9UaF7kYIVt1G/iFnXuPg3SXA3pNFl4ShlE45AaUOxF6qqWOVV6wHjWr
         5TmLYHGy2KeVJqtcOm7UwNJnhfwI7yT4l/BSxmXOpl/BuylfaCEWTAQu4t5gu6hXH1mi
         6nYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTugHSMKSI0oTRXg26e/C8rO67ijX6fUeRBjKtIhZv+BNQYhshQ66w4kL8Tuvdhje1wOyCvoI=@lists.infradead.org
X-Gm-Message-State: AFq9FYLBovdOdgdJHxpTmANBKGbIFtxcPutCHDaXAul5lAxpE36xzgH3
	lJe1xKUL+YEIRoVro9LiIYTTgpWfbNjBdiIv9zW+0C7bzAPJLeC6K3onMki3Gtx1n/c9gi61Gi8
	RjLLWAppg+gA9GPRI2YC/voEaANiqw6SLAly/zJwPw6kjQ0nRhWaPJX+7Dv3dRpLO
X-Gm-Gg: AYBFou3MCQVkOOwNMFlv9BRW/nV3/cu+Nh0Wbk34qOAsF0lodc5W2yx47ZiX+AKFML2
	GdUoAnZSRfaofTyFZm3UL/G9a89/NN+vR+krfvFFlphPqJdmAD5ajjbqZKcnRu55otSSU/xTBF9
	joFKN0Qq1sppY6LwmDnuqi66+/MTL3EWVAFRP+Tnhu8LH/bixLHQi1P8PQK2dQd2ztGjSWPFSob
	GNfN16/AsQsG8SfT2tg/jr1tc1m1mleHrGkWdERWwNPPkHsqd8lWk0Yk6vjEFNaE+IeTBPbSOyR
	7sFP9l/I9gcS/kOiZdXDWorhcIzz6fLaCPhdT2RFyLLINC+MzuZYe76KZ8TNX1FL7PRKLHciRTe
	SP2So1sp1Gl+q2F2744US+OJjl20DUlM=
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055385a91.52.1793102714675;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055353a91.52.1793102714216;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404746b3sm3697041a91.17.2026.10.27.05.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:05:13 -0700 (PDT)
Message-ID: <1c24fbfd-bc88-41d9-8632-76c5dad9f2c8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:34:57 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] media: qcom: Pass proper PAS ID to set_remote_state
 API
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bod@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Eric Dumazet <edumazet@kernel.org>,
        Sumit Garg
 <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0937b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rTiepDLV5_WpOwre6ukA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: FCIxKiM4EA6FeE6BeosVUXldZn9xNvq3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXxlhX3d+CGEmm
 TRBV6u9HGXt3JoizGiwWnavpjNQ6ur8aNrm2pOVvXl0hHR3pG3Fof6FMfTICNN8OiGQeTlbVXyE
 tI0Mvjb800RQXEbL0hYHqFIxQ81kKTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX62kiGbtCYrjx
 6BxwsX3RS8twgo+TjOiUYHDtat+qahCtt4+s3WqbFQUumS8rnhqxzsBrRi1mD4A9pkOaiDyu87y
 UlIJ5glFeLgQZ8EcC60Fp/LDKr9IYgLu7hld5W4fVRJrFSTM9wC12wMWhxcFrv/Qd8R9mTt1bGu
 TAszeC3ycWu7VDGOhjzv98/Y8LgwJEYm6L6t4J4BsDJ/N4F/3EwwnIu8u2gXG79lQDUJ/HA8W7e
 mJV9+KIWtRQkRyDXxvnGkCIgwy/EW7CtB+cSeW3cMvPaf2xonPT/u3mAS5JIgIqzmh1th3Sei8m
 Sa0exsGV9IiQHW4pNf1DMZy6gf2WjQVZrtnOjnL5vyqjh2IdHLCCLyPmTnG8s5Jz+VC1EapCRTu
 wlS6BLptXImHVHF7gZoSYgGFUc/qgbmh+MWnGAr1TiYc36Nc7lqrxxVY5qQCwqNFHr4W5MXeNkd
 y4g+O0THTpmPfaDFOnw==
X-Proofpoint-GUID: FCIxKiM4EA6FeE6BeosVUXldZn9xNvq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_050516_359712_DF3D2D9D 
X-CRM114-Status: GOOD (  17.89  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/27/2026 5:32 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
> Changes in v10:
> - Resent standalone, as all the earlier patches of the series are merged.
> - Link to v9: https://lore.kernel.org/all/20260702115835.167602-11-sumit.garg@kernel.org/
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..ed2bd0e83797 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -262,5 +262,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
> 
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261027-pas-id-media-7cc70fc5716f
> 
> Best regards,

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

