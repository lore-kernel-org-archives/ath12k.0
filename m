Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494CBC43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=; b=KkPhVSQZRkLaHWfJNVZpAQk8g3
	Msf+TOlfa98IxC/ByKNWw0N41/AbDON2pSG++hqQVhPxEkDeKAWIwMh2gLwvsD6mbfObYsrm4XaFP
	gK5p69iHOV7L06ZmXIK+cJBwjbZ7vNTOhQW9C7knB2ZRABHKhUvvNff78o6q+fdlWFZOH1CtrWm85
	cfJ8J5yfD5eOI6R9fpHC6Xekkt3EONRdZIZn1ChaSDKjOLd7FTQ+EvocZymeIDdpHuwSq7hZKs/ZD
	OSDLyxLVDlwc/gdcSXYmcGF5JYzWYrkfB11EJ19Kb2yhT/grWwWtgT8//q9eyRiW42Xbd10TPkI8K
	HRWP43Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXoY-0000000H1Xg-0CXt;
	Tue, 30 Jun 2026 12:43:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXoU-0000000H1X8-3ODS
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:43:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4Hm1573623
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=; b=F3n0sFhNv4vOtoPY
	BXpZieU5OTwgT+HxAP0Ui+awldHBAbEr4vblIJ9IdeTx7g2gtRrx1GseILh+9/Zz
	aUmOUzW30aW1DfxX0b6aivoylCA8dyu5nTTHJxTXKFcXYQeJpUqRYcH+cRLQPY2L
	mgBawKtvZMT/4MLeuXXScRU9UDEzx2vtpgQNU524wiU4QVKVdS2TJuOs1bU1B4gY
	PP3d9nugzR1z9WpP3ZipFIsVzxeM8o5ivIptJ8TRF5ogVjGNk69Bk7kkhKrB4KZH
	SX87UJJTfzONkxOeiEhrA3XT5VKplB3UT3HP8JIyDOMh/eDIuUKMKAkX4IkMSFbr
	Mib4eA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f468627wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:43:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so262034e0c.2
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782823421; x=1783428221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=D3vPpzrTzKyN5XyIKOdTx450QELJGBuRlcCphVezX+Qb/4jZDP/52B1/yUKmWlWlfm
         Jmma22/JlF23LfrV3crui9V//G7Rit/O05zDoaKRPxTLBKXaPF0PM1B71b+VTOutYIKw
         eVHtW/ewwau3KkT0mJvmGwUrrCANac9iCOxN7DHi8gGDAA+gmoRrbDshbQvZn7xtpFc8
         4s9qkW1/xShXPmy92OQ4IO7CV+s5iTKoW+cTor39mLUHX4c3n0HwrCxihYxrIhh1AFSm
         BpbIaKJReIVZiEc7suMWPt3qeY+mHp+6Exj4M3XeP69SaK72oBJkd1ER/0KcVS0jNtvv
         Lhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823421; x=1783428221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40HebzjMVnQxUW0qFO0coiRdTK0hbU3rpwuRRVO0fek=;
        b=ZIdiv53JSV3jol2imCxGYs03YenKHY8572U/FWRlSTuPiqP3h8kG6XaaI4SOfA/7Y2
         DCM0/zta4J4JnWsUveCdIDQeKK3RZrclRANW9+QJbEFwbOwg5/7t1pAjBONA8Cka8WW0
         uU0iAVzvoz7r9Pa9ahUjK2flMbGC3PCHw9/hgpxmXVmfbWbsnofTSwYUK1PbdFk117mc
         uxRa+uzgGfJWHGj36gPgzskELXYbcUXQudaNNPcC3dcKrnbX6GY5xIPlmDhAfIKdnhJn
         a/7bE1nA2+kshkD7fiFnzGUUSLP0iDAJbPNH5R/HhI9f/Ryyjiw7f2poNfNalmjNVg65
         8/3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/3hDDX2dmTaCfs8nJBdFhoPtVrjPUkpki66xjTaYhKfRVGYEmOe7cRjuzClZMyNaRFUoCTY4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL0fXWyk5WeLz0KO04kPsZ6+Aqkm2LUECh4Wr0c9ZhsNCP54yg
	kjuNo84HL7pWWkIzFQrPtOnvpyEWtXHP7MhFoUtMhczyNRUrkp35DakoUtygK7HaxalwXHOa/28
	I8T0fAiDlYoy9MJWfz6ABj7n5ZzVeDTO8QBr1WAUP/UDaG8pM/VNqcnZCL24ttu1u
X-Gm-Gg: AfdE7clC4e5/UUVPbLf6lLhQqwdeywsAzlNcBKVtkGtEqL3MZgklUBLGXXRq3sgmhym
	f1KwQwwwPBOzvMIdGImegY5VBf2zrS1dGcKUbD9dYRUHEzh79eIg93HPCMaIcoS1oEBnHofmCgF
	p1xLZT8C0eEYZ4/UtiBxfH02wyB4KoulZ6dWJ1zRXkW7GT+ixaEfbQLessunwJO0gLbuAtMuRLC
	cucWCSQHLozgkBiRaQo/Wgb0V5xMeqogWguMhItlw3l3G+Bn2ftBSdPuPmCS7xEyz5we4zErpCj
	xvcoof/ftCkGSWzTXw5r0IH3PvbdqVyO+KxkKNDRqbGn8N6iiIgx8u2n+MOBCB9x+sVaAyhnudo
	SOAxNeDwfD6rZCX3Yll1givSRq+MOLP17zEs=
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493233e0c.0.1782823420997;
        Tue, 30 Jun 2026 05:43:40 -0700 (PDT)
X-Received: by 2002:a05:6122:860e:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5bdbe9a7662mr493224e0c.0.1782823420597;
        Tue, 30 Jun 2026 05:43:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c968400sm1127666a12.25.2026.06.30.05.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:43:39 -0700 (PDT)
Message-ID: <e05fdb45-0ebf-4dee-8d25-05dfc65042fd@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] net: ipa: Switch to generic PAS TZ APIs
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
        Alex Elder <elder@riscstar.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OAAZQfHe2_ErdNoE3ouQMsbbA3ADl0ms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfXx743V52S1cJY
 EEQ8UNtrH6brbU/jknjydIx61m6fs15L1nAd/fQaRFo00HE8O5105OJjdLP5gZrpqPbzE024HTK
 j41zi8Vg+PCpOhx1Wi0pXPavz/ACtwBb1cvnvp7lAcO7RErmmRwmFAo4O+I8IaqWxVhQVY3LsgH
 hsCiKPbNRUcoYrl3ZkgVeLKupNjCvpL3ZneKwczHBdDx67KgwwSRdWoNyYpqSLsnmRDAwpsB7Su
 qmushKlBuLjZvn6rgmBVtjBRk2y1L7Aui1nGXwLS4fBEbFFD0JFvuj7vdrYPx89YKOgdG04ReVn
 tt1RN9PlG3HVCzr12anv/CzIcUGHEhkOulVmYUd+kQycR24/1J7mZFX6OocRpfsoGfslFkRGXxL
 mCnex+AwDjmN8BLKKFfSdkd/Cx7C7KFIqYzOQl5RT+F6M1ELYCWDgeNsAicEjks7QnSyVSt701H
 rRsMyBeaHnitgHIeZjg==
X-Proofpoint-GUID: OAAZQfHe2_ErdNoE3ouQMsbbA3ADl0ms
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43b9fd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=smRyAmGWe8i0dDVrb1gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExOCBTYWx0ZWRfX+ECmjnx0iWy5
 5hXcYYRMSJCbBBn+5U7mWC9EJcpqiKDzCUL3kZ6v9OCqCMvxsmawy7sYR0LrAlytEYAMGp6fbjr
 FIZ0NfnqHxmV64Zz4amwfnl0QSsurOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_054342_986039_3D94FA96 
X-CRM114-Status: GOOD (  13.82  )
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
> Switch ipa client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/net/ipa/Kconfig    |  2 +-
>  drivers/net/ipa/ipa_main.c | 13 ++++++++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index 01d219d3760c..a9aff1b7977d 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -6,7 +6,7 @@ config QCOM_IPA
>  	depends on QCOM_RPROC_COMMON || (QCOM_RPROC_COMMON=n && COMPILE_TEST)
>  	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
>  	select QCOM_MDT_LOADER
> -	select QCOM_SCM
> +	select QCOM_PAS

"meh" for the reasons stated on rproc patches

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


