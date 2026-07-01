Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1986C43458
	for <ath12k@archiver.kernel.org>; Wed,  1 Jul 2026 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5nBOf/Ov1F+rraEj62zHawTRB/8BjMFTvGV2tnm9N4=; b=xl181J6ffkZqfdRwc2cMxrW4i5
	99wRIZ1svtMUMTjOEvK0sNVwGWCNbQfT31aPx96lzjC4PteLT+Y1K7WrccZqN4BFnAYCBCloBypnf
	STblSzYE9ffdYUmczXVGwDO66l7i1K946XN4hoYK6rzK5vq9xIfOMDaVdxk1f2Mn0fgDi+8uHLwys
	zpnmBRmF5G7udLX0EbodMU3caSowONDBRKdt3bgKgOaMzljIqL80JZ4ubWUUMTU/ETEMGACXDS4NN
	xpuanNsuTS0aPOGq8mwU5niiNBaVgFp3XABtiFWlQf2QNRWvon7AIRvqMNddM6HYpdtmvFlTx7aq+
	Vcq39bCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesqN-00000001Qmu-35Ng;
	Wed, 01 Jul 2026 11:11:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesqI-00000001Qll-0xag
	for ath12k@lists.infradead.org;
	Wed, 01 Jul 2026 11:11:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8i2n721749
	for <ath12k@lists.infradead.org>; Wed, 1 Jul 2026 11:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5nBOf/Ov1F+rraEj62zHawTRB/8BjMFTvGV2tnm9N4=; b=EiVY6z7c4AclhJxv
	IjydyH+Cf8APmGkuVaT66N2cKfurEuN4IifGkWx74mHARak9ukggNmPfdqugDsc/
	jbMa3p+k64vQkZ76ffbcdebzndLfIVYO0bnFRSykzIvsd8t+mQmKLWuAowNrWiIu
	o2kSM8Vs8TO+emdmY3tkXQEku/1WkpkUYKJCyoE+FVfZlzIur/hxrub8JBCNXlPj
	L3caq2QjgybbdwaC1QRAGosiePnSltCTrmJozbzWw3+EUbdZWH2ljPtchgjGssHm
	muLzoeFipStVoy+j7zPbClKblFd6XHlaLLivvkoVXLUWnGFBhw4wURAD0a7wHw0d
	a1wavg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbq2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 11:10:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so993301cf.1
        for <ath12k@lists.infradead.org>; Wed, 01 Jul 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904256; x=1783509056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5nBOf/Ov1F+rraEj62zHawTRB/8BjMFTvGV2tnm9N4=;
        b=MDobGwkU50I4xH0CDnUh7zhMKYPnj41CZ3h9hN+Qv93YUvRW6rdHeqXlRP5uy2bCUM
         gwepfOtCNUzXRKLjgAa8nv/kLO26XiAM+MGVeiNcoxCLekeSG6O8uv20sluG4omBew5d
         wQfvqLnj5Dju785X2GyJJRdTM4Z+dUv6bWSUM3nXZyaURmDc/JncSI2VxaVf7bnSOgxO
         HlA3qUCzKao0Sj0vIQcDKE1IYqwoYsgr6vTo7o701wbTX1V17q63qjyAFL3/X2Stgiy4
         YzmEhMAjQNcH2y3kf6qT9wzbGHTtIrO/UEJysV41ZdICqnNMKxqyfmXaGLxXBpTOwGa5
         NL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904256; x=1783509056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5nBOf/Ov1F+rraEj62zHawTRB/8BjMFTvGV2tnm9N4=;
        b=ZD42bw1QHJQgcPCNwBYZuLogLpDp63YAHUCYrWMF5LEgRWf4INwa49i7o2nxDDQWxm
         3vGFb+fiN0SRnWhZFsI3/DgqVoWfRxIZDNVqZn6p87QnDHbymQS5usLczlJXUcEyhwIW
         AnhaG4KLZWRZ7uFMdJxSKI3rcLGO6rJN6MjOQ176jeA0TeK5AtCg7NS/HUvZTiqw70X1
         xQxSxCMKY6eKEVX8Dy5yxukPAjLicatSK5gt9LasVfZMyNgY45LT8mIZsBVKRi0usYcM
         Xm/9R9/D98Hb+iiibChlD4T+F7jY7/TOpjKna3HTo4bgbrPAa7Cuku89uj3LnIrZe4sZ
         zZbQ==
X-Forwarded-Encrypted: i=1; AFNElJ902Akdx4DVdjuVTCt8iwqOnAJg6qaLEqFa30sXJaAax1uGq3ibWyN2o9Z/sk2+VWmsyrh58yw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIqiLcPsiJ/vdnmk8v3ro703kKbJqJtw/zyMJ74xunJbneUSfO
	aFjAVBDCAgHzhWsNTINcuMdye7z/K2atyqsJZURVQLcRvW0igsRrR1i6BGcn/Y0HbYDKXqR0j8U
	aMB4rVECZpLodoFx4FAbTknyqt5eGRiEO2VO4o97fGvs/FhUAfHgYCKsVTWdZIWB/
X-Gm-Gg: AfdE7ckFS/lOumEVNPBrRqVMrsSWuG8Zu59ax8mfoh+BaSfyWomKPl7N3w8OjifrVV/
	TJIyuq/g7W9DsKzbq54ktHLS44DSamNME5F5G/wDa4lnfflJ+r+0Orsu3k3YTQSZx6qLV7AKk3m
	OlpoDzU24dlXCK+qs0V+/xAy5wyBWIv1gwDyx0rx/zTh3gjm5SU81Oy/DGRXJ6h4IGjU40MXIPm
	VJb4snErPMpqa4yn2HzfSjzNq9BBa2bII6eFfPn4YAOogIb646vU8jfZAz3jaWGHsFtQ/pVdSPz
	2qgE4cdZh3C2f5qQg8uEQ0JEwbHDBWywuvMi3fKBJRQivvLTpQl3eJCdljaNX6MHK9wnQl3YTe4
	xOFzv4J4VIO9kqb2walew8K7m2cTuu09qg2M=
X-Received: by 2002:a05:622a:164f:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c26b4ff5cmr8481701cf.10.1782904256288;
        Wed, 01 Jul 2026 04:10:56 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c26b4ff5cmr8481381cf.10.1782904255890;
        Wed, 01 Jul 2026 04:10:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3b5ba9sm2553522a12.7.2026.07.01.04.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:10:55 -0700 (PDT)
Message-ID: <392d38bd-8bc8-4567-a79c-dca7a1bb8e34@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: add missing IRQ_DOMAIN select to
 QCOM_SCM
To: Julian Braha <julianbraha@gmail.com>, andersson@kernel.org
Cc: sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
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
        sumit.garg@oss.qualcomm.com, harshal.dev@oss.qualcomm.com
References: <20260701110344.1999068-1-julianbraha@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701110344.1999068-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 65H2YbraJMnDBy7bDDjQfYkxB9qm0hWb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX89NYkFLT5dc7
 A1GjSKKXR8XWPwuPDUEGm+0OFJ8R0ftpSFl3ftiAWnsrgTuNM4LTL+/AFiLkKrUYof5IINckHYo
 nQkzYVl0/eFJ/Igwc5CIOhXp2oORn+I=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44f5c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=46PZNAZc7cL1ucK_2EcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 65H2YbraJMnDBy7bDDjQfYkxB9qm0hWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNyBTYWx0ZWRfX3EH5+2vD92ub
 Lb8NbcwViyzyewQ/GiLWCBvQAGA6B2E6mPXXsUCYRHSQdg5G8W7vlDhcB0/ni2Fna25KX7kLDGk
 zLDoR9gPb3BV/N06+7K9fyMq8n47r86jreHuoVTmCerO4EKAXwawAevs0DHkbLh3JS1uvYyueME
 pwRi8wUK4/bULDgui7XFsoULpUw0y5wufOXClHa235li2wc7XVWA2Vvx9MgMwIBx4UjPuf+yybi
 shHZgUXyNhs2zRsTlr4CN145JycnXxpef4/t6iErMuq6V1cnaTey5G969YOfwkbfp9oq4/gxgho
 P69TDbeM4MaP+bZXh2uydAFcR37hEBVSM9aC+s/TLlY9pDKXVWtPypW45n/A/h+I7L0tNhA2ByS
 gYMA0d97LJPj3E7xq8SkXIYxa54oi+CtBwdnDsKBj5SdCHjIp3EpcXRWID3ND9on73L9eL048GD
 jkN601Sd0f3XMX+ic6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_041059_422455_3579EF44 
X-CRM114-Status: GOOD (  11.53  )
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

On 7/1/26 1:03 PM, Julian Braha wrote:
> 'drivers/firmware/qcom/qcom_scm.c' calls 'irq_create_fwspec_mapping'
> so it will fail to compile if IRQ_DOMAIN is disabled:
> 
> drivers/firmware/qcom/qcom_scm.c: In function ‘qcom_scm_get_waitq_irq’:
>   drivers/firmware/qcom/qcom_scm.c:2512:16: error: implicit declaration
> of function ‘irq_create_fwspec_mapping’; did you mean
> ‘irq_create_of_mapping’? [-Wimplicit-function-declaration]
>    2512 |         return irq_create_fwspec_mapping(&fwspec);
>         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
>         |                irq_create_of_mapping
> 
> A patch-set in review proposes making QCOM_SCM visible in the kconfig
> frontend, so let's ensure that it's safe for users to enable:
> https://lore.kernel.org/lkml/akS_6izxrhgK-I22@sumit-xelite/
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

